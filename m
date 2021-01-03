Content-Type: multipart/mixed; boundary="===============4630960489481000905=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1349:1: warning: stack frame size of 1040 bytes in function 'gf100_gr_trap_intr'
Date: Sun, 03 Jan 2021 14:21:34 +0800
Message-ID: <202101031429.3B2zrC4N-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4630960489481000905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3516bd729358a2a9b090c1905bd2a3fa926e24c6
commit: 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e powerpc: inline iomap acce=
ssors
date:   4 weeks ago
config: powerpc64-randconfig-r031-20210103 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 7af6a1=
34508cd1c7f75c6e3441ce436f220f30a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1349:1: warning: stack fr=
ame size of 1040 bytes in function 'gf100_gr_trap_intr' [-Wframe-larger-tha=
n=3D]
   gf100_gr_trap_intr(struct gf100_gr *gr)
   ^
   1 warning generated.


vim +/gf100_gr_trap_intr +1349 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100=
.c

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1347  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1348  static void
bfee3f3d97db88b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20 @1349  gf100_gr_trap_intr(struct gf100_gr *gr)
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1350  {
109c2f2f1c42c16 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1351  	struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
109c2f2f1c42c16 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1352  	struct nvkm_device *device =3D subdev->device;
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1353  	char error[128];
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1354  	u32 trap =3D nvkm_rd32(device, 0x400108);
109c2f2f1c42c16 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1355  	int rop, gpc;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1356  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1357  	if (trap & 0x00000001) {
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1358  		u32 stat =3D nvkm_rd32(device, 0x404000);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1359  =

caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1360  		nvkm_snprintbf(error, sizeof(error), gf100_dispatch_e=
rror,
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1361  			       stat & 0x3fffffff);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1362  		nvkm_error(subdev, "DISPATCH %08x [%s]\n", stat, erro=
r);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1363  		nvkm_wr32(device, 0x404000, 0xc0000000);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1364  		nvkm_wr32(device, 0x400108, 0x00000001);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1365  		trap &=3D ~0x00000001;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1366  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1367  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1368  	if (trap & 0x00000002) {
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1369  		u32 stat =3D nvkm_rd32(device, 0x404600);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1370  =

caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1371  		nvkm_snprintbf(error, sizeof(error), gf100_m2mf_error,
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1372  			       stat & 0x3fffffff);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1373  		nvkm_error(subdev, "M2MF %08x [%s]\n", stat, error);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1374  =

276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1375  		nvkm_wr32(device, 0x404600, 0xc0000000);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1376  		nvkm_wr32(device, 0x400108, 0x00000002);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1377  		trap &=3D ~0x00000002;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1378  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1379  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1380  	if (trap & 0x00000008) {
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1381  		u32 stat =3D nvkm_rd32(device, 0x408030);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1382  =

1894054dc1b6e43 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2016-12-22  1383  		nvkm_snprintbf(error, sizeof(error), gf100_ccache_err=
or,
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1384  			       stat & 0x3fffffff);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1385  		nvkm_error(subdev, "CCACHE %08x [%s]\n", stat, error);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1386  		nvkm_wr32(device, 0x408030, 0xc0000000);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1387  		nvkm_wr32(device, 0x400108, 0x00000008);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1388  		trap &=3D ~0x00000008;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1389  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1390  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1391  	if (trap & 0x00000010) {
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1392  		u32 stat =3D nvkm_rd32(device, 0x405840);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1393  		nvkm_error(subdev, "SHADER %08x, sph: 0x%06x, stage: =
0x%02x\n",
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1394  			   stat, stat & 0xffffff, (stat >> 24) & 0x3f);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1395  		nvkm_wr32(device, 0x405840, 0xc0000000);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1396  		nvkm_wr32(device, 0x400108, 0x00000010);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1397  		trap &=3D ~0x00000010;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1398  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1399  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1400  	if (trap & 0x00000040) {
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1401  		u32 stat =3D nvkm_rd32(device, 0x40601c);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1402  =

caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1403  		nvkm_snprintbf(error, sizeof(error), gf100_unk6_error,
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1404  			       stat & 0x3fffffff);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1405  		nvkm_error(subdev, "UNK6 %08x [%s]\n", stat, error);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1406  =

276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1407  		nvkm_wr32(device, 0x40601c, 0xc0000000);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1408  		nvkm_wr32(device, 0x400108, 0x00000040);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1409  		trap &=3D ~0x00000040;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1410  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1411  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1412  	if (trap & 0x00000080) {
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1413  		u32 stat =3D nvkm_rd32(device, 0x404490);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1414  		u32 pc =3D nvkm_rd32(device, 0x404494);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1415  		u32 op =3D nvkm_rd32(device, 0x40449c);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1416  =

caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1417  		nvkm_snprintbf(error, sizeof(error), gf100_macro_erro=
r,
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1418  			       stat & 0x1fffffff);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1419  		nvkm_error(subdev, "MACRO %08x [%s], pc: 0x%03x%s, op=
: 0x%08x\n",
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1420  			   stat, error, pc & 0x7ff,
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1421  			   (pc & 0x10000000) ? "" : " (invalid)",
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1422  			   op);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1423  =

276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1424  		nvkm_wr32(device, 0x404490, 0xc0000000);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1425  		nvkm_wr32(device, 0x400108, 0x00000080);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1426  		trap &=3D ~0x00000080;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1427  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1428  =

30f4e0870d1726f drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2013-06-09  1429  	if (trap & 0x00000100) {
109c2f2f1c42c16 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1430  		u32 stat =3D nvkm_rd32(device, 0x407020) & 0x3fffffff;
30f4e0870d1726f drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2013-06-09  1431  =

caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1432  		nvkm_snprintbf(error, sizeof(error), gk104_sked_error=
, stat);
caf2be8a345f9ed drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ilia Mirki=
n 2016-01-02  1433  		nvkm_error(subdev, "SKED: %08x [%s]\n", stat, error);
30f4e0870d1726f drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2013-06-09  1434  =

109c2f2f1c42c16 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1435  		if (stat)
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1436  			nvkm_wr32(device, 0x407020, 0x40000000);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1437  		nvkm_wr32(device, 0x400108, 0x00000100);
30f4e0870d1726f drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2013-06-09  1438  		trap &=3D ~0x00000100;
30f4e0870d1726f drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2013-06-09  1439  	}
30f4e0870d1726f drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2013-06-09  1440  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1441  	if (trap & 0x01000000) {
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1442  		u32 stat =3D nvkm_rd32(device, 0x400118);
bfee3f3d97db88b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1443  		for (gpc =3D 0; stat && gpc < gr->gpc_nr; gpc++) {
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1444  			u32 mask =3D 0x00000001 << gpc;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1445  			if (stat & mask) {
bfee3f3d97db88b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1446  				gf100_gr_trap_gpc(gr, gpc);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1447  				nvkm_wr32(device, 0x400118, mask);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1448  				stat &=3D ~mask;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1449  			}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1450  		}
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1451  		nvkm_wr32(device, 0x400108, 0x01000000);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1452  		trap &=3D ~0x01000000;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1453  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1454  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1455  	if (trap & 0x02000000) {
bfee3f3d97db88b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1456  		for (rop =3D 0; rop < gr->rop_nr; rop++) {
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1457  			u32 statz =3D nvkm_rd32(device, ROP_UNIT(rop, 0x070)=
);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1458  			u32 statc =3D nvkm_rd32(device, ROP_UNIT(rop, 0x144)=
);
109c2f2f1c42c16 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1459  			nvkm_error(subdev, "ROP%d %08x %08x\n",
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1460  				 rop, statz, statc);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1461  			nvkm_wr32(device, ROP_UNIT(rop, 0x070), 0xc0000000);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1462  			nvkm_wr32(device, ROP_UNIT(rop, 0x144), 0xc0000000);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1463  		}
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1464  		nvkm_wr32(device, 0x400108, 0x02000000);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1465  		trap &=3D ~0x02000000;
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1466  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1467  =

f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1468  	if (trap) {
109c2f2f1c42c16 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1469  		nvkm_error(subdev, "TRAP UNHANDLED %08x\n", trap);
276836d46e535c8 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs=
  2015-08-20  1470  		nvkm_wr32(device, 0x400108, trap);
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1471  	}
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1472  }
f73221e4aa766a5 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs=
  2012-09-06  1473  =


:::::: The code at line 1349 was first introduced by commit
:::::: bfee3f3d97db88bfb732735eb4955ad3381ac758 drm/nouveau/gr: cosmetic ch=
anges

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4630960489481000905==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4630960489481000905==--

