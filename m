Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9372877D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760468556; cv=none; b=lGawduiMitBbwp4crZRjzajJ018AysT7m5N3KRjoIFBG9/inQDlakgD2CJ/B9JjWx7C377UfhIGrhTukXvboQOqoPdYVeqPrKb3nrTRay4qrNq33sc+i6+j2wKR5E3ivP3bCnA60sCgt68579RMQHeF/owzQX1CDgyUXy4ZDq1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760468556; c=relaxed/simple;
	bh=u2gDif44Df5DLrSL7h1xngXRQxV2eqMZembPsXROzFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWOaM0jtYkxWG+3jflqsWgNYrsq1y8ZPxtIo2klhbhebkfHqJD8QVdj9mv+asigkpjbV5EuYGT/xxu9QdprcpxzL23Cy4LEn85us5koKhhTOrk+SXFZALUJSYRhcO00oHq9zXWm+C6hOHxt2vvSkxsMhqoKao7fMnEsaBCPGEA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zgeTynto; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zgeTynto"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-42f8e736ecaso121145ab.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 12:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760468552; x=1761073352; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+0VBQjB/Y/umPNjaSCDtCDnZ/a1hFSIuSC3lykWc04=;
        b=zgeTyntorMNyfZ9vmIBjmQza5LaYMT+gUbaGhMcBOLySTn8T2ztBoBhjZy4Jdbz5Nz
         JWK0kbPYHjrtQ04mTs53aLNnj5T3jqGiskNHQvGXAVVz1zTA7KlQspJcs3DrhU5zEhBl
         hNV43r8rQzWIkuNTybk6PZph6EcqrZnqrVjcotpvshN5gYfvYtNCXoIDuaK2uO4NWhtN
         nyDljm/sOpUYOMY34hemsCvyhla9qZ+sH2Fxp0gU3LDjybYPVXw3UhTKmNg/KUU9e3Mc
         cds5e4WP0dqXCxvdu8yiteo+TjcSpxYTTAXkBlN/9ymRIime2EMUggIp9bNpYynn1h6x
         5Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760468552; x=1761073352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+0VBQjB/Y/umPNjaSCDtCDnZ/a1hFSIuSC3lykWc04=;
        b=Y3mtcSR5jERe/6YSV2BTwNt+GR3x4nyHFSL7s+tqSe86J5uvzT11RfFlwncX/+bsdU
         LNgH+6Xjj0oceRb23BhKsTdLtDIItamQtgOwmDUxXlcuFNIae0Hes7NY9DXHBpu7Loc7
         RAsImmoiVYsVhYohp/XUIbwUf42Z78DCQj9VIGa7/zUmzZ2EHDNjEmImHEdDVbi8H4UC
         M7FkeICsdhEl3xGIkN8GYvy5Z5vqQwJP+MUSKmLg+yPClP9nAK85QC4BVOvvEe2sXAWp
         /m5lNHShyVpSXKy8iAZPlA36/2tmy4T77HHd00wAOd+4J0kGhOdpBrBmZYZxKQefc0Jb
         D58A==
X-Forwarded-Encrypted: i=1; AJvYcCVzc7u2dp1PS5dgzPOoNjutgnP+MyExghNA+yQ6N7GyxufISrQbhPXQNCyAMpcZmVUvKPdwJ08wux1WkwJV@lists.linux.dev
X-Gm-Message-State: AOJu0YyFcd1/Xpj+2xUGfHGovjnYaO1N8/TidFewju//nqmmTMSKvTJt
	0wsrtNUPIjopM2oxm8Zc1Iqgb8fwlykNR8r5sQykdLbR72fvLavDreiBHlaZxBpY0uFR7+paCTD
	X6YMlx5YapObZjhXfN1NGVtzwWAOi3Qwj1V5oqjA+
X-Gm-Gg: ASbGncv23NMJX9VXtJRptGzf9FIjXumtU/vL4XFqzBXqqGMzN/NV6iSTfqhvKCxzrvH
	K56VA1AKWwX+oqSxoIonzJjipKlJsAquQVgTVYzW7aE/dSke/w1nhR4yoT07fajCQUND4mFStes
	eXRit+4zpNSEc9Wl3V8P6UHuViIHBUdnr9Sj9FyV1/UnTXJ9hGCI81c7avTyc/oertQGd+gaxMV
	q8N8jXrtnrjM2YuBSePHk8CSByYChcSDO+RdmN4/KLTCz7rKqZteCEvlotrNUOVN+bSVvQ4Dw==
X-Google-Smtp-Source: AGHT+IEUnstB8sZX0JOXzoER7Tbrl36eDkG2+ANOE5b0GFme/ecO+Kt2I36cAn6tEhvwrOSVSyGRsoNTdA/Kl7ZBG2g=
X-Received: by 2002:a05:622a:1e86:b0:4e5:7832:45b9 with SMTP id
 d75a77b69052e-4e8830bc344mr213371cf.9.1760468551644; Tue, 14 Oct 2025
 12:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010210134.2066321-2-xur@google.com> <aOsOyf3HHzTy23+b@rli9-mobl>
