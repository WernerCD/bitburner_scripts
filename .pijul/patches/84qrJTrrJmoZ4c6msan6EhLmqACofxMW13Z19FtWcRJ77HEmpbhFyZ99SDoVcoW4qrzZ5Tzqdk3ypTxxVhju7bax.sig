?? ǘbX84qrJTrrJmoZ4c6msan6EhLmqACofxMW13Z19FtWcRJ77HEmpbhFyZ99SDoVcoW4qrzZ5Tzqdk3ypTxxVhju7bax                     nicoty?       stock_trader.js: add. others: make changes to accommodate stock_trader.js. TODO: update README.md, make a stock trader start script, move functions out of job objects.        2020-10-29T15:02:21.905495970Z              @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s?   @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb   @       ?j_o??	?+{9;W?LO?ld%??n??UNB?ޞ_???
a?????a??*7F?vzme????O?=أ   @       ?_???s!W????l?@??^Z/?1?L??JF?0k)?7?G??*?,>??w?a(?o?????:   @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??   @       C???煶8{5???*(:?6і<)?  ?'????$??L??|V]?????V???H&??F?0f(tm???   @       d??y??-e^?2j?l??_?5???t?y?h&?4?Lr?5?OG??iJ$???^??m??y?P   @        )*?#?.??υ?ʀ8?Z?S۷)??2??????#?GrK???\?4? ki?Lt?{๊?M   @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       N?? eq??P?\i?ɬRH??~??@c?q????A,???DS? ?a??u$6>=?F??b????%   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?nOn?&<???2????[|????X???k?Nү$P??? It?}:??z??<߭Y??;kL%m   @       t?{?v??v?Y?j
?????;n$;????~S?E"??H?c?a^?[?`?&???qߏ?J?   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       Z.?y?????pI?󃝜G/JF??iM??m???K????#=ԥ??4Ƹ?Y???=f?O]?9lǩ   @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<V:                    @       ?j_o??	?+{9;W?LO?ld%??n??UNB?ޞ_???
a?????a??*7F?vzme????O?=أ1          @       K?}?z??޻N??0???\?@G9?	?y?Ta7S???)?????>u[????V?.~?????F?=??          @       ?j_o??	?+{9;W?LO?ld%??n??UNB?ޞ_???
a?????a??*7F?vzme????O?=أ   @       K?}?z??޻N??0???\?@G9?	?y?Ta7S???)?????>u[????V?.~?????F?=??                     @       K?}?z??޻N??0???\?@G9?	?y?Ta7S???)?????>u[????V?.~?????F?=??                 @       K?}?z??޻N??0???\?@G9?	?y?Ta7S???)?????>u[????V?.~?????F?=??                      "      This software is distributed and licensed under the terms of the [Blue Oak Model License 1.0.0](https://web.archive.org/web/20190309191626/https://blueoakcouncil.org/license/1.0.0) and uses third party libraries that are distributed and licensed under their own terms (see LICENSE-OTHERS).
   @       K?}?z??޻N??0???\?@G9?	?y?Ta7S???)?????>u[????V?.~?????F?=??                     @       |?]1???+8??12O!??|5????,????TƊ?`?4M??????+~?NƎ?Oǌ?\$?                 @       ??eAqsӛL[7?!6?3ܬ3Ie J?و?egȾ?X?88'??Q?I+?q9??[{??                      ?       * Convert objects with functions (the job objects in hacker's and main's schedules) to objects with no functions. Move all functions outside of object to their own thing. Data and functions shouldn't mix!
   @       MR?ֱ.??d?O?X?W??2?+?7????eЋ??X??E????Q? G?sƤ\O?v?;?                     @       MR?ֱ.??d?O?X?W??2?+?7????eЋ??X??E????Q? G?sƤ\O?v?;?                                    ?stock_trader.js           @       MR?ֱ.??d?O?X?W??2?+?7????eЋ??X??E????Q? G?sƤ\O?v?;?                                                       /**
?       * Prioritise lower "volatility" stocks as they have the greatest potential to keep increasing or keep decreasing in price for longer periods of time. In this case "volatility" is the amount of times peaks and troughs in price changes happen divided by amount of ticks - need to confirm if amount of flip flopping really is predicatable and constant though, or if it changes randomly.
        *
?        * Assumptions: Using a constant SMA of growth works (for all stocks). Maybe should use volatility dependent smoothing instead though?
        *
5        * Process for long (just inverse things for short):
        *
        * filter:
       * * remove stocks with sma5 growth (i.e., price change (curr tick price minus prev tick price) divided by price from previous tick) less than sma10 of growth (i.e., will buy only if sma5 of growth is greater than sma10 of growth as this indicates an upwards momentum) and
T       * * stock with sma5 growth <= 0 (i.e., will only buy if stock is actually increasing in price and not just decreasing in price slower than it was before). we are using growth or price change rather than just price as the former also indicates direction in addition to magnitude rather than just magnitude which is the case for the latter.
        *
X        * then sort by decreasing (biggest first) sma5 of growth * curr price * buyable shares
        *
        * buy if:
       * * (commission * 2) / (total price of buyable shares + (2 * commission)) < some fraction (default 1 = pays off 100% after one growth tick. if 0.5 = pays off after 2, etc.) of sma5 growth as this would indicate that growth is sufficient to break even from commission, and
       * * (highest price - curr price) * buyable shares > 2 * commission as we are assuming that highest price might actually be the cap, so we need to ensure that even if it's reached, we can still break even. can also filter to remove stocks using all these criteria in filter stage.
        *
y        * sell if momentum reversed (i.e., sma5 growth is less than sma10, sma5 is negative) and we'd make a profit if we sell.
        *
:        * @description stock_trader.js - 22.2GB - trades stocks.
        * @license BlueOak-1.0.0
]        * @todo Make a script that's responsible for buying 4S API and gets killed when it's owned.
U        * @todo Sell stocks to buy a better ones (when, how much better? by which metric?).
       * @todo Make an interface that can be used to manually buy and sell stocks if the user wishes. This is so that we can track and recalculate average price of owned shares (otherwise, if player transacts using game's interface, we can't track it without unless we use getStockPosition).
?        * @todo Use absolute CMA of price growth when filtering stocks, instead of SMA? Maybe even use actual volatility if available (this will incur extra RAM though)?
?        * @todo If using SMA, determine if number of ticks used in SMA should be greater if volatility is higher. i.e., use Kaufman's Adaptive Moving Average?
o       * @todo Auto detect when shares owned change every tick and recalculate average price of owned accordingly (use price last tick to adjust). don't do this manually (i.e., when the script buys or sells) as player might manually buy shares which would mess up your average price of owned shares value? This would use up 2GB since it would need getStockPosition though.
        */
       
	       import {
         string_sanitise,
         object_parse_arguments,
         array_map_sort,
	         clone,
       } from "lib_no_ns.js";
       
       /**
        * @description Constants.
        * @readonly
D        * @property {number} float_commission - The cost of a transaction.
?        * @property {number} float_period_update_stock - The delay between each market update in milliseconds. @see {@link msPerStockUpdate in src/StockMartket/StockMarket.tsx}
X        * @property {Object} object_defaults - Contains default values for script's arguments.
?        * @property {number} object_defaults.float_investment_capital - The default fraction of total assets to potentially be used for investing in the market.
?        * @property {number} object_defaults.integer_prices_average_length - The default maximum length of the stock objects' average price array used for calculating the short range average.
G        * @property {Object} object_argument_names - Contains argument names.
        */
       const object_constants = {
         float_commission: 100e3,
"         get float_commission_double() {
&           return this.float_commission * 2;
         },
"         float_period_update_stock: 6e3,
         object_defaults: {
!           float_investment_capital: 1,
&           integer_prices_average_length: 5,
         },
         object_argument_names: {
D           investment_capital: { short: "c", long: "investment-capital" },
:           prices_average_length: { short: "r", long: "range" },
(           help: { short: "h", long: "help" },
         },
       };
       
       /**
,        * @description Returns a new stock object.
O        * @param {Object} object_arguments - Contains the arguments for the function.
H        * @param {string} object_arguments.string_symbol - The stock's symbol.
v        * @param {number} object_arguments.integer_shares_long - The number owned shares of this stock in the long position.
x        * @param {number} object_arguments.integer_shares_short - The number owned shares of this stock in the short position.
?        * @param {number} object_arguments.float_average_cash_spent_per_share_long - The average cash spent per share owned in the long position.
?        * @param {number} object_arguments.float_average_cash_spent_per_share_short - The average cash spent per share owned in the short position.
t        * @param {number} object_arguments.float_price_average_biggest - The biggest observed average price of this stock.
m        * @param {number[]} object_arguments.array_prices_average - An array of this stock's recent average prices.
#        * @returns {Object} Stock object.
        */
       const object_get_stock = ({
         string_symbol,
         integer_shares_long,
         integer_shares_short,
+         float_average_cash_spent_per_share_long,
,         float_average_cash_spent_per_share_short,
         float_price_average_biggest,
         array_prices_average,
	       }) => ({
          string_symbol: string_symbol,
,         integer_shares_long: integer_shares_long,
.         integer_shares_short: integer_shares_short,
T         float_average_cash_spent_per_share_long: float_average_cash_spent_per_share_long,
V         float_average_cash_spent_per_share_short: float_average_cash_spent_per_share_short,
<         float_price_average_biggest: float_price_average_biggest,
.         array_prices_average: array_prices_average,
       });
       
       /**
=        * @description Returns the growth rate between two numbers.
V        * @param {Object} object_numbers - The array of numbers to calculate growth rate of.
>        * @param {number} object_numbers.float_old - The old number.
>        * @param {number} object_numbers.float_new - The new number.
&        * @returns {number} The growth rate.
        */
7       const float_get_growth = ({ float_old, float_new }) =>
M         float_old < 1 ? (float_new - 1) / 1 : (float_new - float_old) / float_old;
       
       /**
G        * @description Returns the average growth rate of an array of numbers
c        * @param {number[]} array_numbers - The array of numbers to calculate the average growth rate of.
.        * @returns {number} The average growth rate.
        */
4       const float_get_growth_average = (array_numbers) =>
         array_numbers.length > 1
           ? array_numbers.reduce(
=               (float_accumulator, float_current, integer_index) =>
                 integer_index > 0
!                   ? float_get_growth({
=                       float_old: array_numbers[integer_index - 1],
*                       float_new: float_current,
%                     }) + float_accumulator
                   : 0,

               0

             ) /
!             (array_numbers.length - 1)
	           : 0;
       
       /**
P        * @description Returns the absolute average growth rate of an array of numbers
l        * @param {number[]} array_numbers - The array of numbers to calculate the absolute average growth rate of.
7        * @returns {number} The absolute average growth rate.
        */
=       const float_get_growth_average_absolute = (array_numbers) =>
         array_numbers.length > 1
           ? array_numbers.reduce(
=               (float_accumulator, float_current, integer_index) =>
                 integer_index > 0
                   ? Math.abs(
#                       float_get_growth({
?                         float_old: array_numbers[integer_index - 1],
,                         float_new: float_current,
                       })
$                     ) + float_accumulator
                   : 0,

               0

             ) /
!             (array_numbers.length - 1)
	           : 0;
       
       /**
W        * @description Returns the average of the latest growth rates of an array of numbers.
O        * @param {Object} object_arguments - Contains the arguments for the function.
g        * @param {number[]} object_arguments.array_numbers - Array of numbers to average the growth rates of.
d        * @param {number} object_arguments.integer_latest_length - Number of last growth rates to average.
!        * @returns Average growth rate.
        */
1       const float_get_growth_average_range_latest = ({
         array_numbers,
         integer_latest_length,
       }) => {
7         const integer_numbers_length = array_numbers.length;
8         return integer_numbers_length > integer_latest_length
            ? float_get_growth_average(
L               array_numbers.slice(integer_numbers_length - integer_latest_length)
             )
/           : float_get_growth_average(array_numbers);
       };
       
       /**
X        * @description Returns the average of the lagging growth rates of an array of numbers.
O        * @param {Object} object_arguments - Contains the arguments for the function.
g        * @param {number[]} object_arguments.array_numbers - Array of numbers to average the growth rates of.
e        * @param {number} object_arguments.integer_lagging_length - Number of last growth rates to average.
!        * @returns Average growth rate.
        */
2       const float_get_growth_average_range_lagging = ({
         array_numbers,
         integer_lagging_length,
       }) => {
7         const integer_numbers_length = array_numbers.length,
J           integer_difference = integer_numbers_length - integer_lagging_length;
9         return integer_numbers_length > integer_lagging_length
            ? float_get_growth_average(
               array_numbers.slice(
7                 integer_difference - integer_lagging_length,
                 integer_difference

               )
             )
/           : float_get_growth_average(array_numbers);
       };
       
       /**
+        * @description Returns an updated object.
O        * @param {Object} object_arguments - Contains the arguments for the function.
K        * @param {Object} object_arguments.object_original - The original object.
?        * @param {Object} object_arguments.object_properties_new - An object whose properties will be used to replace those of the original in the new object to be returned.
)        * @returns {Object} The updated object.
        */
M       const object_get_updated = ({ object_original, object_properties_new }) => {
6         const object_update = clone(object_properties_new);
3         for (const string_property in object_original) {
:           if (!object_update.hasOwnProperty(string_property)) {
P             object_update[string_property] = clone(object_original[string_property]);
           }
         }
         return object_update;
       };
       
       /**
?        * @description Takes a stock object and returns a new one based on the original, but with values updated after selling some shares.
O        * @param {Object} object_arguments - Contains the arguments for the function.
U        * @param {Object} object_arguments.object_stock_original The original stock object.
?        * @param {number} object_arguments.object_stock_original.integer_shares_long - The amount of shares of this stock owned in the long position.
?        * @param {number} object_arguments.object_stock_original.integer_shares_short - The amount of shares of this stock owned in the short position.
?        * @param {number} object_arguments.object_stock_original.float_average_cash_spent_per_share_long - The average cash spent on shares of this stock owned in the long position.
?        * @param {number} object_arguments.object_stock_original.float_average_cash_spent_per_share_short - The average cash spent on shares of this stock owned in the short position.
?        * @param {boolean} object_arguments.boolean_long Whether the value is being updated for shares in the long or short position. True = long, false = short.
\        * @param {number} object_arguments.integer_shares_to_remove - The amount of shares to add.
Y        * @returns {Object} The new stock object with values updated after selling some shares.
        */
)       const object_get_stock_sell_updated = ({
         object_stock_original,
         boolean_long,
         integer_shares_to_remove,
       }) => {
         const integer_shares_total =
           (boolean_long
2             ? object_stock_original.integer_shares_long
P             : object_stock_original.integer_shares_short) - integer_shares_to_remove;
         return object_get_updated({
,           object_original: object_stock_original,
(           object_properties_new: boolean_long

             ? {
                 integer_shares_long:
A                   integer_shares_total < 0 ? 0 : integer_shares_total,
3                 float_average_cash_spent_per_share_long:
&                   integer_shares_total <= 0
                     ? 0
O                     : object_stock_original.float_average_cash_spent_per_share_long,

               }

             : {
                  integer_shares_short:
A                   integer_shares_total < 0 ? 0 : integer_shares_total,
4                 float_average_cash_spent_per_share_short:
&                   integer_shares_total <= 0
                     ? 0
P                     : object_stock_original.float_average_cash_spent_per_share_short,
               },
         });
       };
       
       /**
-        * @description Returns a new stocks object.
O        * @param {Object} object_arguments - Contains the arguments for the function.
P        * @param {Object[]} object_arguments.array_stocks - An array of stock objects.
o        * @param {number} object_arguments.float_cash_invested - The amount of cash currently invested in the market.
$        * @returns {Object} Stocks object.
        */
H       const object_get_stocks = ({ array_stocks, float_cash_invested }) => ({
         array_stocks: array_stocks,
,         float_cash_invested: float_cash_invested,
       });
       
       /**
?        * @description Takes an array of stock objects and returns a new one based on the original, excluding all stocks in which no shares are owned. I.e., this returns an array of stocks which the player has invested in.
O        * @param {Object} object_arguments - Contains the arguments for the function.
a        * @param {Object[]} object_arguments.array_stocks_original The original array of stock objects.
?        * @param {boolean} object_arguments.boolean_long - Whether the stocks included will be those in which shares are invested in the long position or in the short position. True = long, false = short.
Q        * @returns {Object[]} The new array of stock objects in which shares are owned.
        */
O       const array_get_stocks_invested = ({ array_stocks_original, boolean_long }) =>
          array_stocks_original.filter(
           (object_stock) =>
             (boolean_long
+               ? object_stock.integer_shares_long
1               : object_stock.integer_shares_short) > 0
         );
       
       /**
?        * @description Takes an array of stock objects and returns a new one based on the original, but updated after selling shares in a stock.
O        * @param {Object} object_arguments - Contains the arguments for the function.
a        * @param {Object[]} object_arguments.array_stocks_original The original array of stock objects.
H        * @param {string} object_arguments.string_symbol - The stock's symbol.
?        * @param {boolean} object_arguments.boolean_long - Whether the shares transacted were in the long or short position. True = long, false = short.
]        * @param {number} object_arguments.integer_shares_to_remove - The amount of shares removed.
U        * @returns {Object[]} The new array of stock objects with the updated stock object.
        */
)       const array_get_stocks_sell_updated = ({
         array_stocks_original,
         string_symbol,
         boolean_long,
         integer_shares_to_remove,
       }) =>
.         array_stocks_original.map((object_stock) =>
1           object_stock.string_symbol === string_symbol
(             ? object_get_stock_sell_updated({
/                 object_stock_original: object_stock,
&                 boolean_long: boolean_long,
>                 integer_shares_to_remove: integer_shares_to_remove,
               })
             : object_stock
         );
       
       /**
        * @description Main function
8        * @param {Object} ns - An instance of the `ns` object.
        */
*       export const main = async function (ns) {
         /**
9          * @description Prints a help message to the terminal.
          */
"         const void_print_help = () => {
J           const object_argument_names = object_constants.object_argument_names,
:             object_defaults = object_constants.object_defaults;
           ns.tprint(
             string_sanitise(`
       DESCRIPTION
         Trades stocks.
       
       USAGE
