Content-Type: multipart/mixed; boundary="===============2686129487029854180=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-arm:cex7 102/102] drivers/net/phy/sfp-bus.c:121:5: error: redefinition of 'sfp_parse_port'
Date: Wed, 12 Feb 2020 03:10:55 +0800
Message-ID: <202002120351.5a3gJA7L%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2686129487029854180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Russell,

First bad commit (maybe !=3D root cause):

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   9ce6b3da01bfaf78f5529746945d93c5688d3ed7
commit: 9ce6b3da01bfaf78f5529746945d93c5688d3ed7 [102/102] net: add qsfp su=
pport                              [*experimental*]
config: x86_64-randconfig-c002-20200212 (attached as .config)
compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
reproduce:
        git checkout 9ce6b3da01bfaf78f5529746945d93c5688d3ed7
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/phy/sfp-bus.c:121:5: error: redefinition of 'sfp_parse_port'
    int sfp_parse_port(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
        ^~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:663:19: note: previous definition of 'sfp_parse_port=
' was here
    static inline int sfp_parse_port(struct sfp_bus *bus,
                      ^~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:190:6: error: redefinition of 'sfp_may_have_ph=
y'
    bool sfp_may_have_phy(struct sfp_bus *bus, const struct sfp_eeprom_id *=
id)
         ^~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:670:20: note: previous definition of 'sfp_may_have_p=
hy' was here
    static inline bool sfp_may_have_phy(struct sfp_bus *bus,
                       ^~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:218:6: error: redefinition of 'sfp_parse_suppo=
rt'
    void sfp_parse_support(struct sfp_bus *bus, const struct sfp_eeprom_id =
*id,
         ^~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:676:20: note: previous definition of 'sfp_parse_supp=
ort' was here
    static inline void sfp_parse_support(struct sfp_bus *bus,
                       ^~~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:367:17: error: redefinition of 'sfp_select_int=
erface'
    phy_interface_t sfp_select_interface(struct sfp_bus *bus,
                    ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:682:31: note: previous definition of 'sfp_select_int=
erface' was here
    static inline phy_interface_t sfp_select_interface(struct sfp_bus *bus,
                                  ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:449:6: error: redefinition of 'sfp_bus_put'
    void sfp_bus_put(struct sfp_bus *bus)
         ^~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:708:20: note: previous definition of 'sfp_bus_put' w=
as here
    static inline void sfp_bus_put(struct sfp_bus *bus)
                       ^~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:503:5: error: redefinition of 'sfp_get_module_=
info'
    int sfp_get_module_info(struct sfp_bus *bus, struct ethtool_modinfo *mo=
dinfo)
        ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:688:19: note: previous definition of 'sfp_get_module=
_info' was here
    static inline int sfp_get_module_info(struct sfp_bus *bus,
                      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:520:5: error: redefinition of 'sfp_get_module_=
eeprom'
    int sfp_get_module_eeprom(struct sfp_bus *bus, struct ethtool_eeprom *e=
e,
        ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:694:19: note: previous definition of 'sfp_get_module=
_eeprom' was here
    static inline int sfp_get_module_eeprom(struct sfp_bus *bus,
                      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:536:6: error: redefinition of 'sfp_upstream_st=
art'
    void sfp_upstream_start(struct sfp_bus *bus)
         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:700:20: note: previous definition of 'sfp_upstream_s=
tart' was here
    static inline void sfp_upstream_start(struct sfp_bus *bus)
                       ^~~~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:553:6: error: redefinition of 'sfp_upstream_st=
op'
    void sfp_upstream_stop(struct sfp_bus *bus)
         ^~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:704:20: note: previous definition of 'sfp_upstream_s=
top' was here
    static inline void sfp_upstream_stop(struct sfp_bus *bus)
                       ^~~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:583:17: error: redefinition of 'sfp_bus_find_f=
wnode'
    struct sfp_bus *sfp_bus_find_fwnode(struct fwnode_handle *fwnode)
                    ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:712:31: note: previous definition of 'sfp_bus_find_f=
wnode' was here
    static inline struct sfp_bus *sfp_bus_find_fwnode(struct fwnode_handle =
*fwnode)
                                  ^~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:623:5: error: redefinition of 'sfp_bus_add_ups=
tream'
    int sfp_bus_add_upstream(struct sfp_bus *bus, void *upstream,
        ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:717:19: note: previous definition of 'sfp_bus_add_up=
stream' was here
    static inline int sfp_bus_add_upstream(struct sfp_bus *bus, void *upstr=
eam,
                      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/sfp-bus.c:660:6: error: redefinition of 'sfp_bus_del_ups=
tream'
    void sfp_bus_del_upstream(struct sfp_bus *bus)
         ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/sfp.h:5:0,
                    from drivers/net/phy/sfp-bus.c:11:
   include/linux/sfp.h:723:20: note: previous definition of 'sfp_bus_del_up=
stream' was here
    static inline void sfp_bus_del_upstream(struct sfp_bus *bus)
                       ^~~~~~~~~~~~~~~~~~~~

vim +/sfp_parse_port +121 drivers/net/phy/sfp-bus.c

949e063b3cd9d8 Russell King   2019-11-21  106  =

0a6fcd3fc14d39 Russell King   2017-12-01  107  /**
0a6fcd3fc14d39 Russell King   2017-12-01  108   * sfp_parse_port() - Parse =
the EEPROM base ID, setting the port type
0a6fcd3fc14d39 Russell King   2017-12-01  109   * @bus: a pointer to the &s=
truct sfp_bus structure for the sfp module
0a6fcd3fc14d39 Russell King   2017-12-01  110   * @id: a pointer to the mod=
ule's &struct sfp_eeprom_id
0a6fcd3fc14d39 Russell King   2017-12-01  111   * @support: optional pointe=
r to an array of unsigned long for the
0a6fcd3fc14d39 Russell King   2017-12-01  112   *   ethtool support mask
0a6fcd3fc14d39 Russell King   2017-12-01  113   *
0a6fcd3fc14d39 Russell King   2017-12-01  114   * Parse the EEPROM identifi=
cation given in @id, and return one of
0a6fcd3fc14d39 Russell King   2017-12-01  115   * %PORT_TP, %PORT_FIBRE or =
%PORT_OTHER. If @support is non-%NULL,
0a6fcd3fc14d39 Russell King   2017-12-01  116   * also set the ethtool %ETH=
TOOL_LINK_MODE_xxx_BIT corresponding with
0a6fcd3fc14d39 Russell King   2017-12-01  117   * the connector type.
0a6fcd3fc14d39 Russell King   2017-12-01  118   *
0a6fcd3fc14d39 Russell King   2017-12-01  119   * If the port type is not k=
nown, returns %PORT_OTHER.
0a6fcd3fc14d39 Russell King   2017-12-01  120   */
ce0aa27ff3f68e Russell King   2017-07-25 @121  int sfp_parse_port(struct sf=
p_bus *bus, const struct sfp_eeprom_id *id,
ce0aa27ff3f68e Russell King   2017-07-25  122  		   unsigned long *support)
ce0aa27ff3f68e Russell King   2017-07-25  123  {
ce0aa27ff3f68e Russell King   2017-07-25  124  	int port;
ce0aa27ff3f68e Russell King   2017-07-25  125  =

ce0aa27ff3f68e Russell King   2017-07-25  126  	/* port is the physical con=
nector, set this from the connector field. */
ce0aa27ff3f68e Russell King   2017-07-25  127  	switch (id->base.connector)=
 {
c83f8d2fce3488 Russell King   2019-09-26  128  	case SFF8024_CONNECTOR_SC:
c83f8d2fce3488 Russell King   2019-09-26  129  	case SFF8024_CONNECTOR_FIBE=
RJACK:
c83f8d2fce3488 Russell King   2019-09-26  130  	case SFF8024_CONNECTOR_LC:
c83f8d2fce3488 Russell King   2019-09-26  131  	case SFF8024_CONNECTOR_MT_R=
J:
c83f8d2fce3488 Russell King   2019-09-26  132  	case SFF8024_CONNECTOR_MU:
c83f8d2fce3488 Russell King   2019-09-26  133  	case SFF8024_CONNECTOR_OPTI=
CAL_PIGTAIL:
c83f8d2fce3488 Russell King   2019-09-26  134  	case SFF8024_CONNECTOR_MPO_=
1X12:
c83f8d2fce3488 Russell King   2019-09-26  135  	case SFF8024_CONNECTOR_MPO_=
2X16:
ce0aa27ff3f68e Russell King   2017-07-25  136  		port =3D PORT_FIBRE;
ce0aa27ff3f68e Russell King   2017-07-25  137  		break;
ce0aa27ff3f68e Russell King   2017-07-25  138  =

c83f8d2fce3488 Russell King   2019-09-26  139  	case SFF8024_CONNECTOR_RJ45:
ce0aa27ff3f68e Russell King   2017-07-25  140  		port =3D PORT_TP;
ce0aa27ff3f68e Russell King   2017-07-25  141  		break;
ce0aa27ff3f68e Russell King   2017-07-25  142  =

c83f8d2fce3488 Russell King   2019-09-26  143  	case SFF8024_CONNECTOR_COPP=
ER_PIGTAIL:
f10fcbcf91006a Russell King   2017-12-29  144  		port =3D PORT_DA;
f10fcbcf91006a Russell King   2017-12-29  145  		break;
f10fcbcf91006a Russell King   2017-12-29  146  =

c83f8d2fce3488 Russell King   2019-09-26  147  	case SFF8024_CONNECTOR_UNSP=
EC:
ce0aa27ff3f68e Russell King   2017-07-25  148  		if (id->base.e1000_base_t)=
 {
ce0aa27ff3f68e Russell King   2017-07-25  149  			port =3D PORT_TP;
ce0aa27ff3f68e Russell King   2017-07-25  150  			break;
ce0aa27ff3f68e Russell King   2017-07-25  151  		}
ce0aa27ff3f68e Russell King   2017-07-25  152  		/* fallthrough */
c83f8d2fce3488 Russell King   2019-09-26  153  	case SFF8024_CONNECTOR_SG: =
/* guess */
c83f8d2fce3488 Russell King   2019-09-26  154  	case SFF8024_CONNECTOR_HSSD=
C_II:
c83f8d2fce3488 Russell King   2019-09-26  155  	case SFF8024_CONNECTOR_NOSE=
PARATE:
c83f8d2fce3488 Russell King   2019-09-26  156  	case SFF8024_CONNECTOR_MXC_=
2X16:
ce0aa27ff3f68e Russell King   2017-07-25  157  		port =3D PORT_OTHER;
ce0aa27ff3f68e Russell King   2017-07-25  158  		break;
ce0aa27ff3f68e Russell King   2017-07-25  159  	default:
ce0aa27ff3f68e Russell King   2017-07-25  160  		dev_warn(bus->sfp_dev, "SF=
P: unknown connector id 0x%02x\n",
ce0aa27ff3f68e Russell King   2017-07-25  161  			 id->base.connector);
ce0aa27ff3f68e Russell King   2017-07-25  162  		port =3D PORT_OTHER;
ce0aa27ff3f68e Russell King   2017-07-25  163  		break;
ce0aa27ff3f68e Russell King   2017-07-25  164  	}
ce0aa27ff3f68e Russell King   2017-07-25  165  =

f10fcbcf91006a Russell King   2017-12-29  166  	if (support) {
f10fcbcf91006a Russell King   2017-12-29  167  		switch (port) {
f10fcbcf91006a Russell King   2017-12-29  168  		case PORT_FIBRE:
f10fcbcf91006a Russell King   2017-12-29  169  			phylink_set(support, FIBR=
E);
f10fcbcf91006a Russell King   2017-12-29  170  			break;
f10fcbcf91006a Russell King   2017-12-29  171  =

f10fcbcf91006a Russell King   2017-12-29  172  		case PORT_TP:
f10fcbcf91006a Russell King   2017-12-29  173  			phylink_set(support, TP);
f10fcbcf91006a Russell King   2017-12-29  174  			break;
f10fcbcf91006a Russell King   2017-12-29  175  		}
f10fcbcf91006a Russell King   2017-12-29  176  	}
f10fcbcf91006a Russell King   2017-12-29  177  =

ce0aa27ff3f68e Russell King   2017-07-25  178  	return port;
ce0aa27ff3f68e Russell King   2017-07-25  179  }
ce0aa27ff3f68e Russell King   2017-07-25  180  EXPORT_SYMBOL_GPL(sfp_parse_=
port);
ce0aa27ff3f68e Russell King   2017-07-25  181  =

949e063b3cd9d8 Russell King   2019-11-21  182  /**
949e063b3cd9d8 Russell King   2019-11-21  183   * sfp_may_have_phy() - indi=
cate whether the module may have a PHY
949e063b3cd9d8 Russell King   2019-11-21  184   * @bus: a pointer to the &s=
truct sfp_bus structure for the sfp module
949e063b3cd9d8 Russell King   2019-11-21  185   * @id: a pointer to the mod=
ule's &struct sfp_eeprom_id
949e063b3cd9d8 Russell King   2019-11-21  186   *
949e063b3cd9d8 Russell King   2019-11-21  187   * Parse the EEPROM identifi=
cation given in @id, and return whether
949e063b3cd9d8 Russell King   2019-11-21  188   * this module may have a PH=
Y.
949e063b3cd9d8 Russell King   2019-11-21  189   */
949e063b3cd9d8 Russell King   2019-11-21 @190  bool sfp_may_have_phy(struct=
 sfp_bus *bus, const struct sfp_eeprom_id *id)
949e063b3cd9d8 Russell King   2019-11-21  191  {
949e063b3cd9d8 Russell King   2019-11-21  192  	if (id->base.e1000_base_t)
949e063b3cd9d8 Russell King   2019-11-21  193  		return true;
949e063b3cd9d8 Russell King   2019-11-21  194  =

949e063b3cd9d8 Russell King   2019-11-21  195  	if (id->base.phys_id !=3D S=
FF8024_ID_DWDM_SFP) {
949e063b3cd9d8 Russell King   2019-11-21  196  		switch (id->base.extended_=
cc) {
949e063b3cd9d8 Russell King   2019-11-21  197  		case SFF8024_ECC_10GBASE_T=
_SFI:
949e063b3cd9d8 Russell King   2019-11-21  198  		case SFF8024_ECC_10GBASE_T=
_SR:
949e063b3cd9d8 Russell King   2019-11-21  199  		case SFF8024_ECC_5GBASE_T:
949e063b3cd9d8 Russell King   2019-11-21  200  		case SFF8024_ECC_2_5GBASE_=
T:
949e063b3cd9d8 Russell King   2019-11-21  201  			return true;
949e063b3cd9d8 Russell King   2019-11-21  202  		}
949e063b3cd9d8 Russell King   2019-11-21  203  	}
949e063b3cd9d8 Russell King   2019-11-21  204  =

949e063b3cd9d8 Russell King   2019-11-21  205  	return false;
949e063b3cd9d8 Russell King   2019-11-21  206  }
949e063b3cd9d8 Russell King   2019-11-21  207  EXPORT_SYMBOL_GPL(sfp_may_ha=
ve_phy);
949e063b3cd9d8 Russell King   2019-11-21  208  =

0a6fcd3fc14d39 Russell King   2017-12-01  209  /**
0a6fcd3fc14d39 Russell King   2017-12-01  210   * sfp_parse_support() - Par=
se the eeprom id for supported link modes
0a6fcd3fc14d39 Russell King   2017-12-01  211   * @bus: a pointer to the &s=
truct sfp_bus structure for the sfp module
0a6fcd3fc14d39 Russell King   2017-12-01  212   * @id: a pointer to the mod=
ule's &struct sfp_eeprom_id
0a6fcd3fc14d39 Russell King   2017-12-01  213   * @support: pointer to an a=
rray of unsigned long for the ethtool support mask
0a6fcd3fc14d39 Russell King   2017-12-01  214   *
0a6fcd3fc14d39 Russell King   2017-12-01  215   * Parse the EEPROM identifi=
cation information and derive the supported
0a6fcd3fc14d39 Russell King   2017-12-01  216   * ethtool link modes for th=
e module.
0a6fcd3fc14d39 Russell King   2017-12-01  217   */
ce0aa27ff3f68e Russell King   2017-07-25 @218  void sfp_parse_support(struc=
t sfp_bus *bus, const struct sfp_eeprom_id *id,
ce0aa27ff3f68e Russell King   2017-07-25  219  		       unsigned long *supp=
ort)
ce0aa27ff3f68e Russell King   2017-07-25  220  {
9962acf7fb8c5c Russell King   2017-12-29  221  	unsigned int br_min, br_nom=
, br_max;
03145864bd0fca Russell King   2018-02-27  222  	__ETHTOOL_DECLARE_LINK_MODE=
_MASK(modes) =3D { 0, };
ce0aa27ff3f68e Russell King   2017-07-25  223  =

9962acf7fb8c5c Russell King   2017-12-29  224  	/* Decode the bitrate infor=
mation to MBd */
9962acf7fb8c5c Russell King   2017-12-29  225  	br_min =3D br_nom =3D br_ma=
x =3D 0;
9962acf7fb8c5c Russell King   2017-12-29  226  	if (id->base.br_nominal) {
9962acf7fb8c5c Russell King   2017-12-29  227  		if (id->base.br_nominal !=
=3D 255) {
9962acf7fb8c5c Russell King   2017-12-29  228  			br_nom =3D id->base.br_no=
minal * 100;
52c5cd1bf0cecf Antoine Tenart 2018-05-04  229  			br_min =3D br_nom - id->b=
ase.br_nominal * id->ext.br_min;
9962acf7fb8c5c Russell King   2017-12-29  230  			br_max =3D br_nom + id->b=
ase.br_nominal * id->ext.br_max;
9962acf7fb8c5c Russell King   2017-12-29  231  		} else if (id->ext.br_max)=
 {
9962acf7fb8c5c Russell King   2017-12-29  232  			br_nom =3D 250 * id->ext.=
br_max;
9962acf7fb8c5c Russell King   2017-12-29  233  			br_max =3D br_nom + br_no=
m * id->ext.br_min / 100;
9962acf7fb8c5c Russell King   2017-12-29  234  			br_min =3D br_nom - br_no=
m * id->ext.br_min / 100;
9962acf7fb8c5c Russell King   2017-12-29  235  		}
2b999ba899059e Antoine Tenart 2018-05-04  236  =

2b999ba899059e Antoine Tenart 2018-05-04  237  		/* When using passive cabl=
es, in case neither BR,min nor BR,max
2b999ba899059e Antoine Tenart 2018-05-04  238  		 * are specified, set br_m=
in to 0 as the nominal value is then
2b999ba899059e Antoine Tenart 2018-05-04  239  		 * used as the maximum.
2b999ba899059e Antoine Tenart 2018-05-04  240  		 */
2b999ba899059e Antoine Tenart 2018-05-04  241  		if (br_min =3D=3D br_max &=
& id->base.sfp_ct_passive)
2b999ba899059e Antoine Tenart 2018-05-04  242  			br_min =3D 0;
9962acf7fb8c5c Russell King   2017-12-29  243  	}
9962acf7fb8c5c Russell King   2017-12-29  244  =

ce0aa27ff3f68e Russell King   2017-07-25  245  	/* Set ethtool support from=
 the compliance fields. */
ce0aa27ff3f68e Russell King   2017-07-25  246  	if (id->base.e10g_base_sr)
03145864bd0fca Russell King   2018-02-27  247  		phylink_set(modes, 10000ba=
seSR_Full);
ce0aa27ff3f68e Russell King   2017-07-25  248  	if (id->base.e10g_base_lr)
03145864bd0fca Russell King   2018-02-27  249  		phylink_set(modes, 10000ba=
seLR_Full);
ce0aa27ff3f68e Russell King   2017-07-25  250  	if (id->base.e10g_base_lrm)
03145864bd0fca Russell King   2018-02-27  251  		phylink_set(modes, 10000ba=
seLRM_Full);
ce0aa27ff3f68e Russell King   2017-07-25  252  	if (id->base.e10g_base_er)
03145864bd0fca Russell King   2018-02-27  253  		phylink_set(modes, 10000ba=
seER_Full);
ce0aa27ff3f68e Russell King   2017-07-25  254  	if (id->base.e1000_base_sx =
||
ce0aa27ff3f68e Russell King   2017-07-25  255  	    id->base.e1000_base_lx =
||
ce0aa27ff3f68e Russell King   2017-07-25  256  	    id->base.e1000_base_cx)
03145864bd0fca Russell King   2018-02-27  257  		phylink_set(modes, 1000bas=
eX_Full);
ce0aa27ff3f68e Russell King   2017-07-25  258  	if (id->base.e1000_base_t) {
03145864bd0fca Russell King   2018-02-27  259  		phylink_set(modes, 1000bas=
eT_Half);
03145864bd0fca Russell King   2018-02-27  260  		phylink_set(modes, 1000bas=
eT_Full);
ce0aa27ff3f68e Russell King   2017-07-25  261  	}
ce0aa27ff3f68e Russell King   2017-07-25  262  =

9962acf7fb8c5c Russell King   2017-12-29  263  	/* 1000Base-PX or 1000Base-=
BX10 */
9962acf7fb8c5c Russell King   2017-12-29  264  	if ((id->base.e_base_px || =
id->base.e_base_bx10) &&
9962acf7fb8c5c Russell King   2017-12-29  265  	    br_min <=3D 1300 && br_=
max >=3D 1200)
d7f7e0018b96fd Baruch Siach   2018-11-29  266  		phylink_set(modes, 1000bas=
eX_Full);
9962acf7fb8c5c Russell King   2017-12-29  267  =

f10fcbcf91006a Russell King   2017-12-29  268  	/* For active or passive ca=
bles, select the link modes
f10fcbcf91006a Russell King   2017-12-29  269  	 * based on the bit rates a=
nd the cable compliance bytes.
f10fcbcf91006a Russell King   2017-12-29  270  	 */
f10fcbcf91006a Russell King   2017-12-29  271  	if ((id->base.sfp_ct_passiv=
e || id->base.sfp_ct_active) && br_nom) {
f10fcbcf91006a Russell King   2017-12-29  272  		/* This may look odd, but =
some manufacturers use 12000MBd */
f10fcbcf91006a Russell King   2017-12-29  273  		if (br_min <=3D 12000 && b=
r_max >=3D 10300)
03145864bd0fca Russell King   2018-02-27  274  			phylink_set(modes, 10000b=
aseCR_Full);
f10fcbcf91006a Russell King   2017-12-29  275  		if (br_min <=3D 3200 && br=
_max >=3D 3100)
03145864bd0fca Russell King   2018-02-27  276  			phylink_set(modes, 2500ba=
seX_Full);
f10fcbcf91006a Russell King   2017-12-29  277  		if (br_min <=3D 1300 && br=
_max >=3D 1200)
03145864bd0fca Russell King   2018-02-27  278  			phylink_set(modes, 1000ba=
seX_Full);
f10fcbcf91006a Russell King   2017-12-29  279  	}
f10fcbcf91006a Russell King   2017-12-29  280  	if (id->base.sfp_ct_passive=
) {
f10fcbcf91006a Russell King   2017-12-29  281  		if (id->base.passive.sff84=
31_app_e)
03145864bd0fca Russell King   2018-02-27  282  			phylink_set(modes, 10000b=
aseCR_Full);
f10fcbcf91006a Russell King   2017-12-29  283  	}
f10fcbcf91006a Russell King   2017-12-29  284  	if (id->base.sfp_ct_active)=
 {
f10fcbcf91006a Russell King   2017-12-29  285  		if (id->base.active.sff843=
1_app_e ||
f10fcbcf91006a Russell King   2017-12-29  286  		    id->base.active.sff843=
1_lim) {
03145864bd0fca Russell King   2018-02-27  287  			phylink_set(modes, 10000b=
aseCR_Full);
f10fcbcf91006a Russell King   2017-12-29  288  		}
f10fcbcf91006a Russell King   2017-12-29  289  	}
f10fcbcf91006a Russell King   2017-12-29  290  =

ce0aa27ff3f68e Russell King   2017-07-25  291  	switch (id->base.extended_c=
c) {
c83f8d2fce3488 Russell King   2019-09-26  292  	case SFF8024_ECC_UNSPEC:
ce0aa27ff3f68e Russell King   2017-07-25  293  		break;
c83f8d2fce3488 Russell King   2019-09-26  294  	case SFF8024_ECC_100GBASE_S=
R4_25GBASE_SR:
03145864bd0fca Russell King   2018-02-27  295  		phylink_set(modes, 100000b=
aseSR4_Full);
03145864bd0fca Russell King   2018-02-27  296  		phylink_set(modes, 25000ba=
seSR_Full);
ce0aa27ff3f68e Russell King   2017-07-25  297  		break;
c83f8d2fce3488 Russell King   2019-09-26  298  	case SFF8024_ECC_100GBASE_L=
R4_25GBASE_LR:
c83f8d2fce3488 Russell King   2019-09-26  299  	case SFF8024_ECC_100GBASE_E=
R4_25GBASE_ER:
03145864bd0fca Russell King   2018-02-27  300  		phylink_set(modes, 100000b=
aseLR4_ER4_Full);
ce0aa27ff3f68e Russell King   2017-07-25  301  		break;
c83f8d2fce3488 Russell King   2019-09-26  302  	case SFF8024_ECC_100GBASE_C=
R4:
03145864bd0fca Russell King   2018-02-27  303  		phylink_set(modes, 100000b=
aseCR4_Full);
c83f8d2fce3488 Russell King   2019-09-26  304  		/* fallthrough */
c83f8d2fce3488 Russell King   2019-09-26  305  	case SFF8024_ECC_25GBASE_CR=
_S:
c83f8d2fce3488 Russell King   2019-09-26  306  	case SFF8024_ECC_25GBASE_CR=
_N:
03145864bd0fca Russell King   2018-02-27  307  		phylink_set(modes, 25000ba=
seCR_Full);
ce0aa27ff3f68e Russell King   2017-07-25  308  		break;
c83f8d2fce3488 Russell King   2019-09-26  309  	case SFF8024_ECC_10GBASE_T_=
SFI:
c83f8d2fce3488 Russell King   2019-09-26  310  	case SFF8024_ECC_10GBASE_T_=
SR:
c83f8d2fce3488 Russell King   2019-09-26  311  		phylink_set(modes, 10000ba=
seT_Full);
c83f8d2fce3488 Russell King   2019-09-26  312  		break;
c83f8d2fce3488 Russell King   2019-09-26  313  	case SFF8024_ECC_5GBASE_T:
c83f8d2fce3488 Russell King   2019-09-26  314  		phylink_set(modes, 5000bas=
eT_Full);
c83f8d2fce3488 Russell King   2019-09-26  315  		break;
c83f8d2fce3488 Russell King   2019-09-26  316  	case SFF8024_ECC_2_5GBASE_T:
c83f8d2fce3488 Russell King   2019-09-26  317  		phylink_set(modes, 2500bas=
eT_Full);
c83f8d2fce3488 Russell King   2019-09-26  318  		break;
ce0aa27ff3f68e Russell King   2017-07-25  319  	default:
ce0aa27ff3f68e Russell King   2017-07-25  320  		dev_warn(bus->sfp_dev,
ce0aa27ff3f68e Russell King   2017-07-25  321  			 "Unknown/unsupported ext=
ended compliance code: 0x%02x\n",
ce0aa27ff3f68e Russell King   2017-07-25  322  			 id->base.extended_cc);
ce0aa27ff3f68e Russell King   2017-07-25  323  		break;
ce0aa27ff3f68e Russell King   2017-07-25  324  	}
ce0aa27ff3f68e Russell King   2017-07-25  325  =

ce0aa27ff3f68e Russell King   2017-07-25  326  	/* For fibre channel SFP, d=
erive possible BaseX modes */
ce0aa27ff3f68e Russell King   2017-07-25  327  	if (id->base.fc_speed_100 ||
ce0aa27ff3f68e Russell King   2017-07-25  328  	    id->base.fc_speed_200 ||
ce0aa27ff3f68e Russell King   2017-07-25  329  	    id->base.fc_speed_400) {
ce0aa27ff3f68e Russell King   2017-07-25  330  		if (id->base.br_nominal >=
=3D 31)
03145864bd0fca Russell King   2018-02-27  331  			phylink_set(modes, 2500ba=
seX_Full);
ce0aa27ff3f68e Russell King   2017-07-25  332  		if (id->base.br_nominal >=
=3D 12)
03145864bd0fca Russell King   2018-02-27  333  			phylink_set(modes, 1000ba=
seX_Full);
03145864bd0fca Russell King   2018-02-27  334  	}
03145864bd0fca Russell King   2018-02-27  335  =

03145864bd0fca Russell King   2018-02-27  336  	/* If we haven't discovered=
 any modes that this module supports, try
03145864bd0fca Russell King   2018-02-27  337  	 * the encoding and bitrate=
 to determine supported modes. Some BiDi
03145864bd0fca Russell King   2018-02-27  338  	 * modules (eg, 1310nm/1550=
nm) are not 1000BASE-BX compliant due to
03145864bd0fca Russell King   2018-02-27  339  	 * the differing wavelength=
s, so do not set any transceiver bits.
03145864bd0fca Russell King   2018-02-27  340  	 */
03145864bd0fca Russell King   2018-02-27  341  	if (bitmap_empty(modes, __E=
THTOOL_LINK_MODE_MASK_NBITS)) {
03145864bd0fca Russell King   2018-02-27  342  		/* If the encoding and bit=
 rate allows 1000baseX */
c83f8d2fce3488 Russell King   2019-09-26  343  		if (id->base.encoding =3D=
=3D SFF8024_ENCODING_8B10B && br_nom &&
03145864bd0fca Russell King   2018-02-27  344  		    br_min <=3D 1300 && br=
_max >=3D 1200)
03145864bd0fca Russell King   2018-02-27  345  			phylink_set(modes, 1000ba=
seX_Full);
ce0aa27ff3f68e Russell King   2017-07-25  346  	}
03145864bd0fca Russell King   2018-02-27  347  =

b34bb2cb5b62c7 Russell King   2019-11-20  348  	if (bus->sfp_quirk)
b34bb2cb5b62c7 Russell King   2019-11-20  349  		bus->sfp_quirk->modes(id, =
modes);
b34bb2cb5b62c7 Russell King   2019-11-20  350  =

03145864bd0fca Russell King   2018-02-27  351  	bitmap_or(support, support,=
 modes, __ETHTOOL_LINK_MODE_MASK_NBITS);
03145864bd0fca Russell King   2018-02-27  352  =

03145864bd0fca Russell King   2018-02-27  353  	phylink_set(support, Autone=
g);
03145864bd0fca Russell King   2018-02-27  354  	phylink_set(support, Pause);
03145864bd0fca Russell King   2018-02-27  355  	phylink_set(support, Asym_P=
ause);
ce0aa27ff3f68e Russell King   2017-07-25  356  }
ce0aa27ff3f68e Russell King   2017-07-25  357  EXPORT_SYMBOL_GPL(sfp_parse_=
support);
ce0aa27ff3f68e Russell King   2017-07-25  358  =


:::::: The code at line 121 was first introduced by commit
:::::: ce0aa27ff3f68ed4ea1631d33797e573b3508bfa sfp: add sfp-bus to bridge =
between network devices and sfp cages

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2686129487029854180==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
eTGpoQsCAA==
--===============2686129487029854180==--

