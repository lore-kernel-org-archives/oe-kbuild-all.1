Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB97235BE4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 11:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741174605; cv=none; b=elfZQBDpw25TwZ04xwUe3Gm92/XewHggxhFZowluxQVc4MZIYrYpbWNJd5MQAUlFm6fYQYCWmURvrkdPgN6CMZuvvArS79aND7TomDxop84GQe657Vl3yZrQJGdpB/adtSZ7lX09AYj4Z/aKErlzERUZIVXoNug44kCmacZD5VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741174605; c=relaxed/simple;
	bh=HeaLeqCxFce0lg8Om7j0ozI2Ceknv89Ds829ukrVQcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jkmm+k3Oox6x7UYytqCB8atR0LN9kEqE+Dns+KixTi0xg1dCSQcVMgbzJGsaG3ZZipqHxzShb0IHLier7c0lJOHcxqnAmPZQGTzxiDJkse42dwZxe7v5bM0va3AHFAYGHnkQmDv7qRSmYckSXb6qFU6LH6fizAqS2YwzeXcTtek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kC6lE23z; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kC6lE23z"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30b9b1979b9so56869831fa.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Mar 2025 03:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741174602; x=1741779402; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWlFdYO+U5pkyvFkJdSxJPcpii24zFkKT+mvaAzenDM=;
        b=kC6lE23zxzB54qlZ8vYQsVKnnGo0apOGO6nsTSZzk9P+uLIkPLH4GDmrHUoQrtJtiB
         jESKpWhXPDxNAMz1KrOqwe0ZgtzJvy05uSWE3NJ/naktltiXZtdeHE3lEQDeHXoMOLlZ
         qQXox6DZzzDFC62GPGM51fLxV4oVErPmqiP6kIfO+70EQNKWtTqiLXds6lBzHCNclfkv
         qE6lewNotQsNzpH39WdCxW09dv9LoB0Uw/qBndG9NA8rsuHQ9ZKvlhsnZ3rr07cdxZs3
         opOih0SOAe+ve766AGyam12HFjbZYeWDW77fcBi6qt2/hzF+ZfhqBm1b6fiwNZsrvCHl
         cd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741174602; x=1741779402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWlFdYO+U5pkyvFkJdSxJPcpii24zFkKT+mvaAzenDM=;
        b=esGr7DKm1y0HB8fb0LWgL9mEYSGhBpqLH5Pv+IftC+T1cCw9eM94JxvLceE2C5Fadl
         5YahM2qPNTNXTdisTEq+V0E4p7l1Zt21iQ+II1g13OF+iXaHXT9TJpb2KrQzOLfTZOp1
         cWV8x4Gum7YaJ3gIVhk3j6Zwsud7fXBbRhp3TPebEgQtLNGRs9Jj+CtKy+Np7z1/BcuK
         t5eIX3XEK52eydH5teiNiBYeyvL4f/8RUhXDCMVCQ+ChOba7t8n5974qiX2gE1iJl1tV
         iQx0m9vCeSkQ3yReH+ZncUfjWEhGq5244tUYDd2C0jB8Qisg0E58Z+Ome3jl/v/P4AHw
         bZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXgr/F8//uxdo64aAYzySsECdB0POjKpdIWt0yCnWFduRCy+R+5HUelRbC8DfClhCDZ6v8g791wus1wm62S@lists.linux.dev
X-Gm-Message-State: AOJu0YzSlb/dhRswZ5ZGWSix9Npa69boukKvoDi9NWd5FVb03ko/5YdK
	XTrzDGvg7Sm977CuUo6exqXfwlvwb8feSIuo4aNWskM9FyekX5lRLnkz4MEkOzKrrnCw9a+t2B1
	EbdfJqu4b7226nlRjdCovCzGsVi8=
X-Gm-Gg: ASbGncsMmMI6r9jlgNgOwsWMsKF3KRTJAIis9Diuu++vO4TeOtIacrsp930lhMeU+wf
	wNmJ51hM6raUf+A+VfHxFlV3HhONATvgOD7WMeyVFGNzFazfXu7M4+hQ1OI2obBcuX1a7cBqkbe
	wBv83fApBplKfjPVEqeW8ua8xYl6ReumSF8PHX9h024xjIF+OfJgtI3dPbJvHX
