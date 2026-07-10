Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368335E953
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 02:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651889; cv=none; b=DdLwqdx4sNQMBxzX1ZeW9CJYchBweL92lcCZBiE6avcgtSCJ4BtKHPnP+k1hmTvJg229hHDzij+76ZWq1Cwu+Qvc78SlbH8YBoBruJLjQNKKg+x66VE1eqCSX5D5WSwzPsvfWOHuA5bEV8PIalzZYvdt8d4ih6Hg4SkqwsHkR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651889; c=relaxed/simple;
	bh=ldLrbVu1CrDZlABh6sQCF2O6+FC7TBAzDRxOjyIlTUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLyodU9prYxI5YZrMkhq8iSrEXK9TUivDBtvlaGXF5QtZtjh4huIQ/IrQGd9qOXDcdS77B8IgDs1pbWCi78THP6jjpun3yVBX0ps5jEJ35mAtPmisDiqCM7hNsu+zuWTAYg3bIsTFoz9Zm+sD3THIqs8jzAlKxGIwdKodVTya6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sbwoLXAX; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sbwoLXAX"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783651879; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=lUrJGNdkgOLm/MDj00ePOaZ/7kLX0+V9Jpn17brXOZc=;
	b=sbwoLXAXpohyRU18GT1x04RnY3U2YQUEiEsMpaTaLWnUHJAw5cuG2u5EGPta2zSNzBAYWvuxEO/lABv2UHjkwefh3edC8M0y9jl24iCucaMSAsyyYCFAbgxwc2Qrm3EpBF73rF1V/48orayCg0bUfZK6NuBYqKRMJTY5ps55rAY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X6mEdSu_1783651878;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X6mEdSu_1783651878 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Jul 2026 10:51:18 +0800
Date: Fri, 10 Jul 2026 10:51:17 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against
 symbol 'init_task'; recompile with -fPIC
Message-ID: <alBeJUafPKhx8RMS@U-2FWC9VHC-2323.local>
References: <202607100652.WPUlEAfx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202607100652.WPUlEAfx-lkp@intel.com>

Thanks for the report!

Add Powerpc list.

On Fri, Jul 10, 2026 at 06:18:50AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> commit: d5cae2261b86913e602452ce4a07e6aefc0f603b dma-contiguous: simplify numa cma area handling
> date:   6 weeks ago
> config: powerpc-randconfig-r133-20260709 (https://download.01.org/0day-ci/archive/20260710/202607100652.WPUlEAfx-lkp@intel.com/config)
> compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100652.WPUlEAfx-lkp@intel.com/reproduce)


> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'init_task'; recompile with -fPIC
>    >>> defined in vmlinux.a(init/init_task.o)
>    >>> referenced by head_44x.S:101 (arch/powerpc/kernel/head_44x.S:101)
>    >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x42) in archive vmlinux.a
> --
> >> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'init_thread_union'; recompile with -fPIC
>    >>> defined in ./arch/powerpc/kernel/vmlinux.lds:133
>    >>> referenced by head_44x.S:108 (arch/powerpc/kernel/head_44x.S:108)
>    >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x4e) in archive vmlinux.a

I checked the patch and couldn't find obvious clue between the patch and
the error.

commit d5cae2261b8691 only changes kernel/dma/contiguous.c, which is under
CONFIG_DMA_CMA per kernel/dma/Makefile. In your config above, CONFIG_DMA_CMA
is not even set, so the contigous.c should not be compiled. Could you help
to double check? thanks!

- Feng

> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HOTPLUG_CPU
>    Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
>    Selected by [y]:
>    - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
