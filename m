Content-Type: multipart/mixed; boundary="===============7412106401158155806=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [chrome-os:chromeos-5.4 182/255] drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c:74 mt7663_usb_sdio_set_rates() warn: variable dereferenced before check 'sta' (see line 70)
Date: Tue, 04 May 2021 12:33:11 +0300
Message-ID: <202105041652.LYlvFmND-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7412106401158155806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   2844d73d89c22c4dddd33272e77e40f50582b1bb
commit: f56036cf6e75afafec0a9b989ef35e0dda25f0a0 [182/255] FROMGIT: mt76: m=
t7615: fix TSF configuration
config: i386-randconfig-m021-20210504 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c:74 mt7663_usb_sdio_set=
_rates() warn: variable dereferenced before check 'sta' (see line 70)

vim +/sta +74 drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c

d1251709841d1d Lorenzo Bianconi 2020-11-08   64  static int mt7663_usb_sdio=
_set_rates(struct mt7615_dev *dev,
d1251709841d1d Lorenzo Bianconi 2020-11-08   65  				     struct mt7615_wtb=
l_rate_desc *wrd)
d790cea7b38dd2 Lorenzo Bianconi 2020-07-15   66  {
d1251709841d1d Lorenzo Bianconi 2020-11-08   67  	struct mt7615_rate_desc *=
rate =3D &wrd->rate;
d1251709841d1d Lorenzo Bianconi 2020-11-08   68  	struct mt7615_sta *sta =
=3D wrd->sta;
d790cea7b38dd2 Lorenzo Bianconi 2020-07-15   69  	u32 w5, w27, addr, val;
f56036cf6e75af Ryder Lee        2021-02-23  @70  	u16 idx =3D sta->vif->mt7=
6.omac_idx;
                                                                  ^^^^^
Patch introduces a new dereference

d790cea7b38dd2 Lorenzo Bianconi 2020-07-15   71  =

d790cea7b38dd2 Lorenzo Bianconi 2020-07-15   72  	lockdep_assert_held(&dev-=
>mt76.mutex);
d790cea7b38dd2 Lorenzo Bianconi 2020-07-15   73  =

d790cea7b38dd2 Lorenzo Bianconi 2020-07-15  @74  	if (!sta)
                                                            ^^^^
Old check is too late.

d790cea7b38dd2 Lorenzo Bianconi 2020-07-15   75  		return -EINVAL;
d790cea7b38dd2 Lorenzo Bianconi 2020-07-15   76  =

d790cea7b38dd2 Lorenzo Bianconi 2020-07-15   77  	if (!mt76_poll(dev, MT_WT=
BL_UPDATE, MT_WTBL_UPDATE_BUSY, 0, 5000))

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7412106401158155806==--

