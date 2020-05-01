Content-Type: multipart/mixed; boundary="===============0394500491001257611=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V3 3/3] ath11k: add support for setting fixed HE rate/gi/ltf
Date: Fri, 01 May 2020 10:14:02 +0800
Message-ID: <202005011012.mVlArqn5%lkp@intel.com>
In-Reply-To: <20200429145708.25992-3-john@phrozen.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0394500491001257611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi John,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mac80211/master]
[also build test WARNING on ath6kl/ath-next v5.7-rc3]
[cannot apply to mac80211-next/master next-20200430]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/John-Crispin/nl80211-add-s=
upport-for-setting-fixed-HE-rate-gi-ltf/20200430-040802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211.git =
master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/mac.c:1310:27: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got tricted __le16 [usertype] v @@
>> drivers/net/wireless/ath/ath11k/mac.c:1310:27: sparse:    expected restr=
icted __le16 [usertype] v
>> drivers/net/wireless/ath/ath11k/mac.c:1310:27: sparse:    got unsigned s=
hort [usertype]
>> drivers/net/wireless/ath/ath11k/mac.c:1311:83: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected unsigned int @@  =
  got restricted __le16unsigned int @@
>> drivers/net/wireless/ath/ath11k/mac.c:1311:83: sparse:    expected unsig=
ned int
>> drivers/net/wireless/ath/ath11k/mac.c:1311:83: sparse:    got restricted=
 __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1313:27: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got tricted __le16 [usertype] v @@
   drivers/net/wireless/ath/ath11k/mac.c:1313:27: sparse:    expected restr=
icted __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1313:27: sparse:    got unsigned s=
hort [usertype]
>> drivers/net/wireless/ath/ath11k/mac.c:1314:58: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@    expected unsigned short [a=
ssigned] [usertype] tx_mcs_set @@    got  short [assigned] [usertype] tx_mc=
s_set @@
>> drivers/net/wireless/ath/ath11k/mac.c:1314:58: sparse:    expected unsig=
ned short [assigned] [usertype] tx_mcs_set
   drivers/net/wireless/ath/ath11k/mac.c:1314:58: sparse:    got restricted=
 __le16 [usertype] v
>> drivers/net/wireless/ath/ath11k/mac.c:1314:27: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got 16 [usertype] v @@
   drivers/net/wireless/ath/ath11k/mac.c:1314:27: sparse:    expected restr=
icted __le16 [usertype] v
>> drivers/net/wireless/ath/ath11k/mac.c:1314:27: sparse:    got unsigned s=
hort
   drivers/net/wireless/ath/ath11k/mac.c:1315:83: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected unsigned int @@  =
  got restricted __le16unsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1315:83: sparse:    expected unsig=
ned int
   drivers/net/wireless/ath/ath11k/mac.c:1315:83: sparse:    got restricted=
 __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1320:19: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got tricted __le16 [usertype] v @@
   drivers/net/wireless/ath/ath11k/mac.c:1320:19: sparse:    expected restr=
icted __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1320:19: sparse:    got unsigned s=
hort [usertype]
   drivers/net/wireless/ath/ath11k/mac.c:1321:73: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected unsigned int @@  =
  got restricted __le16unsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1321:73: sparse:    expected unsig=
ned int
   drivers/net/wireless/ath/ath11k/mac.c:1321:73: sparse:    got restricted=
 __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1323:19: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got tricted __le16 [usertype] v @@
   drivers/net/wireless/ath/ath11k/mac.c:1323:19: sparse:    expected restr=
icted __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1323:19: sparse:    got unsigned s=
hort [usertype]
   drivers/net/wireless/ath/ath11k/mac.c:1324:50: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@    expected unsigned short [a=
ssigned] [usertype] tx_mcs_set @@    got  short [assigned] [usertype] tx_mc=
s_set @@
   drivers/net/wireless/ath/ath11k/mac.c:1324:50: sparse:    expected unsig=
