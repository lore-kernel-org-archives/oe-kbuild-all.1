Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076AB2DE6E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 01:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787794547; cv=none; b=m5WKX3Vtt5F82cRbRZjd+JDYwsV1rOHke5KO+OT6dwjYzVhuxue3HmEv1s0bNS9uMdONmsntORR68uOH85SVFO81VT8S4o59bd/BHdCUxARpoN2YN/UAxF/0BRVwx+QG2aLgjDbF8cOkTP7wXadwgvVV8RRtie6w33Pfdq5OVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787794547; c=relaxed/simple;
	bh=ZXvDOQhI2Trm9ROxIjerspnQL3PLWp+eTpsSKkJVJ64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArDk7U4+EshjGYQxPQMw4YdGf62EngjOfrvx0/IMUM1nlqqPAAxk5I3a2QTUkmUG1DnrjwknNpxY8Xv+5o8O7p/nRRcN9OCCdO/h/XnezLtO248C7txsZ4SmG8HqBu7emVz77mPY7K6AM3oiifXUoHEaDQ2b4eJldIQYTT65wt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KMxa+b9H; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KMxa+b9H"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 683EE1691;
	Wed, 26 Aug 2026 18:35:38 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A20F3F85F;
	Wed, 26 Aug 2026 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787794542; bh=ZXvDOQhI2Trm9ROxIjerspnQL3PLWp+eTpsSKkJVJ64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMxa+b9HDWX+IRGb9CQ5mody6Fh6iCREWu6x2AZ0wKXCsb20TwxnOoM6SD8u3F9uP
	 6EYxpFFWdtZYqM3HGGL3qSFEg0Abhfj1zj4rq5OakHJjtVLqweY/WYJtgCJK55hHrG
	 zSw4LWmaNh3CWb1/Jy+L51fJGL2KHVT68PoRdcmY=
Date: Thu, 27 Aug 2026 02:35:38 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, oe-kbuild-all@lists.linux.dev,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [davidhildenbrand:get_dummy 14/21]
 include/linux/pgtable.h:2351:13: error: implicit declaration of function
 'mm_pmd_folded'
Message-ID: <ao-UalxycPEPmumX@e129823.arm.com>
References: <202608270845.raYtE0vt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608270845.raYtE0vt-lkp@intel.com>

Hi,

> Hi Yeoreum,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://github.com/davidhildenbrand/linux get_dummy
> head:   112a153a97494becabd764fe6257578ba908801f
> commit: db92928e80f5332bbfca9a70beaef62d46a0c9de [14/21] x86: mm: carve out the generic compile-time folded pgtable case in effective_prot()
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260827/202608270845.raYtE0vt-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608270845.raYtE0vt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608270845.raYtE0vt-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/mm.h:31,
>                     from include/linux/cpuset.h:17,
>                     from kernel/sched/sched.h:33,
>                     from kernel/sched/rq-offsets.c:5:
>    include/linux/pgtable.h: In function 'mm_first_pgtable_level':
> >> include/linux/pgtable.h:2351:13: error: implicit declaration of function 'mm_pmd_folded' [-Wimplicit-function-declaration]
>     2351 |         if (mm_pmd_folded(mm))
>          |             ^~~~~~~~~~~~~
> >> include/linux/pgtable.h:2353:13: error: implicit declaration of function 'mm_pud_folded' [-Wimplicit-function-declaration]
>     2353 |         if (mm_pud_folded(mm))
>          |             ^~~~~~~~~~~~~
> >> include/linux/pgtable.h:2355:13: error: implicit declaration of function 'mm_p4d_folded' [-Wimplicit-function-declaration]
>     2355 |         if (mm_p4d_folded(mm))
>          |             ^~~~~~~~~~~~~
>    make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1410: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.

This is known issue and fixed at internal review version 6.

Thanks!

[..snipped..]

-- 
Sincerely,
Yeoreum Yun
