Content-Type: multipart/mixed; boundary="===============3087747084586861995=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 10/11] kasan: fix bug detection via ksize for HW_TAGS mode
Date: Wed, 06 Jan 2021 16:02:50 -0800
Message-ID: <20210106160250.24b79d8d119a7ff0a5414f3f@linux-foundation.org>
In-Reply-To: <202101060828.QFNIkNMv-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3087747084586861995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Jan 2021 08:09:00 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Andrey,
>    In file included from arch/x86/boot/compressed/cmdline.c:2:
>    In file included from arch/x86/boot/compressed/misc.h:30:
>    In file included from include/linux/acpi.h:14:
>    In file included from include/linux/resource_ext.h:11:
>    In file included from include/linux/slab.h:136:
> >> include/linux/kasan.h:314:77: warning: non-void function does not retu=
rn a value [-Wreturn-type]
>    static inline bool kasan_check_byte(const void *address, unsigned long=
 ip) {}
>                                                                          =
      ^
>    1 warning generated.
> =


This?

--- a/include/linux/kasan.h~kasan-fix-bug-detection-via-ksize-for-hw_tags-m=
ode-fix
+++ a/include/linux/kasan.h
@@ -311,7 +311,10 @@ static inline void *kasan_krealloc(const
 	return (void *)object;
 }
 static inline void kasan_kfree_large(void *ptr, unsigned long ip) {}
-static inline bool kasan_check_byte(const void *address, unsigned long ip)=
 {}
+static inline bool kasan_check_byte(const void *address, unsigned long ip)
+{
+	return true;
+}
 =

 #endif /* CONFIG_KASAN */
 =


btw, "kasan_check_byte" isn't a good function name.  Check for what? =

Does it return true for a check which passed, or for a check which
failed?  Something like "kasan_byte_valid" would be better - the name
explains the return value.

--===============3087747084586861995==--