ned short [assigned] [usertype] tx_mcs_set
   drivers/net/wireless/ath/ath11k/mac.c:1324:50: sparse:    got restricted=
 __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1324:19: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got 16 [usertype] v @@
   drivers/net/wireless/ath/ath11k/mac.c:1324:19: sparse:    expected restr=
icted __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1324:19: sparse:    got unsigned s=
hort
   drivers/net/wireless/ath/ath11k/mac.c:1325:73: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected unsigned int @@  =
  got restricted __le16unsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1325:73: sparse:    expected unsig=
ned int
   drivers/net/wireless/ath/ath11k/mac.c:1325:73: sparse:    got restricted=
 __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1333:19: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got tricted __le16 [usertype] v @@
   drivers/net/wireless/ath/ath11k/mac.c:1333:19: sparse:    expected restr=
icted __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1333:19: sparse:    got unsigned s=
hort [usertype]
   drivers/net/wireless/ath/ath11k/mac.c:1334:72: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected unsigned int @@  =
  got restricted __le16unsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1334:72: sparse:    expected unsig=
ned int
   drivers/net/wireless/ath/ath11k/mac.c:1334:72: sparse:    got restricted=
 __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1336:19: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got tricted __le16 [usertype] v @@
   drivers/net/wireless/ath/ath11k/mac.c:1336:19: sparse:    expected restr=
icted __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1336:19: sparse:    got unsigned s=
hort [usertype]
   drivers/net/wireless/ath/ath11k/mac.c:1337:50: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@    expected unsigned short [a=
ssigned] [usertype] tx_mcs_set @@    got  short [assigned] [usertype] tx_mc=
s_set @@
   drivers/net/wireless/ath/ath11k/mac.c:1337:50: sparse:    expected unsig=
ned short [assigned] [usertype] tx_mcs_set
   drivers/net/wireless/ath/ath11k/mac.c:1337:50: sparse:    got restricted=
 __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1337:19: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected restricted __le16=
 [usertype] v @@    got 16 [usertype] v @@
   drivers/net/wireless/ath/ath11k/mac.c:1337:19: sparse:    expected restr=
icted __le16 [usertype] v
   drivers/net/wireless/ath/ath11k/mac.c:1337:19: sparse:    got unsigned s=
hort
   drivers/net/wireless/ath/ath11k/mac.c:1338:72: sparse: sparse: incorrect=
 type in assignment (different base types) @@    expected unsigned int @@  =
  got restricted __le16unsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1338:72: sparse:    expected unsig=
ned int
   drivers/net/wireless/ath/ath11k/mac.c:1338:72: sparse:    got restricted=
 __le16 [usertype] v
>> drivers/net/wireless/ath/ath11k/mac.c:5292:47: sparse: sparse: incorrect=
 type in return expression (different base types) @@    expected unsigned s=
hort @@    got restricted __le16 conunsigned short @@
>> drivers/net/wireless/ath/ath11k/mac.c:5292:47: sparse:    expected unsig=
ned short
>> drivers/net/wireless/ath/ath11k/mac.c:5292:47: sparse:    got restricted=
 __le16 const [usertype] tx_mcs_80p80
   drivers/net/wireless/ath/ath11k/mac.c:5296:47: sparse: sparse: incorrect=
 type in return expression (different base types) @@    expected unsigned s=
hort @@    got restricted __le16 conunsigned short @@
   drivers/net/wireless/ath/ath11k/mac.c:5296:47: sparse:    expected unsig=
ned short
>> drivers/net/wireless/ath/ath11k/mac.c:5296:47: sparse:    got restricted=
 __le16 const [usertype] tx_mcs_160
   drivers/net/wireless/ath/ath11k/mac.c:5298:39: sparse: sparse: incorrect=
 type in return expression (different base types) @@    expected unsigned s=
hort @@    got restricted __le16 conunsigned short @@
   drivers/net/wireless/ath/ath11k/mac.c:5298:39: sparse:    expected unsig=
