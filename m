Content-Type: multipart/mixed; boundary="===============5143712466559033519=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/crypto/chelsio/chcr_ktls.c:1078: undefined reference to `tls_get_record'
Date: Thu, 08 Oct 2020 22:30:02 -0700
Message-ID: <c015720e-d83e-1400-a67f-ab1a736a3d7b@infradead.org>
In-Reply-To: <202008080002.xe30V0kb%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5143712466559033519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/7/20 9:16 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   86cfccb66937dd6cbf26ed619958b9e587e6a115
> commit: 5a4b9fe7fece62ecab6fb28fe92362f83b41c33e cxgb4/chcr: complete rec=
ord tx handling
> date:   5 months ago
> config: parisc-randconfig-r013-20200807 (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout 5a4b9fe7fece62ecab6fb28fe92362f83b41c33e
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Dparisc
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>     hppa-linux-ld: drivers/crypto/chelsio/chcr_ktls.o: in function `chcr_=
ktls_xmit':
>>> drivers/crypto/chelsio/chcr_ktls.c:1078: undefined reference to `tls_ge=
t_record'
>     hppa-linux-ld: drivers/crypto/chelsio/chcr_ktls.o: in function `.LC10=
':
>>> chcr_ktls.c:(.rodata.cst4+0x0): undefined reference to `tls_validate_xm=
it_skb'

Hi,
Has anyone tried to fix this build error?
It still fails on v5.9-rc8.

CONFIG_TLS=3Dm
but
CONFIG_CRYPTO_DEV_CHELSIO=3Dy
CONFIG_CHELSIO_TLS_DEVICE=3Dy

so the builtin driver cannot reach the TLS loadable module symbols.

--
~Randy
--===============5143712466559033519==--