2         run ${ns.getScriptName()} [FLAGS] [OPTIONS ...]
       
       FLAGS
M         -${object_argument_names.help.short}, --${object_argument_names.help.long}
&           Displays this message then exits.
       
       OPTIONS
;         -${object_argument_names.investment_capital.short}, --${
6               object_argument_names.investment_capital.long
             } <FRACTION>
?           FRACTION = The fraction of your total cash (invested + not invested in the stock market) that can be used to invest in the stock market. Should be a floating point number > 0 <= 1. Defaults to ${
/             object_defaults.float_investment_capital
           }.
       
>         -${object_argument_names.prices_average_length.short}, --${
9               object_argument_names.prices_average_length.long
             } <RANGE>
?           RANGE = The length of the stock objects' average price array used to calculate the short range simple moving average of the stock's average price growth. Should be an integer >= 2. Defaults to ${
4             object_defaults.integer_prices_average_length
	           }.`)
           ),
             ns.exit();
         };
       
         /**
K          * @description Returns the number of shares of this stock in existence.
9          * @param {string} string_symbol - The stock's symbol.
H          * @returns {number} The number of shares of this stock in existence.
          */
0         const integer_shares_max = (string_symbol) =>
)           ns.getStockMaxShares(string_symbol);
       
         /**
:          * @description Returns this stock's current ask price.
9          * @param {string} string_symbol - The stock's symbol.
7          * @returns {number} This stock's current ask price.
          */
1         const float_get_price_ask = (string_symbol) =>
(           ns.getStockAskPrice(string_symbol);
       
         /**
:          * @description Returns this stock's current bid price.
9          * @param {string} string_symbol - The stock's symbol.
7          * @returns {number} This stock's current bid price.
          */
1         const float_get_price_bid = (string_symbol) =>
(           ns.getStockBidPrice(string_symbol);
       
         /**
>          * @description Returns this stock's current average price.
9          * @param {string} string_symbol - The stock's symbol.
;          * @returns {number} This stock's current average price.
          */
5         const float_get_price_average = (string_symbol) =>
P           (float_get_price_ask(string_symbol) + float_get_price_bid(string_symbol)) /
           2;
       
         /**
?          * @description Returns the current forecast for this stock.
9          * @param {string} string_symbol - The stock's symbol.
          */
0         const float_get_forecast = (string_symbol) =>
(           ns.getStockForecast(string_symbol);
       
         /**
O          * @description Returns an updated array of a stock's recent average prices.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
G          * @param {Object} object_arguments.object_stock - The stock object.
W          * @param {string} object_arguments.object_stock.string_symbol - The stock's symbol.
{          * @param {number[]} object_arguments.object_stock.array_prices_average - An array of the stock's recent average prices.
}          * @param {number} object_arguments.integer_prices_average_length - The maximum length of the stock's average price array.
K          * @returns {number[]} Updated array of a stock's recent average prices.
          */
.         const array_get_prices_average_updated = ({
           object_stock,
#           integer_prices_average_length,

         }) => {
L           const array_prices_average = object_stock.array_prices_average.concat([
=               float_get_price_average(object_stock.string_symbol),

             ]),
K             integer_prices_average_length_current = array_prices_average.length;
Q           return integer_prices_average_length_current > integer_prices_average_length
$             ? array_prices_average.slice(
P                 integer_prices_average_length_current - integer_prices_average_length

               )
             : array_prices_average;
         };
       
         /**
?          * @description Takes a stock object and returns a new one based on the original, but with an updated average price array and biggest average price value. This is ran after a stock market tick.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
Y          * @param {Object} object_arguments.object_stock_original - The original stock object.
`          * @param {string} object_arguments.object_stock_original.string_symbol - The stock's symbol.
?          * @param {number} object_arguments.object_stock_original.float_price_average_biggest - The biggest observed average price of this stock.
}          * @param {number} object_arguments.integer_prices_average_length - The maximum length of the stock's average price array.
q          * @returns {Object} The new stock object with an updated average price array and biggest average price value.
          */
+         const object_get_stock_tick_updated = ({
           object_stock_original,
#           integer_prices_average_length,

         }) => {
9           const float_price_average = float_get_price_average(
*             object_stock_original.string_symbol
           );
            return object_get_updated({
.             object_original: object_stock_original,
             object_properties_new:
P               float_price_average > object_stock_original.float_price_average_biggest
                 ? {
G                     array_prices_average: array_get_prices_average_updated({
5                       object_stock: object_stock_original,
N                       integer_prices_average_length: integer_prices_average_length,
                     }),
@                     float_price_average_biggest: float_price_average,
                   }
                 : {
G                     array_prices_average: array_get_prices_average_updated({
5                       object_stock: object_stock_original,
N                       integer_prices_average_length: integer_prices_average_length,
                     }),
                   },
           });
         };
       
         /**
Y          * @description Returns true if the 4S Market Data API is accessible, otherwise false.
;          * @param {string} string_symbol - A valid stock symbol.
W          * @returns {boolean} True if the 4S Market Data API is accessible, otherwise false.
          */
/         const boolean_have_4S = (string_symbol) => {

           try {
*             ns.getStockForecast(string_symbol);
             return true;
!           } catch (object_exception) {
             return false;
           }
         };
       
         /**
P          * @description Returns true if shorting stocks is possible, otherwise false.
;          * @param {string} string_symbol - A valid stock symbol.
N          * @returns {boolean} True if shorting stocks is possible, otherwise false.
          */
1         const boolean_can_short = (string_symbol) => {

           try {
&             ns.sellShort(string_symbol, 0);
             return true;
!           } catch (object_exception) {
             return false;
           }
         };
       
         /**
D          * @description Returns the profit to be made if shares are sold.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
G          * @param {Object} object_arguments.object_stock - The stock object.
W          * @param {string} object_arguments.object_stock.string_symbol - The stock's symbol.
?          * @param {number} object_arguments.object_stock.float_average_cash_spent_per_share_long - The average cash spent on shares of this stock owned in the long position.
?          * @param {number} object_arguments.object_stock.float_average_cash_spent_per_share_short - The average cash spent on shares of this stock owned in the short position.
]          * @param {number} object_arguments.integer_shares_to_sell - The amount of shares to sell.
?          * @param {boolean} object_arguments.boolean_long Whether the value is being calculated for shares in the long or short position. True = long, false = short.
A          * @returns {number} The profit to be made if shares are sold.
          */
         const float_get_profit = ({
           object_stock,
           integer_shares_to_sell,
           boolean_long,
         }) =>
           integer_shares_to_sell *
             (boolean_long
<               ? float_get_price_bid(object_stock.string_symbol) -
?                 object_stock.float_average_cash_spent_per_share_long
<               : float_get_price_ask(object_stock.string_symbol) -
C                 object_stock.float_average_cash_spent_per_share_short) -
'           object_constants.float_commission;
       
         /**
?          * @description Buys shares and returns true if transaction was sucessful, otherwise false. This function is effectful and impure.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
J          * @param {string} object_arguments.string_symbol - The stock's symbol.
T          * @param {number} object_arguments.integer_shares - The amount of shares to buy.
?          * @param {boolean} object_arguments.boolean_long Whether the shares transacted are in the long or short position. True = long, false = short.
M          * @returns {boolean} True if transaction was successful, otherwise false.
          */
K         const boolean_buy = ({ string_symbol, integer_shares, boolean_long }) =>
           boolean_long
7             ? ns.buyStock(string_symbol, integer_shares) > 0
:             : ns.shortStock(string_symbol, integer_shares) > 0;
       
         /**
?          * @description Sells shares and returns true if transaction was sucessful, otherwise false. This function is effectful and impure.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
J          * @param {string} object_arguments.string_symbol - The stock's symbol.
U          * @param {number} object_arguments.integer_shares - The amount of shares to sell.
?          * @param {boolean} object_arguments.boolean_long Whether the shares transacted are in the long or short position. True = long, false = short.
M          * @returns {boolean} True if transaction was successful, otherwise false.
          */
L         const boolean_sell = ({ string_symbol, integer_shares, boolean_long }) =>
           boolean_long
8             ? ns.sellStock(string_symbol, integer_shares) > 0
9             : ns.sellShort(string_symbol, integer_shares) > 0;
       
         /**
P          * @description Returns the current number of available shares of this stock.
6          * @param {Object} object_stock - The stock object.
F          * @param {string} object_stock.string_symbol - The stock's symbol.
w          * @param {number} object_stock.integer_shares_long - The amount of shares of this stock owned in the long position.
y          * @param {number} object_stock.integer_shares_short - The amount of shares of this stock owned in the short position.
M          * @returns {number} The current number of available shares of this stock.
          */
*         const integer_get_shares_available = ({
           string_symbol,
           integer_shares_long,
           integer_shares_short,
         }) =>
