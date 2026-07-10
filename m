Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385A3DC4A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 09:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676690; cv=none; b=RLOP/1l2te4l8uwU5SE6/gMzru1Xf0Ig5kOcFoTtrs1n46RrNy8foHtqcUoT/sUAV6HQKQ8Iath8kYHKmSVNZEgIrhQOMJQwEvkcpbUjeZKuPG8a96QFkGwSoYnujGQF4bwlXGf9U2leBIvNsKQRnDBZONTh66/+rFIYImwWhn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676690; c=relaxed/simple;
	bh=n5dVZR56QrTg/Ul60zta0d41rZ5y/rUxhI7osvzotYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XB0cpOOP/z5eW6zGoKvdKb8+SJ/Opg8AVMo6I4KU6QssiQWrjLrGzuOyNvPY+jJFNbYCW7car1U55yUfnuJyQNAyVmvZ3M4nJAys/KiiUMFQwOAZF8LLcKcWXJMnpYYOPYYk8r/teNr/3NV3jQ96U4JM/Xk+8yr7U7+Yut5BasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PJdGSXWo; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PJdGSXWo"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783676685; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=0SCLf4a0Hf1R30pugtjRiY04P2OQ/nfMJ2OjDravk6A=;
	b=PJdGSXWoQ7i2lVTubjZXD/xu26/rUFpAACLLnxKVRMlOrjYNURFe+6/0j9paP6Z89nMdmKXl5duXE0fcAwYkuSc5DWEZM3IIMTWaBrVr4htoX/B4CcAbRwQ9zSAFOIkvQ37KS4i57Okl/mf1hgzIgpbsk56JqFCiEWbn+HEFrj4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X6nI9ux_1783676684;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X6nI9ux_1783676684 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Jul 2026 17:44:44 +0800
Date: Fri, 10 Jul 2026 17:44:43 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, lkp@intel.com
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against
 symbol 'init_task'; recompile with -fPIC
Message-ID: <alC_C8KmO0F0Mh6X@U-2FWC9VHC-2323.local>
References: <202607100652.WPUlEAfx-lkp@intel.com>
 <alBeJUafPKhx8RMS@U-2FWC9VHC-2323.local>
 <37fe4a15-e51b-411e-9667-a1c670f413e1@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37fe4a15-e51b-411e-9667-a1c670f413e1@kernel.org>

On Fri, Jul 10, 2026 at 06:33:49AM +0200, Christophe Leroy (CS GROUP) wrote:
> + Clang
> 
> Le 10/07/2026 à 04:51, Feng Tang a écrit :
> > Thanks for the report!
> > 
> > Add Powerpc list.
> 
> This is a Clang build with Clang linker, did you reproduce the problem with
> a normal GCC build ?

I tried the 'reproduce' provided by 0day bot, but it failed early:

	/workspace/feng/ws2/projects/linux-2.6/Makefile:1244: C=1 specified, but sparse is not available or not up to date
	Documentation/.renames.txt: warning: ignored by one of the .gitignore files
	../arch/powerpc/lib/sstep.c:1346:31: error: variable 'rc' set but not used [-Werror,-Wunused-but-set-variable]
	 1346 |         unsigned int opcode, ra, rb, rc, rd, spr, u;
		  |                                      ^
	../arch/powerpc/lib/sstep.c:1350:21: error: variable 'suffix' set but not used [-Werror,-Wunused-but-set-variable]
	 1350 |         unsigned int word, suffix;
		  |                            ^
	2 errors generated.

0day folks, could you help to check? thanks


> Thanks
> Christophe
> 
> > 
> > On Fri, Jul 10, 2026 at 06:18:50AM +0800, kernel test robot wrote:
> > > tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C016c05b801ba48f2593f08dede2e29c2%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639192487094863506%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=fQm6QfsJ2ggaKoRJWCz4dsaquz7Wo3uhRnOexVUrTnQ%3D&reserved=0 master
> > > head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> > > commit: d5cae2261b86913e602452ce4a07e6aefc0f603b dma-contiguous: simplify numa cma area handling
> > > date:   6 weeks ago
> > > config: powerpc-randconfig-r133-20260709 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20260710%2F202607100652.WPUlEAfx-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C016c05b801ba48f2593f08dede2e29c2%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639192487094899182%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=BkT0BYyJtniz6YPzGpYbO0jn2T7vBDBLaK2Tsh1LcnE%3D&reserved=0)
> > > compiler: clang version 21.1.8 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C016c05b801ba48f2593f08dede2e29c2%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639192487094917538%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=5%2BLVtRoojuNbhEMr3BhM2xF50PV%2FIYh%2FWw3ipDIWG%2FY%3D&reserved=0 2078da43e25a4623cab2d0d60decddf709aaea28)
> > > sparse: v0.6.5-rc1
> > > reproduce (this is a W=1 build): (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20260710%2F202607100652.WPUlEAfx-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C016c05b801ba48f2593f08dede2e29c2%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639192487094935016%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BrpcCLuNecZIfyF6N5X%2FFcHhdG9YzLBAErvBGHyjjak%3D&reserved=0)
> > 
> > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > > > ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'init_task'; recompile with -fPIC
> > >     >>> defined in vmlinux.a(init/init_task.o)
> > >     >>> referenced by head_44x.S:101 (arch/powerpc/kernel/head_44x.S:101)
> > >     >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x42) in archive vmlinux.a
> > > --
> > > > > ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'init_thread_union'; recompile with -fPIC
> > >     >>> defined in ./arch/powerpc/kernel/vmlinux.lds:133
> > >     >>> referenced by head_44x.S:108 (arch/powerpc/kernel/head_44x.S:108)
> > >     >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x4e) in archive vmlinux.a
> > 
> > I checked the patch and couldn't find obvious clue between the patch and
> > the error.
> > 
> > commit d5cae2261b8691 only changes kernel/dma/contiguous.c, which is under
> > CONFIG_DMA_CMA per kernel/dma/Makefile. In your config above, CONFIG_DMA_CMA
> > is not even set, so the contigous.c should not be compiled. Could you help
> > to double check? thanks!
> > 
> > - Feng
> > 
> > > Kconfig warnings: (for reference only)
> > >     WARNING: unmet direct dependencies detected for HOTPLUG_CPU
> > >     Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
> > >     Selected by [y]:
> > >     - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]
> > > 
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C016c05b801ba48f2593f08dede2e29c2%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639192487094952205%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=sqz%2BJ2dpT3ZZjlQyyvAhgPdP9jS0kJLpbRKTcV4rM50%3D&reserved=0
> > 
