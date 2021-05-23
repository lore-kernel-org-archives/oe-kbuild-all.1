Content-Type: multipart/mixed; boundary="===============1900884712292181977=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kbuild-all@lists.01.org
Subject: Re: [cryptodev:master 43/53] drivers/char/hw_random/ixp4xx-rng.c:26:10: fatal error: 'mach/hardware.h' file not found
Date: Sun, 23 May 2021 08:56:05 +0800
Message-ID: <20210523005605.2qy7exr67pg2nz3a@gondor.apana.org.au>
In-Reply-To: <202105222208.Ay7upVmB-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1900884712292181977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 22, 2021 at 10:48:19PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev=
-2.6.git master
> head:   acbc3fb26feed173d9ca6b0a16d0bed01c40f339
> commit: 3c0907bc4c47475734ffe21accc31261527dbdf5 [43/53] hwrng: omap - En=
able driver for TI K3 family
> config: arm64-randconfig-r026-20210522 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project e84a=
9b9bb3051c35dea993cdad7b3d2575638f85)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptod=
ev-2.6.git/commit/?id=3D3c0907bc4c47475734ffe21accc31261527dbdf5
>         git remote add cryptodev https://git.kernel.org/pub/scm/linux/ker=
nel/git/herbert/cryptodev-2.6.git
>         git fetch --no-tags cryptodev master
>         git checkout 3c0907bc4c47475734ffe21accc31261527dbdf5
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Please ignore this.  It was a merge error on my part.  I've fixed
it in the crypto tree.

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--===============1900884712292181977==--