ned short
>> drivers/net/wireless/ath/ath11k/mac.c:5298:39: sparse:    got restricted=
 __le16 const [usertype] tx_mcs_80
>> drivers/net/wireless/ath/ath11k/mac.c:5288:5: sparse: sparse: symbol 'at=
h11k_mac_get_tx_mcs_map' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/mac.c:5339:22: sparse: sparse: cast to r=
estricted __le16

Please review and possibly fold the followup patch.

vim +1310 drivers/net/wireless/ath/ath11k/mac.c

f4740f8f367c7c Miles Hu     2020-04-29  1231  =

d5c65159f28953 Kalle Valo   2019-11-23  1232  static void ath11k_peer_assoc=
_h_he(struct ath11k *ar,
d5c65159f28953 Kalle Valo   2019-11-23  1233  				   struct ieee80211_vif *=
vif,
d5c65159f28953 Kalle Valo   2019-11-23  1234  				   struct ieee80211_sta *=
sta,
d5c65159f28953 Kalle Valo   2019-11-23  1235  				   struct peer_assoc_para=
ms *arg)
d5c65159f28953 Kalle Valo   2019-11-23  1236  {
f4740f8f367c7c Miles Hu     2020-04-29  1237  	struct ath11k_vif *arvif =3D=
 (void *)vif->drv_priv;
f4740f8f367c7c Miles Hu     2020-04-29  1238  	struct cfg80211_chan_def def;
9f056ed8ee01ad John Crispin 2019-11-25  1239  	const struct ieee80211_sta_h=
e_cap *he_cap =3D &sta->he_cap;
f4740f8f367c7c Miles Hu     2020-04-29  1240  	enum nl80211_band band;
f4740f8f367c7c Miles Hu     2020-04-29  1241  	const u16 *he_mcs_mask;
f4740f8f367c7c Miles Hu     2020-04-29  1242  	u8 max_nss, he_mcs;
f4740f8f367c7c Miles Hu     2020-04-29  1243  	__le16 he_tx_mcs =3D 0, v =
=3D 0;
f4740f8f367c7c Miles Hu     2020-04-29  1244  	int i;
f4740f8f367c7c Miles Hu     2020-04-29  1245  =

f4740f8f367c7c Miles Hu     2020-04-29  1246  	if (WARN_ON(ath11k_mac_vif_c=
han(vif, &def)))
f4740f8f367c7c Miles Hu     2020-04-29  1247  		return;
9f056ed8ee01ad John Crispin 2019-11-25  1248  =

9f056ed8ee01ad John Crispin 2019-11-25  1249  	if (!he_cap->has_he)
9f056ed8ee01ad John Crispin 2019-11-25  1250  		return;
9f056ed8ee01ad John Crispin 2019-11-25  1251  =

f4740f8f367c7c Miles Hu     2020-04-29  1252  	band =3D def.chan->band;
f4740f8f367c7c Miles Hu     2020-04-29  1253  	he_mcs_mask =3D arvif->bitra=
te_mask.control[band].he_mcs;
f4740f8f367c7c Miles Hu     2020-04-29  1254  =

f4740f8f367c7c Miles Hu     2020-04-29  1255  	if (ath11k_peer_assoc_h_he_m=
asked(he_mcs_mask))
f4740f8f367c7c Miles Hu     2020-04-29  1256  		return;
f4740f8f367c7c Miles Hu     2020-04-29  1257  =

9f056ed8ee01ad John Crispin 2019-11-25  1258  	arg->he_flag =3D true;
9f056ed8ee01ad John Crispin 2019-11-25  1259  =

9f056ed8ee01ad John Crispin 2019-11-25  1260  	memcpy(&arg->peer_he_cap_mac=
info, he_cap->he_cap_elem.mac_cap_info,
9f056ed8ee01ad John Crispin 2019-11-25  1261  	       sizeof(arg->peer_he_c=
ap_macinfo));
9f056ed8ee01ad John Crispin 2019-11-25  1262  	memcpy(&arg->peer_he_cap_phy=
info, he_cap->he_cap_elem.phy_cap_info,
9f056ed8ee01ad John Crispin 2019-11-25  1263  	       sizeof(arg->peer_he_c=
ap_phyinfo));
9f056ed8ee01ad John Crispin 2019-11-25  1264  	memcpy(&arg->peer_he_ops, &v=
if->bss_conf.he_operation,
9f056ed8ee01ad John Crispin 2019-11-25  1265  	       sizeof(arg->peer_he_o=
ps));
9f056ed8ee01ad John Crispin 2019-11-25  1266  =

9f056ed8ee01ad John Crispin 2019-11-25  1267  	/* the top most byte is used=
 to indicate BSS color info */
9f056ed8ee01ad John Crispin 2019-11-25  1268  	arg->peer_he_ops &=3D 0xffff=
ff;
9f056ed8ee01ad John Crispin 2019-11-25  1269  =

9f056ed8ee01ad John Crispin 2019-11-25  1270  	if (he_cap->he_cap_elem.phy_=
cap_info[6] &
9f056ed8ee01ad John Crispin 2019-11-25  1271  	    IEEE80211_HE_PHY_CAP6_PP=
E_THRESHOLD_PRESENT) {
9f056ed8ee01ad John Crispin 2019-11-25  1272  		int bit =3D 7;
9f056ed8ee01ad John Crispin 2019-11-25  1273  		int nss, ru;
9f056ed8ee01ad John Crispin 2019-11-25  1274  =

9f056ed8ee01ad John Crispin 2019-11-25  1275  		arg->peer_ppet.numss_m1 =3D=
 he_cap->ppe_thres[0] &
9f056ed8ee01ad John Crispin 2019-11-25  1276  					  IEEE80211_PPE_THRES_NS=
S_MASK;
9f056ed8ee01ad John Crispin 2019-11-25  1277  		arg->peer_ppet.ru_bit_mask =
=3D
9f056ed8ee01ad John Crispin 2019-11-25  1278  			(he_cap->ppe_thres[0] &
9f056ed8ee01ad John Crispin 2019-11-25  1279  			 IEEE80211_PPE_THRES_RU_IN=
DEX_BITMASK_MASK) >>
9f056ed8ee01ad John Crispin 2019-11-25  1280  			IEEE80211_PPE_THRES_RU_IND=
EX_BITMASK_POS;
9f056ed8ee01ad John Crispin 2019-11-25  1281  =

9f056ed8ee01ad John Crispin 2019-11-25  1282  		for (nss =3D 0; nss <=3D ar=
g->peer_ppet.numss_m1; nss++) {
9f056ed8ee01ad John Crispin 2019-11-25  1283  			for (ru =3D 0; ru < 4; ru+=
+) {
9f056ed8ee01ad John Crispin 2019-11-25  1284  				u32 val =3D 0;
9f056ed8ee01ad John Crispin 2019-11-25  1285  				int i;
9f056ed8ee01ad John Crispin 2019-11-25  1286  =

9f056ed8ee01ad John Crispin 2019-11-25  1287  				if ((arg->peer_ppet.ru_bi=
t_mask & BIT(ru)) =3D=3D 0)
9f056ed8ee01ad John Crispin 2019-11-25  1288  					continue;
9f056ed8ee01ad John Crispin 2019-11-25  1289  				for (i =3D 0; i < 6; i++)=
 {
9f056ed8ee01ad John Crispin 2019-11-25  1290  					val >>=3D 1;
9f056ed8ee01ad John Crispin 2019-11-25  1291  					val |=3D ((he_cap->ppe_t=
hres[bit / 8] >>
9f056ed8ee01ad John Crispin 2019-11-25  1292  						 (bit % 8)) & 0x1) << 5;
9f056ed8ee01ad John Crispin 2019-11-25  1293  					bit++;
9f056ed8ee01ad John Crispin 2019-11-25  1294  				}
9f056ed8ee01ad John Crispin 2019-11-25  1295  				arg->peer_ppet.ppet16_ppe=
t8_ru3_ru0[nss] |=3D
9f056ed8ee01ad John Crispin 2019-11-25  1296  								val << (ru * 6);
9f056ed8ee01ad John Crispin 2019-11-25  1297  			}
9f056ed8ee01ad John Crispin 2019-11-25  1298  		}
9f056ed8ee01ad John Crispin 2019-11-25  1299  	}
9f056ed8ee01ad John Crispin 2019-11-25  1300  =

6d293d447670da John Crispin 2019-11-25  1301  	if (he_cap->he_cap_elem.mac_=
cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_RES)
6d293d447670da John Crispin 2019-11-25  1302  		arg->twt_responder =3D true;
6d293d447670da John Crispin 2019-11-25  1303  	if (he_cap->he_cap_elem.mac_=
cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_REQ)
6d293d447670da John Crispin 2019-11-25  1304  		arg->twt_requester =3D true;
6d293d447670da John Crispin 2019-11-25  1305  =

9f056ed8ee01ad John Crispin 2019-11-25  1306  	switch (sta->bandwidth) {
9f056ed8ee01ad John Crispin 2019-11-25  1307  	case IEEE80211_STA_RX_BW_160:
9f056ed8ee01ad John Crispin 2019-11-25  1308  		if (he_cap->he_cap_elem.phy=
_cap_info[0] &
9f056ed8ee01ad John Crispin 2019-11-25  1309  		    IEEE80211_HE_PHY_CAP0_C=
HANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G) {
9f056ed8ee01ad John Crispin 2019-11-25 @1310  			v =3D le16_to_cpu(he_cap->=
he_mcs_nss_supp.rx_mcs_80p80);
9f056ed8ee01ad John Crispin 2019-11-25 @1311  			arg->peer_he_rx_mcs_set[WM=
I_HECAP_TXRX_MCS_NSS_IDX_80_80] =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1312  =

9f056ed8ee01ad John Crispin 2019-11-25  1313  			v =3D le16_to_cpu(he_cap->=
he_mcs_nss_supp.tx_mcs_80p80);
f4740f8f367c7c Miles Hu     2020-04-29 @1314  			v =3D ath11k_peer_assoc_h_=
he_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin 2019-11-25  1315  			arg->peer_he_tx_mcs_set[WM=
I_HECAP_TXRX_MCS_NSS_IDX_80_80] =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1316  =

9f056ed8ee01ad John Crispin 2019-11-25  1317  			arg->peer_he_mcs_count++;
f4740f8f367c7c Miles Hu     2020-04-29  1318  			he_tx_mcs =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1319  		}
9f056ed8ee01ad John Crispin 2019-11-25  1320  		v =3D le16_to_cpu(he_cap->h=
e_mcs_nss_supp.rx_mcs_160);
9f056ed8ee01ad John Crispin 2019-11-25  1321  		arg->peer_he_rx_mcs_set[WMI=
_HECAP_TXRX_MCS_NSS_IDX_160] =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1322  =

9f056ed8ee01ad John Crispin 2019-11-25  1323  		v =3D le16_to_cpu(he_cap->h=
e_mcs_nss_supp.tx_mcs_160);
f4740f8f367c7c Miles Hu     2020-04-29  1324  		v =3D ath11k_peer_assoc_h_h=
e_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin 2019-11-25  1325  		arg->peer_he_tx_mcs_set[WMI=
_HECAP_TXRX_MCS_NSS_IDX_160] =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1326  =

9f056ed8ee01ad John Crispin 2019-11-25  1327  		arg->peer_he_mcs_count++;
f4740f8f367c7c Miles Hu     2020-04-29  1328  		if (!he_tx_mcs)
f4740f8f367c7c Miles Hu     2020-04-29  1329  			he_tx_mcs =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1330  		/* fall through */
9f056ed8ee01ad John Crispin 2019-11-25  1331  =

9f056ed8ee01ad John Crispin 2019-11-25  1332  	default:
9f056ed8ee01ad John Crispin 2019-11-25  1333  		v =3D le16_to_cpu(he_cap->h=
e_mcs_nss_supp.rx_mcs_80);
9f056ed8ee01ad John Crispin 2019-11-25  1334  		arg->peer_he_rx_mcs_set[WMI=
_HECAP_TXRX_MCS_NSS_IDX_80] =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1335  =

9f056ed8ee01ad John Crispin 2019-11-25  1336  		v =3D le16_to_cpu(he_cap->h=
e_mcs_nss_supp.tx_mcs_80);
f4740f8f367c7c Miles Hu     2020-04-29 @1337  		v =3D ath11k_peer_assoc_h_h=
e_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin 2019-11-25 @1338  		arg->peer_he_tx_mcs_set[WMI=
_HECAP_TXRX_MCS_NSS_IDX_80] =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1339  =

9f056ed8ee01ad John Crispin 2019-11-25  1340  		arg->peer_he_mcs_count++;
f4740f8f367c7c Miles Hu     2020-04-29  1341  		if (!he_tx_mcs)
f4740f8f367c7c Miles Hu     2020-04-29  1342  			he_tx_mcs =3D v;
9f056ed8ee01ad John Crispin 2019-11-25  1343  		break;
9f056ed8ee01ad John Crispin 2019-11-25  1344  	}
f4740f8f367c7c Miles Hu     2020-04-29  1345  	/* Calculate peer NSS capabi=
lity from HE capabilities if STA
f4740f8f367c7c Miles Hu     2020-04-29  1346  	 * supports HE.
f4740f8f367c7c Miles Hu     2020-04-29  1347  	 */
f4740f8f367c7c Miles Hu     2020-04-29  1348  	for (i =3D 0, max_nss =3D 0,=
 he_mcs =3D 0; i < NL80211_HE_NSS_MAX; i++) {
f4740f8f367c7c Miles Hu     2020-04-29  1349  		he_mcs =3D __le16_to_cpu(he=
_tx_mcs) >> (2 * i) & 3;
f4740f8f367c7c Miles Hu     2020-04-29  1350  =

f4740f8f367c7c Miles Hu     2020-04-29  1351  		if (he_mcs !=3D IEEE80211_H=
E_MCS_NOT_SUPPORTED &&
f4740f8f367c7c Miles Hu     2020-04-29  1352  		    he_mcs_mask[i])
f4740f8f367c7c Miles Hu     2020-04-29  1353  			max_nss =3D i + 1;
f4740f8f367c7c Miles Hu     2020-04-29  1354  	}
f4740f8f367c7c Miles Hu     2020-04-29  1355  	arg->peer_nss =3D min(sta->r=
x_nss, max_nss);
f4740f8f367c7c Miles Hu     2020-04-29  1356  =

f4740f8f367c7c Miles Hu     2020-04-29  1357  	ath11k_dbg(ar->ab, ATH11K_DB=
G_MAC,
f4740f8f367c7c Miles Hu     2020-04-29  1358  		   "mac he peer %pM nss %d =
mcs cnt %d\n",
f4740f8f367c7c Miles Hu     2020-04-29  1359  		   sta->addr, arg->peer_nss=
, arg->peer_he_mcs_count);
d5c65159f28953 Kalle Valo   2019-11-23  1360  }
d5c65159f28953 Kalle Valo   2019-11-23  1361  =


:::::: The code at line 1310 was first introduced by commit
:::::: 9f056ed8ee01ad6898db49707cdc70ce923be3d0 ath11k: add HE support

:::::: TO: John Crispin <john@phrozen.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0394500491001257611==--

