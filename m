Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BDD1F95E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725865113; cv=none; b=WTn8bBTMX7IVi6iXtaPJgJJScobWk3pN0MzyRROzhAxo3UOFd6nNML6PJScV4k4gjInif2X0w7ZH2v+D4UhBxZUWGJ7OuthHGVb9atnUJs4FgRRqwM9fwviy+sdZC4hZiYFEfR5vl69X8nd8zlnZ7ig+0sR50uCWy55phqU3Djs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725865113; c=relaxed/simple;
	bh=/z99RsFo7w2oE3PEqci8rQnLp8xjxYvVxEkJkCN24JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKPoZyuamPt7IVk1rdPlkn+dOq3zEy8VI/yCh2ehU3E1WsKbUDDA451Vt5AavMOqgZ08s73SH7kN59CWSF5uBCt3uxifYEprP5f1t/l2LT8tui3ucbiQ8zdaK6g7YSefTLaJuONr4HkjNmODUUQvBfcTgk8PixGbkSZZcWU1B5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfeE74hi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfeE74hi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3EDC4CECC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 06:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725865112;
	bh=/z99RsFo7w2oE3PEqci8rQnLp8xjxYvVxEkJkCN24JY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IfeE74hioku44MQ4zrKTZE1xxaZ+eP1gGsZZ5o+4DlzTsdcVDsa8Gqc9IYeN0t5e+
	 O9uXEEVCu8J31BEF8j9V8Wh4UyfXJ8iHHykXhC3va3T4y2Lh0rdFtfpwSkWWFAjrdf
	 ffNDmDqS/qOWHRdwu//xRR7R2VaLcPzsx5K6JHn2P7Uzoon/+96DmBM2yspSshagji
	 CuYYhCxt2v5gwWIKptaobRiXg6L9vlgCWyD40QmEvJUwAIXNssdJIDgN0BjIiDlTwm
	 aQ8TssBMxkvij9hRtEVW9SBQs6RqSmCNAsRBl6eFf+zJAa6xdVeEnvQd2yB01j/55T
	 RqdHqS645Sy5A==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f760f7e25bso9506981fa.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Sep 2024 23:58:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YyCuNOOiF5eRn5bn1ksbPGKh9MwcJMCw0nNFN9Bko0BDq0nenWV
	W0HW2791Wv2jB3SjPO2BFlN5yVP9rc3fBEJXSq5Pot1OCM0/x/WxhMajp8KGxGYWP0cdQunNtbf
	cTfjuv9SGT08l3Apxy8tLQ9H/0/0=
X-Google-Smtp-Source: AGHT+IF5OEqeNF5Fqa7J0qieFGJU57lGv+I41m2QE2gCCumc1nnaPRcN/gYdwvYhvKw5Z2tcmHfGaGdHxYPt6gkVoMY=
X-Received: by 2002:a05:6512:3b89:b0:536:550e:7804 with SMTP id
 2adb3069b0e04-536587b3466mr3826751e87.18.1725865111492; Sun, 08 Sep 2024
 23:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409090249.milE4bxu-lkp@intel.com>
In-Reply-To: <202409090249.milE4bxu-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Sep 2024 15:57:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQ2miUvSo7GJvGCoUimS1MxKkXC8HKWJoqGsCBwcSOww@mail.gmail.com>
Message-ID: <CAK7LNASQ2miUvSo7GJvGCoUimS1MxKkXC8HKWJoqGsCBwcSOww@mail.gmail.com>
Subject: Re: [masahiroy:kbuild 27/30] make[3]: *** No rule to make target
 'arch/powerpc/boot/cuImage.katmai', needed by 'arch/powerpc/boot/zImage'.
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 3:49=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git kbuild
> head:   4dda2081d84398248af60da1d519840a5d6e3390
> commit: e6abfb536d16cc9264c4d92b429934f92adf5285 [27/30] kbuild: split de=
vice tree build rules into scripts/Makefile.dtbs
> config: powerpc-katmai_defconfig (https://download.01.org/0day-ci/archive=
/20240909/202409090249.milE4bxu-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240909/202409090249.milE4bxu-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409090249.milE4bxu-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> make[3]: *** No rule to make target 'arch/powerpc/boot/cuImage.katmai'=
, needed by 'arch/powerpc/boot/zImage'.
>    make[3]: Target 'arch/powerpc/boot/zImage' not remade because of error=
s.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


Thanks.
I will fix as follows:



diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6385e7aa5dbb..8403eba15457 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -444,7 +444,7 @@ ifneq ($(userprogs),)
 include $(srctree)/scripts/Makefile.userprogs
 endif

-ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb.o %.dtbo.o,$(targets)=
),)
+ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o
%.dtbo.o,$(targets)),)
 include $(srctree)/scripts/Makefile.dtbs
 endif




--=20
Best Regards
Masahiro Yamada
