Content-Type: multipart/mixed; boundary="===============0568151238666386315=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [nbd168-wireless:mt76 121/138] drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2317:31: sparse: sparse: incorrect type in initializer (different base types)
Date: Sat, 16 May 2020 15:26:44 +0800
Message-ID: <202005161541.CpN35y4a%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0568151238666386315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/nbd168/wireless mt76
head:   12a87174accd29ff943d4c5fb735e1541b92630b
commit: 5517f78b0063d0463d042c68ac0c651db47ecf90 [121/138] mt76: mt7915: en=
able firmware module debug support
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 5517f78b0063d0463d042c68ac0c651db47ecf90
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:256:16: sparse: sparse: =
mixing different enum types:
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:256:16: sparse:    unsig=
ned int enum mt7915_txq_id
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:256:16: sparse:    unsig=
ned int enum mt76_txq_id
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:787:63: sparse: sparse: =
incorrect type in argument 2 (different address spaces) @@    expected unsi=
gned char const [usertype] *ies @@    got unsigneunsigned char const [usert=
ype] *ies @@
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:787:63: sparse:    expec=
ted unsigned char const [usertype] *ies
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:787:63: sparse:    got u=
nsigned char const [noderef] <asn:4> *
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@    expected unsigne=
d int w @@    got restricted __le3unsigned int w @@
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse:    expe=
cted unsigned int w
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse:    got =
restricted __le32 [usertype] supp_ht_mcs
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1608:23: sparse: sparse:=
 restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1648:33: sparse: sparse:=
 restricted __le16 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1647:60: sparse: sparse:=
 bad assignment (>>=3D) to restricted __le16
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2042:16: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2317:31: sparse: sparse:=
 incorrect type in initializer (different base types) @@    expected unsign=
ed int [usertype] module_idx @@    got restrunsigned int [usertype] module_=
idx @@
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2317:31: sparse:    expe=
cted unsigned int [usertype] module_idx
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2317:31: sparse:    got =
restricted __le32 [usertype]
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:788:38: sparse: sparse: =
dereference of noderef expression
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:788:38: sparse: sparse: =
dereference of noderef expression

vim +2317 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c

  2306	=

  2307	int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 le=
vel)
  2308	{
  2309		struct {
  2310			u8 ver;
  2311			u8 pad;
  2312			u16 len;
  2313			u8 level;
  2314			u8 rsv[3];
  2315			u32 module_idx;
  2316		} data =3D {
> 2317			.module_idx =3D cpu_to_le32(module),
  2318			.level =3D level,
  2319		};
  2320	=

  2321		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_FW_DBG_CTRL,
  2322					   &data, sizeof(data), false);
  2323	}
  2324	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0568151238666386315==--

