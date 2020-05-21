Content-Type: multipart/mixed; boundary="===============2882583897198350925=="
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH linus] RISC-V: gp_in_global can be static
Date: Thu, 21 May 2020 13:51:41 -0700
Message-ID: <mhng-7dafbf2e-2bf8-447f-bb31-c3c640d0e898@palmerdabbelt-glaptop1>
In-Reply-To: <20200518050227.GA13086@f1dbffaf4744>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2882583897198350925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 17 May 2020 22:02:27 PDT (-0700), lkp(a)intel.com wrote:
>
> Fixes: 52e7c52d2ded ("RISC-V: Stop relying on GCC's register allocator's =
hueristics")
> Signed-off-by: kbuild test robot <lkp@intel.com>
> ---
>  process.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 610c11e916068..3b2933839d492 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -22,7 +22,7 @@
>  #include <asm/switch_to.h>
>  #include <asm/thread_info.h>
>
> -unsigned long gp_in_global __asm__("gp");
> +static unsigned long gp_in_global __asm__("gp");
>
>  extern asmlinkage void ret_from_fork(void);
>  extern asmlinkage void ret_from_kernel_thread(void);

Thanks.  Looks like this is actually a real bug: gp_in_global was supposed =
to
have the "register" keyword, and missing that appears to cause the __asm__ =
to
be ignored.
--===============2882583897198350925==--

