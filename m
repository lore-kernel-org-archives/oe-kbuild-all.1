Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587F1CF97
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 14:05:22 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1c4c5375329so2095329fac.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695477922; x=1696082722; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6j7juc4DVm+O/omSDnFgSvCJ2jKt1/TY4VRI13yi4vU=;
        b=EAXxPnj4y58G7UUB4DTa5veUeQxqU49KS2Cr90BLSpt+ZVrVY9IHp/xPnlCIQ51ftv
         PzjwwHCM1BZ6TjKFFMaDrwt1hZInE87SiXTlaLijXKo5kt7ZzBbWR1GtXI2bJ3CXwhUm
         /RaS9prj3yf3S4Uv9tTUzntO9sjTbNCLJmAdp20Ki0UJW/JLCQQYwvV6k3nUOUQA+tJm
         o9JtubLtunuQaLp0SgnXa/E1AdUE0E1pjxMkxcOvjntixiey+nYR0leUFnpCvggHoVTn
         F+I3QzjbHDRF2GXwaQnEAQ6lfvnf2KmuL7tORDCb0P7gyyv2ZQ4e7QM66iMqLaIGEvJB
         83xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695477922; x=1696082722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6j7juc4DVm+O/omSDnFgSvCJ2jKt1/TY4VRI13yi4vU=;
        b=uwRTWnQ+usT6DreCefmw0BKXXqxh6iS6MnTzGSBqyqk7AUvBrmm/DepzA+iCos9neu
         4y1pKDRfDi4cx8XvEwL+HEZkV0oCEt2VwXZXXh7bfLSMfCbxIftMH8DXNcwV/PNX3+Dz
         Nh4wLGnLRt2M3kLPTiojyvUIQRCndD8PNSGOAGp0T5n+LdGEULAUP4VHs663Ob55KwX+
         Zav7w8gPHP60ujyuWpYQb8bWvkIu+QxUzcO0jK2XWCJD+CR37uRz6DSamjP0wfNNtyIX
         P56RJyy1qPOQgLX+yITP/NDocJlxVjZqPs0ddTVAu3uLCibfPGuk9CZUvTF3FLll/mkZ
         QAew==
X-Gm-Message-State: AOJu0Yw1t/CSfxX7XGuKzatxlAwO53gZMZnTXM04kRuIKha2q9AeQLlE
	oCttaorm/ZqCLTCEomVa1UE5mrkVGUnsGfK2lJw=
X-Google-Smtp-Source: AGHT+IELW7nKbkj0tE8mKgN+jdQ1jRS+BCBSFdJE7V820hqaCIDPkwbunIG3Ypz8JjgWX2x09twSAJva7PKBQSWVf2M=
X-Received: by 2002:a05:6870:f60a:b0:1d5:21f9:7272 with SMTP id
 ek10-20020a056870f60a00b001d521f97272mr2315995oab.23.1695477921949; Sat, 23
 Sep 2023 07:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920192300.3772199-1-goldstein.w.n@gmail.com> <202309231130.ZI5MdlDc-lkp@intel.com>
In-Reply-To: <202309231130.ZI5MdlDc-lkp@intel.com>
From: Noah Goldstein <goldstein.w.n@gmail.com>
Date: Sat, 23 Sep 2023 09:05:10 -0500
Message-ID: <CAFUsyfKDRiX9kKOhHcA4PLqqT6Q5faHF0eRGiKN+9NSbvrUfDw@mail.gmail.com>
Subject: Re: x86/csum: Remove unnecessary odd handling
To: kernel test robot <lkp@intel.com>
Cc: x86@kernel.org, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, edumazet@google.com, tglx@linutronix.de, 
	mingo@redhat.com, torvalds@linux-foundation.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, David.Laight@aculab.com, hpa@zytor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:25=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Noah,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on tip/x86/core]
> [also build test WARNING on tip/master tip/auto-latest linus/master v6.6-=
rc2 next-20230921]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Noah-Goldstein/x86=
-csum-Remove-unnecessary-odd-handling/20230921-032450
> base:   tip/x86/core
> patch link:    https://lore.kernel.org/r/20230920192300.3772199-1-goldste=
in.w.n%40gmail.com
> patch subject: x86/csum: Remove unnecessary odd handling
> config: x86_64-randconfig-121-20230921 (https://download.01.org/0day-ci/a=
rchive/20230923/202309231130.ZI5MdlDc-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230923/202309231130.ZI5MdlDc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309231130.ZI5MdlDc-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> arch/x86/lib/csum-partial_64.c:16:45: sparse: sparse: incorrect type i=
n return expression (different base types) @@     expected restricted __wsu=
m @@     got unsigned long long @@
>    arch/x86/lib/csum-partial_64.c:16:45: sparse:     expected restricted =
__wsum
>    arch/x86/lib/csum-partial_64.c:16:45: sparse:     got unsigned long lo=
ng
> >> arch/x86/lib/csum-partial_64.c:16:45: sparse: sparse: incorrect type i=
n return expression (different base types) @@     expected restricted __wsu=
m @@     got unsigned long long @@
>    arch/x86/lib/csum-partial_64.c:16:45: sparse:     expected restricted =
__wsum
>    arch/x86/lib/csum-partial_64.c:16:45: sparse:     got unsigned long lo=
ng
>
> vim +16 arch/x86/lib/csum-partial_64.c
>
>     13
>     14  static inline __wsum csum_finalize_sum(u64 temp64)
>     15  {
>   > 16          return (temp64 + ror64(temp64, 32)) >> 32;
>     17  }
>     18

Just needs a `(__wsum)` cast. Should I post a new patch?
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
