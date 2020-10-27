Content-Type: multipart/mixed; boundary="===============5204045900386900362=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace the comparision method
Date: Tue, 27 Oct 2020 10:45:30 +0800
Message-ID: <202010271026.W21NUVEY-lkp@intel.com>
In-Reply-To: <20201026220920.41538-1-izabela.bakollari@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5204045900386900362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/izabela-bakollari-gmail-co=
m/staging-rtl8723bs-Replace-the-comparision-method/20201027-061116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
9ab476ba001ead1f64430a3a61c9466ac0fa91ed
config: powerpc64-randconfig-r001-20201026 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f2c25c=
70791de95d2466e09b5b58fc37f6ccd7a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1be7587c45233c40c20f755e8=
da6867c36dde9ca
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review izabela-bakollari-gmail-com/stagin=
g-rtl8723bs-Replace-the-comparision-method/20201027-061116
        git checkout 1be7587c45233c40c20f755e8da6867c36dde9ca
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/staging/rtl8723bs/core/rtw_ap.c:9:
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:21:
   In file included from drivers/staging/rtl8723bs/include/osdep_service.h:=
15:
   In file included from drivers/staging/rtl8723bs/include/osdep_service_li=
nux.h:19:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:30:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/staging/rtl8723bs/core/rtw_ap.c:9:
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:21:
   In file included from drivers/staging/rtl8723bs/include/osdep_service.h:=
15:
   In file included from drivers/staging/rtl8723bs/include/osdep_service_li=
nux.h:19:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:32:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/staging/rtl8723bs/core/rtw_ap.c:9:
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:21:
   In file included from drivers/staging/rtl8723bs/include/osdep_service.h:=
15:
   In file included from drivers/staging/rtl8723bs/include/osdep_service_li=
nux.h:19:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:34:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/staging/rtl8723bs/core/rtw_ap.c:9:
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:21:
   In file included from drivers/staging/rtl8723bs/include/osdep_service.h:=
15:
   In file included from drivers/staging/rtl8723bs/include/osdep_service_li=
nux.h:19:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:36:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/staging/rtl8723bs/core/rtw_ap.c:1457:5: error: expected '(' afte=
r 'if'
           if !(psetstakey_para) {
              ^
   12 warnings and 1 error generated.

vim +1457 drivers/staging/rtl8723bs/core/rtw_ap.c

  1442	=

  1443	u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info=
 *psta)
  1444	{
  1445		struct cmd_obj *ph2c;
  1446		struct set_stakey_parm	*psetstakey_para;
  1447		struct cmd_priv *pcmdpriv =3D &padapter->cmdpriv;
  1448		u8 res =3D _SUCCESS;
  1449	=

  1450		ph2c =3D rtw_zmalloc(sizeof(struct cmd_obj));
  1451		if (!ph2c) {
  1452			res =3D _FAIL;
  1453			goto exit;
  1454		}
  1455	=

  1456		psetstakey_para =3D rtw_zmalloc(sizeof(struct set_stakey_parm));
> 1457		if !(psetstakey_para) {
  1458			kfree(ph2c);
  1459			res =3D _FAIL;
  1460			goto exit;
  1461		}
  1462	=

  1463		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
  1464	=

  1465		psetstakey_para->algorithm =3D (u8)psta->dot118021XPrivacy;
  1466	=

  1467		memcpy(psetstakey_para->addr, psta->hwaddr, ETH_ALEN);
  1468	=

  1469		memcpy(psetstakey_para->key, &psta->dot118021x_UncstKey, 16);
  1470	=

  1471		res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);
  1472	=

  1473	exit:
  1474	=

  1475		return res;
  1476	}
  1477	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5204045900386900362==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICJhwl18AAy5jb25maWcAjDzdc9u2k+/9KzTpy+8e2thO4rR34weQBCVUJEEDoGT7BaPISuqr
