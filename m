Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868EC132
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 05:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721454782; cv=none; b=LPLI9KaXbiSrObeyB2Utg2KinGLJT0AE7yCBw65TWbDeN/uTTyj3nIlQ34tO9RTWsMoqfk811NXC8AqT1wGAVn1/WUiiN8ErYfyGfsrmrmUpB0/S6LT76O23q02AX+76gYtCE5ncNDzkjcast1Jcc1tN/9shdpECs/0+I80Emog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721454782; c=relaxed/simple;
	bh=UeO3G7NkIzQBPpyoL2rDY32NGhukDMyOmDw7qfhTgGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3vPrT/GAikbBT0piUNOCFCDURf0Qzhd293nd7shNWzImHdyhEf8MgAM/4bN977XW6KqxaRZCCfBQLCohJt8VpBYjJBTPSBb5liDFleRPM6tSLj4jVMXUxk59R6aEaf328GosgjdtSgFwfRkk2zqKrZe3iU/LbilSwsxrRy58SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STDj8bgf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STDj8bgf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C54C4AF0B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 05:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721454782;
	bh=UeO3G7NkIzQBPpyoL2rDY32NGhukDMyOmDw7qfhTgGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=STDj8bgf91byztxi0xlVuMG+p5+z+BjNQC9B1zaz2tQ8edNXfDWk4+gH9ErOm8pvY
	 hmavGFIZ6MWm9nYyRuUejmqsDsuDeAa6TeVodQWclcfsI8oIUsS4ddA8QcFzKd+kpW
	 PDBjvYeQGVnK/ErATiskTChhtIkLA1WG+iqydBnSOFX0+lMyw8QDG1KzVDndEEd509
	 K0tcBH0RL0nv4XqGVoYdo5AhRGFioj2bTCQPtn2tzeiSk6eIwIEbYuG+YN4wXM9zNj
	 MdaupLH6m4n49iHkXupovBujs9V7SFRMSH4RH39kpKEbOBfEUBXYTBM2xvLnh9oYQk
	 csVhZuIhxXnJA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eeb2d60efbso39837001fa.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 22:53:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTwP93TO/E6BGn8fvrAU7b6ApKpn7NsJ9LBvSggDjNNNBS1iTFte9WoPvdyIEHdSGO79i1Tng60IHWhDnYb+0L9F3LkYvDoeXCjirc/w==
X-Gm-Message-State: AOJu0YwENc4+kJQa0gssWYE1hOis2sdAnJrtGlaGV02yuUm8OJPX7l3o
	Fy5vofiNSGe9qgLTkAS+AFKgtwcLuf1wFq3ETsgbqAR9zyps4tZ+W8BLFnWBly+D/JiphIie8FV
	4Ni9ukerRmLL6Z9FKld9VfrDrG64=
X-Google-Smtp-Source: AGHT+IGuxYsj+teUSsDmP5OkxvJFSZxGtcEgk8xrflEw4gEe6H9eH+x5HhbMa6R7VKtCOtM/o/QYthKiD8LEp7kpMuw=
X-Received: by 2002:a2e:90d7:0:b0:2ee:8ce9:5ad2 with SMTP id
 38308e7fff4ca-2ef167a3da0mr10089341fa.23.1721454780524; Fri, 19 Jul 2024
 22:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407201336.mW8dj1VB-lkp@intel.com>
In-Reply-To: <202407201336.mW8dj1VB-lkp@intel.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 20 Jul 2024 13:52:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Baxm_V=cjcJe5HN1ej7LWhvUL7fdWA1awGwf6VK06zA@mail.gmail.com>
Message-ID: <CAAhV-H6Baxm_V=cjcJe5HN1ej7LWhvUL7fdWA1awGwf6VK06zA@mail.gmail.com>
Subject: Re: [chenhuacai-loongson:loongarch-next 5/18] arch/loongarch/kernel/syscall.o:
 warning: objtool: do_syscall+0x11c: return with modified stack frame
To: kernel test robot <lkp@intel.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

Can this warning be fixed? Or we can only use
STACK_FRAME_NON_STANDARD(do_syscall) to skip it?

Huacai

On Sat, Jul 20, 2024 at 1:06=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-=
loongson.git loongarch-next
> head:   14c860e4d30d97502271d5c19474c8561ba06c98
> commit: a196fe59bfa2120d0625afd2b3cc72050a7260fa [5/18] LoongArch: Add RA=
NDOMIZE_KSTACK_OFFSET support
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/2024=
0720/202407201336.mW8dj1VB-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240720/202407201336.mW8dj1VB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407201336.mW8dj1VB-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> arch/loongarch/kernel/syscall.o: warning: objtool: do_syscall+0x11c: r=
eturn with modified stack frame
>
>
> objdump-func vmlinux.o do_syscall:
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
