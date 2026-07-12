Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEB726ED59;
	Sun, 12 Jul 2026 20:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783888920; cv=none; b=dTa+eqUBZTFFT2RushhBugnFrtKkY2raLxbYbdtConM8r392ryKvDhq3jZ4/bgjmnBvCF7kTEkZzvqL/x2Kz8AkQ9NVxhgz/sWVq9PDc904X4juegcEbYtNIRE6ynU62ietlOrQVWT177ZnksGnpYDBhYWfhbAcwQINVF0JWoRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783888920; c=relaxed/simple;
	bh=csfn0ppYkXTkR8w4JoEkUhf7wE3SMNugJFpJqqALljw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stOIQ3RKzq4lIyNIXf51j+T86l15wkplc8t20sLApVmFl6BVtJ8YzpeU1TOJ4onnZWyRwD3tQpBOJ8agWyHU+YT7Dlx6LBdcmhxfWOoy/DEWQ7tD5PAdukSGLpYIylYfjd6eIk3EPxZE9zGXY79VIXW5j3bW+7wB4BZmdP6cZkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEOM0U3F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEOM0U3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5361F000E9;
	Sun, 12 Jul 2026 20:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783888919;
	bh=dLSOU1pu1ktkGkfXBrA/niWmFzF/2hu1aOV2pcJShT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cEOM0U3FTXpjGbKvwi2BsxSK3Adb/46B8+sOF4GTAu9znEAWAcy7jtUjkl+qABedI
	 zKTYYvkIk8AezlUq1AXW2h2gWyW7Cx1dqHSJIrkyareOI5dmHZREAXhjRdbwJ8bfkG
	 pMfuhJRyGhd+zjb/rM+tTcqnvXhfJXObtqAm0EKo8op+jBBoNDCHirVwMJ+gFjUBSK
	 4WAnVpHe6n7JpTjygZsz66snFSNi79CT/rE84DhSEUs7m+vgkhlXhJA55N4QYQ5GXa
	 vkY18dSaOvyGhgaYr+qPFOTxqxX3LZYa2ZWm7NjCDi9apz/jrf7oW6wAIwlfK0IbwG
	 etBry/xh8LUog==
Date: Sun, 12 Jul 2026 16:41:54 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Feng Tang <feng.tang@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against
 symbol 'init_task'; recompile with -fPIC
Message-ID: <20260712204154.GB1697833@ax162>
References: <202607100652.WPUlEAfx-lkp@intel.com>
 <alBeJUafPKhx8RMS@U-2FWC9VHC-2323.local>
 <37fe4a15-e51b-411e-9667-a1c670f413e1@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

This does not reproduce with either the GNU toolchain or LLVM + the GNU
assembler. It only reproduces with clang's integrated assembler. I am
pretty sure I have seen this error before so I suspect that this
bisection is bogus like mentioned below.

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
> 

-- 
Cheers,
Nathan
