Content-Type: multipart/mixed; boundary="===============2735412008388375332=="
MIME-Version: 1.0
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/3] KEYS: trusted: Reserve TPM for seal and unseal operations
Date: Mon, 05 Oct 2020 06:30:27 +0300
Message-ID: <20201005033027.GA144802@linux.intel.com>
In-Reply-To: <202010051054.nSqmgsmE-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2735412008388375332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'll fix this this and send v2.

/Jarkko

On Mon, Oct 05, 2020 at 10:42:00AM +0800, kernel test robot wrote:
> Hi Jarkko,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on security/next-testing]
> [also build test WARNING on integrity/next-integrity char-misc/char-misc-=
testing linus/master v5.9-rc8 next-20201002]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Jarkko-Sakkinen/KEYS-tru=
sted-Fix-incorrect-handling-of-tpm_get_random/20201005-092710
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-sec=
urity.git next-testing
> config: x86_64-randconfig-a002-20201005 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bcd0=
5599d0e53977a963799d6ee4f6e0bc21331b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/ef36c0cd07555d658f81aee=
66abb02bdbe1c37b7
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jarkko-Sakkinen/KEYS-trusted-Fix=
-incorrect-handling-of-tpm_get_random/20201005-092710
>         git checkout ef36c0cd07555d658f81aee66abb02bdbe1c37b7
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    In file included from security/keys/encrypted-keys/encrypted.c:22:
>    In file included from include/keys/trusted-type.h:12:
> >> include/linux/tpm.h:423:16: warning: no previous prototype for functio=
n 'tpm_transmit_cmd' [-Wmissing-prototypes]
>    extern ssize_t tpm_transmit_cmd(struct tpm_chip *chip, struct tpm_buf =
*buf,
>                   ^
>    include/linux/tpm.h:423:8: note: declare 'static' if the function is n=
ot intended to be used outside of this translation unit
>    extern ssize_t tpm_transmit_cmd(struct tpm_chip *chip, struct tpm_buf =
*buf,
>           ^
> >> include/linux/tpm.h:426:1: warning: non-void function does not return =
a value [-Wreturn-type]
>    }
>    ^
>    2 warnings generated.
> =

> vim +/tpm_transmit_cmd +423 include/linux/tpm.h
> =

>    397	=

>    398	extern int tpm_is_tpm2(struct tpm_chip *chip);
>    399	extern __must_check int tpm_try_get_ops(struct tpm_chip *chip);
>    400	extern void tpm_put_ops(struct tpm_chip *chip);
>    401	extern ssize_t tpm_transmit_cmd(struct tpm_chip *chip, struct tpm_=
buf *buf,
>    402					size_t min_rsp_body_length, const char *desc);
>    403	extern int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
>    404				struct tpm_digest *digest);
>    405	extern int tpm_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
>    406				  struct tpm_digest *digests);
>    407	extern int tpm_send(struct tpm_chip *chip, void *cmd, size_t bufle=
n);
>    408	extern int tpm_get_random(struct tpm_chip *chip, u8 *data, size_t =
max);
>    409	extern struct tpm_chip *tpm_default_chip(void);
>    410	void tpm2_flush_context(struct tpm_chip *chip, u32 handle);
>    411	#else
>    412	static inline int tpm_is_tpm2(struct tpm_chip *chip)
>    413	{
>    414		return -ENODEV;
>    415	}
>    416	static inline int tpm_try_get_ops(struct tpm_chip *chip)
>    417	{
>    418		return -ENODEV;
>    419	}
>    420	static inline void tpm_put_ops(struct tpm_chip *chip)
>    421	{
>    422	}
>  > 423	extern ssize_t tpm_transmit_cmd(struct tpm_chip *chip, struct tpm_=
buf *buf,
>    424					size_t min_rsp_body_length, const char *desc)
>    425	{
>  > 426	}
>    427	static inline int tpm_pcr_read(struct tpm_chip *chip, int pcr_idx,
>    428				       struct tpm_digest *digest)
>    429	{
>    430		return -ENODEV;
>    431	}
>    432	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============2735412008388375332==--

