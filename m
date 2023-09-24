Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249DDED4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 14:36:04 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1dce0f9e222so1423626fac.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695566164; x=1696170964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ/00UTDB27GXD5poXkBVO7NXs6vYfukJqINZetFUFY=;
        b=lN+ujSx4eSKRXwtC4kS8q7Xn7m/CPjsx2POFIF6ihMzhcoKn82r7Y4l5Loq0rPyis9
         RHAuCwB8pbufqPt1TAit99+xzl4R9xCuKQytOnLOXGHX0Hh7TdbncAGrKv2jFOm6TPyq
         0JB6e+JLsdYyuPzEo8k3S8aG3YZbRqrHzIqfbAp5UqrdpsX2f2dIDhny0edj1wYK2g5i
         5/PY9F1Id5PLDxQdosD3IeP8GWEf/viufLLFpA281qyisNdKLSJH01iHV9TVxB0rRVlo
         XkIqLbs7swDUlrimQEci78Q9T1AYI0gzllq0NT2GD4cjRS/xAfGAFJ/y82Rl5HcGOu7Z
         3BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695566164; x=1696170964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ/00UTDB27GXD5poXkBVO7NXs6vYfukJqINZetFUFY=;
        b=uSWwIcYOs2s2flk9nh+Bo/vlSvvX7oSDaUxXAXnYsdf6oRXwME8fVbe+TW7tyq414H
         EJx9+3A6T/5yevsChYuykYY99WCQz00wucTDt6dBSJiO3lF9Y854m8u466kx6DNNaZsK
         Jk1BQYhThNMa2kpuAgN+LbOdsGBXxEGTJqOP831mxW3iaaLNSQgt7lQKAOvNDG/8uPcK
         ouq0xSDk9TujacWQqMLLm5wuskPTUilaXci/Wy/QTnUDqDxCxe9BjEf7b7zgsIuBAuGd
         CVo3jE7wJbj1+GbblyvXeEp26igjQGEj/q4hABfUGOKs91YTZR5KOQuZ1MDx+ZN+sSTY
         lsxQ==
X-Gm-Message-State: AOJu0YyFz45Ou+dw/up8AkR/Ukc2kbpYpYBDkerT9MfIbVGW7n1Uc+Td
	i2OX3IuBi29Mx/f9liUfhUJKSUOUx2mWMCDc774=
X-Google-Smtp-Source: AGHT+IEFyPM7kaXP5xYMce0IylX4IjXWF3Ts4oSgQZ3Ru/iEBU5tMPbD42Lw4PuWt0p0VZnTIPBVP8nD04wI9sOwTvs=
X-Received: by 2002:a05:6870:c596:b0:1b0:4fc5:2e4b with SMTP id
 ba22-20020a056870c59600b001b04fc52e4bmr4997697oab.9.1695566164110; Sun, 24
 Sep 2023 07:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920192300.3772199-1-goldstein.w.n@gmail.com>
 <202309231130.ZI5MdlDc-lkp@intel.com> <CAFUsyfKDRiX9kKOhHcA4PLqqT6Q5faHF0eRGiKN+9NSbvrUfDw@mail.gmail.com>
 <d02bd4f823534a00ae4915ead3d92773@AcuMS.aculab.com>
In-Reply-To: <d02bd4f823534a00ae4915ead3d92773@AcuMS.aculab.com>
From: Noah Goldstein <goldstein.w.n@gmail.com>
Date: Sun, 24 Sep 2023 09:35:51 -0500
Message-ID: <CAFUsyfL0M5P4+4s_b1kvJ_fE-ax8YBK0ammbKfoy7yKs1obzrA@mail.gmail.com>
Subject: Re: x86/csum: Remove unnecessary odd handling
To: David Laight <David.Laight@aculab.com>
Cc: kernel test robot <lkp@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "edumazet@google.com" <edumazet@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 4:13=E2=80=AFPM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Noah Goldstein
> > Sent: 23 September 2023 15:05
> >
> > On Fri, Sep 22, 2023 at 10:25=E2=80=AFPM kernel test robot <lkp@intel.c=
om> wrote:
> > >
> > > Hi Noah,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on tip/x86/core]
> > > [also build test WARNING on tip/master tip/auto-latest linus/master v=
6.6-rc2 next-20230921]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented i=
n
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Noah-Goldstein=
/x86-csum-Remove-unnecessary-
> > odd-handling/20230921-032450
> > > base:   tip/x86/core
> > > patch link:    https://lore.kernel.org/r/20230920192300.3772199-1-gol=
dstein.w.n%40gmail.com
> > > patch subject: x86/csum: Remove unnecessary odd handling
> > > config: x86_64-randconfig-121-20230921 (https://download.01.org/0day-
> > ci/archive/20230923/202309231130.ZI5MdlDc-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> > ci/archive/20230923/202309231130.ZI5MdlDc-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202309231130.ZI5MdlDc=
-lkp@intel.com/
> > >
> > > sparse warnings: (new ones prefixed by >>)
> > > >> arch/x86/lib/csum-partial_64.c:16:45: sparse: sparse: incorrect ty=
pe in return expression
> > (different base types) @@     expected restricted __wsum @@     got uns=
igned long long @@
> > >    arch/x86/lib/csum-partial_64.c:16:45: sparse:     expected restric=
ted __wsum
> > >    arch/x86/lib/csum-partial_64.c:16:45: sparse:     got unsigned lon=
g long
> > > >> arch/x86/lib/csum-partial_64.c:16:45: sparse: sparse: incorrect ty=
pe in return expression
> > (different base types) @@     expected restricted __wsum @@     got uns=
igned long long @@
> > >    arch/x86/lib/csum-partial_64.c:16:45: sparse:     expected restric=
ted __wsum
> > >    arch/x86/lib/csum-partial_64.c:16:45: sparse:     got unsigned lon=
g long
> > >
> > > vim +16 arch/x86/lib/csum-partial_64.c
> > >
> > >     13
> > >     14  static inline __wsum csum_finalize_sum(u64 temp64)
> > >     15  {
> > >   > 16          return (temp64 + ror64(temp64, 32)) >> 32;
> > >     17  }
> > >     18
> >
> > Just needs a `(__wsum)` cast. Should I post a new patch?
>
> It'll need to be a (__force __wsum) cast.
>
> I think new patches are expected...
>
Thank you, posted V4 that should fix the warning.
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)