X-Google-Smtp-Source: AGHT+IEoFkcbxDDv1dZPxu93WwtasiJI2Lz3qV5/cJ/6/JfY41teVTwgtDE1Riii8TG+BQq6FVk+CV4MaDNemyWbAN0=
X-Received: by 2002:a2e:bc18:0:b0:30b:d63c:ad20 with SMTP id
 38308e7fff4ca-30bd7af199bmr10137871fa.24.1741174601641; Wed, 05 Mar 2025
 03:36:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214-scanf-kunit-convert-v8-3-5ea50f95f83c@gmail.com>
 <202502160245.KUrryBJR-lkp@intel.com> <CAJ-ks9kkigKG=Nf_mZrA5CA=SUV2sSyY51_rLef42T+ZxCmk1Q@mail.gmail.com>
 <Z8gdpSErMCMCZZNP@pathway.suse.cz>
In-Reply-To: <Z8gdpSErMCMCZZNP@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 5 Mar 2025 06:36:03 -0500
X-Gm-Features: AQ5f1JqURv3wm0FFfsHXNlwRx6ZYwKWLutLxKPRJPNR4Ik3Z-kjKd3V7yI5FsHY
Message-ID: <CAJ-ks9mMCmD8UkT_gkiLxh3sRZkOWGVFamNnFfdVNJ__f2mfgA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] scanf: convert self-test to KUnit
To: Petr Mladek <pmladek@suse.com>
Cc: kernel test robot <lkp@intel.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 4:47=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> On Sat 2025-02-15 14:52:22, Tamir Duberstein wrote:
> > On Sat, Feb 15, 2025 at 1:51=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > Hi Tamir,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on 7b7a883c7f4de1ee5040bd1c32aabaafde54d209]
> > >
> > > url:
> > https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/scanf-i=
mplicate-test-line-in-failure-messages/20250215-002302
> > > base:   7b7a883c7f4de1ee5040bd1c32aabaafde54d209
> > > patch link:
> > https://lore.kernel.org/r/20250214-scanf-kunit-convert-v8-3-5ea50f95f83=
c%40gmail.com
> > > patch subject: [PATCH v8 3/4] scanf: convert self-test to KUnit
> > > config: sh-randconfig-002-20250216 (
> > https://download.01.org/0day-ci/archive/20250216/202502160245.KUrryBJR-=
lkp@intel.com/config
> > )
> > > compiler: sh4-linux-gcc (GCC) 14.2.0
> > > reproduce (this is a W=3D1 build): (
> > https://download.01.org/0day-ci/archive/20250216/202502160245.KUrryBJR-=
lkp@intel.com/reproduce
> > )
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202502160245.KUrryBJR-lkp@intel.c=
om/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    In file included from <command-line>:
> > >    lib/tests/scanf_kunit.c: In function 'numbers_list_ll':
> > > >> include/linux/compiler.h:197:61: warning: function 'numbers_list_l=
l'
> > might be a candidate for 'gnu_scanf' format attribute
> > [-Wsuggest-attribute=3Dformat]
> >
> > I am not able to reproduce these warnings with clang 19.1.7. They also
> > don't obviously make sense to me.
>
> I have reproduced the problem with gcc:
>
> $> gcc --version
> gcc (SUSE Linux) 14.2.1 20250220 [revision 9ffecde121af883b60bbe60d004250=
36bc873048]
>
> $> make W=3D1 lib/test_scanf.ko
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC [M]  lib/test_scanf.o
> In file included from <command-line>:
> lib/test_scanf.c: In function =E2=80=98numbers_list_ll=E2=80=99:
> ./include/linux/compiler.h:197:61: warning: function =E2=80=98numbers_lis=
t_ll=E2=80=99 might be a candidate for =E2=80=98gnu_scanf=E2=80=99 format a=
ttribute [-Wsuggest-attribute=3Dformat]
>   197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Sta=
tic_assert(!(e), msg);}))
>       |                                                             ^
> [...]
>
> It seems that it is a regression introduced by the first
> patch of this patch set. And the fix is:
>
> diff --git a/lib/test_scanf.c b/lib/test_scanf.c
> index d1664e0d0138..e65b10c3dc11 100644
> --- a/lib/test_scanf.c
> +++ b/lib/test_scanf.c
> @@ -27,7 +27,7 @@ static struct rnd_state rnd_state __initdata;
>  typedef int (*check_fn)(const char *file, const int line, const void *ch=
eck_data,
>                         const char *string, const char *fmt, int n_args, =
va_list ap);
>
> -static void __scanf(6, 0) __init
> +static void __scanf(6, 8) __init
>  _test(const char *file, const int line, check_fn fn, const void *check_d=
ata, const char *string,
>         const char *fmt, int n_args, ...)
>  {
>
> Best Regards,
> Petr

Thanks for the review! I'll respin later today unless you let me know other=
wise.

Cheers.
Tamir
