Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B421019E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766829286; cv=none; b=PIB4hebBWDVUrOmdoc5UNeez/ofGSg6ysUzmhrVmBLXHvTvGg//G0aWFLnX+9yllbcoFHxSYeBsSDjJs9jW5jtt4HOHnSuoc5GF6rfKAuruNFUB6VBBa/r3z4/hlOecDZr9wOTV9wrNWyTgjnNnP5/FrzBSI8WoMY+oMqh55zZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766829286; c=relaxed/simple;
	bh=Ky7LqFUiFeL0ivcTjN19Eav+OqAGEwFRZrjCsNjRqrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sY0UL8V1vhOa6pkKo8UW9c/6BHYw97dI6TZk32UxkZCwSHUfkIvQ8Q1g+Par6aANj2IOa0g7Y6pFSgMQv5p+8b8l/QFPni6jTo7kAc19g0oWcJab1QVnZl1e5htAEJh+9EiGYHmMREqY206su1WODSiryr0qA0PRnO6its2aT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5Fng3ju; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5Fng3ju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766829285; x=1798365285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ky7LqFUiFeL0ivcTjN19Eav+OqAGEwFRZrjCsNjRqrw=;
  b=G5Fng3jupZN5tQkrhwG3pnz5k1sgaDWITE0zBphZGpLX7vG6hxyNiv/6
   skJvv92WTOLFEN6JiLDpd0ndjMltCnIo7n4PU8o7ArihK3g/96RsiuOKf
   6n3+pTRkVfeDZNa0tHb0GKS1UiNxbmJCphYg/cfW6PlRCj2r6w1ygMALu
   yhYHp3Vi1S32eC5JEdEEw6hELMRgts9OWamkdGuRXgp7Ck+18TRNKNFBp
   FpLvkQ1YV365cDeXQbuLuSrUHZeubDrBDzBDDPIrgiNqwAIR0ytzvFPdZ
   36eO2S4oNUJ4+2IQZi9gs4eI6wKG7j4suujQH61p51cMjtqzbz5367Qzu
   g==;
X-CSE-ConnectionGUID: oN4d0pNOTkK6g+sVHiKXWw==
X-CSE-MsgGUID: +9foyHgfQGKcp/wh6AKVIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68429897"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68429897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 01:54:44 -0800
X-CSE-ConnectionGUID: /EliFEKZQeKY1t3uvyxKiw==
X-CSE-MsgGUID: EhErDzhLS2+n1gmfMnjIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="199665797"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2025 01:54:41 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZR0Q-000000005iv-1Rpp;
	Sat, 27 Dec 2025 09:54:38 +0000
Date: Sat, 27 Dec 2025 17:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Wei <lucaswei@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, sjadavani@google.com,
	Lucas Wei <lucaswei@google.com>, stable@vger.kernel.org,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: errata: Workaround for SI L1 downstream coherency
 issue
Message-ID: <202512271720.e5kDPkoP-lkp@intel.com>
References: <20251226074106.3751725-1-lucaswei@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226074106.3751725-1-lucaswei@google.com>

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on arm-perf/for-next/perf arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Wei/arm64-errata-Workaround-for-SI-L1-downstream-coherency-issue/20251226-154541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251226074106.3751725-1-lucaswei%40google.com
patch subject: [PATCH] arm64: errata: Workaround for SI L1 downstream coherency issue
config: arm64-randconfig-r123-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271720.e5kDPkoP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271720.e5kDPkoP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271720.e5kDPkoP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/cpu_errata.c:145:1: sparse: sparse: symbol 'arm_si_l1_workaround_4311569' was not declared. Should it be static?
   arch/arm64/kernel/cpu_errata.c:444:18: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpu_errata.c:445:17: sparse:   also defined here
   arch/arm64/kernel/cpu_errata.c:450:18: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpu_errata.c:451:17: sparse:   also defined here
   arch/arm64/kernel/cpu_errata.c:757:17: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpu_errata.c:758:18: sparse:   also defined here

vim +/arm_si_l1_workaround_4311569 +145 arch/arm64/kernel/cpu_errata.c

   143	
   144	#ifdef CONFIG_ARM64_ERRATUM_4311569
 > 145	DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
   146	static int __init early_arm_si_l1_workaround_4311569_cfg(char *arg)
   147	{
   148		static_branch_enable(&arm_si_l1_workaround_4311569);
   149		pr_info("Enabling cache maintenance workaround for ARM SI-L1 erratum 4311569\n");
   150	
   151		return 0;
   152	}
   153	early_param("arm_si_l1_workaround_4311569", early_arm_si_l1_workaround_4311569_cfg);
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
