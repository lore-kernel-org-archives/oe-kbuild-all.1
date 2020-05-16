Content-Type: multipart/mixed; boundary="===============0289910827191434492=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [nbd168-wireless:mt76 114/138] drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:758:63: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Sat, 16 May 2020 14:39:22 +0800
Message-ID: <202005161419.h2l3YNUx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0289910827191434492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/nbd168/wireless mt76
head:   12a87174accd29ff943d4c5fb735e1541b92630b
commit: 6094f86fb3713e1b7d0c7f264c3a76263745efae [114/138] mt76: mt7915: ad=
d HE bss_conf support for interfaces
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 6094f86fb3713e1b7d0c7f264c3a76263745efae
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:253:16: sparse: sparse: =
mixing different enum types:
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:253:16: sparse:    unsig=
ned int enum mt7915_txq_id
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:253:16: sparse:    unsig=
ned int enum mt76_txq_id
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:758:63: sparse: sparse: =
incorrect type in argument 2 (different address spaces) @@    expected unsi=
gned char const [usertype] *ies @@    got unsigneunsigned char const [usert=
ype] *ies @@
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:758:63: sparse:    expec=
ted unsigned char const [usertype] *ies
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:758:63: sparse:    got u=
nsigned char const [noderef] <asn:4> *
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@    expected unsigne=
d int w @@    got restricted __le3unsigned int w @@
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse:    expe=
cted unsigned int w
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse:    got =
restricted __le32 [usertype] supp_ht_mcs
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1390:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1430:33: sparse: sparse:=
 restricted __le16 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1429:60: sparse: sparse:=
 bad assignment (>>=3D) to restricted __le16
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1773:16: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:759:38: sparse: sparse: =
dereference of noderef expression
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:759:38: sparse: sparse: =
dereference of noderef expression

vim +758 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c

   750	=

   751	static void mt7915_check_he_obss_narrow_bw_ru_iter(struct wiphy *wip=
hy,
   752							   struct cfg80211_bss *bss,
   753							   void *_data)
   754	{
   755		struct mt7915_he_obss_narrow_bw_ru_data *data =3D _data;
   756		const struct element *elem;
   757	=

 > 758		elem =3D cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY, bss->ies->data,
 > 759					  bss->ies->len);
   760	=

   761		if (!elem || elem->datalen < 10 ||
   762		    !(elem->data[10] &
   763		      WLAN_EXT_CAPA10_OBSS_NARROW_BW_RU_TOLERANCE_SUPPORT))
   764			data->tolerated =3D false;
   765	}
   766	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0289910827191434492==--

