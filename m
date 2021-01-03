Content-Type: multipart/mixed; boundary="===============7817464725421963246=="
MIME-Version: 1.0
From: Ard Biesheuvel <ardb@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] crypto: x86/aes-ni-xts - rewrite and drop indirections via glue helper
Date: Sun, 03 Jan 2021 21:31:15 +0100
Message-ID: <CAMj1kXFZ77ptJXqp-JWembc-U6ouhZs3G8079Y+qkPQ47VQogA@mail.gmail.com>
In-Reply-To: <202101010632.59pt4uvv-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7817464725421963246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Dec 2020 at 23:37, kernel test robot <lkp@intel.com> wrote:
>
> Hi Ard,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on cryptodev/master]
> [also build test ERROR on crypto/master linus/master v5.11-rc1 next-20201=
223]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>

This is a false positive, and the cover letter mentions that these
patches depend on the cts(cbc(aes)) patch which is now in the
cryptodev tree

I will try to remember to use --base next time.


> url:    https://github.com/0day-ci/linux/commits/Ard-Biesheuvel/crypto-x8=
6-aes-ni-xts-recover-and-improve-performance/20210101-004902
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev=
-2.6.git master
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/0day-ci/linux/commit/120e62f276c7436572e8a67=
ecfb9bbb1125bfd8d
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Ard-Biesheuvel/crypto-x86-aes-ni=
-xts-recover-and-improve-performance/20210101-004902
>         git checkout 120e62f276c7436572e8a67ecfb9bbb1125bfd8d
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    ld: arch/x86/crypto/aesni-intel_asm.o: in function `aesni_xts_encrypt':
> >> (.text+0x8909): undefined reference to `.Lcts_permute_table'
>    ld: arch/x86/crypto/aesni-intel_asm.o: in function `aesni_xts_decrypt':
>    (.text+0x8af6): undefined reference to `.Lcts_permute_table'
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7817464725421963246==--