(           integer_shares_max(string_symbol) -
2           (integer_shares_long + integer_shares_short);
       
         /**
v          * @description Returns the current number of affordable shares of this stock in either the long or short position.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
G          * @param {Object} object_arguments.object_stock - The stock object.
W          * @param {string} object_arguments.object_stock.string_symbol - The stock's symbol.
Y          * @param {number} object_arguments.float_cash - The amount of cash that can be spent.
?          * @param {boolean} object_arguments.boolean_long Whether the value is being calculated for shares in the long or short position. True = long, false = short.
k          * @returns {number} The number of affordable shares of this stock in either the long or short position.
          */
(         const integer_get_shares_buyable = ({
           object_stock,
           float_cash,
           boolean_long,

         }) => {
(           const integer_can_buy = Math.floor(
B               (float_cash - object_constants.float_commission_double) /
                 (boolean_long
>                   ? float_get_price_ask(object_stock.string_symbol)
?                   : float_get_price_bid(object_stock.string_symbol))
	             ),
M             integer_available_shares = integer_get_shares_available(object_stock);
6           return integer_can_buy > integer_available_shares
!             ? integer_available_shares
             : integer_can_buy;
         };
       
         /**
?          * @description Takes a stock object and returns a new one based on the original, but with an updated average cash per share value. This is ran after buying shares.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
W          * @param {Object} object_arguments.object_stock_original The original stock object.
`          * @param {string} object_arguments.object_stock_original.string_symbol - The stock's symbol.
?          * @param {number} object_arguments.object_stock_original.integer_shares_long - The amount of shares of this stock owned in the long position.
?          * @param {number} object_arguments.object_stock_original.integer_shares_short - The amount of shares of this stock owned in the short position.
?          * @param {number} object_arguments.object_stock_original.float_average_cash_spent_per_share_long - The average cash spent on shares of this stock owned in the long position.
?          * @param {number} object_arguments.object_stock_original.float_average_cash_spent_per_share_short - The average cash spent on shares of this stock owned in the short position.
?          * @param {boolean} object_arguments.boolean_long Whether the value is being updated for shares in the long or short position. True = long, false = short.
[          * @param {number} object_arguments.integer_shares_to_add - The amount of shares to add.
Z          * @returns {Object} The new stock object with an updated average cash per share value.
          */
C         const object_get_stock_average_cash_spent_per_share_updated = ({
           object_stock_original,
           boolean_long,
           integer_shares_to_add,

         }) => {
0           const integer_shares_current = boolean_long
4               ? object_stock_original.integer_shares_long
6               : object_stock_original.integer_shares_short,
M             integer_shares_total = integer_shares_current + integer_shares_to_add;
            return object_get_updated({
.             object_original: object_stock_original,
*             object_properties_new: boolean_long
               ? {
5                   float_average_cash_spent_per_share_long:
(                     (integer_shares_current *
Q                       object_stock_original.float_average_cash_spent_per_share_long) /
'                       integer_shares_total +
'                     (integer_shares_to_add *
L                       (float_get_price_ask(object_stock_original.string_symbol) +
P                         object_constants.float_commission / integer_shares_to_add)) /
&                       integer_shares_total,
                 }
               : {
6                   float_average_cash_spent_per_share_short:
(                     (integer_shares_current *
R                       object_stock_original.float_average_cash_spent_per_share_short) /
'                       integer_shares_total +
'                     (integer_shares_to_add *
L                       (float_get_price_bid(object_stock_original.string_symbol) +
P                         object_constants.float_commission / integer_shares_to_add)) /
&                       integer_shares_total,
                 },
           });
         };
       
         /**
?          * @description Takes a stock object and returns a new one based on the original, but with values updated after buying some shares.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
W          * @param {Object} object_arguments.object_stock_original The original stock object.
`          * @param {string} object_arguments.object_stock_original.string_symbol - The stock's symbol.
?          * @param {number} object_arguments.object_stock_original.integer_shares_long - The amount of shares of this stock owned in the long position.
?          * @param {number} object_arguments.object_stock_original.integer_shares_short - The amount of shares of this stock owned in the short position.
?          * @param {number} object_arguments.object_stock_original.float_average_cash_spent_per_share_long - The average cash spent on shares of this stock owned in the long position.
?          * @param {number} object_arguments.object_stock_original.float_average_cash_spent_per_share_short - The average cash spent on shares of this stock owned in the short position.
?          * @param {boolean} object_arguments.boolean_long Whether the value is being updated for shares in the long or short position. True = long, false = short.
[          * @param {number} object_arguments.integer_shares_to_add - The amount of shares to add.
Z          * @returns {Object} The new stock object with values updated after buying some shares.
          */
*         const object_get_stock_buy_updated = ({
           object_stock_original,
           boolean_long,
           integer_shares_to_add,

         }) => {
.           const integer_shares_owned = boolean_long
4               ? object_stock_original.integer_shares_long
6               : object_stock_original.integer_shares_short,
?             integer_shares_available = integer_get_shares_available(
               object_stock_original
	             ),
K             integer_shares_total = integer_shares_owned + integer_shares_to_add;
            return object_get_updated({
O             object_original: object_get_stock_average_cash_spent_per_share_updated({
6               object_stock_original: object_stock_original,
$               boolean_long: boolean_long,
               integer_shares_to_add:
:                 integer_shares_total > integer_shares_available
'                   ? integer_shares_available
%                   : integer_shares_to_add,

             }),
*             object_properties_new: boolean_long
               ? {
!                   integer_shares_long:
>                     integer_shares_total > integer_shares_available
B                       ? integer_shares_owned + integer_shares_available
@                       : integer_shares_owned + integer_shares_to_add,
                 }
               : {
"                   integer_shares_short:
>                     integer_shares_total > integer_shares_available
B                       ? integer_shares_owned + integer_shares_available
@                       : integer_shares_owned + integer_shares_to_add,
                 },
           });
         };
       
         /**
T          * @description Returns an array of stock objects for all existing stock symbols.
P          * @returns {Object[]} Array of stock objects for all existing stock symbols.
          */
!         const array_get_stocks = () =>
2           ns.getStockSymbols().map((string_symbol) => {
J             const float_price_average = float_get_price_average(string_symbol);
              return object_get_stock({
&               string_symbol: string_symbol,
                integer_shares_long: 0,
!               integer_shares_short: 0,
4               float_average_cash_spent_per_share_long: 0,
5               float_average_cash_spent_per_share_short: 0,
:               float_price_average_biggest: float_price_average,
5               array_prices_average: [float_price_average],

             });
           });
       
         /**
?          * @description Takes an array of stock objects and returns a new one based on the original, but with values updated after one market tick.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
c          * @param {Object[]} object_arguments.array_stocks_original The original array of stock objects.
?          * @param {number} object_arguments.integer_prices_average_length - The maximum length of the stock objects' average price arrays.
c          * @returns {Object[]} The new array of stock objects with values updated after one market tick.
          */
+         const array_get_stocks_tick_updated = ({
           array_stocks_original,
#           integer_prices_average_length,
         }) =>
0           array_stocks_original.map((object_stock) =>
&             object_get_stock_tick_updated({
-               object_stock_original: object_stock,
F               integer_prices_average_length: integer_prices_average_length,
	             })
           );
       
         /**
X          * @description Returns the remaining amount of cash that can be used for investment.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
q          * @param {number} object_arguments.float_cash_invested - The amount of cash currently invested in the market.
w          * @param {number} object_arguments.float_investment_capital - The fraction of cash that can be used for investment.
U          * @returns {number} The remaining amount of cash that can be used for investment.
          */
$         const float_get_capital_left = ({
           float_cash_invested,
           float_investment_capital,

         }) => {
           return (
C             (ns.getServerMoneyAvailable("home") + float_cash_invested) *
#               float_investment_capital -
             float_cash_invested
           );
         };
       
         /**
W          * @description Returns true if shares of a stock should be bought, otherwise false.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
G          * @param {Object} object_arguments.object_stock - The stock object.
W          * @param {string} object_arguments.object_stock.string_symbol - The stock's symbol.
[          * @param {number} object_arguments.integer_shares_to_buy - The amount of shares to buy.
?          * @param {boolean} object_arguments.boolean_long Whether the value is being calculated for shares in the long or short position. True = long, false = short.
?          * @param {number} object_arguments.integer_smoothing - The amount of values to average for the shorter ranger average growth rate, which is compared with the longer range average growth rate when 4S Market Data API is inaccessible.
J          * @returns {boolean} True if shares should be bought, otherwise false.
          */
          const boolean_should_buy = ({
           object_stock,
           integer_shares_to_buy,
           boolean_long,
           integer_smoothing,

         }) => {
7           if (boolean_have_4S(object_stock.string_symbol)) {
             return boolean_long
B               ? float_get_forecast(object_stock.string_symbol) > 0.5 &&
P                   // Ensure that growth is sufficient to break even from commissions.
7                   object_constants.float_commission_double /
'                     (integer_shares_to_buy *
B                       float_get_price_ask(object_stock.string_symbol) +
<                       object_constants.float_commission_double) <
1                     float_get_growth_average_absolute(
2                       object_stock.array_prices_average
                     ) &&
?                   // Assume that the biggest recorded price is the biggest the price can reach, so need to ensure that even if it's reached, we can still break even.
8                   (object_stock.float_price_average_biggest -
E                     float_get_price_average(object_stock.string_symbol)) *
&                     integer_shares_to_buy >
7                     object_constants.float_commission_double
B               : float_get_forecast(object_stock.string_symbol) < 0.5 &&
P                   // Ensure that growth is sufficient to break even from commissions.
7                   object_constants.float_commission_double /
'                     (integer_shares_to_buy *
B                       float_get_price_bid(object_stock.string_symbol) +
<                       object_constants.float_commission_double) <
1                     float_get_growth_average_absolute(
2                       object_stock.array_prices_average
                     ) &&
?                   // Assume that 0 is the lowest the price can reach, so need to ensure that even if it's reached, we can still break even.
B                   float_get_price_average(object_stock.string_symbol) *
&                     integer_shares_to_buy >
8                     object_constants.float_commission_double;
           } else {
W             const float_growth_average_range_latest = float_get_growth_average_range_latest(

               {
<                 array_numbers: object_stock.array_prices_average,
4                 integer_latest_length: integer_smoothing,

               }
	             );
             return boolean_long
m               ? // Buy only if latest SMA of growth is greater than lagging as this indicates an upwards momentum.
.                 float_growth_average_range_latest >
5                   float_get_growth_average_range_lagging({
@                     array_numbers: object_stock.array_prices_average,
9                     integer_lagging_length: integer_smoothing,
                   }) &&
?                   // Buy only if stock has actually been increasing in price and not just decreasing in price at a slower rate than it was before.
5                   float_growth_average_range_latest > 0 &&
_                   // Just to be extra safe, ensure that the stock's latest growth was also positive.
4                   float_get_growth_average_range_latest({
@                     array_numbers: object_stock.array_prices_average,
(                     integer_latest_length: 2,
                   }) > 0 &&
P                   // Ensure that growth is sufficient to break even from commissions.
7                   object_constants.float_commission_double /
'                     (integer_shares_to_buy *
B                       float_get_price_ask(object_stock.string_symbol) +
<                       object_constants.float_commission_double) <
1                     float_get_growth_average_absolute(
2                       object_stock.array_prices_average
                     ) &&
?                   // Assume that the biggest recorded price is the biggest the price can reach, so need to ensure that even if it's reached, we can still break even.
8                   (object_stock.float_price_average_biggest -
E                     float_get_price_average(object_stock.string_symbol)) *
&                     integer_shares_to_buy >
7                     object_constants.float_commission_double
k               : // Buy only if latest SMA of growth is less than lagging as this indicates a downwards momentum.
.                 float_growth_average_range_latest <
5                   float_get_growth_average_range_lagging({
@                     array_numbers: object_stock.array_prices_average,
9                     integer_lagging_length: integer_smoothing,
                   }) &&
?                   // Buy only if stock has actually been decreasing in price and not just increasing in price at a slower rate than it was before.
5                   float_growth_average_range_latest < 0 &&
_                   // Just to be extra safe, ensure that the stock's latest growth was also negative.
4                   float_get_growth_average_range_latest({
@                     array_numbers: object_stock.array_prices_average,
(                     integer_latest_length: 2,
                   }) < 0 &&
P                   // Ensure that growth is sufficient to break even from commissions.
7                   object_constants.float_commission_double /
'                     (integer_shares_to_buy *
B                       float_get_price_bid(object_stock.string_symbol) +
<                       object_constants.float_commission_double) <
1                     float_get_growth_average_absolute(
2                       object_stock.array_prices_average
                     ) &&
?                   // Assume that 0 is the lowest the price can reach, so need to ensure that even if it's reached, we can still break even.
B                   float_get_price_average(object_stock.string_symbol) *
&                     integer_shares_to_buy >
8                     object_constants.float_commission_double;
           }
         };
       
         /**
?         * @description Takes an array of stock objects and returns a new one based on the original, optimised for buying shares. If buying shares in the long position, excludes objects that have forecast values below a threshold and sorts the rest by their forecast value from highest to lowest. Otherwise, excludes objects that have forecast values above a threshold and sorts the rest by their forecast value from lowest to highest.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
Y          * @param {Object} object_arguments.object_stocks_original The original stocks object.
q          * @param {Object[]} object_arguments.object_stocks_original.array_stocks The original array of stock objects.
?          * @param {boolean} object_arguments.boolean_long - Whether the forecast values are being calculated for shares in the long or short position. True = long, false = short.
?          * @param {number} object_arguments.integer_smoothing - The amount of values to average for the shorter range average growth rate, which is compared with the longer range average growth rate when 4S Market Data API is inaccessible.
w          * @param {number} object_arguments.float_investment_capital - The fraction of cash that can be used for investment.
U          * @returns {Object[]} The new array of stock objects optimised for buying shares.
          */
"         const array_get_stocks_buy = ({
           object_stocks_original,
           boolean_long,
           integer_smoothing,
           float_investment_capital,
         }) =>
           array_map_sort(
C             object_stocks_original.array_stocks.filter((object_stock) =>
               boolean_should_buy({
&                 object_stock: object_stock,
>                 integer_shares_to_buy: integer_get_shares_buyable({
(                   object_stock: object_stock,
1                   float_cash: float_get_capital_left({
O                     float_cash_invested: object_stocks_original.float_cash_invested,
B                     float_investment_capital: float_investment_capital,
                   }),
(                   boolean_long: boolean_long,
                 }),
&                 boolean_long: boolean_long,
0                 integer_smoothing: integer_smoothing,
               })
	             ),
             (object_stock) =>
4               boolean_have_4S(object_stock.string_symbol)
;                 ? float_get_forecast(object_stock.string_symbol)
4                 : float_get_growth_average_range_latest({
@                     array_numbers: object_stock.array_prices_average,
8                     integer_latest_length: integer_smoothing,
                   }),
             boolean_long
L               ? (element_first, element_second) => element_second - element_first
L               : (element_first, element_second) => element_first - element_second
           );
       
         /**
?          * @description Takes an array of stock objects and returns a new one based on the original, but updated after buying shares in a stock.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
c          * @param {Object[]} object_arguments.array_stocks_original The original array of stock objects.
J          * @param {string} object_arguments.string_symbol - The stock's symbol.
?          * @param {boolean} object_arguments.boolean_long - Whether the shares transacted were in the long or short position. True = long, false = short.
Z          * @param {number} object_arguments.integer_shares_to_add - The amount of shares added.
W          * @returns {Object[]} The new array of stock objects with the updated stock object.
          */
*         const array_get_stocks_buy_updated = ({
           array_stocks_original,
           string_symbol,
           boolean_long,
           integer_shares_to_add,
         }) =>
0           array_stocks_original.map((object_stock) =>
3             object_stock.string_symbol === string_symbol
)               ? object_get_stock_buy_updated({
1                   object_stock_original: object_stock,
(                   boolean_long: boolean_long,
:                   integer_shares_to_add: integer_shares_to_add,
                 })
               : object_stock
           );
       
         /**
?          * @description Takes a stocks object and returns a new one based on the original, but with values updated after one market tick.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
[          * @param {Object} object_arguments.object_stocks_original - The original stocks object.
?          * @param {number} object_arguments.integer_prices_average_length - The maximum length of the stock objects' average price arrays.
&          * @returns {Object} Stocks object.
          */
,         const object_get_stocks_tick_updated = ({
           object_stocks_original,
#           integer_prices_average_length,
         }) =>
           object_get_updated({
/             object_original: object_stocks_original,
             object_properties_new: {
6               array_stocks: array_get_stocks_tick_updated({
F                 array_stocks_original: object_stocks_original.array_stocks,
H                 integer_prices_average_length: integer_prices_average_length,
               }),
	             },
           });
       
         /**
?          * @description Takes a stocks object and returns a new one based on the original, but with values updated after buying some shares of a stock.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
[          * @param {Object} object_arguments.object_stocks_original - The original stocks object.
J          * @param {string} object_arguments.string_symbol - The stock's symbol.
?          * @param {boolean} object_arguments.boolean_long - Whether the shares transacted were in the long or short position. True = long, false = short.
Z          * @param {number} object_arguments.integer_shares_to_add - The amount of shares added.
&          * @returns {Object} Stocks object.
          */
+         const object_get_stocks_buy_updated = ({
           object_stocks_original,
           string_symbol,
           boolean_long,
           integer_shares_to_add,
         }) =>
           object_get_updated({
/             object_original: object_stocks_original,
             object_properties_new: {
5               array_stocks: array_get_stocks_buy_updated({
F                 array_stocks_original: object_stocks_original.array_stocks,
(                 string_symbol: string_symbol,
&                 boolean_long: boolean_long,
8                 integer_shares_to_add: integer_shares_to_add,
               }),
               float_cash_invested:
7                 object_stocks_original.float_cash_invested +
.                 object_constants.float_commission +
"                 integer_shares_to_add *
                   (boolean_long
3                     ? float_get_price_ask(string_symbol)
5                     : float_get_price_bid(string_symbol)),
	             },
           });
       
         /**
?          * @description Takes a stocks object and returns a new one based on the original, but with values updated after selling some shares of a stock.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
[          * @param {Object} object_arguments.object_stocks_original - The original stocks object.
J          * @param {string} object_arguments.string_symbol - The stock's symbol.
?          * @param {boolean} object_arguments.boolean_long - Whether the shares transacted were in the long or short position. True = long, false = short.
_          * @param {number} object_arguments.integer_shares_to_remove - The amount of shares removed.
&          * @returns {Object} Stocks object.
          */
,         const object_get_stocks_sell_updated = ({
           object_stocks_original,
           string_symbol,
           boolean_long,
           integer_shares_to_remove,
         }) =>
           object_get_updated({
/             object_original: object_stocks_original,
             object_properties_new: {
6               array_stocks: array_get_stocks_sell_updated({
F                 array_stocks_original: object_stocks_original.array_stocks,
(                 string_symbol: string_symbol,
&                 boolean_long: boolean_long,
>                 integer_shares_to_remove: integer_shares_to_remove,
               }),
               float_cash_invested:
7                 object_stocks_original.float_cash_invested -
                 float_get_profit({
D                   object_stock: object_stocks_original.array_stocks.find(
M                     (object_stock) => object_stock.string_symbol === string_symbol
                   ),
>                   integer_shares_to_sell: integer_shares_to_remove,
(                   boolean_long: boolean_long,
                 }),
	             },
           });
       
         /**
J          * @description Returns true if shares should be sold, otherwise false.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
G          * @param {Object} object_arguments.object_stock - The stock object.
W          * @param {string} object_arguments.object_stock.string_symbol - The stock's symbol.
]          * @param {number} object_arguments.integer_shares_to_sell - The amount of shares to sell.
?          * @param {boolean} object_arguments.boolean_long Whether the value is being calculated for shares in the long or short position. True = long, false = short.
?          * @param {number} object_arguments.integer_smoothing - The amount of values to average for the shorter ranger average growth rate, which is compared with the longer range average growth rate when 4S Market Data API is inaccessible.
H          * @returns {boolean} True if shares should be sold, otherwise false.
          */
!         const boolean_should_sell = ({
           object_stock,
           integer_shares_to_sell,
           boolean_long,
           integer_smoothing,
         }) =>
0           boolean_have_4S(object_stock.string_symbol)
             ? float_get_profit({
&                 object_stock: object_stock,
:                 integer_shares_to_sell: integer_shares_to_sell,
&                 boolean_long: boolean_long,
               }) > 0 &&
               (boolean_long
A                 ? float_get_forecast(object_stock.string_symbol) < 0.5
B                 : float_get_forecast(object_stock.string_symbol) > 0.5)
             : float_get_profit({
&                 object_stock: object_stock,
:                 integer_shares_to_sell: integer_shares_to_sell,
&                 boolean_long: boolean_long,
               }) > 0 &&
               (boolean_long
4                 ? float_get_growth_average_range_latest({
@                     array_numbers: object_stock.array_prices_average,
8                     integer_latest_length: integer_smoothing,
                   }) <
7                     float_get_growth_average_range_lagging({
B                       array_numbers: object_stock.array_prices_average,
;                       integer_lagging_length: integer_smoothing,
                     }) &&
4                   float_get_growth_average_range_latest({
@                     array_numbers: object_stock.array_prices_average,
(                     integer_latest_length: 2,
                   }) < 0
4                 : float_get_growth_average_range_latest({
@                     array_numbers: object_stock.array_prices_average,
8                     integer_latest_length: integer_smoothing,
                   }) >
7                     float_get_growth_average_range_lagging({
B                       array_numbers: object_stock.array_prices_average,
;                       integer_lagging_length: integer_smoothing,
                     }) &&
4                   float_get_growth_average_range_latest({
@                     array_numbers: object_stock.array_prices_average,
(                     integer_latest_length: 2,
                   }) > 0);
       
         /**
?          * @description Sells invested shares if profitable and returns updated stocks object. This function is effectful and impure.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
[          * @param {Object} object_arguments.object_stocks_original - The original stocks object.
?          * @param {boolean} object_arguments.boolean_long - Whether the shares transacted are in the long or short position. True = long, false = short.
?          * @param {number} object_arguments.integer_smoothing - The amount of values to average for the shorter ranger average growth rate, which is compared with the longer range average growth rate when 4S Market Data API is inaccessible.
&          * @returns {Object} Stocks object.
          */
5         const object_get_stocks_sell_invested_updated = ({
           object_stocks_original,
           boolean_long,
           integer_smoothing,

         }) => {
7           let object_stocks = clone(object_stocks_original),
:             array_stocks_invested = array_get_stocks_invested({
;               array_stocks_original: object_stocks.array_stocks,
$               boolean_long: boolean_long,

             });

           for (
             ;
3             array_stocks_invested.some((object_stock) =>
               boolean_should_sell({
&                 object_stock: object_stock,
/                 integer_shares_to_sell: boolean_long
/                   ? object_stock.integer_shares_long
1                   : object_stock.integer_shares_short,
&                 boolean_long: boolean_long,
0                 integer_smoothing: integer_smoothing,
               })
             ) &&
O             ns.getServerMoneyAvailable("home") >= object_constants.float_commission;
       
           ) {
:             for (const object_stock of array_stocks_invested) {
               if (
Q                 ns.getServerMoneyAvailable("home") < object_constants.float_commission
               ) {
                 break;

               }
,               const integer_shares = boolean_long
-                 ? object_stock.integer_shares_long
/                 : object_stock.integer_shares_short;
               if (
                  boolean_should_sell({
(                   object_stock: object_stock,
4                   integer_shares_to_sell: integer_shares,
(                   boolean_long: boolean_long,
2                   integer_smoothing: integer_smoothing,
                 })
               ) {
                 if (
                   boolean_sell({
9                     string_symbol: object_stock.string_symbol,
.                     integer_shares: integer_shares,
*                     boolean_long: boolean_long,
                   })
                 ) {
l                   // Transaction was successful, update the stocks object, then update the invested stocks array.
=                   object_stocks = object_get_stocks_sell_updated({
5                     object_stocks_original: object_stocks,
9                     string_symbol: object_stock.string_symbol,
*                     boolean_long: boolean_long,
8                     integer_shares_to_remove: integer_shares,
                   });
@                   array_stocks_invested = array_get_stocks_invested({
A                     array_stocks_original: object_stocks.array_stocks,
*                     boolean_long: boolean_long,
                   });
                   break;
                 }

               }
             }
           }
           return object_stocks;
         };
       
         /**
s          * @description Buys profitable shares and returns updated stocks object. This function is effectful and impure.
Q          * @param {Object} object_arguments - Contains the arguments for the function.
[          * @param {Object} object_arguments.object_stocks_original - The original stocks object.
?          * @param {number} object_arguments.float_investment_capital - The fraction of total assets to potentially be used for investing in the market.
?          * @param {boolean} object_arguments.boolean_long - Whether the shares transacted are in the long or short position. True = long, false = short.
&          * @returns {Object} Stocks object.
          */
6         const object_get_stocks_buy_profitable_updated = ({
           object_stocks_original,
           boolean_long,
           float_investment_capital,
           integer_smoothing,

         }) => {
7           let object_stocks = clone(object_stocks_original),
0             array_stocks_buy = array_get_stocks_buy({
/               object_stocks_original: object_stocks,
$               boolean_long: boolean_long,
.               integer_smoothing: integer_smoothing,
<               float_investment_capital: float_investment_capital,

             });

           for (
             ;
%             array_stocks_buy.length > 0 &&
O             ns.getServerMoneyAvailable("home") >= object_constants.float_commission;
             
           ) {
0             const object_stock = array_stocks_buy[0],
6               float_capital_left = float_get_capital_left({
B                 float_cash_invested: object_stocks.float_cash_invested,
>                 float_investment_capital: float_investment_capital,
               }),
>               integer_shares_buyable = integer_get_shares_buyable({
&                 object_stock: object_stock,
*                 float_cash: float_capital_left,
&                 boolean_long: boolean_long,
               });
             if (
               boolean_buy({
5                 string_symbol: object_stock.string_symbol,
2                 integer_shares: integer_shares_buyable,
&                 boolean_long: boolean_long,
               })

             ) {
U               // Transaction was successful, update stocks object and stocks to buy array.
8               object_stocks = object_get_stocks_buy_updated({
1                 object_stocks_original: object_stocks,
5                 string_symbol: object_stock.string_symbol,
&                 boolean_long: boolean_long,
9                 integer_shares_to_add: integer_shares_buyable,
               });
2               array_stocks_buy = array_get_stocks_buy({
1                 object_stocks_original: object_stocks,
&                 boolean_long: boolean_long,
0                 integer_smoothing: integer_smoothing,
>                 float_investment_capital: float_investment_capital,
               });
             }
           }
           return object_stocks;
         };
       
#         const main = async function () {
J           const object_argument_names = object_constants.object_argument_names,
:             object_defaults = object_constants.object_defaults,
6             object_storage = parent["window"].localStorage;
M           let float_investment_capital = object_defaults.float_investment_capital,
&             integer_prices_average_length =
7               object_defaults.integer_prices_average_length,
             boolean_print_help = !1;
           // Argument parsing.
>           const object_arguments = object_parse_arguments(ns.args);
4           for (const string_argument in object_arguments)
>             if (object_arguments.hasOwnProperty(string_argument)) {
B               const argument_value = object_arguments[string_argument];
#               switch (string_argument) {
?                 case object_argument_names.investment_capital.short:
                 // fall-through
>                 case object_argument_names.investment_capital.long:
7                   float_investment_capital = argument_value;
                   break;
1                 case object_argument_names.help.short:
                 // fall-through
0                 case object_argument_names.help.long:
1                   boolean_print_help = argument_value;
                   break;
B                 case object_argument_names.prices_average_length.short:
                 // fall-through
A                 case object_argument_names.prices_average_length.long:
<                   integer_prices_average_length = argument_value;
                   break;
                 case "_":
                   continue;
                 default:
[                   const string_message_error = `Unknown argument passed: "${string_argument}".`;
                   throw (
<                     (ns.tprint(`ERROR: ${string_message_error}`),
/                     new Error(string_message_error))
                   );

               }
             }
       
           // Main.
1           if (boolean_print_help) void_print_help(ns);
#           let integer_time = Date.now(),
F             object_stocks_buffer = object_storage.getItem("object_stocks"),
             object_stocks = null;
Q           // Load stocks object from storage if it exists, otherwise create a new one.
)           if (object_stocks_buffer === null) {
*             object_stocks = object_get_stocks({
*               array_stocks: array_get_stocks(),
                float_cash_invested: 0,

             });
           } else {
\             (await ns.prompt(`Existing stock market information detected. Do you want to keep it?
s       Select "No" if you've just reset after installing augmentations or defeating a BitNode, otherwise select "Yes".`))
=               ? (object_stocks = JSON.parse(object_stocks_buffer))
/               : (object_stocks = object_get_stocks({
.                   array_stocks: array_get_stocks(),
$                   float_cash_invested: 0,
                 }));
           }
1           const integer_prices_average_length_double =
+               integer_prices_average_length * 2,
H             string_some_symbol = object_stocks.array_stocks[0].string_symbol;
8           // Increase amount of recorded prices if necessary.

           for (
             ;
B             object_stocks.array_stocks[0].array_prices_average.length <
,             integer_prices_average_length_double;
       
           ) {
             await ns.sleep(
               Math.max(
                 0,
Q                 object_constants.float_period_update_stock + integer_time - Date.now()

               )
	             );
!             integer_time = Date.now();
7             object_stocks = object_get_stocks_tick_updated({
/               object_stocks_original: object_stocks,
M               integer_prices_average_length: integer_prices_average_length_double,

             });
N             object_storage.setItem("object_stocks", JSON.stringify(object_stocks));
           }
D           // Maximum length of arrays reached, can now begin transacting.
           for (;;) {
             // Sell long.
@             object_stocks = object_get_stocks_sell_invested_updated({
/               object_stocks_original: object_stocks,
               boolean_long: true,
:               integer_smoothing: integer_prices_average_length,

             });
N             object_storage.setItem("object_stocks", JSON.stringify(object_stocks));
             // Sell short.
3             if (boolean_can_short(string_some_symbol)) {
B               object_stocks = object_get_stocks_sell_invested_updated({
1                 object_stocks_original: object_stocks,
                 boolean_long: false,
<                 integer_smoothing: integer_prices_average_length,
               });
P               object_storage.setItem("object_stocks", JSON.stringify(object_stocks));
             }
             // Buy long.
A             object_stocks = object_get_stocks_buy_profitable_updated({
/               object_stocks_original: object_stocks,
<               float_investment_capital: float_investment_capital,
               boolean_long: true,
:               integer_smoothing: integer_prices_average_length,

             });
N             object_storage.setItem("object_stocks", JSON.stringify(object_stocks));
             // Buy short.
3             if (boolean_can_short(string_some_symbol)) {
C               object_stocks = object_get_stocks_buy_profitable_updated({
                 ns: ns,
1                 object_stocks_original: object_stocks,
>                 float_investment_capital: float_investment_capital,
                 boolean_long: false,
<                 integer_smoothing: integer_prices_average_length,
               });
P               object_storage.setItem("object_stocks", JSON.stringify(object_stocks));
             }
#             // Update after market tick.
             await ns.sleep(
               Math.max(
                 0,
Q                 object_constants.float_period_update_stock + integer_time - Date.now()

               )
	             );
!             integer_time = Date.now();
7             object_stocks = object_get_stocks_tick_updated({
/               object_stocks_original: object_stocks,
M               integer_prices_average_length: integer_prices_average_length_double,

             });
N             object_storage.setItem("object_stocks", JSON.stringify(object_stocks));
           }
         };
       
         await main();
       };
                     @       N?? eq??P?\i?ɬRH??~??@c?q????A,???DS? ?a??u$6>=?F??b????%B          @       N?? eq??P?\i?ɬRH??~??@c?q????A,???DS? ?a??u$6>=?F??b????%A          @       N?? eq??P?\i?ɬRH??~??@c?q????A,???DS? ?a??u$6>=?F??b????%   @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<V0                     @       N?? eq??P?\i?ɬRH??~??@c?q????A,???DS? ?a??u$6>=?F??b????%A                 @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<V;        $             [             throw (ns.print(`ERROR: ${string_message_error}`), new Error(string_message_error));
   @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<V0                    @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛔ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛓ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛓ                 @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛕ        %             $       export const array_make_servers = (
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛘ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛗ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛙ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛘ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛚ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛙ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?45          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛚ          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛛ          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?45          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛛ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛚ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛜ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛛ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛝ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛜ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?46          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛝ          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛟ          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?46          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛟ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛞ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛠ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛟ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?47          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛠ          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛣ          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?47          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛣ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛢ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛤ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛣ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛥ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛤ          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛗ                 @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z?ꛦ        &                    ) =>
$         array_method_get_servers(ns).map(
           object_server =>
3             object_method_make_server(ns, object_server)
         );
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4:          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?49          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?49                 @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4;        +             <           array_servers_used_updated = clone(array_servers_used),
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????                 @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????        ,             E       export const object_get_server_ram_free_biggest = array_servers => {
=         const array_server_sorted_ram = clone(array_servers).sort(
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????                 @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????        .      	              /**
?        * @description Clamps float_number within the inclusive range specified by the boundary values float_limit_a and float_limit_b. If float_number falls within the range, return float_number. Otherwise, return the nearest number in the range.
5        * @param {number} float_number The number to clamp.
I        * @param {number} float_limit_a The inclusive lower bound of the range.
G        * @param {number} float_limit_b The incluse upper bound of the range.
)        * @returns {number} The clamped number.
x        * @see {@link https://github.com/30-seconds/30-seconds-of-code/commit/611729214af360d935b8a96ec9c5a45f2c7bfb37|GitHub}
        */
       export const float_clamp = (
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????                 @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????        7                    ) =>
         Math.max(
           Math.min(
             float_number,
             Math.max(
               float_limit_a,
               float_limit_b
             )
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????                 @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????        ?                        Math.min(
             float_limit_a,
             float_limit_b
           )
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?_???s!W????l?@??^Z/?1?L??JF?0k)?7?G??*?,>??w?a(?o?????:          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ?_???s!W????l?@??^Z/?1?L??JF?0k)?7?G??*?,>??w?a(?o?????:   @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4=          @       ?_???s!W????l?@??^Z/?1?L??JF?0k)?7?G??*?,>??w?a(?o?????:          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4>          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4=          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4?          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4>          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4?          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4@          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4@          @       ?X̾???TbP/???4E???NO?zp?N^?*D-?g?D?kN?ջ̒]6[??I3 ??`?4   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z????          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???	         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???
         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???	         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???
         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb   @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb          @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???                @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb        C                    /**
V        * @description Returns a string with characters converted to their HTML equivalents.
0        * @param {string} string - String to sanitise.
+        * @returns {string} The sanitised string.
C        * @see {@link https://stackoverflow.com/a/30376762|StackOverflow}
        */
+       export const string_sanitise = string => {
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb%          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb$          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb$                 @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb&        J             O         return string.replace(/[&<>"']/g, string_match => object_map[string_match]);
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb(          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb'          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb(          @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       1&KĀ?'??۩??[?Kb?????2	????E?c??SJנ??Wp?/ ?"?7N?_w??̻??Rb'                 @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??        K                    /**
@        * @description mapsort - Performant sorting for complex input.
2        * @param {Object[]} a - Array of values to sort.
]        * @param {function} b - Function to use on values of `a` to get ideal versions for sorting.
6        * @param {function} c - Sorting function to be used.
,        * @returns {Object[]} The new sorted list.
S        * @see {@link https://unpkg.com/mapsort@1.0.3/compiled/iife/mapsort.min.js|unpkg}
7        * @see {@link https://github.com/Pimm/mapsort|GitHub}
        * @license MIT
        * @example
'        * const sortedArray = array_map_sort(
        *   array,
        *   element => {
=        *     // Return the version of "element" which is ideal for
9        *     // sorting. This version is passed to the compare
        *     // function below.
        *   },
        *   (a, b) => {
:        *     // (Optional.) Return a negative number if a comes
>        *     // before b; a positive number if b comes before a; or
        *     // 0 if they are equal.
        *   }
        * );
        */
?      export const array_map_sort=(function(){'use strict';function defaultCompareFunction(a,b){var c=a+"",d=b+"";return c<d?-1:c>d?1:0}var forEach=[].forEach;function mapSort(a,b,c){if("function"!=typeof b)throw new TypeError(b+" is not a function");var d,e=[],f=[],g=[];forEach.call(a,function(a,h,i){if(d=b(a,h,i),void 0===d)return void g.push(a);if(void 0===c&&"symbol"==typeof d)throw new TypeError("Can't convert symbol to string");e.push(h),f[h]=d;}),void 0===c&&(c=defaultCompareFunction),e.sort(function(a,b){return c(f[a],f[b])});var h=e.map(function(b){return a[b]}).concat(g);return h.length!=a.length&&(h.length=a.length),h}return mapSort;}());
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                 @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??        d                    /**
-        * @description minimist - Parses arguments.
0        * @param {Object[]} args - Array of arguments.
9        * @param {Object} opts  - Options set for the arguments
L        * @returns {Object} argv - Populated with the array arguments from `args`.
        * @license MIT
s        * @see {@link https://github.com/substack/minimist/blob/38a4d1caead72ef99e824bb420a2528eec03d9ab/index.js|GitHub}
        */
8       export const object_parse_arguments = (args, opts) => {
          function hasKey (obj, keys) {
           var o = obj;
.           keys.slice(0,-1).forEach(function (key) {
             o = (o[key] || {});
           });
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                 @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??        r             %           var key = keys[keys.length - 1];
           return key in o;
         }
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                 @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??        u                      function isNumber (x) {
,           if (typeof x === 'number') return true;
/           if (/^0x[0-9a-f]+$/i.test(x)) return true;
A           return /^[-+]?(?:\d+(?:\.\d*)?|\.\d+)(e[-+]?\d+)?$/.test(x);
         }
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<V>          @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??          @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<V   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?}                @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?~       z      ?             
       /**
,        * @description Returns a clone of a value.
5        * @param {any} value_original - Value to be cloned.
        * @returns {any} Clone.
        * @license MIT
t        * @see {@link https://raw.githubusercontent.com/lodash/lodash/4.5.0-npm-packages/lodash.clonedeep/index.js|GitHub}
:        * @see {@link https://lodash.com/docs/#cloneDeep|Lodash}
C        * @see {@link https://stackoverflow.com/a/54157459|StackOverflow}
C        * @see {@link https://stackoverflow.com/a/53737490|StackOverflow}
C        * @see {@link https://stackoverflow.com/a/24648941|StackOverflow}
/        * lodash (Custom Build) <https://lodash.com/>
2        * Build: `lodash modularize exports="npm" -o ./`
L        * Copyright jQuery Foundation and other contributors <https://jquery.org/>
;        * Released under MIT license <https://lodash.com/license>
B        * Based on Underscore.js 1.8.3 <http://underscorejs.org/LICENSE>
R        * Copyright Jeremy Ashkenas, DocumentCloud and Investigative Reporters & Editors
        */
0       export const clone = function(value_original) {
?         /** Used as the size to enable large array optimizations. */
         var LARGE_ARRAY_SIZE = 200;
       
7         /** Used to stand-in for `undefined` hash values. */
4         var HASH_UNDEFINED = '__lodash_hash_undefined__';
       
<         /** Used as references for various `Number` constants. */
+         var MAX_SAFE_INTEGER = 9007199254740991;
       
.         /** `Object#toString` result references. */
&         var argsTag = '[object Arguments]',
#             arrayTag = '[object Array]',
$             boolTag = '[object Boolean]',
!             dateTag = '[object Date]',
#             errorTag = '[object Error]',
%             funcTag = '[object Function]',
-             genTag = '[object GeneratorFunction]',
             mapTag = '[object Map]',
%             numberTag = '[object Number]',
%             objectTag = '[object Object]',
'             promiseTag = '[object Promise]',
%             regexpTag = '[object RegExp]',
             setTag = '[object Set]',
%             stringTag = '[object String]',
%             symbolTag = '[object Symbol]',
'             weakMapTag = '[object WeakMap]';
       
/         var arrayBufferTag = '[object ArrayBuffer]',
)             dataViewTag = '[object DataView]',
,             float32Tag = '[object Float32Array]',
,             float64Tag = '[object Float64Array]',
&             int8Tag = '[object Int8Array]',
(             int16Tag = '[object Int16Array]',
(             int32Tag = '[object Int32Array]',
(             uint8Tag = '[object Uint8Array]',
6             uint8ClampedTag = '[object Uint8ClampedArray]',
*             uint16Tag = '[object Uint16Array]',
*             uint32Tag = '[object Uint32Array]';
       
         /**
          * Used to match `RegExp`
T          * [syntax characters](http://ecma-international.org/ecma-262/7.0/#sec-patterns).
          */
,         var reRegExpChar = /[\\^$.*+?()[\]{}|]/g;
       
H         /** Used to match `RegExp` flags from their coerced string values. */
         var reFlags = /\w*$/;
       
4         /** Used to detect host constructors (Safari). */
4         var reIsHostCtor = /^\[object .+?Constructor\]$/;
       
1         /** Used to detect unsigned integer values. */
%         var reIsUint = /^(?:0|[1-9]\d*)$/;
       
G         /** Used to identify `toStringTag` values supported by `_.clone`. */
         var cloneableTags = {};
5         cloneableTags[argsTag] = cloneableTags[arrayTag] =
?         cloneableTags[arrayBufferTag] = cloneableTags[dataViewTag] =
4         cloneableTags[boolTag] = cloneableTags[dateTag] =
:         cloneableTags[float32Tag] = cloneableTags[float64Tag] =
5         cloneableTags[int8Tag] = cloneableTags[int16Tag] =
4         cloneableTags[int32Tag] = cloneableTags[mapTag] =
8         cloneableTags[numberTag] = cloneableTags[objectTag] =
5         cloneableTags[regexpTag] = cloneableTags[setTag] =
8         cloneableTags[stringTag] = cloneableTags[symbolTag] =
=         cloneableTags[uint8Tag] = cloneableTags[uint8ClampedTag] =
>         cloneableTags[uint16Tag] = cloneableTags[uint32Tag] = true;
5         cloneableTags[errorTag] = cloneableTags[funcTag] =
%         cloneableTags[weakMapTag] = false;
       
5         /** Detect free variable `global` from Node.js. */
^         var freeGlobal = typeof global == 'object' && global && global.Object === Object && global;
       
&         /** Detect free variable `self`. */
T         var freeSelf = typeof self == 'object' && self && self.Object === Object && self;
       
3         /** Used as a reference to the global object. */
B         var root = freeGlobal || freeSelf || Function('return this')();
       
)         /** Detect free variable `exports`. */
[         var freeExports = typeof exports == 'object' && exports && !exports.nodeType && exports;
       
(         /** Detect free variable `module`. */
e         var freeModule = freeExports && typeof module == 'object' && module && !module.nodeType && module;
       
A         /** Detect the popular CommonJS extension `module.exports`. */
H         var moduleExports = freeModule && freeModule.exports === freeExports;
       
         /**
)          * Adds the key-value `pair` to `map`.
          *
          * @private
,          * @param {Object} map The map to modify.
4          * @param {Array} pair The key-value pair to add.
&          * @returns {Object} Returns `map`.
          */
$         function addMapEntry(map, pair) {
C           // Don't return `map.set` because it's not chainable in IE 11.
           map.set(pair[0], pair[1]);
           return map;
         }
       
         /**
          * Adds `value` to `set`.
          *
          * @private
,          * @param {Object} set The set to modify.
(          * @param {*} value The value to add.
&          * @returns {Object} Returns `set`.
          */
%         function addSetEntry(set, value) {
C           // Don't return `set.add` because it's not chainable in IE 11.
           set.add(value);
           return set;
         }
       
         /**
I          * A specialized version of `_.forEach` for arrays without support for
          * iteratee shorthands.
          *
          * @private
7          * @param {Array} [array] The array to iterate over.
D          * @param {Function} iteratee The function invoked per iteration.
'          * @returns {Array} Returns `array`.
          */
(         function arrayEach(array, iteratee) {
           var index = -1,
+               length = array ? array.length : 0;
       
           while (++index < length) {
<             if (iteratee(array[index], index, array) === false) {
               break;
             }
           }
           return array;
         }
       
         /**
2          * Appends the elements of `values` to `array`.
          *
          * @private
/          * @param {Array} array The array to modify.
1          * @param {Array} values The values to append.
'          * @returns {Array} Returns `array`.
          */
&         function arrayPush(array, values) {
           var index = -1,
                length = values.length,
               offset = array.length;
       
           while (++index < length) {
-             array[offset + index] = values[index];
           }
           return array;
         }
       
         /**
H          * A specialized version of `_.reduce` for arrays without support for
          * iteratee shorthands.
          *
          * @private
7          * @param {Array} [array] The array to iterate over.
D          * @param {Function} iteratee The function invoked per iteration.
1          * @param {*} [accumulator] The initial value.
P          * @param {boolean} [initAccum] Specify using the first element of `array` as
          *  the initial value.
1          * @returns {*} Returns the accumulated value.
          */
B         function arrayReduce(array, iteratee, accumulator, initAccum) {
           var index = -1,
+               length = array ? array.length : 0;
       
           if (initAccum && length) {
$             accumulator = array[++index];
           }
           while (++index < length) {
G             accumulator = iteratee(accumulator, array[index], index, array);
           }
           return accumulator;
         }
       
         /**
R          * The base implementation of `_.times` without support for iteratee shorthands
!          * or max array length checks.
          *
          * @private
A          * @param {number} n The number of times to invoke `iteratee`.
D          * @param {Function} iteratee The function invoked per iteration.
4          * @returns {Array} Returns the array of results.
          */
$         function baseTimes(n, iteratee) {
           var index = -1,
               result = Array(n);
       
           while (++index < n) {
'             result[index] = iteratee(index);
           }
           return result;
         }
       
         /**
*          * Gets the value at `key` of `object`.
          *
          * @private
3          * @param {Object} [object] The object to query.
9          * @param {string} key The key of the property to get.
.          * @returns {*} Returns the property value.
          */
#         function getValue(object, key) {
5           return object == null ? undefined : object[key];
         }
       
         /**
3          * Checks if `value` is a host object in IE < 9.
          *
          * @private
*          * @param {*} value The value to check.
R          * @returns {boolean} Returns `true` if `value` is a host object, else `false`.
          */
!         function isHostObject(value) {
I           // Many host objects are `Object` objects that can coerce to strings
=           // despite having improperly defined `toString` methods.
           var result = false;
@           if (value != null && typeof value.toString != 'function') {
             try {
!               result = !!(value + '');
             } catch (e) {}
           }
           return result;
         }
       
         /**
,          * Converts `map` to its key-value pairs.
          *
          * @private
-          * @param {Object} map The map to convert.
3          * @returns {Array} Returns the key-value pairs.
          */
         function mapToArray(map) {
           var index = -1,
"               result = Array(map.size);
       
'           map.forEach(function(value, key) {
&             result[++index] = [key, value];
           });
           return result;
         }
       
         /**
Q          * Creates a unary function that invokes `func` with its argument transformed.
          *
          * @private
2          * @param {Function} func The function to wrap.
9          * @param {Function} transform The argument transform.
3          * @returns {Function} Returns the new function.
          */
&         function overArg(func, transform) {
           return function(arg) {
#             return func(transform(arg));
           };
         }
       
         /**
/          * Converts `set` to an array of its values.
          *
          * @private
-          * @param {Object} set The set to convert.
*          * @returns {Array} Returns the values.
          */
         function setToArray(set) {
           var index = -1,
"               result = Array(set.size);
       
"           set.forEach(function(value) {
             result[++index] = value;
           });
           return result;
         }
       
.         /** Used for built-in method references. */
$         var arrayProto = Array.prototype,
&             funcProto = Function.prototype,
&             objectProto = Object.prototype;
       
4         /** Used to detect overreaching core-js shims. */
/         var coreJsData = root['__core-js_shared__'];
       
8         /** Used to detect methods masquerading as native. */
!         var maskSrcKey = (function() {
a           var uid = /[^.]+$/["exec"](coreJsData && coreJsData.keys && coreJsData.keys.IE_PROTO || '');
0           return uid ? ('Symbol(src)_1.' + uid) : '';
         }());
       
=         /** Used to resolve the decompiled source of functions. */
)         var funcToString = funcProto.toString;
       
3         /** Used to check objects for own properties. */
3         var hasOwnProperty = objectProto.hasOwnProperty;
       
         /**
          * Used to resolve the
`          * [`toStringTag`](http://ecma-international.org/ecma-262/7.0/#sec-object.prototype.tostring)
          * of values.
          */
-         var objectToString = objectProto.toString;
       
/         /** Used to detect if a method is native. */
          var reIsNative = RegExp('^' +
D           funcToString.call(hasOwnProperty).replace(reRegExpChar, '\\$&')
V           .replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g, '$1.*?') + '$'
         );
       
$         /** Built-in value references. */
8         var Buffer = moduleExports ? root.Buffer : undefined,
             Symbol = root.Symbol,
$             Uint8Array = root.Uint8Array,
=             getPrototype = overArg(Object.getPrototypeOf, Object),
$             objectCreate = Object.create,
?             propertyIsEnumerable = objectProto.propertyIsEnumerable,
"             splice = arrayProto.splice;
       
[         /* Built-in method references for those with the same name as other `lodash` methods. */
7         var nativeGetSymbols = Object.getOwnPropertySymbols,
=             nativeIsBuffer = Buffer ? Buffer.isBuffer : undefined,
1             nativeKeys = overArg(Object.keys, Object);
       
C         /* Built-in method references that are verified to be native. */
.         var DataView = getNative(root, 'DataView'),
$             Map = getNative(root, 'Map'),
,             Promise = getNative(root, 'Promise'),
$             Set = getNative(root, 'Set'),
,             WeakMap = getNative(root, 'WeakMap'),
2             nativeCreate = getNative(Object, 'create');
       
2         /** Used to detect maps, sets, and weakmaps. */
/         var dataViewCtorString = toSource(DataView),
%             mapCtorString = toSource(Map),
-             promiseCtorString = toSource(Promise),
%             setCtorString = toSource(Set),
-             weakMapCtorString = toSource(WeakMap);
       
<         /** Used to convert symbols to primitives and strings. */
;         var symbolProto = Symbol ? Symbol.prototype : undefined,
E             symbolValueOf = symbolProto ? symbolProto.valueOf : undefined;
       
         /**
          * Creates a hash object.
          *
          * @private
          * @constructor
<          * @param {Array} [entries] The key-value pairs to cache.
          */
         function Hash(entries) {
           var index = -1,
/               length = entries ? entries.length : 0;
       
           this["clear"]();
           while (++index < length) {
"             var entry = entries[index];
$             this.set(entry[0], entry[1]);
           }
         }
       
         /**
2          * Removes all key-value entries from the hash.
          *
          * @private
          * @name clear
          * @memberOf Hash
          */
         function hashClear() {
<           this.__data__ = nativeCreate ? nativeCreate(null) : {};
         }
       
         /**
0          * Removes `key` and its value from the hash.
          *
          * @private
          * @name delete
          * @memberOf Hash
.          * @param {Object} hash The hash to modify.
9          * @param {string} key The key of the value to remove.
O          * @returns {boolean} Returns `true` if the entry was removed, else `false`.
          */
         function hashDelete(key) {
7           return this.has(key) && delete this.__data__[key];
         }
       
         /**
$          * Gets the hash value for `key`.
          *
          * @private
          * @name get
          * @memberOf Hash
6          * @param {string} key The key of the value to get.
+          * @returns {*} Returns the entry value.
          */
         function hashGet(key) {
           var data = this.__data__;
           if (nativeCreate) {
             var result = data[key];
=             return result === HASH_UNDEFINED ? undefined : result;
           }
C           return hasOwnProperty.call(data, key) ? data[key] : undefined;
         }
       
         /**
.          * Checks if a hash value for `key` exists.
          *
          * @private
          * @name has
          * @memberOf Hash
8          * @param {string} key The key of the entry to check.
S          * @returns {boolean} Returns `true` if an entry for `key` exists, else `false`.
          */
         function hashHas(key) {
           var data = this.__data__;
T           return nativeCreate ? data[key] !== undefined : hasOwnProperty.call(data, key);
         }
       
         /**
%          * Sets the hash `key` to `value`.
          *
          * @private
          * @name set
          * @memberOf Hash
6          * @param {string} key The key of the value to set.
(          * @param {*} value The value to set.
2          * @returns {Object} Returns the hash instance.
          */
!         function hashSet(key, value) {
           var data = this.__data__;
P           data[key] = (nativeCreate && value === undefined) ? HASH_UNDEFINED : value;
           return this;
         }
       
         // Add methods to `Hash`.
'         Hash.prototype["clear"] = hashClear;
)         Hash.prototype['delete'] = hashDelete;
          Hash.prototype.get = hashGet;
          Hash.prototype.has = hashHas;
          Hash.prototype.set = hashSet;
       
         /**
#          * Creates an list cache object.
          *
          * @private
          * @constructor
<          * @param {Array} [entries] The key-value pairs to cache.
          */
          function ListCache(entries) {
           var index = -1,
/               length = entries ? entries.length : 0;
       
           this["clear"]();
           while (++index < length) {
"             var entry = entries[index];
$             this.set(entry[0], entry[1]);
           }
         }
       
         /**
8          * Removes all key-value entries from the list cache.
          *
          * @private
          * @name clear
          * @memberOf ListCache
          */
         function listCacheClear() {
           this.__data__ = [];
         }
       
         /**
6          * Removes `key` and its value from the list cache.
          *
          * @private
          * @name delete
          * @memberOf ListCache
9          * @param {string} key The key of the value to remove.
O          * @returns {boolean} Returns `true` if the entry was removed, else `false`.
          */
"         function listCacheDelete(key) {
           var data = this.__data__,
)               index = assocIndexOf(data, key);
       
           if (index < 0) {
             return false;
           }
%           var lastIndex = data.length - 1;
           if (index == lastIndex) {
             data.pop();
           } else {
#             splice.call(data, index, 1);
           }
           return true;
         }
       
         /**
*          * Gets the list cache value for `key`.
          *
          * @private
          * @name get
          * @memberOf ListCache
6          * @param {string} key The key of the value to get.
+          * @returns {*} Returns the entry value.
          */
         function listCacheGet(key) {
           var data = this.__data__,
)               index = assocIndexOf(data, key);
       
3           return index < 0 ? undefined : data[index][1];
         }
       
         /**
4          * Checks if a list cache value for `key` exists.
          *
          * @private
          * @name has
          * @memberOf ListCache
8          * @param {string} key The key of the entry to check.
S          * @returns {boolean} Returns `true` if an entry for `key` exists, else `false`.
          */
         function listCacheHas(key) {
2           return assocIndexOf(this.__data__, key) > -1;
         }
       
         /**
+          * Sets the list cache `key` to `value`.
          *
          * @private
          * @name set
          * @memberOf ListCache
6          * @param {string} key The key of the value to set.
(          * @param {*} value The value to set.
8          * @returns {Object} Returns the list cache instance.
          */
&         function listCacheSet(key, value) {
           var data = this.__data__,
)               index = assocIndexOf(data, key);
       
           if (index < 0) {
             data.push([key, value]);
           } else {
             data[index][1] = value;
           }
           return this;
         }
       
!         // Add methods to `ListCache`.
1         ListCache.prototype["clear"] = listCacheClear;
3         ListCache.prototype['delete'] = listCacheDelete;
*         ListCache.prototype.get = listCacheGet;
*         ListCache.prototype.has = listCacheHas;
*         ListCache.prototype.set = listCacheSet;
       
         /**
:          * Creates a map cache object to store key-value pairs.
          *
          * @private
          * @constructor
<          * @param {Array} [entries] The key-value pairs to cache.
          */
         function MapCache(entries) {
           var index = -1,
/               length = entries ? entries.length : 0;
       
           this["clear"]();
           while (++index < length) {
"             var entry = entries[index];
$             this.set(entry[0], entry[1]);
           }
         }
       
         /**
1          * Removes all key-value entries from the map.
          *
          * @private
          * @name clear
          * @memberOf MapCache
          */
         function mapCacheClear() {
           this.__data__ = {
             'hash': new Hash,
%             'map': new (Map || ListCache),
             'string': new Hash
           };
         }
       
         /**
/          * Removes `key` and its value from the map.
          *
          * @private
          * @name delete
          * @memberOf MapCache
9          * @param {string} key The key of the value to remove.
O          * @returns {boolean} Returns `true` if the entry was removed, else `false`.
          */
!         function mapCacheDelete(key) {
1           return getMapData(this, key)['delete'](key);
         }
       
         /**
#          * Gets the map value for `key`.
          *
          * @private
          * @name get
          * @memberOf MapCache
6          * @param {string} key The key of the value to get.
+          * @returns {*} Returns the entry value.
          */
         function mapCacheGet(key) {
+           return getMapData(this, key).get(key);
         }
       
         /**
-          * Checks if a map value for `key` exists.
          *
          * @private
          * @name has
          * @memberOf MapCache
8          * @param {string} key The key of the entry to check.
S          * @returns {boolean} Returns `true` if an entry for `key` exists, else `false`.
          */
         function mapCacheHas(key) {
+           return getMapData(this, key).has(key);
         }
       
         /**
$          * Sets the map `key` to `value`.
          *
          * @private
          * @name set
          * @memberOf MapCache
6          * @param {string} key The key of the value to set.
(          * @param {*} value The value to set.
7          * @returns {Object} Returns the map cache instance.
          */
%         function mapCacheSet(key, value) {
+           getMapData(this, key).set(key, value);
           return this;
         }
       
          // Add methods to `MapCache`.
/         MapCache.prototype["clear"] = mapCacheClear;
1         MapCache.prototype['delete'] = mapCacheDelete;
(         MapCache.prototype.get = mapCacheGet;
(         MapCache.prototype.has = mapCacheHas;
(         MapCache.prototype.set = mapCacheSet;
       
         /**
<          * Creates a stack cache object to store key-value pairs.
          *
          * @private
          * @constructor
<          * @param {Array} [entries] The key-value pairs to cache.
          */
         function Stack(entries) {
,           this.__data__ = new ListCache(entries);
         }
       
         /**
3          * Removes all key-value entries from the stack.
          *
          * @private
          * @name clear
          * @memberOf Stack
          */
         function stackClear() {
#           this.__data__ = new ListCache;
         }
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?~         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?~                @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??       +      ?               /**
1          * Removes `key` and its value from the stack.
          *
          * @private
          * @name delete
          * @memberOf Stack
9          * @param {string} key The key of the value to remove.
O          * @returns {boolean} Returns `true` if the entry was removed, else `false`.
          */
         function stackDelete(key) {
)           return this.__data__['delete'](key);
         }
       
         /**
%          * Gets the stack value for `key`.
          *
          * @private
          * @name get
          * @memberOf Stack
6          * @param {string} key The key of the value to get.
+          * @returns {*} Returns the entry value.
          */
         function stackGet(key) {
#           return this.__data__.get(key);
         }
       
         /**
/          * Checks if a stack value for `key` exists.
          *
          * @private
          * @name has
          * @memberOf Stack
8          * @param {string} key The key of the entry to check.
S          * @returns {boolean} Returns `true` if an entry for `key` exists, else `false`.
          */
         function stackHas(key) {
#           return this.__data__.has(key);
         }
       
         /**
&          * Sets the stack `key` to `value`.
          *
          * @private
          * @name set
          * @memberOf Stack
6          * @param {string} key The key of the value to set.
(          * @param {*} value The value to set.
9          * @returns {Object} Returns the stack cache instance.
          */
"         function stackSet(key, value) {
           var cache = this.__data__;
&           if (cache instanceof ListCache) {
"             var pairs = cache.__data__;
;             if (!Map || (pairs.length < LARGE_ARRAY_SIZE - 1)) {
"               pairs.push([key, value]);
               return this;
             }
3             cache = this.__data__ = new MapCache(pairs);
           }
           cache.set(key, value);
           return this;
         }
       
         // Add methods to `Stack`.
)         Stack.prototype["clear"] = stackClear;
+         Stack.prototype['delete'] = stackDelete;
"         Stack.prototype.get = stackGet;
"         Stack.prototype.has = stackHas;
"         Stack.prototype.set = stackSet;
       
         /**
R          * Creates an array of the enumerable property names of the array-like `value`.
          *
          * @private
*          * @param {*} value The value to query.
L          * @param {boolean} inherited Specify returning inherited property names.
;          * @returns {Array} Returns the array of property names.
          */
-         function arrayLikeKeys(value, inherited) {
F           // Safari 8.1 makes `arguments.callee` enumerable in strict mode.
D           // Safari 9 makes `arguments.length` enumerable in strict mode.
8           var result = (isArray(value) || isArguments(value))
(             ? baseTimes(value.length, String)
             : [];
       
            var length = result.length,
                skipIndexes = !!length;
       
           for (var key in value) {
<             if ((inherited || hasOwnProperty.call(value, key)) &&
I                 !(skipIndexes && (key == 'length' || isIndex(key, length)))) {
               result.push(key);
             }
           }
           return result;
         }
       
         /**
R          * Assigns `value` to `key` of `object` if the existing value is not equivalent
\          * using [`SameValueZero`](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
          * for equality comparisons.
          *
          * @private
2          * @param {Object} object The object to modify.
<          * @param {string} key The key of the property to assign.
+          * @param {*} value The value to assign.
          */
-         function assignValue(object, key, value) {
            var objValue = object[key];
F           if (!(hasOwnProperty.call(object, key) && eq(objValue, value)) ||
5               (value === undefined && !(key in object))) {
             object[key] = value;
           }
         }
       
         /**
O          * Gets the index at which the `key` is found in `array` of key-value pairs.
          *
          * @private
0          * @param {Array} array The array to inspect.
+          * @param {*} key The key to search for.
J          * @returns {number} Returns the index of the matched value, else `-1`.
          */
&         function assocIndexOf(array, key) {
           var length = array.length;
           while (length--) {
'             if (eq(array[length][0], key)) {
               return length;
             }
           }
           return -1;
         }
       
         /**
P          * The base implementation of `_.assign` without support for multiple sources
           * or `customizer` functions.
          *
          * @private
4          * @param {Object} object The destination object.
/          * @param {Object} source The source object.
)          * @returns {Object} Returns `object`.
          */
(         function baseAssign(object, source) {
?           return object && copyObject(source, keys(source), object);
         }
       
         /**
I          * The base implementation of `_.clone` and `_.cloneDeep` which tracks
          * traversed objects.
          *
          * @private
*          * @param {*} value The value to clone.
5          * @param {boolean} [isDeep] Specify a deep clone.
B          * @param {boolean} [isFull] Specify a clone including symbols.
G          * @param {Function} [customizer] The function to customize cloning.
/          * @param {string} [key] The key of `value`.
<          * @param {Object} [object] The parent object of `value`.
T          * @param {Object} [stack] Tracks traversed objects and their clone counterparts.
,          * @returns {*} Returns the cloned value.
          */
N         function baseClone(value, isDeep, isFull, customizer, key, object, stack) {
           var result;
           if (customizer) {
S             result = object ? customizer(value, key, object, stack) : customizer(value);
           }
            if (result !== undefined) {
             return result;
           }
           if (!isObject(value)) {
             return value;
           }
            var isArr = isArray(value);
           if (isArr) {
&             result = initCloneArray(value);
             if (!isDeep) {
)               return copyArray(value, result);
             }
           } else {
             var tag = getTag(value),
4                 isFunc = tag == funcTag || tag == genTag;
       
             if (isBuffer(value)) {
+               return cloneBuffer(value, isDeep);
             }
G             if (tag == objectTag || tag == argsTag || (isFunc && !object)) {
#               if (isHostObject(value)) {
&                 return object ? value : {};

               }
7               result = initCloneObject(isFunc ? {} : value);
               if (!isDeep) {
@                 return copySymbols(value, baseAssign(result, value));

               }
             } else {
#               if (!cloneableTags[tag]) {
&                 return object ? value : {};

               }
@               result = initCloneByTag(value, tag, baseClone, isDeep);
             }
           }
I           // Check for circular references and return its corresponding clone.
"           stack || (stack = new Stack);
$           var stacked = stack.get(value);
           if (stacked) {
             return stacked;
           }
           stack.set(value, result);
       
           if (!isArr) {
<             var props = isFull ? getAllKeys(value) : keys(value);
           }
8           arrayEach(props || value, function(subValue, key) {
             if (props) {
               key = subValue;
               subValue = value[key];
             }
H             // Recursively populate clone (susceptible to call stack limits).
d             assignValue(result, key, baseClone(subValue, isDeep, isFull, customizer, key, value, stack));
           });
           return result;
         }
       
         /**
I          * The base implementation of `_.create` without support for assigning
'          * properties to the created object.
          *
          * @private
;          * @param {Object} prototype The object to inherit from.
/          * @returns {Object} Returns the new object.
          */
         function baseCreate(proto) {
7           return isObject(proto) ? objectCreate(proto) : {};
         }
       
         /**
K          * The base implementation of `getAllKeys` and `getAllKeysIn` which uses
K          * `keysFunc` and `symbolsFunc` to get the enumerable property names and
          * symbols of `object`.
          *
          * @private
1          * @param {Object} object The object to query.
J          * @param {Function} keysFunc The function to get the keys of `object`.
P          * @param {Function} symbolsFunc The function to get the symbols of `object`.
G          * @returns {Array} Returns the array of property names and symbols.
          */
;         function baseGetAllKeys(object, keysFunc, symbolsFunc) {
#           var result = keysFunc(object);
N           return isArray(object) ? result : arrayPush(result, symbolsFunc(object));
         }
       
         /**
*          * The base implementation of `getTag`.
          *
          * @private
*          * @param {*} value The value to query.
2          * @returns {string} Returns the `toStringTag`.
          */
         function baseGetTag(value) {
'           return objectToString.call(value);
         }
       
         /**
F          * The base implementation of `_.isNative` without bad shim checks.
          *
          * @private
*          * @param {*} value The value to check.
H          * @returns {boolean} Returns `true` if `value` is a native function,
          *  else `false`.
          */
!         function baseIsNative(value) {
/           if (!isObject(value) || isMasked(value)) {
             return false;
           }
Z           var pattern = (isFunction(value) || isHostObject(value)) ? reIsNative : reIsHostCtor;
*           return pattern.test(toSource(value));
         }
       
         /**
U          * The base implementation of `_.keys` which doesn't treat sparse arrays as dense.
          *
          * @private
1          * @param {Object} object The object to query.
;          * @returns {Array} Returns the array of property names.
          */
         function baseKeys(object) {
            if (!isPrototype(object)) {
!             return nativeKeys(object);
           }
           var result = [];
&           for (var key in Object(object)) {
F             if (hasOwnProperty.call(object, key) && key != 'constructor') {
               result.push(key);
             }
           }
           return result;
         }
       
         /**
#          * Creates a clone of  `buffer`.
          *
          * @private
1          * @param {Buffer} buffer The buffer to clone.
5          * @param {boolean} [isDeep] Specify a deep clone.
2          * @returns {Buffer} Returns the cloned buffer.
          */
)         function cloneBuffer(buffer, isDeep) {
           if (isDeep) {
             return buffer.slice();
           }
8           var result = new buffer.constructor(buffer.length);
           buffer.copy(result);
           return result;
         }
       
         /**
'          * Creates a clone of `arrayBuffer`.
          *
          * @private
A          * @param {ArrayBuffer} arrayBuffer The array buffer to clone.
=          * @returns {ArrayBuffer} Returns the cloned array buffer.
          */
+         function cloneArrayBuffer(arrayBuffer) {
F           var result = new arrayBuffer.constructor(arrayBuffer.byteLength);
=           new Uint8Array(result).set(new Uint8Array(arrayBuffer));
           return result;
         }
       
         /**
$          * Creates a clone of `dataView`.
          *
          * @private
6          * @param {Object} dataView The data view to clone.
5          * @param {boolean} [isDeep] Specify a deep clone.
5          * @returns {Object} Returns the cloned data view.
          */
-         function cloneDataView(dataView, isDeep) {
O           var buffer = isDeep ? cloneArrayBuffer(dataView.buffer) : dataView.buffer;
W           return new dataView.constructor(buffer, dataView.byteOffset, dataView.byteLength);
         }
       
         /**
          * Creates a clone of `map`.
          *
          * @private
+          * @param {Object} map The map to clone.
?          * @param {Function} cloneFunc The function to clone values.
5          * @param {boolean} [isDeep] Specify a deep clone.
/          * @returns {Object} Returns the cloned map.
          */
.         function cloneMap(map, isDeep, cloneFunc) {
M           var array = isDeep ? cloneFunc(mapToArray(map), true) : mapToArray(map);
A           return arrayReduce(array, addMapEntry, new map.constructor);
         }
       
         /**
"          * Creates a clone of `regexp`.
          *
          * @private
1          * @param {Object} regexp The regexp to clone.
2          * @returns {Object} Returns the cloned regexp.
          */
!         function cloneRegExp(regexp) {
Q           var result = new regexp.constructor(regexp.source, reFlags["exec"](regexp));
)           result.lastIndex = regexp.lastIndex;
           return result;
         }
       
         /**
          * Creates a clone of `set`.
          *
          * @private
+          * @param {Object} set The set to clone.
?          * @param {Function} cloneFunc The function to clone values.
5          * @param {boolean} [isDeep] Specify a deep clone.
/          * @returns {Object} Returns the cloned set.
          */
