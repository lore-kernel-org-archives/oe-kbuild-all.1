Content-Type: multipart/mixed; boundary="===============5963063510033670521=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 10/11] kasan: fix bug detection via ksize for HW_TAGS mode
Date: Thu, 07 Jan 2021 02:59:30 +0100
Message-ID: <CAAeHK+xhERCD-455hMd1_ksPEyjB_1bfoDht0Crz60sBuQO-TA@mail.gmail.com>
In-Reply-To: <20210106160250.24b79d8d119a7ff0a5414f3f@linux-foundation.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5963063510033670521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 7, 2021 at 1:02 AM Andrew Morton <akpm@linux-foundation.org> =
wrote:
>
> On Wed, 6 Jan 2021 08:09:00 +0800 kernel test robot <lkp@intel.com> wro=
te:
>
> > Hi Andrey,
> >    In file included from arch/x86/boot/compressed/cmdline.c:2:
> >    In file included from arch/x86/boot/compressed/misc.h:30:
> >    In file included from include/linux/acpi.h:14:
> >    In file included from include/linux/resource_ext.h:11:
> >    In file included from include/linux/slab.h:136:
> > >> include/linux/kasan.h:314:77: warning: non-void function does not re=
turn a value [-Wreturn-type]
> >    static inline bool kasan_check_byte(const void *address, unsigned lo=
ng ip) {}
> >                                                                        =
        ^
> >    1 warning generated.
> >
>
> This?
>
> --- a/include/linux/kasan.h~kasan-fix-bug-detection-via-ksize-for-hw_tags=
-mode-fix
> +++ a/include/linux/kasan.h
> @@ -311,7 +311,10 @@ static inline void *kasan_krealloc(const
>         return (void *)object;
>  }
>  static inline void kasan_kfree_large(void *ptr, unsigned long ip) {}
> -static inline bool kasan_check_byte(const void *address, unsigned long i=
p) {}
> +static inline bool kasan_check_byte(const void *address, unsigned long i=
p)
> +{
> +       return true;
> +}
>
>  #endif /* CONFIG_KASAN */

Yes.

> btw, "kasan_check_byte" isn't a good function name.  Check for what?
> Does it return true for a check which passed, or for a check which
> failed?  Something like "kasan_byte_valid" would be better - the name
> explains the return value.

Sounds good, will fix in v2 along with the warning.

Thank you!
--===============5963063510033670521==--