In-Reply-To: <aOsOyf3HHzTy23+b@rli9-mobl>
From: Rong Xu <xur@google.com>
Date: Tue, 14 Oct 2025 12:02:19 -0700
X-Gm-Features: AS18NWD7EPq_DfBbzf6-L2iKu6NA5tQZvgCFEqNW3zDUgwkmUpW71hzrYnwMQRk
Message-ID: <CAF1bQ=T3hMROdSqGOZ7W_=iThtJHEoxNF+sfdAnGS2npecgRyw@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
To: kernel test robot <lkp@intel.com>
Cc: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Yabin Cui <yabinc@google.com>, Sriraman Tallam <tmsriram@google.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These new warnings are legit. We now pass LDFLAGS_vmlinux to the
linker with the orphan-handling option set to the appropriate warning
level. These warnings are similar to other existing warnings in the
buildlog and they are legit.

-Rong


On Sat, Oct 11, 2025 at 7:13=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on kees/for-next/kspp]
> [also build test WARNING on linus/master v6.17 next-20251010]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbu=
ild-Disable-AutoFDO-and-Propeller-flags-for-kernel-modules/20251011-050345
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git fo=
r-next/kspp
> patch link:    https://lore.kernel.org/r/20251010210134.2066321-2-xur%40g=
oogle.com
> patch subject: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags fo=
r kernel modules
> :::::: branch date: 26 hours ago
> :::::: commit date: 26 hours ago
> config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/2025=
1012/202510120641.H3SMaB6Q-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251012/202510120641.H3SMaB6Q-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202510120641.H3SMaB6Q-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> powerpc-linux-ld: warning: orphan section `.head.text' from `arch/powe=
rpc/kernel/head_book3s_32.o' being placed in section `.head.text'
> >> powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/po=
werpc/kernel/head_book3s_32.o' being placed in section `__ftr_alt_97'
> >> powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch=
/powerpc/kernel/head_book3s_32.o' being placed in section `__mmu_ftr_fixup'
> >> powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/pow=
erpc/kernel/head_book3s_32.o' being placed in section `__ftr_fixup'
> >> powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/fpu.o' being placed in section `.export_symbol'
> >> powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/=
main.o' being placed in section `.export_symbol'
> >> powerpc-linux-ld: warning: orphan section `.init.text' from `init/main=
.o' being placed in section `.init.text'
> >> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/=
main.o' being placed in section `.rodata.str1.4'
> >> powerpc-linux-ld: warning: orphan section `__bug_table' from `init/mai=
n.o' being placed in section `__bug_table'
> >> powerpc-linux-ld: warning: orphan section `.ref.text' from `init/main.=
o' being placed in section `.ref.text'
> >> powerpc-linux-ld: warning: orphan section `.text.unlikely' from `init/=
main.o' being placed in section `.text.unlikely'
> >> powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `i=
nit/main.o' being placed in section `.data..read_mostly'
> >> powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from =
`init/main.o' being placed in section `.data..ro_after_init'
> >> powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`init/main.o' being placed in section `.discard.addressable'
> >> powerpc-linux-ld: warning: orphan section `.init.data' from `init/main=
.o' being placed in section `.init.data'
> >> powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/ma=
in.o' being placed in section `.init.rodata'
> >> powerpc-linux-ld: warning: orphan section `.init.setup' from `init/mai=
n.o' being placed in section `.init.setup'
> >> powerpc-linux-ld: warning: orphan section `__param' from `init/main.o'=
 being placed in section `__param'
> >> powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/=
version.o' being placed in section `.export_symbol'
> >> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/=
version.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `init/vers=
ion.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`init/version.o' being placed in section `.discard.addressable'
>    powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/ve=
rsion.o' being placed in section `.init.rodata'
>    powerpc-linux-ld: warning: orphan section `.init.setup' from `init/ver=
sion.o' being placed in section `.init.setup'
>    powerpc-linux-ld: warning: orphan section `.note.Linux' from `init/ver=
sion.o' being placed in section `.note.Linux'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `init/do_m=
ounts.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/=
do_mounts.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.text.unlikely' from `init/=
do_mounts.o' being placed in section `.text.unlikely'
>    powerpc-linux-ld: warning: orphan section `.init.data' from `init/do_m=
ounts.o' being placed in section `.init.data'
>    powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/do=
_mounts.o' being placed in section `.init.rodata'
>    powerpc-linux-ld: warning: orphan section `.init.setup' from `init/do_=
mounts.o' being placed in section `.init.setup'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/=
noinitramfs.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `init/noin=
itramfs.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.initcallrootfs.init' from =
`init/noinitramfs.o' being placed in section `.initcallrootfs.init'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/=
init_task.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`init/init_task.o' being placed in section `.discard.addressable'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/cputable.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/cputable.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/cputable.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/cputable.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from =
`arch/powerpc/kernel/cputable.o' being placed in section `.data..ro_after_i=
nit'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/cputable.o' being placed in section `.discard.addressa=
ble'
>    powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powe=
rpc/kernel/cputable.o' being placed in section `.init.data'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/irq.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/irq.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/irq.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/irq.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `a=
rch/powerpc/kernel/irq.o' being placed in section `.data..read_mostly'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/irq.o' being placed in section `.discard.addressable'
>    powerpc-linux-ld: warning: orphan section `.static_call_sites' from `a=
rch/powerpc/kernel/irq.o' being placed in section `.static_call_sites'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/align.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powe=
rpc/kernel/align.o' being placed in section `__ex_table'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/align.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powe=
rpc/kernel/signal_32.o' being placed in section `__ex_table'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/signal_32.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/pmc.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/pmc.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/pmc.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/pmc.o' being placed in section `.discard.addressable'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/vdso.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/vdso.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/vdso.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from =
`arch/powerpc/kernel/vdso.o' being placed in section `.data..ro_after_init'
>    powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch=
/powerpc/kernel/vdso.o' being placed in section `.initcall3.init'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/process.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/process.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/process.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/=
powerpc/kernel/process.o' being placed in section `.text.unlikely'
>    powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/po=
werpc/kernel/process.o' being placed in section `__ftr_alt_97'
>    powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/pow=
erpc/kernel/process.o' being placed in section `__ftr_fixup'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/process.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powe=
rpc/kernel/process.o' being placed in section `__ex_table'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/process.o' being placed in section `.discard.addressab=
le'
>    powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/po=
werpc/kernel/process.o' being placed in section `.init.rodata'
>    powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/pow=
erpc/kernel/process.o' being placed in section `.init.setup'
>    powerpc-linux-ld: warning: orphan section `.initcallearly.init' from `=
arch/powerpc/kernel/process.o' being placed in section `.initcallearly.init=
'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/idle.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/idle.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/idle.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/idle.o' being placed in section `.discard.addressable'
>    powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/po=
werpc/kernel/idle.o' being placed in section `.init.rodata'
>    powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/pow=
erpc/kernel/idle.o' being placed in section `.init.setup'
>    powerpc-linux-ld: warning: orphan section `.initcall6.init' from `arch=
/powerpc/kernel/idle.o' being placed in section `.initcall6.init'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/signal.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/signal.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/sysfs.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/sysfs.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/sysfs.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/sysfs.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/sysfs.o' being placed in section `.discard.addressable=
'
>    powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch=
/powerpc/kernel/sysfs.o' being placed in section `.initcall4.init'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/cacheinfo.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/cacheinfo.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.data..once' from `arch/pow=
erpc/kernel/cacheinfo.o' being placed in section `.data..once'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/time.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/time.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/time.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.data..once' from `arch/pow=
erpc/kernel/time.o' being placed in section `.data..once'
>    powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `a=
rch/powerpc/kernel/time.o' being placed in section `.data..read_mostly'
>    powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from =
`arch/powerpc/kernel/time.o' being placed in section `.data..ro_after_init'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/time.o' being placed in section `.discard.addressable'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/prom.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/prom.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/prom.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/prom.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/prom.o' being placed in section `.discard.addressable'
>    powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powe=
rpc/kernel/prom.o' being placed in section `.init.data'
>    powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/po=
werpc/kernel/prom.o' being placed in section `.init.rodata'
>    powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/pow=
erpc/kernel/prom.o' being placed in section `.init.setup'
>    powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powe=
rpc/kernel/traps.o' being placed in section `__ex_table'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/traps.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/pow=
erpc/kernel/traps.o' being placed in section `__bug_table'
>    powerpc-linux-ld: warning: orphan section `.noinstr.text' from `arch/p=
owerpc/kernel/traps.o' being placed in section `.noinstr.text'
>    powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/=
powerpc/kernel/traps.o' being placed in section `.text.unlikely'
>    powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/=
powerpc/kernel/setup-common.o' being placed in section `.export_symbol'
>    powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/=
powerpc/kernel/setup-common.o' being placed in section `.rodata.str1.4'
>    powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/=
powerpc/kernel/setup-common.o' being placed in section `.text.unlikely'
>    powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powe=
rpc/kernel/setup-common.o' being placed in section `.init.text'
>    powerpc-linux-ld: warning: orphan section `.discard.addressable' from =
`arch/powerpc/kernel/setup-common.o' being placed in section `.discard.addr=
essable'
>    powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powe=
rpc/kernel/setup-common.o' being placed in section `.init.data'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