.         function cloneSet(set, isDeep, cloneFunc) {
M           var array = isDeep ? cloneFunc(setToArray(set), true) : setToArray(set);
A           return arrayReduce(array, addSetEntry, new set.constructor);
         }
       
         /**
-          * Creates a clone of the `symbol` object.
          *
          * @private
8          * @param {Object} symbol The symbol object to clone.
9          * @returns {Object} Returns the cloned symbol object.
          */
!         function cloneSymbol(symbol) {
D           return symbolValueOf ? Object(symbolValueOf.call(symbol)) : {};
         }
       
         /**
&          * Creates a clone of `typedArray`.
          *
          * @private
:          * @param {Object} typedArray The typed array to clone.
5          * @param {boolean} [isDeep] Specify a deep clone.
7          * @returns {Object} Returns the cloned typed array.
          */
1         function cloneTypedArray(typedArray, isDeep) {
S           var buffer = isDeep ? cloneArrayBuffer(typedArray.buffer) : typedArray.buffer;
Y           return new typedArray.constructor(buffer, typedArray.byteOffset, typedArray.length);
         }
       
         /**
/          * Copies the values of `source` to `array`.
          *
          * @private
:          * @param {Array} source The array to copy values from.
<          * @param {Array} [array=[]] The array to copy values to.
'          * @returns {Array} Returns `array`.
          */
