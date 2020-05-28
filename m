Content-Type: multipart/mixed; boundary="===============5613720007060285072=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [tip:locking/kcsan 12/12] /bin/bash: line 1: 61526 Segmentation fault sparse ...
Date: Thu, 28 May 2020 09:59:00 +0200
Message-ID: <20200528075900.GA236442@google.com>
In-Reply-To: <20200527235442.GC1805@zn.tnic>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5613720007060285072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2020, Borislav Petkov wrote:

> On Thu, May 28, 2020 at 07:39:31AM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git loc=
king/kcsan
> > head:   a5dead405f6be1fb80555bdcb77c406bf133fdc8
> > commit: a5dead405f6be1fb80555bdcb77c406bf133fdc8 [12/12] compiler_types=
.h: Optimize __unqual_scalar_typeof compilation time
> > config: i386-randconfig-s002-20200527 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > reproduce:
> >         # apt-get install sparse
> >         # sparse version: v0.6.1-240-gf0fe1cd9-dirty
> >         git checkout a5dead405f6be1fb80555bdcb77c406bf133fdc8
> >         # save the attached .config to linux build tree
> >         make W=3D1 C=3D1 ARCH=3Di386 CF=3D'-fdiagnostic-prefix -D__CHEC=
K_ENDIAN__'
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> I'll say.
> =

> Looking at the subject, that broke the 0day bot too. :-)
> =

> /me trims it.
> =

> Looks like we need __CHECKER__ ifdeffery somewhere but it is too late
> for me to think straight so tomorrow...

Ouch. The below should be all we need, assuming it's the best we can do
for sparse right now.

Thanks,
-- Marco

------ >8 ------

From: Marco Elver <elver@google.com>
Date: Thu, 28 May 2020 09:43:13 +0200
Subject: [PATCH] compiler_types.h: Use unoptimized __unqual_scalar_typeof f=
or
 sparse

If the file is being checked with sparse, use the unoptimized version of
__unqual_scalar_typeof(), since sparse does not support _Generic.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/compiler_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index a529fa263906..c1ee20812a8c 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -246,7 +246,7 @@ struct ftrace_likely_data {
  * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
  *			       non-scalar types unchanged.
  */
-#if defined(CONFIG_CC_IS_GCC) && CONFIG_GCC_VERSION < 40900
+#if (defined(CONFIG_CC_IS_GCC) && CONFIG_GCC_VERSION < 40900) || defined(_=
_CHECKER__)
 /*
  * We build this out of a couple of helper macros in a vain attempt to
  * help you keep your lunch down while reading it.
-- =

2.27.0.rc0.183.gde8f92d652-goog

--===============5613720007060285072==--