beVkuW3++9sFvwByqSQz7Yi7ywWwWOwXlv75p59n7PW4f9ocH7abx8dvsy+7591hc9zdzz4/PO7+
Z5bIWSHNjCfC/ArE2cPz679vv+7/2R2+bmcffj0/+/Xsl8P2fLbcHZ53j7N4//z54csrcHjYP//0
80+xLFIxt3FsV1xpIQtr+I25erN93Dx/mf29O7wA3ez84lfgM/vPl4fjf799C/9/ejgc9oe3j49/
P9mvh/3/7rbH2eeL7cWH7cezj7+f3+9+/3B/8f7ycnf2+6cPnz789nn77uPny+32/uPm/X+9aUed
98NenbXALBnDgE5oG2esmF998wgBmGVJD3IU3evnF2fwz+OxYNoyndu5NNJ7KURYWZmyMiReFJko
eI8S6tqupVr2kKgSWWJEzq1hUcatlspjZRaKM5h2kUr4H5BofBW24efZ3O3r4+xld3z92m9MpOSS
Fxb2ReelN3AhjOXFyjIFghC5MFfvLoBLO2WZlwJGN1yb2cPL7Hl/RMad5GTMslZKb95QYMsqX0Zu
WVazzHj0C7bidslVwTM7vxPe9EhgwlNWZcbN3ePSghdSm4Ll/OrNf573z7teS/SaIZducfpWr0QZ
E+sqpRY3Nr+ueOVtkg/Fl2OT+ezWzMQL67A+y16WSmptc55LdWuZMSxekHSV5pmISBSr4HQS83UC
ZAqGdxQ4N5ZlrUaAcs1eXj+9fHs57p56jZjzgisRO93TC7nuFzrE2IyveEbjRfEHjw3uf6DMicyZ
GMC0yENAKlXMk0aZhX8kdcmU5khEj5rwqJqn2ol/93w/238erHL4kjtJq14wA3QMKruERRZGE8hc
aluVCTO8Fal5eAKLRknViHgJp4yD3LzzWki7uMPTlDtBdRsKwBLGkImg1LB+SyQZH3DqHxdivrCK
a7dAFQhkNMdOjxXneWmAlTNB3WRa+EpmVWGYuiV1sKGiTk3zfizh9VZScVm9NZuXv2ZHmM5sA1N7
OW6OL7PNdrt/fT4+PH/pZbcSCt4uK8tix6NWiW5kJ9oQTcyCYGILZsQqWCtFBftNrjjSCaxNxhyO
L5AbkghNsDbMaEowWgRy1qIzVonQaN6TkGezgz8gOydjFVczTalicWsB548Nj5bfgM5RG6hrYv/1
AQgX6Xg0Z4NAjUBVwim4USzm3fSaFYcrCZ1GJIoLb0CxrH+MIW6zfPACzAsejqfeQSHTFIybSM3V
xVmvwaIwS3BPKR/QnL+rRa23f+7uXx93h9nn3eb4eti9OHAzfQI7cP7A//ziNy8mmCtZldrfIvAQ
8ZxWxGzZvEA7GIeyOl4M9SkkKEWiT+FVkrNT+BTO+R1Xp0gSvhLxhBusKUC3J89SO0+u0tODgBMg
CdD9gwuBE0toOYgnXpYSdgINp5EqMAxOei5omRY0uJFUw/Bg8GJwCrSwFc/YLTE8biKIx0Uvygs5
3TPLgbGWFfhFL7JRSRsB9dzhPADoghgAUNldznrOALi5G7yc3Ul61oh6T3O90ybx2URSorHH35SY
YytL8ErijqOjd7spVc6KOJD3kEzDj6kIB4xAgmFvLMGkgDtmlmPIitbdjz9+kKyL4IJnsI4xL41L
YNBCeaFrmfYPtQ3tn3Mw5gIiN+Xxm3OTg6mzo6ij1p8ROF2wovb1vatwIWft20mPi/bKi1Br+1Xk
wo+4AyfKsxQEo+izGTEIutIqy4ix0goSOm+y+AimxBNJKYNFinnBstTTcLeMNFAhF3KlCeWLFmAH
fVImJEEmpK3UIE5gyUpo3sqXkhuwjphSwt+uJdLe5noMscEudVAnLDzlw9gCFKUdnJYy4MF0ZJLR
lgPVyEUHpGBcmI+upF+ExaEiFi+9yVNk+raI3eZ7tkFzL8R2FnUAg9d5knBvH91ZxONsu4i5V9j4
/CwwH849NjWDcnf4vD88bZ63uxn/e/cMoQwDxxljMAOhah+5DJk37vUH2XSRYF7zqAPSOjpurQ7k
tcxAUrwMbH/G6LxLZ1VE6Wgmo+H7IG815218Ryp2laaQUpcMyGDfIFcGHxQYB8Pz2m5BDi1SEQ8M
F4Q3qchapW9kE6b9HWkZX75vQ/HysN/uXl72B8gJvn7dH451gN5RokFfvtP2krL/HZ5bx3GYI5Ve
gNfThrDUJ0KCAT7PK0hKQGkXFC9EB6oG1M6S0luWlxOrSKRUEc8yX3pj0XRKlGj57sLTHMgZIjwW
RSKYtymX7yPh+4O8GpzFPGcQWhUYxxo4lewGCy0nCCB7Pv+NJmi1t2V0/vEH6JDfeXCENTd1lFUn
QpCEe2kmhyioRTkTYFOhNJylRVUsJ+icStNkCtN2ffXhvFszJEvxsk4CdFWWYXnLgeGNNGNzPcZj
tg7h1xjRquNizSExNoEaeSaNqex27DxZ0RQKZAUB/299wc+J0TuhLkSUuTAQCkOkaV0w6fsSV4Vx
mzGeWu2PAystIq7q6AQdvhaRn/A7kmahWIZQMuI6PB/g8FrTzeeTOMFifXVB45JTuBXgzoITxNbe
Yu9kAfbODzjLeV2zdGUjffW+MT+PmyPabc/6dAKVeVDSaWMMnUEwXJ9/KihcgoWfVxDD+0EIKyHW
ZIphhh+KQqZ1yIphNsQqQQEW8WAyII67gb0VLq5p6xez9LD7v9fd8/bb7GW7eaxLFn0AC4oPGdH1
VAZPvN0yFvePu9n94eHv3QFA3XAIHo6ARaDJEeoXPIjPuOdzze28JKMo0E2rTBxYxOFu+Y58/xWr
/i/+JBd39vzsjDTFgLr4cEYF9Xf23dnZoB4GXGjaq3d9Db4+gguFJaEgd2ZmAeaqytxpImcD2QHW
A8D+VBEETiaswvqHjhdOi5uK7UKaMhud3RGNgl8rT7GW/IbHg0ewkaMTjqFajSwrNceQ4NaL0rgL
E1gUZgceeFSh98rO4E9tUuV0LltUYbIfWB2e8di0i8shncoGswb7bADdiGFotFwRl0KLLONzlrWG
065YVvGrs38/3O829592u89n9b/QrdXTcAYwPLjvl871DCyf80ZN9aYzbc3FSQN+3wW+GG0NaV15
Gh2sM3FSJWDiz991XiFPnAnp03R+A5bFGgbxH8St3vVGY985Fad7xj84CJ5P0AUrsZyMZQMqpslB
lxO0eUaY8CIGURnnQeUAYFjdcHC6wJvbNVuiai3JnNMr4peN2R7yT1aY5ifjCs1gXt3bPTzOggO9
vgYlWYOK8BQCYYHRPBFaDzOE1j45AxW9vlAGC51LFsUkG/+VLoSRBdZ3wYPXl1J+4ACKJtMU4inQ
4e1Z+K8/+e4qC3ioU2Tl4lZDxN8TdgRB7bpimbgbGbngAnBz2P75cNxtsQ75y/3uK6wNciVPFIGB
CNPC2hJRMJ55VRAXRoqcDa2crFMU3ldcHWUH7nkOw5k/wE5ZSKN8+XZiv9VoklITeHxZmiETN1iv
MFUBwpoXWNaLsYg/MFOQbrsKsxGFjZo7wnZ6itPMBUgGo2xAmgFqtKQaOsVpavoNG7ywTQeFKIdP
q8Jdu1mulFTUNZwjC0pB/TWh47iAsGocn2IUhNFGYyoJNwV20Yj0tq1TDtjrHD1Fc/s7XBXGp5YV
SR39N/thWTmcZFiCGBYciFUtmErQYrmysAFRNBVHikkYJPdwrLs0E0N3ScmNUk/MWsFhL+Dl2hVj
fZxE48XJd0hqpyXuhr50zUCRMYVCQwNyM2KFDiXPR/tTb3p9hxHn5U28GMYsa86WGDtwLGCx+LoS
ih7OOVG8h22v+AmiJsf8IVqZJR49JV/NYyQ4gcLYKci1Rq9METpW8Bv7UtwBWAZXzg4Neo0ViLsB
mL6Y/A4Fnqih2VDX9U30JB84Om3wxGOs/XhaIpMqA4uA9gqruFh6JPjzG0g9wS64G3dUZuIEu9fh
GMo80LRe2EEt4lQhw6tREG97BYgpJj7JoD7hCIsVZGtgJf3iXYYZJ8ZRazj1HgL1S4u5rkB4hd/N
U4/RoNnATjbYdxcwB7c7hMDQK1sjwzQX7Y1fYdRtzjiP5eqXT5uX3f3srzog+XrYf34YZo5I1oQF
p+q8jqzxnE0puq/6nRppWBr8TkDQJRsQ8WNx33dJrtatcxz9fKCPQfrlQE3gPFnfbqiq4hRF60BO
cdAq7rqMJmrtLaWgLwobNKqAAk90igZLtWubC63rjoLmhhHCH1eZoSv5BRxWULrbPJLkRYRRIm+p
luHtgw+164UwPBPa73dq7QGknChsCb7P2zBUTv9xCTmzFmA0rsOCSXsdGek5CcxENIZj1jZXwtye
QFlzfgbxX3B5jQSYS9G77q6366yq9iX0FTOSrSM62a0HwapVSonbiQFrdyULWrcQXrfkQaoaq9uS
DKzLzeH4gGdlZr593QXJRJd8dbkPdeukE6m9PK0vWqUiAPdFmMGIwe6O6pK4ivzauSIhQ7BL2upm
MNl3KQRLgDeFrOsqeHuKwqDW0FMtbyFF9Xe4RUQpXQwLh+7snC7Ofa1v9kGXEI6jiRg5sK4Wygz4
r9iqfE1Y7DwXch0RCMjjrASzkbGyxJPMkgSPvnWnuadvmhxasfF/d9vX4+bT4861y87cBdTRy6Ii
UaS5CdOjzreNUfAQZlcNkY6VKM0IDGYn9vkq3kSonXCnJuhmn++e9odvs3zzvPmyeyKzQLrW02fL
TaEnZwWkntS1VlfsqUm8eKzFECBXM+G+y+1RK/gfRgnD4tGIYpgZMW3s3DeGbu+XWG/Ay9BQpZoF
Cy0zRuRPWDDGoVynbQFSGb05qguG8Ga6k+i2EUwOOoKnK4q6zCBQKU1tA8oKC+y+wg3CG5dRKI5H
Jgg3czFXbBgJQUg6ry8lPQYY++ApsWZ4yxVB2OMfmqX2NrldmdvEXBSOx9X7s98vu5KKf3m09F6N
ITcpYgbWxD+QMLswPY/9aAwehuWkDpTqEIh3XfrqY6/ed8iY9Ch3pZSUvt9FVdKXN+5cbARSe/J5
1jBXv6CL7i7hrm+jmoqCf+ZcFu62r81WqFIaVyg913roJfOQB0fgyhY5U1QCUBpeZxgsCCen7US/
ZX5De23fAAa6C74HzGhThnVWp9gd/9kf/oJYdGxuQE2XwOrJd6EIsYlg1DLBL3jNJ/gEpjLoD3Gw
4dt9e2ZGR2g3qcpd4k8Xx2FCS051cYlaEP1elXULUMwmyvBA0JVFlYT4WlFcS1sWfne+e7bJIi4H
gyEYbROttA2BYmqi6M8xAxenkHOFTQx5dUP1JTsKa6qiCL2Evi1AKeRScFra9YsrIyaxqaxO4fph
6QFwWyyj++odDoL2aaQoUaMndrtfrg9EhRuATFy24JB9lZTTCuooFFt/hwKxsC/aKEm3Z+Po8HN+
KhDtaOIq8isMrcVu8Vdvtq+fHrZvQu558kGTHX+ws5ehmq4uG13Hfie6l9MR1R2AGqu8yURKiKu/
PLW1lyf39pLY3HAOuSgvp7EDnfVRWpjRqgFmLxUle4cuEojnXDhhbks+ervWtBNTRUtTZs2nQRMn
wRE66U/jNZ9f2mz9vfEcGbiSeJpEldlpRnkJujN1tPHTJ6zbobeasDelKfGrLMi+Uy/rbN+FGMWV
bsAN5uWgHRBo6lLgVDPeNBKsTRJPTFtgp/WE/VUTDdaG/twIQmt/wvAIS52wzojMWEFvKiIjdXH5
23sSnV1MzDdSIplPtt06u6PZQKYIIpmtYHr2t7OL82uCYcLjwvn94LmxEl5pLQtCKXikOp2ZYdnS
57WykNRlPASLMknKwSOm+X4keXPxwfs6gJVREJksJMyRXOtlJtclK6hzzjlHIXx4H6TIHdQWWfPD
tRKD7haGTKy8V7Rsgqb2TLF4PASKc/oTgCSmGhmTQmMvvMSP9nr2EagTcxUNvxDYwmzkl589eMIC
e+hhCkr5PXyO0RPNcxjFD3ETI073B8qSFyu9FnT/x6oWtffJSAupXbsn7w6RSVliUZpi50oyFNcQ
0X4h9uTZNxdaDwfNS7KciHtf6IV37arV8NjWax60EgQU2TvQLI1em244uFbGO6r4ZHWe+NNzMHAG
k0MUsaZjwObTDmfxlaC/UfBoao9A+VlnVW5sVOlbGzamR9f+Q5naP4QZpCyz4+7lOKjWuyktzegj
sSZ1Gr05QPhZUG9dc8USV6trCozbv3bHmdrcP+yxkH/cb/ePQZGOgaGiZUIaoSjIsCJseOYJlXgA
yi+xuMckKO0DKNcp3p3RrxPtewBtr+tHtdTo8XV33O+Pf87ud38/bNtuNb+gZuwiFpHRKKBwFQCv
GPkFW41cwX+DV3K1oowrYsyyGSKA4QCOR9sSMjVhb3NS0DhV0lESIJdxTkwhFZFVzUVKA1oLvJ3V
BATrZR4UbzLDMqIDhd+/OZAub0dEwrPrcTpHV3LumR7nn85dY1keFL5aWjQPPJNYwFkzVUDYFWx/
RxZz7Bdo2titLCryq6yWGm8oYLXu+xHMlfk8iYix8Ra0aalxJK49hJxjndOU9NwataXPVLcAlbC2
7Hyack2fj0xEtXS/DSHW3TbAe+UkLo7zaaRZCgo5KIQ1gcL5KHQ4d9UgFY9JAYhFO0g0g14HD9vV
936E6urN08Pzy/Gwe7R/Hr2EsiOF2J3O7ToKtEjUjUSLH8UIPm/dltHCGmjwLtAVFYEsZPfnGsaz
gogpkppPtrr1k8hyPo5VOjRkLic+aOy3y3x/JBlHUwpgRaT1iVmU+kcmYZLsh+hqqbZf35yaMq4e
v/tw3Zau/cXrd1sLgBJvq3QpfMdeP488VwMWRVnRp7chmOiNRr//u3fG6ufRLVsDHlagmUh9T4TP
JyTn0MCJjrscttJBbhLzcmGn/lxEkdK+qNSQJQ/7yb11iJTKBdv03jM3DST8NDLBzz/C2j0EbDDT
LPMOZ8pEJlfhBSI3CyNl1ka9U/koHwRtSe2Qk2EEUcYxU8HnhmWcx4KNgpEy/mW7OdzPPh0e7r+4
i92+kfJh2zCeyWENu6p7PxY8K/3cNQDbkplF8EdKViYvwziphdkcTwq5K3A+ioRh3wt1BaDqEVOh
cnDEdTdj0konfTg8/bM57GaP+829+9Cg3YG1a9Hwp96B3LVDgt+/e1eWrr25HcRbU/+W66Dr5NFf
HlIEoAF1MzS54P6Vk70ZQOZUjQzJhyvvwh/muohX/j1qG6W5Jg8aN4B62+e+koFwiqzpN2i+UlyP
X8PoqnnX1hd9VL0WiZj7erMhrZvgO2/ufYXnmrsHPfIQIAXXpPWzFRdxz6KB6UzkkDONaLXfotnA
1ucjEN66j8fx/4pLz8+yVZ571ZscO/BBs5zapaEGITLlRVz7cHq7J45r1wNex+3e+c3ljfHLKVqg
VcQmdJSAn20vBILIUX3OnlmWYBexCZW69yv8yB6fIE1SeBP3FABz/EsULaLjXNMLlTY48lg4oiq6
IWjaJRmvPw4enI7hogedLl83h5fAqCItUx9dv0ooJEB43TsTHVFIJdPvEIAOuA+1CKpRY0w7QTfv
Cn7O8j12mNTfBJvD5vnl0f2Nslm2+TZaSZQt4WTqUBR1h8BgaXXLjaIrEqmhZFyk/p8XwCer1uGt
EP2iShMbvKt1mgQFUZ1PjOnki92Sg+kP77c9VNd5BCevrvu0rkOx/K2S+f9z9ixNjts83vdX+LSV
VH2zY8kv+bAHiZJtpvVqUbbluaicGU+mK/2q7s6Xyb9fgqQkkgLt3T2kJwZAiE8QBAHw8+bx/P5j
8vXHw+v4mC6GfUPNHvwtiRNiySiAQ5yZJZtUeWGtK4TflelRqNB5caUFQBDxbe8Et9pWkq8On2r4
K2y2SZEltYi9MliAzIrC/I4ro3G9az0HC4vMv8EGC7RGyAKzu+y6LG98ZYbZzrsGU288FnRUbwF1
1VYgA7uIdTdt0/MjQQrGjKfRRMhiK89Ih+FKEBaq1qH3NU3NtvD5a68DPp0dLMKIcSVKN/lcmf7S
q+r8+gpmPQUElytJdf4KweTWGilgc2lgbEplKdHX4O7EsvHEVWDlaOGUlx1ZgV+x6iRwyBGOOC5h
kIZ1122dU8iNZsq8SJfH75++vjx/nB+eL98mnNXYsGdUCCLuNmnIMOu7mMNkV/qzO38xmt2M1f7C
JftYKmtvNB1A9hKpYw51MBGy3octUu2H8cP7n5+K508Emu06bohWFWQ700yJBAKrcq69ZVqw4QCt
/3s+9PPtLpQman4SMD8KkM4MaC7BPAGco5WiWEIIF4lgic7AMmKtFoSEbz3YLY5cbkdR4hqXyLxu
kdvM+e/PfBs/Pz5eHkXzJt/liuN98fby+DjqZcEwTiCsyxxqDdHGNYLLGkoQMKwKBAyLAXIWoQ0i
/HSSO3Jc9URhFbJw7EmcPbx/RZoEfyBJIva5mLK7Iic76pKqoFGL3u88VgnhM+sPPpfGAff6qOj+
X1iZ/h4D5p3gnJYgP/5T/uvz03M2eZKOY6h2IMjM3r0X7pSdgtB/4jbjUYMLi7MCCvPwXPgUcCV8
pFHsI8ybAzC7Ez+aGgeguNYDGzc6K67I7nNaO5Kjcix4zdZGqBcHSn8/FHVXRL8ZgPiUhxk1KtA5
LBsw44hVbEw3vQJihfhJ4AAKnu6GKxFw62vApHf0yayIcKWUBl9S7JIqybUvyJAeyLihwulEMJiZ
msMFaEtimGh6aLuhG8wgp1GwvcieiZUPmyBYrXGPno7G8wNMp1GRCtp1mApdyPdpCj/cmLbLTDuK
xiQxVyWsitIYFx9f8K2p+xhcNI+rAFDhZivTbwY2XtwXFKIsEpURVxG2T/Tti8zMbwqM11M0Fe5K
SXzQfGQNsDrjM17P4dBsEBwRw0433epQTFIwGLpv26P0Dmup1VC5px6yZMLGSZEA3jqMqAIng/3x
C2GdZy/1x1aIMF74i6aNy0LbsDSgaabREWCTGcwn+yw7KTkwHDAJW898Np9i5xW+e6UF28NVG5cN
lJjmqbCM2TqY+iHqaEBZ6q+n05nh2yJgPp4DhOvWjAvituZECzQZSEcR7bzVaqpZZRRcVGg9bTTn
howsZwtf6wPmLQPtN4hY3i6+y5UzlahQbyLDp28DubWalsWbROv48lBCfiBtQftKnMndNinhaIEk
1pIYPmd93ClrwC+wQZJYSJdBTkNtFDgLm2WwWozg6xlplprltoM2zXwM5mfENljvyoQ1I0ZJ4k2n
c32PthoqsyFffp7fJxTu9/56EvnY3n+c37gO+wHmF6CbPIJO8Y0vgIdX+F+9g2o42aFL6P/Bdzzj
UspmsFSuTktBxBfaSDKEjx+Xt/NkU27DyffOnvzt5e9nsClPnoSpafILZPh5eLvwuvrkV21pg2Nh
COfWMu2OEvT5g2u5fE/nes7b5VEk4B/pZwcuyqUNcgDog3CNiTazyK5A+9UQRP1qEgHE+j2//KFy
N13O71wpvPBzz8tXMRjCqPb54dsF/vuvt/cPcTD8cXl8/fzw/P1l8vI8gf1NaG6auOMwkN8lxfYT
QDKOxSQOR2213UT+BlZGhRVMt1ZrzAm6iwlEf5Er8im4ggcVOf+A2U8ip3FLCyOhKMDBFaPd9CER
0CNwduZsuwH7/Ptff3x/+Kn3Ufel/vyhSkMEZ3cmRJJoMQpxW5qpPaTQGbWe+RioNLsilDFimgXE
qrT4rPre5OOfVz7h+Yr781+Tj/Pr5V8TEn/iEuHXcfWZcRIku0pCUb+droimzvcFtghMz6wm6tzv
ZmZb5UE7tLJUCkxabLdWTI1JwAh4EcK1y0gsiC6pOylkGDdkUbjegJ53c9+QMYWOp+KvHD6zqQwe
kRgPq4CnNOL/GKbioQjur9sTwMMJjryJkqYq+/oMVgurJ/7D7OJj93SApiYAxnIGN3DC9i88N62G
7zdsR2Kr1RKIntU7PNcsc9ZTuJoHhPGR8KrpzGwKI05arpYytOholo1mG/1CyzYpS2/pHHCgYHD/
SHT/SrlGhVuB3TSp6LoHNd6h4h8TI/2WVeuNAUUbZoWhGMq8pIOsdKroIg0AXjtAl+ZMk2toMPlM
/n74+MGxz5/YZjN55tvNvy+TB8jw+v381VAgBLdwR+i1IRZ4khxCvRcF8L6o6L2zEfBxxFQQj/cX
HZbJFOIyFY1hfYhbuCELUftrLES2pvsqiDeGjInmi6VhOIpVmEhYO/yqYnlYxcOIotHpyz4wZl3S
pHFPxMYqjDOny5JgstFtbx2xum/Lwjzc8oMe/DA8tyw6mbVn5N8F/CkYmijTvao5uIS8EawW+cTk
nNfruwePNlqiwVMcLY7SVpEuSRvamxxf76i4+zpQyFeBx3ICa+E482RDuFi+tz54rCifXI5R4vgk
YgYfrolaHIjDn4SjMgor26KHFxHAgUNEyuPlYCIaX/2SVObo9pMSh7b3qQPB7B4fUDtHzKWYJHgW
fkDtWW18SzruGLNnk4Z3ycmggpzMNQaS2ZpPbcW3L+HLxqg5FRXZRs+UBjNHOOQjfS1GGNMP4kzL
wKGVk9aIUXr3bsHD4qgLSAYpnEhMq2hIIG9mVvABjmrMl/xI83gT6nuidFSzDQe5uwYQnoR8W4DB
fOEQwplDW5DOdGN+Al47BJtA7hhm/xUo5dc3XPx8vD38/hccsBjfkL7+mIRaFh3jckvtrv/bIv1J
G/J+GfZa6EE+E+Oi4ifIkIh1vjM6TJ4ra4Z1sl46C7/oNkgddb/nSjENcaTuEKzD91woGHFgEtLm
URCgWVu1wlFVhDExbaDRHLeJRCQDlyaHL5xIkG77Yo8/qC5orFmOhT8ZhQ50n6GtJyKDgtH8bZLR
nPZDiAshCzFmnHyBax2dr4S0ecnUDgjRYa3dI2NOkLQE3h0wGg2JLst7vt87VEXAN1sQAE6SLQ3z
DaqzaB/fFsXWeKlqQO324TGhKIoG/qJpcBT4CKCYLKwOXQb3bmgPdu2RYrxMmBeNUS5t2NH9IgZH
b443uFJSmUecOxYEcx/lB6iFdwXFv4j6EpnfK0YzJid+8NsSN75yZOPPOfbGEhWcWZLhI5WHtRuX
1FWRFxk+/Llh7OELptkm/7eJHczWRp5ovuIK9MW0oUiZ5AxS3KE14tIvhVg7nec9CVfT6dRpK+zw
duiRRgAWU1eYdJXdbGXFOwJO71iNK4gQrFAUCzO2N2OeWbONEsf1iF4y0dNs6ogiDSuu/FT4gLKC
gL9Yg29arBYTyahPnQkN42aFTnlRspPpKMvP5E26tfp1XPZADdnMf7YQnkRojSmAWsEj/WJl85CQ
9rhwpTTvCWa31pS8TdCZq/uFsKHuyaJo0rStbRpFUe5OkJptOKsfOUT/TAovK1Z0C8cnjkJYbCjk
uodiStvJKJ0AqdtzJ8xim9mAi+GEg36p0zbUxzqovKKNFHTY/ZWm4GDGlYPF3JtPR8VItmqaxl0q
mAeBZ1YBoCtZxgDKaE+riwnlKkVof1apBY7PxlyfUE0x7spIme6ZsyvTpnbwE3ti2xzDk1nnFEyg
tTf1PGIi1FZpV6ADe9Ot40tyW7OYdVuPC1x7ow91e4rjMzLHeWh9KKyD6cwalvuOi86+SkAZvnMw
VwJ1VIjL0q4VuIqZMeJgyXVPb9po+QRAFeezhRJmVjcug1ng+2NgTQLPQ2jngV1PAV6uXFNLYNcm
pwMcGVliApU02fL17Vfw1x4gPs5c+1ivF+hbAKBYqRf9dAsXXLHrd1TFRgB1w5QsB4EPJjCidRRa
7mYCTsD2QnGJJyiUfm6ys9y3ALSjYGIH2Wkh+MhCYCO1eRSkToSNyKwRLe/nU2/tqg5HB9PlvBeg
oIJmfz1+PLw+Xn6anlCqv+CFEbs3JBRrRofqMr40en4GkyKDDGLb3oOfMGdkNce1Df+j3ygi9ENP
lK5kJGXpeCDRKiCqtHt5//j0/vDtMtmzqL9PAqrL5Rs8Q/7yJjBdJH347fz6cXkb33QdU/3hpT40
+qinAgaa/tgaZ1xEGPu7jnXYR02azJHWRqfq9i3MeKKREcpI4aqNkO83GIg3M5ju7Aw2etN7WEL6
aC1MgVjMR+kmACa9SoYhlqDe+Uvd/9/qC7W/3KZLYhry0blN2O0xNymr0BE8aBDJfUO7LK2PQaA3
3KBG7UU6hXlHQo7wZPyNIjU1J4HnLzA3HUA0jVkzL2iwgNhjKryAn8zf9oh2UNdhX6/jl1Mc4neY
OpXQ7pI8x+8Xh9jlI6PY4hC50490QzvhlTyLPKbHB4j7/WWcQOPXyceL8EX4+NFRjYTcUZcRuzjV
9gH4Bc7KYwgcUCyoXK1a9wnoBr/1EjhLKOoomWbIsLzs4WFgjsNtRynBJh4kKBI2J50Z5w2X1Sgf
LYeQspeiZNKgiw+SSMCHxOxSFmPW4vxgnK35z7aM0rvRpkCfX//6cPo0iJhtzaECfsr4br0GArrZ
gG9r6goUlUSQCMaV+UZSyGytd5kjG6gkykJ+sGpsoj4C7RFe6u5vKo3zkyoPVvbr9fitOF0nSA63
8NaVm9bdrggGWfIuOUWFFTjdwfheWi4WQYAbsEwiTGkaSOq7CP/CPT/FLPBTt0Gzuknjew57WE8T
q+RK1TLA0+r0lOndXYRn1OpJ7PwBOIWYg47kXD1hTcLl3MOdl3WiYO7dGAo5VW+0LQtm/uw2zewG
DZfDq9lifYOI4At0ICgrz3dYSDuaPDnWjufdehpI8AUb3Y3PKePZDaK6OIbHEBeuA9U+vzlJWJ2V
uKW5J6H3bOnfGLKCyx786mSYHpnf1sWe7KwEtmPKpr5ZbRKWntfcqFREcL1wGNoaMtFT7HCnCUbt
jAk/25L5CKgNU/1NkAEenWIMnBZbyv8tSwzJTnlYwhEeQ5JTacZbDCiRl1k8YmdcKfT4JAXFiDgc
MIbPJ6D1U1wH0L4mRpNiRuSBaFMQ0GzNC0OJvhIwLglk8kT4yhUiML+tV/jkkxTkFJYOVbCQj9dw
1dFytrVIDqxpmvAaE6e0VW3tRvTGhwY6OHpe3Y8hPS1+TpEkIhmrI/mzJICeZaRK7BRy5hrgCqfj
AoHORxdV8mR9fvsmHJPp52LSOSR2R3EVIKN+IpE6FoX42dJgOvdtIP+rfN6Hk75AcKXpDo0fkeiU
RsYillDQwC2QMlQ1JVOr3vqOuvjmONzsICvD/Mzx9LZkUhHB/WnEvYwszgZa7t56O/ay64a0DWGW
2B3UwdqccZ0IYd4TpHPdrxIb08H9G1GapZr54/x2/gpWk1GcSV0b1wMHrIMgh/o6aMtaT6UmYw+c
QBVv5C/6tP6pyG4M/m+QwqX3Ir68PZwfxwc1KZVkVBzRvRUUIvAXUxTYxgkXzCSsxYMutfnanE7n
LReLadgeQg6yHYE1sg3YVTC7gU7EQawwXqPQK2R4UmuIvBK3htpLDTq2gpfAsqQnQWuXNPyEHTsU
R50wZCU8q3BwZEg0WsxSV2fEx5sfqmo/CHCVQJFBog/EI1OGXL08fwI2HCLmhTAGIuEzihXXLWeu
yziD5GqFoE9SWmPmMEVhZlPUgNrI21wZ3dCDw9FVUtxfxTJC8sZhSO0ovCVlK4cCpoiUcPytDrfO
K2qT9BYZ3TTLxnGGUiRKYnOBffObFb6tKbR4jrW8xURQ0XyTJs0tUgIX1CLTE91SwkURbrLperis
rKXVR+UbYsuaGRmpK5k5DpkX8sXYPA5t1ooMHimW75XvDiI5CdmFjpS57ZbhurUIPHX5uolcSXx6
5rjasjuQdh9HmCeqaoF4A2w/FqsinhRazr9sb3gcBA63eY1/VKDQRFllCUG3emZlGcepFh6uMvHj
BFdk8jh1ZnDPInV3Je3mG9x3dXdUDyJq5r8OJDLL840eYqcRbBTOZ55hIexRYwf9EQnh/ZhvMb4N
LXfSaVeheDOM8G3++84AiLcSjYtOeE/ClZiMd9uW7BLwm4b2GY6khP9X4jOOr/j05MqGNdY/9MrI
zqz2rBYxHjLB29hGxRX2sSVQD4LlP1pxooQ0AkZsiU+u5UoRaHgpFk2vCFh5OSfv8oZrPFElkfsD
qxeXbJFUDjnvNE3ybWJWdXy3N0CN28AOnNZkPpsux4iShOvF3HMhfo4R8krQAmZpQ8o01u//rrbW
7EGVvg/0O0cvskxeDPfDGT7+8fL28PHj6d3quXRbwINSTzawJBsMGBpBkCbj/mO95gyp2YYBG+bW
P+8fl6fJ75C4TaW0+eXp5f3j8Z/J5en3yze4i/ysqD5xLQXi9X41jLgwjeDe1ZExFPBxAvmLRTZG
807GQrI01LMvWFgsqAlIkiw5YAcVwI1nmpibemKCorIXTYa+SwGYQtjQTIZ8IJAQKcBUd7PGriyj
Gd/aHOyVe1R38fOTi45nvt1y1Gc+i/gQndUtMOKMJKoiUzk4l3sdFqzlcnMkZYqPH3Kqq+9o00H3
5nZOKGO+1/vI7AdkWAVIXZ8ixCIBH2QTsbuvS6LrcFAdSGCJ3CBxiW1d5GrlZtioMTN0V94N4+E9
gOszyumwZAhpLekkO7/DCA+xX+ObCRFPKZRWzeMNYI2MteRC13g9D2Cdk4lV2WhfgxqQos49HI+4
jcs2dqsSVyMh70xTtqCZWg6kGoW5NgGSZqtpm6alWXWp5kYmKQCtq1wAF3yS09zhx8TxnbOTk4Af
LgLKllPU8gF4cbyxPwuZlBwFGuFZa9HLhe4o8eWU32dlu71HJleYjfN1iFmj7VjjYGio4bCXA32p
3lNQ082M2S3FNML1AjFM6m0PsUrNYanTZOk3U7vaYlE7uA1ZfbQiGTZpdkxL8bETsbGD2iNtf4xa
ibIG8OMDJE3QGwosQANynEfYqKfLuuR8Xr7+aZzNO6ehEVJjRnM4IWAGL74IjFeFFUA83CniuVKa
cTm48PyOoth0ZyyrCK3ubU94Kemc5mGxGY6ehdGRROb+MUsAsD1g/hkCrRLwmhXs8u4+GUBxSzYd
1EyZ4Orp/PrK9Q5RbWSrEyVX80b6eblqoSSkWYlOnpm1iI/ykSMdtqnhn6k3HbW+yy98Jb5W0lX2
UViAd+kRPwELLNzMkANuHJA9FgVLtsJtH3I4wyxcxD6fc0WEPx8oyWiBCaBuRhDdE0oAjyRez+aN
BR17dMvOh4Ba++bEfFcTG+ReLRXQy8/X8/M3bPCRi3cTndsTbXtsOyV/PP9wo85A4Dt7Shw1TC1P
h8OSvFpUz+2joJtgsbJ7uS4p8QP1hLimpljdJNfQJh53n9E7Ff1SWKFbAI9iXh8vO2JiX87Ncrae
z0ZtTctgtVjiLgN9H66WaJ4jOd1SP1BHMAMMt8PW+q1LxhkFy1H/cLDvBRh47fk2+D5rguWoHXsS
efNrc+GYBTPPORU4dr02sgMhI9FvwDcmOJdu3hK/Vuy6dOat3ZWR89qzpS2ZzYJgavVpSVmhpxqR
67oKeWeMB1umCceNg+Nm2ct2u+W7QOjIBC7Zk7u9tnZFVnXRO96nvx/UqQPRWY5e/0oX8+cBpr3p
JN7RUMkGlHOnHEjYlqLNRyqoV5w9no3UP5yhOursksqujcQwfjTAGyLx0NTpQnPzNRCB3osGAvw9
Y1DgHEW9meGLaRTG3XAMGtN7BqEIpgu0vVB4hjqKGhSes3azW1+ezxy9spg2eGesgileYhV4eIkg
mc5dGG+lywdzZvSW3+Ionj9gehS0BrSUPxsD/1uHphVap0lr4q8X+JWxTpfVyxk6kjrR8C0EqbSI
KzgJKjbauxpVIhLemG9sKWoUB5kFMwP1ZH4QnqpKT3Y1JNR+oaaEiCbAG/NTiP0WFswec2ZV+FE5
8VCFgCKF4NwBwWigyUyXhsU8CuFMfmpDUgfr+QILQulIyNGfelrGuw4O83M5xZjKKX2FZT+18aKY
ZO0IWGS4onZN5GDMSUclM2F6Zo6OU3TvQ/TaMDAWQlnAR1Xs0LsYU7tsqrhu93zE+TgpD12Ljm+i
3mo6R/tR4a51hyDxPa0VXY9wTLCezsYIUKX8FdaJDuvqwFH0JsKxni0XHloFb75YrYa+7zAyTU+h
SJaL5ZikU+iwikrcGpMcHQnv/7m3aMZ8BWKNsgWUv1jd4LqaLVCuC/k5jOuCjwQqDHWadXCdhmXR
bL66SqJUVJyomzLbcL9NpIieY8frjq6qF9PZbNzUquYCA+mCPWHedOojfROv1/9D2ZU0yW0j67/S
p3d7MdyXF+EDiksVXNxEsKrYfWFo5LatGFvtkOUX438/SIALACbYmoPsrvyS2JcEkEuqh8ztm3CI
3GS/cilPenWLqbkLSYYoljgzYQlhpT2MzhDfPwYR6xxbIxamoi54aRtQsZk3DOnKZqrZD47J3Jb7
AoDzGFBIAxtgPfbhwrFY9JxbcMpXdNODMvxyE/uiJLSX8XoOaqF+IEI/CddBWGG+O0mttPtqAwy3
vtN89YvAeEEgdNLMhbZBXtzLvviA8ey67lYR3fnzAonwSJtsRSAQb6sUc6HsvPmvQNM+yHN7wzR7
Vh75Hi7d6BUNDIIcyQL0o8XLL09tG1IrvPjfEwL94+O3T7/+9PbLU/f19dvn31/f/vr2dH77/9ev
X950m5v5464v5pShxZHMdQYIE6uJHxa2pm1RacTC3gmHvbvmVtnUAdrN/n31GttsJVhbDlsP/o6S
lZy0G0qSOpG/cllP17vE66IpPfdUZwg2i2R7YNbQ2QMvlPYgpivIdh0930+ghdzmjLxaPGbKH0c1
XZZepLJkjPwRKzhv1Btaaj7ir7w0OaohzUc78VxAFSmbnfj6yhg9aSp97KRdzXOmOeyaRSQ5ZTVB
0gGy/mt2salG5xVkJiKhGMQlT3CckdWNBTXuWyVmvsdtCg0///Xlk4iGZTMOrsvcUIIDyiKYK90D
VDCLFU9eWatHrVjBS5XlFv3rMpe65A5qyyjg5Xpul/bYec5oV+0uwRglL3qLAnmZizkYelZfLwtL
hIZOWkDfLBenuhbbJYDPXPB+tP2VTWeGWrhDuTPXH8dRb+iZqHt8VwHjcCCgzos81HCdgxcaBXwy
gDGGprkEvk8Joxkmy8J30jbFzOpa1HytsHySJF2dOI5ebkkMjcrsBPSZukjeO6p6K7pRU39H5RKv
mSw/7EdmopyWxvrIX9fcjbV4EQo3nc6YCZKWHixUZlt1WclPv+i1zXwbayiMiIQM4VfQrol64SVI
cjE1s2Q0iKPR6hZQcIjIh6KHVUUrge2uqgW1Dh1XbwBBMq5qBP36nPB+1RTuyWkM55raijRfhcvr
46H+/Onr2+tvr5++fX378vnTn0/SkIouVpbKBr0t3MCyn+LL3e33p6mVa7ni0Zp4gHdq3w/HaWB8
V7RN7vU5Qf+0qm8bDU5NrqMf3uQbgIuvLBKMbYvo/v1gpXpubI4VKA0/kfvW1Ojy+IGmlyBU+Rqh
5zLTzRUcY9mteWAQH/vILKlqPzRnyfrwoe4e62vQnrgf/wugRUAVE54FceUFOvFRh67jmcMDqJbe
k3CSpvgxeYWxl78Z9NULl422L7HyXqPPtNLW3csLqBpOW9zTd0dzVzopql1nkuumrmVoE0E28e4M
B6hWudpZSebt5QZIZ1b3thrIucAYQBf3JvXC2a1W/ahsPKt3W5Vrq/nKx7evcxLhL9IaV427xdx4
QLBKohDP5uA6VGHKQz9NLAnMY7fKW+xuZc/I5QG4JsbaRhXGdqCx+Sn9tZOTNMxzj5tHsLhYwiVp
Qj9Ub34MLEkcPFvrg9fGIsWj72K6h+j7zcZGWZX6jqWHORh5sXvcw3xdi/wRqyjsJ7GLJy0wTHxV
WZJYl+Z0LMQi0hgstrFbDZmP+wDQeaI4wmq2lwV1LExsnxnCooYlUZDixRVgdNyTOznSgNRQRAYU
+/bSHtUktUwdgSaoyp7J5OHJzwcHfRfV8TjBS82hJMXrmnUub30c68LAxcvSJUmY2pAIHfl19yFO
PbyfuRSPrxnygc/SohxD7TN1lsiapXpw2BBQeQnw8WhbMrvy9gJhl1Dszpe1yLKwCRB96TJ4UlsC
D9zkY+PoCetORd8/g+LjZs4MYUEMHdT9p/p5RQHWU8seGoLEQbvSPBGpSH33LBVcjiLv1JJVZ/D8
edySjCflRAQrAocSL7AsrAKMcTuvjYuLv6Eb+e+VdDksfAeb57+zvMmDgoc26nLGsGO6dpGBumgI
aoNJnkZsmEXCkWiAya8Gk6YUpYiFoKWKAbNgjSOGGN1nNnE4KzJjjQVK0w60pOrjpfCDJjCQvwyT
OpHIJfY9fDjc4BbzVrEiAU4rS09owy4khwAzFjZZirkEuwvE89ePf/wK5+SdunWu2oHwH1yOBDXn
E8WoagAqoObdRG7jYpilXZT3S5QPVlSlJcwqMF1rNpsl6RkCvTwtkJ6rSJfnXUMc5rZrq/b8zDtZ
DToEfOUJNH+RN50NBJdYpKra7Ae+aOzhqiDCPykT2k1m/cAIbuLNnh/56pubKdMiR3Dauagnca2M
VBDqbsNYdinW4NZwBn/98untp9evT3MEt1cZ4ftPrYdn87nYcbSpviCMVjb9vYUFDCQGLtKnFrPx
HZ95l6rogdpKLKP29fXeAYJolJYPcc2KTGVVOe/nojareedtaumdPiM9PHVc8toY9AKp7jnTyR1p
hNP4JczEH799/Pup+/jl9TejyIKRH9BE/BDGB2FVIClNhN3Y9OI4fDDXYRdOzcBPR+mupyTzqS34
8QUkUy9OcdVsnXm4u477uNVTU2HxqzZmS0XnG0a8NEVFczJdcz8cXPRidGMtCzrSZrry0ky09k5E
lTU1tmd4BC6fndjxgpx6EfGdHGOl4A/gyv+X8uUVL9/KQtMkcbELK4W3adoKDDKdOH3JCJ7gjznl
Zx9etLpwQlzO2Jgh7lFOWQeP/9fcSePcCfBk+UKTQ0Gr4cqTvfhuEGGhC9APeDEuuZt4Kdp50kfW
VOWp1A3ap8TBk+OHHxxLGwLDmR/ocBdiG18Du2OVOEFyqVz8BK4wt3fwHSrHOnqTgPKmjmuZFzV4
KQf7WFI6YfwoUIecG3tb0boYpyrL4c/mxodmi7VO21MGKkaXqR3gRiglKBfL4R8f2oMXJvEU+gM6
lfh/CWsbmk33++g6peMHjYP2ikVax1mfc8rnd19HsZu677AkniXDtjm1U3/iQzv3UY5lKLEod6Pc
wbthYyr8C8FER5Q38n90Rl2B28JX43exKHeSEGfiP/mxoSjRQMr4Z4TYalfQazsF/uNeumgUsI2T
i0TdVH3gQ6J32ei4lgQlG3P8+B7nj/fKuHAH/uBWhYP2NaMQz4NPBTbE8few2FpdZUpSzM5CYW4b
UAEdAy8g1w7Nc+YIo5Bcd9uz5Bm6lgsPjpcMfMYdN8XMGvj1UBC0koKjO7suOpiH/lY9zzttPD0+
jGd0YsuQb+0IMyf1UnSJ5UtHV/CRM3adE4aZF3uqkGLIB+rnp57m6oW3sm8viCZibK9bp6+ff/rF
FJBEpMycUbNtswvvR7jVBwHQ4ghSSKnzTsVJjdCptHRAxVODxaQa0sjdjWuQIngSueWYIs4S4IDq
QjsuVQ95N8Jd1rmYTkno3P2pxL0XwXfNo1rPIZaygfjZDY0fRLte7wnE9GVJ5O3kjhUyd0guGPN/
lH+zA2jqeOOe6PmBSRTvs3OPGo0FkQXBpiKLfN5urmOJMy5YW3ahJzKJu9kYVW5A2HbihoFjKqoI
W6LXSUfjcJcJ37PKLrA8m80crIlC3pGJTSiFRLrc9ZimMw4I30TB8HDkf4yRH+yyV/EYd7etseUd
digi+T0OD+QYMd3qS94lYWCrw3aq0GeaJE/kcuLnZzz2lcpHPSb59HZY4KzIsBVnv1yoHxdDQ+70
bhZtJh/rU0Lj9Vl3xg02xRQfWYmFa4OrRsAvY+KHsSLVLwBI6p4X4oCv+k9RgUC9iF+AmvKdxP8w
7JEeXDepFw4LwLe6EEsKtkA/7HdrnfCkdyxn9rRoBnH/MH240f66Olcpv378/fXpn3/9/DN4TTBP
vOVpymrwcazsD5wmbp+eVZLy93wJIa4ktK8y/q+kVdXLiLY6kLXdM/+K7AB+yDwXJ36A0hD2zPC0
AEDTAkBNa21CKFXbF/TcTEWTU4JpaS85tqrH2BL8QpVcOi7ySVVZ4XSwe6nAR+bWiZwKljbzbQoz
SgCHcijYYMR13ffRr4svEcTImyfUluhs4Mj9TNDQ0fDR4ulYbzE3NzTJgCjUdlQKPdXTeRwCfgDU
Pp+fy42K1kucN1sxwVbbQ1dLyF1eAuhJMn7k8R1D+2FehdDhLZrs9PHTv377/Muv357+54mfv6we
5OFsllWEsV0AG0CqoHT4fukNjnLrLYCa8Wl/LlUVNUEf7n7ofNBuKYEuVxys2gvqe4750ZC3XoCZ
OwJ4P5+9wPeItvlWSqBztAeAgZ9B/Cgtzw42XObK8VFwLVVzHKDL9dTMjx9Zfb6Y4jZZ8zwxm1ix
8lg4rkPuhdjlzsay6u8gnxtPUztcxN57VIWyG2ygqSOzISSHF0YHz1OAMW45ppQ58h2CJyBA7Alc
YeE7v2oXtCGK2twO27+XbNhOI3jL6x56TlzhnmA2tlMeuQ4m0ykt02dj1jRY9rIL1hn8zjxdvr/T
vGiNBXaGhOyzjdP2rNUOfk/i7oWvzw2u16Hw2FZRhSWrboPnab54dw8fy2esvTXKiGPGj9WxnkLq
snpHmIpK2WsXIi2yNEx0el4T6eponw4rPiwTUKP/qFk9L5TZ2bTx4AJoyxi8dqAtuRRN1AtpRsAv
PVLr2eMNF6eaVu1cwGrCG530OfvB97QKyWeoqa34mmb4BYJy9G02oV5cAL0X/akFl+jCE6XRiLMO
mZacfA+aP7Mkmg38ME/gtlp/ChIZ7hxdyT65gYVEj3QVBLxWl40FmNtvMU2xFIVkaSxPyGYaSIAX
6REo/1/y10+f31QHPitN60CwCIb4SFULrzovxQ9RoI3NLjNqqeoZCkKbGRXmKYkS685EZ2TxLqMP
7h3b8ki3R8D1Csk6JE8OZC9TTmLPTesxhf0N4hFdrKz9EEZBiPBIcwa0ZjW99i0MtXZodfSU1cKG
Bc5ejwtlQ7WbGJuzP86060vFFWC292HH3rIn0X8idlr59fX1z08ff3t9yrrb6ggqe/v997cvCusc
Qwn55P8U66a5auBzjLAeqbTwRkYoDtQfGA7wA2hNR0tqzJIa63Ja4lAhi6BPoqUQNONnDMv8WRPA
a0frUZT1Nqqb2WF7q0lAf19o5LkO1qsyA9Rh3jKihut0GrI7y/dFY20JU6Eq7mpwbBVtSyxHQOQi
xwfqqbAtnBsrBM/tZr8Bptd/hbFpxTKEaQ0g3GzgM50LECfwQ1ZkV2Q5WAtqy1HWYuxvDQRmsTi2
2/EvOwJFXV3u+bmMnQlusOyi84J/kL60tJQ/Sn6K5SuIxVWg7dP17C38Nn9XIaF4ZdW2uXRMd1jA
vhgIbaZc6G43QzG+01fLHQNuKOF7T5zv6aOYDohvuP/iKzPv2WJRzhwcExdZ0EW1MA+38i1Lx65Z
xqHszqDtj82Dl5GfzUzxCiYt3OjNG97cOPKSeh/UQN30lm3axHJym24DrdAFAlA3Rt9ydJbRxZN2
4+gA0e0cdqhmdKGisWZTryGuqsNnItPlcQDihbkGrhPgdF0dTEECVIdTYQh1038FiVz8WUNlQb1f
bAyhr178KfQwxNqmysJI1bdbgFPuJTjAj4VZu6cv6ve7MmfMDyuLFqHOgx3NdQ6kKyQQ2gCkLTIW
eFXg4WXlUOharTp1vvfqBDy45yaNJz6ud+Dh1Q68CK114Knu7TQ6MhklHR/9M2Y6fFXQcUy+p618
17dEcFB4UNcbGkOKFTH0Kx+r7+g5sYeIeUIQR8a1FNARek2RppHvFdjZB9CCxa4fHFSHM3gB0hsF
S3wXGbJA95DpK+l4782YpffOQx0druygRQS+tB1sCvHzcpo4CVIigfAjDsEyFWDoHLWMYIliS8Kp
Z0P8GOnTBTFtk3U8xa7X9PI46NesTlI3AgM1EeBjQF1yLNz88ORGiYslBFCcpBZLRI0rRUb0DOCj
YAHR3RRAzbjBAOxJAmhL0nciZELOgK0rFtjiuFrh4q1I8OQBsRZZorYyh673bytgTVOAaJJ84qAT
tq/4popMfDjzYxMf6Db+AFn+2XmoQJ0PQei5JlzwtiM7X8Ebg3j6J/y/UmUc4ejLWSC2SJpWKZix
2vMdzMpL5YgwkW8G8B5YQLTvOBiEUYyWZyC451mVIUQXBAbaAOToVDsQ5oUhUhUBRBZAqj9gALbT
c0C3tVaB2B2xkgvIO96jOQ+XPXHFjpWH76KBiz03rBwlSZMY2WeH6u57DqEZJnQqIN6hKgM6HFYG
3x2RBW+DvRFrbBV+pwSC5Z0y2EuQZ6MbYL3KfOJ5cYEhUhKzICFSnVtOXB+TKoWttR9iQ2Q2wz7s
/kedhBZlGZUFdXCpMWBF4/QEaRhOj110WwXEOzqKAYNv/dTH3p9UBkyAAzq+OAjk+HQHLOhbn8YQ
2VJHvUQqDAl2kpV02648o8ebMtgiOcikFXQ8yxSXqATyTi3SGD08C+Sdzuay5740L5WfoALLi7ji
SaPOQ4+KIBjG4dFSJ8w50eG1N/TEWCJb2LuZpSG3JAyOxgtwJC5SNwHg9ZLQO8t8RyJ+pCPGAXgJ
wKXdR2lZS0ECXtrWWyccNksmZYtzT7qLwJFKr48787XYheZ7XYwL1SK+85+bH9WhL5rzgMcd5ow9
wTU6b5DRvjiQ9BaSQd5i/vH6CQL5wQeI7g18QQJrrGYBZ/0NX4IFCrGT7egNHtSs8KmorhQ3CQU4
u4AS/wFM+a8DvL2dLSE/AK5JRqrK/nnXtzm9Fs94IHWRgbAbtMMygLYV5717bpve5n0SWAow5MN1
owRcFVmLa8QI+MUWA10OlPpELSEaBV5alG0EWLU9bc2wSgrDnd5JleNexgDnJbNH3BYMz/ZmeZDK
9gAi8y4ewlLEXvznXrxlWxko+Pizo4Md+5GcLP7XAB0etLFFu5TN0jDKV4SDolXZgb9WwC3BciXW
tHdcW0TA7ZkergU1OdNMRBA/YKlAV+4AfxZe/6wMfSEnhj0FmvUtOJy0c8A7T38w9iFQNj0ef81g
H7xtb0RM1hcO0oAGMJ8h9o7oioFUz419Xe0gdmt2kEDFcwEbk8w+B7sebB2tMCP0qBqzUY8dh3jL
lTXIKnAMBbEvIRwtKgisWthrwAvQVQerTF/bO+kMNl+EHSzQrCb98GP7fJjFQA8mDF+FWHEw38BG
4WxvguECQUGlBo2V6QZSwNQxXI4XyyGldXuwJI20qe11eCn69rAFXp5zLgMcTEjGFy1wDHQ7WVlI
1RkZLO+liHyyhbTUxKk1QRGNk+Jxi3efrTo/CnGRl8A9QHvJ6AQ6zFwKlJrU29M84IgaAJD5Kgsu
pvHpAQy3SgTdw5sVGPifjc2zKuCkzy7ThbDpkuVG7uoXomGAJiKJbyLeSu9+/fvPz594E1cf/8YD
SjZtJ3Ics4LereUVznnvthoN5HJvzbKtjX9QDiMTkp/NoDNLDs/dkZeHlvcfe9BBX9Jnjlr1Y9k9
elA4KzDiaq+9fTidqja7IqRFqy9Rjg1wYrBG6IYvTW8O0kVtnf2D5f+Ar58ub39+O4wJCans9ESA
yHI+lPHKG94EOeHGuWnEW83R6dkHnoh6EgLihWFBFgCpB7VluLg6UNFW2+czzeacV0QIY98+f/oX
NjLXr28NI2UBIUVuFiX8mnGBXXaMBd+DuyK82/hN8YCpr6jvwC+pB741xEabpIdjDBEyiAjQrraX
YDj1oFPc8MMDxMWG8OjnYh8NEgS9nQaG+J40vuOFqrm1JDM/0pwZSypEFvENotDgUx8TNmpoUnev
8JLaO44buC5+qhcsReWGnuPjngAEh1CNd3ZpCzL+Er7h2IXfgkaBZ1QCiKn6drtSHdek7v1pCbKM
BIddJQl4DoJqlBQ8o2Jvkysa7krahc64K2gXhsKtWV2LcH5mLmHoYQ+vG7qvDpCjo0bukhB9zV3Q
RL3h2lpId/Gq0m274cqjuQMU1MXl50CGG9uly+UW1wuYk+Ah62S6qIWFgDaPnMY0yL1Ed/ggqzz4
IRoNRQ4a07OcoA4ZAQdTJrXKwlS+GehZHMTXU/DUzAXmQ/hvcxTvPTwLOlisRKk56ijz3bLy3dTs
gRmQjwHGuvQfxp5suW1c2V9R5WmmKrmRqNUPeYBISkLETSS12C8sxVYc1diSS5brTM7XXzRAkFga
yqmaGY+6Gwuxdjd64faiP16Op3/+6v3NmYB8Pu3UAuoHJI7D+L/OXy3r/Ldxsk1B4IjtcYl2bLJc
owLhTY1e84zI92Vo1STCEtcbyVUhFqtYVDuP+z1dPdoMSXk5Pj/bZzUwkXPN80MF164UOC5lN8Qi
Le1vqPEBLZbOT6hp4lJjLjXcImSczDQkmMGkRog4Dmp4P1s7GyE+k7BoiXmCanSmf4/+pXU+C33K
+NAf3677Hy+H985VjH+79JLD9efxBVJwP55PP4/Pnb9gmq77y/PhqiW+1yckJ0kBfqnuI6X5bBIb
sfgxqqzOv4HhkrAUrip4QVAiJ+6RdXhHE98PIWcDxPe5V/TE+38+3mAo3s8vh8772+Hw+EuzbMUp
FLGM/TehU5JgqumQncUVO0vBG6bw87Xie8tRrZhVQ/PSr7R0yQBgh+hgNOlNbIzgwDTQwi/T4h4H
SpehT5frY/eTSsCQJZMJ9VI10CjVfDmQWPythuW566y1yTCdo/Q01xhfKEOTcmanbLZJwCPoNgWe
4Jv3Ot/I3N6N1A29svhKSSyCO6vxAWsEmU6HD2GhhxltcGH6gMbEbQh2aKVBAT6yLnjls224zu+1
MN0KxRhjrBSC0dizq17cx5PhCP0MSM1yh4fHbCmMULktwgx5W2NkfFCrtbwY+n08knFNQYuo52nB
RTWE/tZm4HAbUUm0YyQ4zyQpePZi9FFdozCDYKu4/uiPxUd9++M4YoIg4kGvNIJfaxhHhhxJNF31
vSU6ET4Ear21fAsmbtx1id2lWQxmqMiks+Xew+FD3V5PLeGhcalrgjBmMh+y8vINgyNrBOB9dIXk
ECv31tQUAdt8E3lkwEP9zSMDRv/OMV93A9fmxYM8qwRDV9EBrirVSDBDC5XgrqvfAM3+72F7+G6s
ZgVp52wwnKDwUQ+dfdjxA/QwEEePIyxuuzG83s0tGfvZ+G6oN4w4d8CM7tmlb18GyFgySfjWTIlO
udblne/JRrOX/ZWJC6+315Ifp4Vj2j00Go5CMNSiYyvwYd+eI7geJsNqRmIa3WMzIgj+tNBGeCj4
lmDsTVzreDz4c/3jyeTWocBrQTc5T/F8836UGQzMzV8ue+OSTLBOx4NJeXMWgKA/RHYWgw/v0IVf
xCMPdT9pz+3BRE890iyxbOh3HekMahJYhLjFi6SwU8FbJA/3ySrWnqP5ij6fvjDB5/Z6bq01zIUu
csxhnzUr2f918QwSza7TYqw329+IjNIgzDjucgB5Znm7b3X1jclLcWAiwQX/0gAykgHXrAYYbmBm
YhMFs5EoEcctJnagHwashOu0VkOb82RBkiSM9Ja1tKEkYiIUYatsHvCkdc1gB9uK7CjQY/bx3IUW
SigrVmR/oQzqCAdc++aJ1VIFGXySXTWP6LGAaqp4HmvCfYtC62dddnS3YEKC+L5mLP2X4+F0VcaS
FPeJX5W7KlCz97EftXhgDTkE1g6UKqfrmXSyVhwCodIZ1aPfFFsOx99y6prQD+SoKk43YR3M6RaZ
jJ2NS0810SIkjodJ44uaYVrv6lh/aqiOwUDLHr8s2PZUQliI3xUXcLv/9scTA8FT3H7zlLUUw4T4
lFZOG4CyN1qiOu6M5Dx+RMYjLbcPXHUQ1Vz0wgDnKZ+kYduAQIi3hyoOi4LM8YcXCGAOAXOmkJB3
hnRIJdC0FQrCMglRe9F+RF2iBazVuG7sB1vn4lSl+UpHBJA8vkG06w3K5GvdTKvGwTEi40q0kwlQ
XRUlIKBQXWO1BJl2ssBveGfESHmeTJqW0bTtvADmNJmbMGhQ6ReHgWlMUT9k1zHW5B7ljsnv55/X
zuL32+HyZdN5/ji8XzEv5j+RyjbneXgvzB/l1i7JnKoZiH2IPK49KAqIrS8x0UKjx3cyfQir5fSb
1x1MbpAxHlml7BqkMS18ZTbN/kxTVG9VY/VDsAbKzWTCaUHsZSPL+NFY5UMVsDdAhokjMJZKwesv
ZC1i0sP4JhU/chXEDYUbirg/9jDmsSYArx021jT1ul0YDaQVQZL5Xn8EFH+qixGO+nVVOp5tPS3N
pgr2LHBAfBTKOPXYnhUGZ6cz/gG8zI31SwqsW1DKAR8N9DcliSm9CfrMpuCRBcXBAxw8dDTTw4Ri
Ba/nzJKIOO576BNBTTCLhj17yAk7MNm/Pa+aoDhK87RSZW25t2D5Ua+79JG++KMdOEViSm95CGT+
yLOHhQSrnje1wAnDlJA+eWjPWI1LkW5wVHyrG5KiNwrw8hGZZr65MZB9SHDuoCUISA/XGrQkN3vK
8NodK8cRjBdWfQteDD17zibe0B5yBhyiwArdbkvxN6JYZFTk2MH3sir6RPCGYPxm1+d9VqaV78eZ
C1cuqRO3DXXUZOz1p3qcC3FBVpbpuEjgcXq6nI9P6lUsQcYNy+4rcFlorpd5UUFkj2ma6qZqCS3u
iyIjWNgyiOA50yQMAanIPO55o8GS7V1nMYiXN+oPdM+YGgURFQfdqSMmaUOhxrBV4MN+4KhzOMaX
e00C8SZ7qFJZIeir4ag1+BBpVUTOxTUEGgl2QisEg0kPbVULvlvDMz+YDAcDC56TyWQ8tMDFKOh6
pId0HpIN9Bz5HCVJmLEti6mQJMGi19MT30hEEfQ8VLulEPS7SH853FVlv39jJDnB0B7JNsSwDZ/c
bZCmIDixIVoZBFEx8brY4l77vVHvRicZfty1+7jOAlZujFa55S+5aYndojHn6tM4S5MwUTNjcEQS
lgbEiM3IYQGNPQOk+ZMui7F4jmg6VjP2zjdkiYfzJk9jrCiW18kiwv2YJNawKWjA6RxrMErTDCwR
blTIPSfsCnOytYEbOs1r4x+rKRGRPoD0VpjQSgc8nqvIHrZ//+dwVdIyteE1dYymKALlEwzhDBv8
GQ2jALqh2QYsYjD8g+4VerxBiFpaY3gErDyNIj3DLxTlKoDEYXu7neEa0HkaBTOKSu4LyJfsR0oM
SvaD5wVL0+VaSSIvCSH4IrunQk1kitOkrkRlCGooopu1aZSXV6wKcKl06dkVMv5Ke7uhgg61GOsG
auhEGWy6ghk4MWNT5JM4P/DDMRoC2SC680wxoMEWjH/qVn52u5JsG6O92/hDFC4yVQO3qcz9tsho
wu2rayWF/3J+/KdTnD8ujwdbmSxChKoKXAHhof20lVbkvtEWdxuC1Blsf5ajwVSNdIu22hQkNJqm
ShxlGYq6ihdrW5UMpK9GWUN/QNmorBWTF3FQHE6Hy/Gxw5GdbP984IZLncJWz/yJVG+nDs0n28kP
r+fr4e1yfkSeJUJwJAGDEu3hoYGylRMaHgJ1l5BaRWtvr+/PSENZXCj6LP6Ta/dMGNd5z8Hqz40B
gImttXRKFEu9JwpHDhfmluoXlXgHTf3OX8Xv9+vhtZOeOv6v49vfYPb0ePzJBj/QXS3I68v5mYEh
WKb6YCrZeAQtyoEd1ZOzmI0VceAv5/3T4/nVVQ7Fc4Jkl31tQ3iuzhe6Miqpx2W1pr7fPq80Vf+p
AmF193/xztU3C8eRq4/9C+uw84tQfCMUgYM4lSt8d3w5nv61KmpvV3iG2fhrdCFjhRsTuP9pQTTH
BGTb3MzycNW8koifnfmZEZ7O2jOZQLEbdSN90tMkCGOSaMKQSpaFOY8EmaBBMzVKYHsKds8q7zgK
GuxjmYjoO9AZKQrKy2ofYflGtN9bhRvGqyoWfrvS56p/XkH47/XxfKpf85Rqmo8U5IxvoQ9pgmtA
apJZQdjtjb2E1gS11agOVJKsmxUyVL8/xNmBloTbWN+iycpk2EPNtGuCvITk6Io2s4YX8VDLI16D
pf+VcpuxM1m3fKMoow639G/lhzAo1EHGGyyA4IFzVmpZWwFMV8XI62LaWsByZwZFJwQwbravxsDg
fYi8iZ9FgQEt46zJ20XzFc9saodTYBi4xdWuEdZZ6kjtC7JOvkK3utWGMpgZBIs3nN2a67AIS5WT
/q1jprnPWp3CL1/PJCLw4qF4juWoFAQQ0um+8Lkjh7CNYWJG8fHjnZ887UjIAOIMrSiCWmCd8Eug
W5UQeC/OY1N2afBTH/LFJgQIPZeEwyqvLRQqJiLl2m5XkbzxVwxT0DDPtYcxDUuiDbqcGQ2sTRrv
JvEKumjWEDM2M2q/3FFHtiOVN0nialFQ36yiQcIIoGPEGyJZtmBCeRUH8WiEmoUCWeqHUQqKljwI
C5Uf0SdVqRsOa5/g4Q1i33b+zA4XMJzan9hp+no+Ha/nC/amd4tMWaJ6LDFLKyl3XBLkqcMF19RY
RnSabAIaKzzaNAKHQHa1xKECTeApeKn99iNClQMMKEqFkYYfyuSlM14jdhuSXf0kp9g2EIWn5wba
xs/mrBSGLtvO9bJ/PJ6eMZ9kdnihEyY2uxnhRfok21UquqFsjt99MzSDH9fIM7Zhx0V78eD78XI9
vr0c/sXdfuP1riLBfHznYQd6jS16A908GeAOPy1AcZlLWeVYHxSGIc0UTUBBVdEJfsEJLB3nJDii
sZ5OgQGEMMBT2v/Wxz73RUZGh4C/Tko0owfoyLSv5lo4l/BjsDIi/dURfCT45tZGvU6kEbJphAfk
Am2e4ZjsRrRLjrECXuXwBWC4Pp4UhGEGDKNxFAPg+CCKOK/TaGPAO5YWkALQx9T/kqYI/XUuPEj0
8q6XfY5crhNacnFY6dP3aeDpv0yehLUXT3lseUXQCykbPYZR+ZkGyMPsI3AuxtJkliI49s+OlGWu
39ktEh0WlFIODjIM32WPm4Lf/zDi3/XRVqDGKHFCSJgHTtPKoOxEk6/qb5lmZjPQ6VbrtNSu5d0f
egd4PT4CQNIE8u8JVx9HoS3RnZd28oNwVeOscC7/1LeRzQ2RGx8vIe1HtQPQ4Pjq4QfI3FzjDQ1P
xEDYcr6vLDszjdby1hdgJlaFjkgBbRvhDDI4uEzdEhrdGJaZxyvBzxft9sNHI9zBCtHXqoTVIRDS
DK2eMvEV8JopEMiyoFC/N/HKzVYx7g+eUl2xmRgFDAe6sWZFk+GxlZdtO8HmcuAY4RzaDgQxs0TK
/aD+hGcXrnjiN8yMqPn1eOalmgxWuDYEAmzs2tUsZttQe8ATIMx6h9fgl8oskXWZzoqBdgoKmAaa
8TNf2Qc+AygWZcKGTSXgJbRlkrKxhyzHar0tDCI3UUhtWbE/GluGkJBoS3huyihKMUlIKUOTIEQ7
AYFtUv6tKDYO2UilWWP/5u8ff2lpQgt5oSjLi4P4IYrvG4GHnEbpPCexuoUEyrq4BDidfofPjmih
SEocBZtBMxFooTeOQ4Wo6QzKm9RfLUYg+JKn8ddgE3D2pOVO5J4o0jsmymjz+z2NaKgd7w+MDD1V
1sFMLKC2cbxBoUdKi68zUn4Nd/DfpMS7xHBad+KClTPuz40gwuaLlI2JIISIzMg8/Dboj9sTzqxf
QGQZmoJOmsnk3z59XH9OGkfRpDQuFQ4wpp7D8q2qO735zUKYez98PJ07P7GxqFO/aeIqgJaQBRUT
PwEJmoQyssrASECcNIrnKhfK/gWNAibbK4bMYZ6oo2Uok8o407vHATe5B0EhuS4NyDZ3EI4U9oSJ
ZDMmEuYhY5/VV0L40zJVUty1B7KpByxB+d65L8owVg+zHMydLQaNBK6LlMyMhRDy60tuAxNYG1Ib
6XJrqoWsqn2XnRUQmcvB2dj95CAX+z21yEPXV32fCa5C4clrSL3GuyrzWmO27FpmyNnMEctMEBbr
OCY5zhfXFRmLoYGrHIrdPMZxG1RgRQEROSGfdMp5DPfHP2ge5gLGMxQqC48dudqFyn8LxshIMFmj
4hKzdihWa1Is9KmRMMEqWUm1UCpxs6K1BBAnNKsgtKQjWqtJytUJt5pU6eApwojx0NDx2bxVUT3S
dsnoAU3a0aKVa79t7gGt66G4OfTVgOujpvxx/SFEqwjjaRgE4c1qZjmZxyHj/2o2AurqNyzWztqB
MU3Ykkb3YBrbx0Hm2rCrZDcwDiIGGuEg45rK25Y0CJjShEE1va8DoKkysUFgrGsn3TQtMVMRQcY2
pdVQxjgb9GpjJ/dGu7fX1tgKiDiWMGbFHokwT60xl7AbrFhD4lrqDcEDzezWIPMuBIAUV3JEY1p+
6zU8RFhu03yJ31aJweLD741n/O6rYyIgjquYIzXzNIAUW4cqWpBXDv/KNC2BwlkSZAvhnsJkNGxJ
SyJgOcIIiPQPC2jBsweugwyL0chIcMsyJqzBcUVTxXiWn9jGT00xAg3WsbXaI2ed5FpKWP67mmth
SDKf3UsAq5b5VHP0rcnlZ9CEX2AQg9KHSIf4yMlCbrEgzBb4EeFTfWHDbyHnoE4igIVUuNu2Z403
kV7HNiRgDAShKvFoupxqnUG0bTfetXc40lKgtFCHcXuDh4TDWeUM4y0I/4f+1XKcQ40cEJcOhlhH
doO6y/CZSlSHVfZDSiPfPh3fz5PJ8O5LT4k9AwRStKkGaAIJjWTcV5zxdcx4qLfbYCaq/4OB8Zxl
3LWNXZhRV9vDOg6zuTVINAcaA4fZhRskgxutYzbSBsnoRnHMUFojueu7i9+hpgRGcc8xRXdqDju9
V2Prg5loDyuswmwdtbI9b9h1zCJD9XQUd2XVOyEbMigl2MPBfbySAU49xMEjc5FIhGvvSPyd4xMc
veo5uqX7XwFmmdJJhZ1+DXJtTlRMfOCbHKHkJYUfQozRP5AkZbjOsfe8hiRPSQmBkV+R4vc5jSKK
eZ1LkjkJI/2RvcHkoSMAuaSg7AvwgGINRbKmpT7QzdiIYM5WpeU6X+JGy0CxLmdacIsgwh6U1wmF
Ba8woAJQJWCSFdEHnl+gcUJXbT+r7UpVVGgPhcLu8PD4cTlef9vu9HCPqdqYe9CortZhUUsciho6
zAvK+EUmizAy8B7WRX+hZg8D62ps666CRQWZsPmX6NJpLWuDU3XBrVZ4emucZbkll0uk6wGDMXWg
oy/SdY5nhobHLp/r8GM2+IswylRtPoqGuHmLb5++vv84nr5+vB8ur+enw5dfh5e3w6VR8EkFYPul
RI3RV8TfPoHJ8NP5P6fPv/ev+88v5/3T2/H0+X3/88A6eHz6DIHdnmEaP/94+/lJzOzycDkdXjq/
9penwwme/dsZVmIRd46n4/W4fzn+dw/Ydvp9nwcEB413tSE5W/u0VMIA3qKCKO/qFHIgGx9/yVZs
go2tQsE4IyzaoEEBTbjqAXM+xk36SqRGqyaw52MHgiOYY2tRgI+RRLuHuLHiNLeX7OkuzYUIqsjC
IiwGKFhNWBzGfnZvQndqtFgBylYmBCJnjNi28dONqj4CF8LmseLy++167jyeL4fO+dIRy1NZCcLf
kERzklFVJaWAPRsekgAF2qTF0qfZQt1MBsIuAgIACrRJcy1EQANDCRv21+q4syfE1fllltnUS9UG
RdYAyi2blN0pjMOx663hdgH9dVGnbmQ/YQ1hUs1nPW8SryMLkawjHGg3z/8E5hqDo2HBbgCL3Ihy
IICNBbh4n/j48XJ8/PLP4XfnkS/R58v+7ddva2XmBbGqD+zlEfp2L0I/WNi98PMAqbJQHdvkR6/z
TegNh7072Wnycf11OF2Pj/vr4akTnnjP2dbv/Od4/dUh7+/nxyNHBfvr3voU34/tyUFg/oJdwcTr
Zml0X4enM3fanEKcMvsrwhW1TgL2yQvCDsaN/Iopd1KB2+rd7uPUHkd/NrVhpb0cfWTxhb6mk62h
UY6nI6vR6QxPAFKjM9ZJTMIX2F1ZWCPAmJBtTuzdmSzcYwyBT8q1PTug92+GcrF//+UaScYhWh1Z
xMRHxmN384s2opB47Dw+H96vdmO53/eQmQOwBd3tFlougRo8jcgy9OypFnB7alnlZa8LmXGtRY2e
4M6hjoOB1Zk4GCLjxKBVlt0Yqpiytc7NdrFhzmNwNXaXBvyoa/WPgb3hCAODD7i1BxekhwKh59Z3
MgRWNwNDsAsE3LeBcd+utmQM0DSdI4NQzvPeHaqqq0MPZCLMhuAejm+/NN+M5gQqkKoZtHJku5IU
yXpKHRq0miL38ahnzWpMt6anqEkD8bKZLIkGg5EUwhlaJDmwcbpLYwtH/SHrSym0t8iM/0XqWi7I
A0HDBNXzR6KCIItLXg3IyR/aHBnjGTLNor5ZMQMLVobEGolym8JQ27QC3mqyxVo5v75dDu/vQtIw
v5gxXxFx5JaSt8IDGj9EICcDD1lx+NNei1xgx4D5hif8C/enp/NrJ/l4/XG4CMdIU2iSS7iglZ/l
ahgt+Y35dG4E01Ix9eGPYbDzkmP+v7Ir640bR8J/JcjTPuwGTtbrmXnIA1tSdyutyzrc3XkRPE7D
a2TiGHYbm/n3W19RB4+iJhPAQLqqRJEUWQfroCRngfCAn1KYVQlySaqjh4X62Esa/oiQuzBhJy3e
X8oTTS0GI7hUbDq4Ezdhk4IV2XLVlFliBWeMfE0JSgb6PobimkbPHw+/P9+Siff8/fX88CjIaFRc
UcK+ZTgxIhExyEO/5KZPI+L0HjYe9xb1RLSwtkEz6aeLfbHUWB8t8S3AR3FNGji8z++XSJbHMpIt
7v1pzLPeuzz6gOTc7oVeIEWkEPP7Z7xqc5Td/ODL6BkLKyOMRY8uLpWwR0CjAyOX+4C7qQ5R4ltl
QEYRyXT59Tku3Iz6zSELDN6gCMb1qOaY5wkO4PjQDs7DuR8GsupW2UDTdCub7PCfi9/6KMFpWxoh
OUFnJhjHibuo+RWxrTfAog2J4pexUGQAC/sSD5tJHpsCdTQSHcLCoc7oQWrIp9PzGfm1ZKC98IUy
Lw/3j7fn1+fTm7v/nu6+Pjzem/VG4SPvW9yrqA83aysA18c3H98a3rQBnxzaWpkTEjq9LItY1Uf3
fTK1bppYDC5LaVqZeAyc/IlB65tlgrxSHzJVVrXLEdavyPwnuVaL98OQua/qnkPhzExR5cRzr1LS
VlHk0FhIY/YhKbJFVB37dV3mziGISZIlRQBbJO1wXfe8p8o6Ts0r++o0T/qiy1cotDhHr/DqUWaE
NG5SRCxBlFeHaKsd/HViGUAR7dO0tU4/ovdXNoVvNkV92na9pak5lhv9nJ0A1iZnDO3IZHWUbRuD
4FJ4VNX7sGIGCvo+crtXloCMLCsuMnyzxK59AzUyji8Gi9SMDFJFXObGmIUekEo4heLNbQGqY8ps
OMLDoCRkVtDnZy0CHShpokLLgEots54p0l/KPSH9cyb/ZoEl+sNngN3f/eFXy9E7QDnrUzSRB4JU
mZ9tAKo6l2DtljaF8BLUgVt4xSr65LU2rNsBOA+z31jBTAYi+2wVkJ4RHJrngzF//v5nbwGXX5pQ
JEbjnhTM0rL+TCiaNZbnKjJOS+gHQoUbOExqZYZRcRLHjcp6GN+m6GzKKCVmcpPQnNZWwWfF+Xlm
wqgGcUZVriob7lbURtaMB+hXx8q6wqjggWk88clNu3VwXCJcVaxcm/0GtwNOxXHdt/3V5cp0kAJD
05SpmvhhuU2G3O3Z3Yknq3B93maT6Y9jTCCXmXGdb/G1wYI3WWktSPxe4hFFZgcBR9nnvlVWE2l9
DRVVimTLq9QK36Uf69iYg5KvGd+QEK6Nr9og97p05QY+IJKKbTOMAGjAjAebqBmHD4MljhqhGSk5
Al2nL+Lq11nXbB337USEBJY+N8PM4G+Lk6o0xtPQF3ayReGRLTbiFE9Khqc72D7KUbVi6NPzw+P5
K18L8uXb6eXe901z4tOuH2KkjWwDBiO6Skx1xZ4sOR1sk5E2kU3unl+CFNcdMlIu52+hdU6vhYki
PhYKF4+5lw2YYO3jM2fwmK9KaMxJXROdXGMFD9IfaUGrsrHK5AQnbDp0efjj9K/zw7dBo3th0jsN
f/anV7/LTlydYUis6qLEusvPwDZVlsrueYMo3qt6LR/ibeIVUjnTKlBNf7D/8w7Hc0idlHJxiOsm
OumTC3lbS7Uidot8+1wuuKFibp9ozAFuCU6qHyIUWyUyAj060tM5GCNPm1y1kcFHXQx3D7mrR38i
12UdkZnSFfoR3tX9vz/ILg/zER0gqa9BlJX9n10MVp2wYZ/Gp99f7+/h6E4fX87Pr9/sax1yBfuR
bI/62uBeM3DytutP+PHix3uJinT01FSpfRycWB1fWfL2rT39dlj2CBuiS5e+2xDly3Q5UvUX2gkE
MXBxQWamO1rD5vP4LVnTE3deNWrI70VReZVZNjpjQ+8jW5ceBfdPdXkYr3Db4rezJ0HHP/sjRxKT
dxo6xEZM7RrcGRySzNqkaCypxfByXyRWxiZDqzJtyiJkzupe6LRGadPyTAxDIImY0SbwBzFiwluX
o0s68HeLNxOTiQdkgjIhAZ6jG7nJ/Tff5OyfCyTWTDT1yuW2BKw2ZHdsGkFaDyT6+hnhpRqxMJ+6
rBPHw4hUA56TlFNiKSSbSkT4fHJKXPgfgScL2bFr2i7uoALIIZJop7Ce/bNKjUV+AlSNopw3C2me
2hRyo3bmlemOvNk6ZZq03xT0b8rvTy//fJN9v/v6+qRZ4/b28d4qq1HhFlWEEJVySrqFRxGOLpkv
QcF5QFdRR1qaRtPkaMp16yOnl6L6LVsTJiG/SehBmHjqzizZVB077w0sGiD7bUfz36pGjqXcX6PA
cLSNS0mf5zM5/S4zc3d54nWYIomqL6+QTwK/0TvUC9xnsJddPYdmCU26CwUK5i5JKocx6dMwREjM
XPUfL08Pj4iaoEF8ez2ffpzoP6fz3bt378yLpVHIgNvmwupCMklV48qhoWCBOMfcBsYVZCYwDLs2
OVj3YOmVP5dAtXnBRO7MwH6vcX1DuxXRjOGX7hsrY0hDubOODaeTFiv/ZQMi+IrxTt8sSSrpRZhS
dkWN1zHZ70T5sBbZJe4B2TzIsJXYRGv7+fkgq4l183uVtsYyHC2fv7FOLMOrra1iD6wuIvaxK+DJ
pRWvD8AESaclZYDBfdX6wJfb8+0bKAJ3OOn1lH+7eICGVRKw2fgdGEWGmEoMSV70sWoVzKC6q4YD
eIcdBLrpvioiYyQpWlIK/VpiddRJ7MJZBaPiH3U9aui5Xxdw+bsDg5opxlNWa873Ayi5bvwFYnfT
nl3ip1qxr72bzQeDkFceKVvw4QTuCVekiUXHtpQ2FkvtydDgLhsyycZualVtZZrRvF07g9YNMLDP
uQQWh6Kat0kwCSoHYG0zJSmDhbl3ddXu4UHdyozUbUc2U+PzCJ0fLgIHRR75hnZLAaasRyC7WnAT
SCLm68+aGld4Swf7wbacdTj7QOMt4afv/zs9P91Zy3gWFUZO3561M0kZISKNNBRxrhujVVrit+32
49WlSZ/kHRZN7PnSkXRQQb6b5z0z/hPy3zK1SrJ+nSjeMqwt2xWoAkQLmYY0/SjpTRqKfMY0KqxN
2uvTqWU6DBEnetCNyLpshFcPlAcrC/Ogj32dCGENpc/QkPxbZUeZvq/LPreSOLQWYDkuMfWqzo7u
4ZGD4HDw0kxSBcEA7MuurbpW54NfXvx2JdGkxUTy/sN0z9lapZk+YLVbrlokNloHTt6yNI/z2tPL
GaIOOlyE8sO39ycjrwRV2WYuqou0zXXDLbDNcDUsOfCOG3Gzkc1YZiKBClmiJZOWVq5Rlf+1wTMR
l2tmSuHG5XyjpOVgg5+0qyb26/b6z/m7cf0YAzHvHHxStrBZB5N3l/04O0lxFCz1Bc3lapeMqUDe
u9KSlWZahIF3Ec0autZPdWU8eFnirjtkNriGIpmHBB6Eg5k5PVDPqwZkw5Ein6HXOIgQs5RAieO/
uuOyC8qMjNdI4imqTpTeWBc/Li/o3yR9SGrBh4zFqS9lKixxnu3iQFlPbTWlfN9KoIYbk+RpwXeM
himCz+/4UoPGLDEn0q1GtZQZbJiuXsG/tYA3HWlBKstZFibTBUHCeG01XF0uCwUzWyZIxLO4TQ7g
hwvTrP0h2kklLaWRqtFJPfbTO0K0pbw/mIClt3xrLeO1CAzju84tpmtiD+x/DOPHk5swRQ1HfYsd
tTCHoQR+xqaxFNam98HOKOI7Dhc+Tncab/Iwx9PTgIBCl885M1ktTTOCa7ZwFnmlWkdulqKGMAkl
MQLGbk26wchaLWNprXEnpi1fzeOKU00nik8dCGQiZuZjhuF4y39+ZeM9qaeSLxVe2hCcGxmsjKDZ
F+kmilb3YjOw8QPHlWMjLoE1y2AkEIdmlbckn84D7Lw+WY/xkv+07/L/+zSXUP6hAQA=
--===============5204045900386900362==--