&         function copyArray(source, array) {
           var index = -1,
                length = source.length;
       
&           array || (array = Array(length));
           while (++index < length) {
$             array[index] = source[index];
           }
           return array;
         }
       
         /**
0          * Copies properties of `source` to `object`.
          *
          * @private
@          * @param {Object} source The object to copy properties from.
<          * @param {Array} props The property identifiers to copy.
C          * @param {Object} [object={}] The object to copy properties to.
M          * @param {Function} [customizer] The function to customize copied values.
)          * @returns {Object} Returns `object`.
          */
;         function copyObject(source, props, object, customizer) {
           object || (object = {});
       
           var index = -1,
               length = props.length;
       
           while (++index < length) {
             var key = props[index];
       
              var newValue = customizer
D               ? customizer(object[key], source[key], key, object, source)
               : undefined;
       
Q             assignValue(object, key, newValue === undefined ? source[key] : newValue);
           }
           return object;
         }
       
         /**
;          * Copies own symbol properties of `source` to `object`.
          *
          * @private
=          * @param {Object} source The object to copy symbols from.
@          * @param {Object} [object={}] The object to copy symbols to.
)          * @returns {Object} Returns `object`.
          */
)         function copySymbols(source, object) {
;           return copyObject(source, getSymbols(source), object);
         }
       
         /**
P          * Creates an array of own enumerable property names and symbols of `object`.
          *
          * @private
1          * @param {Object} object The object to query.
G          * @returns {Array} Returns the array of property names and symbols.
          */
          function getAllKeys(object) {
5           return baseGetAllKeys(object, keys, getSymbols);
         }
       
         /**
          * Gets the data for `map`.
          *
          * @private
+          * @param {Object} map The map to query.
,          * @param {string} key The reference key.
(          * @returns {*} Returns the map data.
          */
"         function getMapData(map, key) {
           var data = map.__data__;
           return isKeyable(key)
9             ? data[typeof key == 'string' ? 'string' : 'hash']
             : data.map;
         }
       
         /**
4          * Gets the native function at `key` of `object`.
          *
          * @private
1          * @param {Object} object The object to query.
7          * @param {string} key The key of the method to get.
I          * @returns {*} Returns the function if it's native, else `undefined`.
          */
$         function getNative(object, key) {
'           var value = getValue(object, key);
4           return baseIsNative(value) ? value : undefined;
         }
       
         /**
K          * Creates an array of the own enumerable symbol properties of `object`.
          *
          * @private
1          * @param {Object} object The object to query.
4          * @returns {Array} Returns the array of symbols.
          */
U         var getSymbols = nativeGetSymbols ? overArg(nativeGetSymbols, Object) : stubArray;
       
         /**
(          * Gets the `toStringTag` of `value`.
          *
          * @private
*          * @param {*} value The value to query.
2          * @returns {string} Returns the `toStringTag`.
          */
         var getTag = baseGetTag;
       
B         // Fallback for data views, maps, sets, and weak maps in IE 11,
;         // for data views in Edge < 14, and promises in Node.js.
O         if ((DataView && getTag(new DataView(new ArrayBuffer(1))) != dataViewTag) ||
,             (Map && getTag(new Map) != mapTag) ||
>             (Promise && getTag(Promise.resolve()) != promiseTag) ||
,             (Set && getTag(new Set) != setTag) ||
8             (WeakMap && getTag(new WeakMap) != weakMapTag)) {
           getTag = function(value) {
/             var result = objectToString.call(value),
F                 Ctor = result == objectTag ? value.constructor : undefined,
:                 ctorString = Ctor ? toSource(Ctor) : undefined;
       
             if (ctorString) {
               switch (ctorString) {
7                 case dataViewCtorString: return dataViewTag;
-                 case mapCtorString: return mapTag;
5                 case promiseCtorString: return promiseTag;
-                 case setCtorString: return setTag;
5                 case weakMapCtorString: return weakMapTag;

               }
             }
             return result;
           };
         }
       
         /**
!          * Initializes an array clone.
          *
          * @private
.          * @param {Array} array The array to clone.
5          * @returns {Array} Returns the initialized clone.
          */
#         function initCloneArray(array) {
           var length = array.length,
,               result = array.constructor(length);
       
1           // Add properties assigned by `RegExp#exec`.
X           if (length && typeof array[0] == 'string' && hasOwnProperty.call(array, 'index')) {
"             result.index = array.index;
"             result.input = array.input;
           }
           return result;
         }
       
         /**
"          * Initializes an object clone.
          *
          * @private
1          * @param {Object} object The object to clone.
6          * @returns {Object} Returns the initialized clone.
          */
%         function initCloneObject(object) {
M           return (typeof object.constructor == 'function' && !isPrototype(object))
)             ? baseCreate(getPrototype(object))
             : {};
         }
       
         /**
=          * Initializes an object clone based on its `toStringTag`.
          *
G          * **Note:** This function only supports cloning values with tags of
B          * `Boolean`, `Date`, `Error`, `Number`, `RegExp`, or `String`.
          *
          * @private
1          * @param {Object} object The object to clone.
C          * @param {string} tag The `toStringTag` of the object to clone.
?          * @param {Function} cloneFunc The function to clone values.
5          * @param {boolean} [isDeep] Specify a deep clone.
6          * @returns {Object} Returns the initialized clone.
          */
<         function initCloneByTag(object, tag, cloneFunc, isDeep) {
#           var Ctor = object.constructor;
           switch (tag) {
             case arrayBufferTag:
)               return cloneArrayBuffer(object);
       
             case boolTag:
             case dateTag:
"               return new Ctor(+object);
       
             case dataViewTag:
.               return cloneDataView(object, isDeep);
       
(             case float32Tag: case float64Tag:
2             case int8Tag: case int16Tag: case int32Tag:
K             case uint8Tag: case uint8ClampedTag: case uint16Tag: case uint32Tag:
0               return cloneTypedArray(object, isDeep);
       
             case mapTag:
4               return cloneMap(object, isDeep, cloneFunc);
       
             case numberTag:
             case stringTag:
!               return new Ctor(object);
       
             case regexpTag:
$               return cloneRegExp(object);
       
             case setTag:
4               return cloneSet(object, isDeep, cloneFunc);
       
             case symbolTag:
$               return cloneSymbol(object);
           }
         }
       
         /**
4          * Checks if `value` is a valid array-like index.
          *
          * @private
*          * @param {*} value The value to check.
R          * @param {number} [length=MAX_SAFE_INTEGER] The upper bounds of a valid index.
R          * @returns {boolean} Returns `true` if `value` is a valid index, else `false`.
          */
$         function isIndex(value, length) {
9           length = length == null ? MAX_SAFE_INTEGER : length;
           return !!length &&
<             (typeof value == 'number' || reIsUint.test(value)) &&
8             (value > -1 && value % 1 == 0 && value < length);
         }
       
         /**
A          * Checks if `value` is suitable for use as unique object key.
          *
          * @private
*          * @param {*} value The value to check.
M          * @returns {boolean} Returns `true` if `value` is suitable, else `false`.
          */
         function isKeyable(value) {
           var type = typeof value;
[           return (type == 'string' || type == 'number' || type == 'symbol' || type == 'boolean')
              ? (value !== '__proto__')
             : (value === null);
         }
       
         /**
-          * Checks if `func` has its source masked.
          *
          * @private
3          * @param {Function} func The function to check.
J          * @returns {boolean} Returns `true` if `func` is masked, else `false`.
          */
         function isMasked(func) {
1           return !!maskSrcKey && (maskSrcKey in func);
         }
       
         /**
5          * Checks if `value` is likely a prototype object.
          *
          * @private
*          * @param {*} value The value to check.
P          * @returns {boolean} Returns `true` if `value` is a prototype, else `false`.
          */
          function isPrototype(value) {
+           var Ctor = value && value.constructor,
N               proto = (typeof Ctor == 'function' && Ctor.prototype) || objectProto;
       
           return value === proto;
         }
       
         /**
)          * Converts `func` to its source code.
          *
          * @private
5          * @param {Function} func The function to process.
0          * @returns {string} Returns the source code.
          */
         function toSource(func) {
           if (func != null) {
             try {
(               return funcToString.call(func);
             } catch (e) {}
             try {
               return (func + '');
             } catch (e) {}
           }
           return '';
         }
       
         /**
N          * This method is like `_.clone` except that it recursively clones `value`.
          *
          * @static
          * @memberOf _
          * @since 1.0.0
          * @category Lang
6          * @param {*} value The value to recursively clone.
1          * @returns {*} Returns the deep cloned value.
          * @see _.clone
          * @example
          *
-          * var objects = [{ 'a': 1 }, { 'b': 2 }];
          *
&          * var deep = _.cloneDeep(objects);
*          * console.log(deep[0] === objects[0]);
          * // => false
          */
         function cloneDeep(value) {
)           return baseClone(value, true, true);
         }
       
         /**
          * Performs a
V          * [`SameValueZero`](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
H          * comparison between two values to determine if they are equivalent.
          *
          * @static
          * @memberOf _
          * @since 4.0.0
          * @category Lang
,          * @param {*} value The value to compare.
2          * @param {*} other The other value to compare.
S          * @returns {boolean} Returns `true` if the values are equivalent, else `false`.
          * @example
          *
          * var object = { 'a': 1 };
          * var other = { 'a': 1 };
          *
          * _.eq(object, object);
          * // => true
          *
          * _.eq(object, other);
          * // => false
          *
          * _.eq('a', 'a');
          * // => true
          *
          * _.eq('a', Object('a'));
          * // => false
          *
          * _.eq(NaN, NaN);
          * // => true
          */
         function eq(value, other) {
D           return value === other || (value !== value && other !== other);
         }
       
         /**
8          * Checks if `value` is likely an `arguments` object.
          *
          * @static
          * @memberOf _
          * @since 0.1.0
          * @category Lang
*          * @param {*} value The value to check.
L          * @returns {boolean} Returns `true` if `value` is an `arguments` object,
          *  else `false`.
          * @example
          *
8          * _.isArguments(function() { return arguments; }());
          * // => true
          *
          * _.isArguments([1, 2, 3]);
          * // => false
          */
          function isArguments(value) {
F           // Safari 8.1 makes `arguments.callee` enumerable in strict mode.
O           return isArrayLikeObject(value) && hasOwnProperty.call(value, 'callee') &&
^             (!propertyIsEnumerable.call(value, 'callee') || objectToString.call(value) == argsTag);
         }
       
         /**
;          * Checks if `value` is classified as an `Array` object.
          *
          * @static
          * @memberOf _
          * @since 0.1.0
          * @category Lang
*          * @param {*} value The value to check.
M          * @returns {boolean} Returns `true` if `value` is an array, else `false`.
          * @example
          *
          * _.isArray([1, 2, 3]);
          * // => true
          *
(          * _.isArray(document.body.children);
          * // => false
          *
          * _.isArray('abc');
          * // => false
          *
          * _.isArray(_.noop);
          * // => false
          */
         var isArray = Array.isArray;
       
         /**
O          * Checks if `value` is array-like. A value is considered array-like if it's
O          * not a function and has a `value.length` that's an integer greater than or
G          * equal to `0` and less than or equal to `Number.MAX_SAFE_INTEGER`.
          *
          * @static
          * @memberOf _
          * @since 4.0.0
          * @category Lang
*          * @param {*} value The value to check.
O          * @returns {boolean} Returns `true` if `value` is array-like, else `false`.
          * @example
          *
          * _.isArrayLike([1, 2, 3]);
          * // => true
          *
,          * _.isArrayLike(document.body.children);
          * // => true
          *
          * _.isArrayLike('abc');
          * // => true
          *
          * _.isArrayLike(_.noop);
          * // => false
          */
          function isArrayLike(value) {
J           return value != null && isLength(value.length) && !isFunction(value);
         }
       
         /**
O          * This method is like `_.isArrayLike` except that it also checks if `value`
          * is an object.
          *
          * @static
          * @memberOf _
          * @since 4.0.0
          * @category Lang
*          * @param {*} value The value to check.
K          * @returns {boolean} Returns `true` if `value` is an array-like object,
          *  else `false`.
          * @example
          *
%          * _.isArrayLikeObject([1, 2, 3]);
          * // => true
          *
2          * _.isArrayLikeObject(document.body.children);
          * // => true
          *
!          * _.isArrayLikeObject('abc');
          * // => false
          *
"          * _.isArrayLikeObject(_.noop);
          * // => false
          */
&         function isArrayLikeObject(value) {
6           return isObjectLike(value) && isArrayLike(value);
         }
       
         /**
$          * Checks if `value` is a buffer.
          *
          * @static
          * @memberOf _
          * @since 4.3.0
          * @category Lang
*          * @param {*} value The value to check.
M          * @returns {boolean} Returns `true` if `value` is a buffer, else `false`.
          * @example
          *
           * _.isBuffer(new Buffer(2));
          * // => true
          *
$          * _.isBuffer(new Uint8Array(2));
          * // => false
          */
.         var isBuffer = nativeIsBuffer || stubFalse;
       
         /**
=          * Checks if `value` is classified as a `Function` object.
          *
          * @static
          * @memberOf _
          * @since 0.1.0
          * @category Lang
*          * @param {*} value The value to check.
O          * @returns {boolean} Returns `true` if `value` is a function, else `false`.
          * @example
          *
          * _.isFunction(_);
          * // => true
          *
          * _.isFunction(/abc/);
          * // => false
          */
         function isFunction(value) {
M           // The use of `Object#toString` avoids issues with the `typeof` operator
T           // in Safari 8-9 which returns 'object' for typed array and other constructors.
A           var tag = isObject(value) ? objectToString.call(value) : '';
,           return tag == funcTag || tag == genTag;
         }
       
         /**
5          * Checks if `value` is a valid array-like length.
          *
/          * **Note:** This method is loosely based on
M          * [`ToLength`](http://ecma-international.org/ecma-262/7.0/#sec-tolength).
          *
          * @static
          * @memberOf _
          * @since 4.0.0
          * @category Lang
*          * @param {*} value The value to check.
S          * @returns {boolean} Returns `true` if `value` is a valid length, else `false`.
          * @example
          *
          * _.isLength(3);
          * // => true
          *
#          * _.isLength(Number.MIN_VALUE);
          * // => false
          *
          * _.isLength(Infinity);
          * // => false
          *
          * _.isLength('3');
          * // => false
          */
         function isLength(value) {
'           return typeof value == 'number' &&
A             value > -1 && value % 1 == 0 && value <= MAX_SAFE_INTEGER;
         }
       
         /**
          * Checks if `value` is the
d          * [language type](http://www.ecma-international.org/ecma-262/7.0/#sec-ecmascript-language-types)
d          * of `Object`. (e.g. arrays, functions, objects, regexes, `new Number(0)`, and `new String('')`)
          *
          * @static
          * @memberOf _
          * @since 0.1.0
          * @category Lang
*          * @param {*} value The value to check.
N          * @returns {boolean} Returns `true` if `value` is an object, else `false`.
          * @example
          *
          * _.isObject({});
          * // => true
          *
          * _.isObject([1, 2, 3]);
          * // => true
          *
          * _.isObject(_.noop);
          * // => true
          *
          * _.isObject(null);
          * // => false
          */
         function isObject(value) {
           var type = typeof value;
@           return !!value && (type == 'object' || type == 'function');
         }
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??       ?                      /**
Q          * Checks if `value` is object-like. A value is object-like if it's not `null`
,          * and has a `typeof` result of "object".
          *
          * @static
          * @memberOf _
          * @since 4.0.0
          * @category Lang
*          * @param {*} value The value to check.
P          * @returns {boolean} Returns `true` if `value` is object-like, else `false`.
          * @example
          *
          * _.isObjectLike({});
          * // => true
          *
           * _.isObjectLike([1, 2, 3]);
          * // => true
          *
          * _.isObjectLike(_.noop);
          * // => false
          *
          * _.isObjectLike(null);
          * // => false
          */
!         function isObjectLike(value) {
0           return !!value && typeof value == 'object';
         }
   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??         @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q?   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                     I                /**
H          * Creates an array of the own enumerable property names of `object`.
          *
A          * **Note:** Non-object values are coerced to objects. See the
L          * [ES spec](http://ecma-international.org/ecma-262/7.0/#sec-object.keys)
          * for more details.
          *
          * @static
          * @since 0.1.0
          * @memberOf _
          * @category Object
1          * @param {Object} object The object to query.
;          * @returns {Array} Returns the array of property names.
          * @example
          *
          * function Foo() {
          *   this.a = 1;
          *   this.b = 2;
          * }
          *
          * Foo.prototype.c = 3;
          *
          * _.keys(new Foo);
:          * // => ['a', 'b'] (iteration order is not guaranteed)
          *
          * _.keys('hi');
          * // => ['0', '1']
          */
         function keys(object) {
K           return isArrayLike(object) ? arrayLikeKeys(object) : baseKeys(object);
         }
       
         /**
,          * This method returns a new empty array.
          *
          * @static
          * @memberOf _
          * @since 4.13.0
          * @category Util
3          * @returns {Array} Returns the new empty array.
          * @example
          *
+          * var arrays = _.times(2, _.stubArray);
          *
          * console.log(arrays);
          * // => [[], []]
          *
+          * console.log(arrays[0] === arrays[1]);
          * // => false
          */
         function stubArray() {
           return [];
         }
       
         /**
"          * This method returns `false`.
          *
          * @static
          * @memberOf _
          * @since 4.13.0
          * @category Util
)          * @returns {boolean} Returns `false`.
          * @example
          *
          * _.times(2, _.stubFalse);
          * // => [false, false]
          */
         function stubFalse() {
           return false;
         }
       
$         return cloneDeep(value_original);
       };   @       ?+???5(?b???A???(??t??"QU?N?O?i?ij:K'???}??*7:?=?	Q??                    @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??y          @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??x          @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???                    @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??x                 @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??z        V                            ns.print(
   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???                   @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??|          @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??{          @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???                    @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??{                 @       B?9xD????W???c?@?B? ?APFW?q???:??????7?+)#???z??N??}        W             ]           } else ns.print(`WARNING: Unable to find a server to run "${string_script}". Skipped.`);
   @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???                   @       d??y??-e^?2j?l??_?5???t?y?h&?4?Lr?5?OG??iJ$???^??m??y?P	         @       d??y??-e^?2j?l??_?5???t?y?h&?4?Lr?5?OG??iJ$???^??m??y?P         @       d??y??-e^?2j?l??_?5???t?y?h&?4?Lr?5?OG??iJ$???^??m??y?P   @       ?u(?w??????????(??5?)??5??@&!;[????\???????[ɑ???Z? $?`??R                     @       d??y??-e^?2j?l??_?5???t?y?h&?4?Lr?5?OG??iJ$???^??m??y?P                @       d??y??-e^?2j?l??_?5???t?y?h&?4?Lr?5?OG??iJ$???^??m??y?P
       X             ?             ns.print(`WARNING: "${string_method_score_correction}" is not a valid value for the \`string_method_score_correction\` variable. Defaulting to "standard" method.`);
   @       ?u(?w??????????(??5?)??5??@&!;[????\???????[ɑ???Z? $?`??R                    @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??          @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??          @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s?   @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                     @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                 @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??        Y             4       // lib_servers.js - 1.85GB - TODO: use localStorage
   @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                    @       ?nOn?&<???2????[|????X???k?Nү$P??? It?}:??z??<߭Y??;kL%m$          @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??          @       ?nOn?&<???2????[|????X???k?Nү$P??? It?}:??z??<߭Y??;kL%m   @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                     @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                 @       ?nOn?&<???2????[|????X???k?Nү$P??? It?}:??z??<߭Y??;kL%m%        Z             )       export const array_get_servers = ns => {
   @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                    @       ?nOn?&<???2????[|????X???k?Nү$P??? It?}:??z??<߭Y??;kL%m,          @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??          @       ?nOn?&<???2????[|????X???k?Nү$P??? It?}:??z??<߭Y??;kL%m   @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                     @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                [                    };   @        FT?m8$	??????+??? ?P@?5j??N?Y?(??V?BO?)%E$г???nn???k?s??                    @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???X         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???W         @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???   @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<VP                     @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???W                @       ????X^?i???T?e????|1?p=??sf??)U???Y?B'?[? Cے8????Z?z???Z       \             	         clone,
   @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<VP                    @       t?{?v??v?Y?j
?????;n$;????~S?E"??H?c?a^?[?`?&???qߏ?J??         @       t?{?v??v?Y?j
?????;n$;????~S?E"??H?c?a^?[?`?&???qߏ?J??         @       t?{?v??v?Y?j
?????;n$;????~S?E"??H?c?a^?[?`?&???qߏ?J?   @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<VP                     @       t?{?v??v?Y?j
?????;n$;????~S?E"??H?c?a^?[?`?&???qߏ?J??                @       ?_???s!W????l?@??^Z/?1?L??JF?0k)?7?G??*?,>??w?a(?o?????:        ]             >           object_server_target_after = clone(object_server_target);
   @       vyc|?{.?_????oF?U??A?F??]}???#$?e?eQUJk? ???_??`?z?P???T<VP       ?u 
 '?_?ڒ!%4/ ??y?r-??I?l???	I?l???  ʭ ?Cc???NDض?6?!?HN??,??j??? ?i1??>????48??Ĝ?????????e9??