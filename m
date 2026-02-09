Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4193A25DB12
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770672553; cv=none; b=P14PxHWgYp3yfbb0L0gHUaeQbwVyOj0G+8Zmocpbupysz+0M/FNkbv9bVk7eBQre3c4l/7REVATTI00DGvMNsEfJ8Tt34ODEr2Rd0plvSRrB33/Eb3oA9QblOxD72GIz0h2DtaakfeTzotbTDXtffbjmWV3y2vrX6c83bXpUAgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770672553; c=relaxed/simple;
	bh=/LgTZaFAZUNNIfQzp485GxUHPXvcIVujUCeyp+eVHcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9zmJUNxCCLxaAeAl6Tx9FYWgnFlX2dBku1il9wI0PJixFlxBpv2UgnVGML5gxmxpWytvf3xTnccVVvxFOdMtoN6oLdB9Bp+bHx7MCU8mgaoVEHZ4R0TtVbbEopIFrhsa5PYKXdZ4D6QwdvGKiN3RwkwHuAJIop/hamDQjdb4jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ag4PY2H/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ag4PY2H/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770672553; x=1802208553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/LgTZaFAZUNNIfQzp485GxUHPXvcIVujUCeyp+eVHcM=;
  b=ag4PY2H/ozyBrF13boF7EIHz0oNwGBzoyt26iV4mh8BMvLl++yCb7C4N
   GJu+7QrGGYR3kb9s9mTWdNJOPOPzJcDwIK9urUWhhaUmjh7lt5NlbQMj9
   1LLp6mgPzWPOB00vIpa8QWofwMN8gcbvb0AcGvTPQjEr9U1ooYWf8eEW9
   dfBcZAXbJeUTzfPRuWoNuG23WpVnDpw6Hfz8OcDZMMrjqbn9Q+KiGRX1C
   v9tiyM7afL3xisz58Xga7EInUmB9COM6EJVWigZeV5VYXXMBnesbTtSHn
   LuSontS44lpD1DXX36YqZ0M7pC8ryEmqkFXmp6RQCwezINfabdGQdpHO5
   A==;
X-CSE-ConnectionGUID: SckWGKUdT/mMR81T1Tpdbw==
X-CSE-MsgGUID: wuysHystT3Oe+DreoIwu8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94436788"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="94436788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:29:12 -0800
X-CSE-ConnectionGUID: sEi5dmbeT16QxMnqFyoBcA==
X-CSE-MsgGUID: pA6FxwJHSTe0l9IABqA+Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="242322031"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Feb 2026 13:29:05 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpYoU-000000000TN-1pHD;
	Mon, 09 Feb 2026 21:28:58 +0000
Date: Mon, 9 Feb 2026 22:28:43 +0100
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com,
	kees@kernel.org, elver@google.com, arnd@arndb.de,
	lirongqing@baidu.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
Message-ID: <202602092246.ZOtmGYe8-lkp@intel.com>
References: <20260209095931.2813152-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209095931.2813152-2-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes arm64/for-next/core tip/x86/core next-20260209]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/crash-Exclude-crash-kernel-memory-in-crash-core/20260209-180157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209095931.2813152-2-ruanjinjie%40huawei.com
patch subject: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260209/202602092246.ZOtmGYe8-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092246.ZOtmGYe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092246.ZOtmGYe8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/powerpc/include/asm/kexec.h:126,
                    from ./include/linux/kexec.h:38,
                    from init/initramfs.c:604:
>> ./arch/powerpc/include/asm/kexec_ranges.h:7:32: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
       7 | void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
         |                                ^~~~~~~~~
--
   In file included from ./arch/powerpc/include/asm/kexec.h:126,
                    from ./include/linux/kexec.h:38,
                    from arch/powerpc/kexec/ranges.c:20:
>> ./arch/powerpc/include/asm/kexec_ranges.h:7:32: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
       7 | void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
         |                                ^~~~~~~~~
>> arch/powerpc/kexec/ranges.c:146:6: error: conflicting types for 'sort_memory_ranges'; have 'void(struct crash_mem *, bool)' {aka 'void(struct crash_mem *, _Bool)'}
     146 | void sort_memory_ranges(struct crash_mem *mem_rngs, bool merge)
         |      ^~~~~~~~~~~~~~~~~~
   ./arch/powerpc/include/asm/kexec_ranges.h:7:6: note: previous declaration of 'sort_memory_ranges' with type 'void(struct crash_mem *, bool)' {aka 'void(struct crash_mem *, _Bool)'}
       7 | void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
         |      ^~~~~~~~~~~~~~~~~~


vim +146 arch/powerpc/kexec/ranges.c

180adfc532a83c Hari Bathini 2020-07-29  138  
180adfc532a83c Hari Bathini 2020-07-29  139  /**
180adfc532a83c Hari Bathini 2020-07-29  140   * sort_memory_ranges - Sorts the given memory ranges list.
180adfc532a83c Hari Bathini 2020-07-29  141   * @mem_rngs:           Range list to sort.
180adfc532a83c Hari Bathini 2020-07-29  142   * @merge:              If true, merge the list after sorting.
180adfc532a83c Hari Bathini 2020-07-29  143   *
180adfc532a83c Hari Bathini 2020-07-29  144   * Returns nothing.
180adfc532a83c Hari Bathini 2020-07-29  145   */
180adfc532a83c Hari Bathini 2020-07-29 @146  void sort_memory_ranges(struct crash_mem *mem_rngs, bool merge)
180adfc532a83c Hari Bathini 2020-07-29  147  {
180adfc532a83c Hari Bathini 2020-07-29  148  	int i;
180adfc532a83c Hari Bathini 2020-07-29  149  
180adfc532a83c Hari Bathini 2020-07-29  150  	if (!mem_rngs)
180adfc532a83c Hari Bathini 2020-07-29  151  		return;
180adfc532a83c Hari Bathini 2020-07-29  152  
180adfc532a83c Hari Bathini 2020-07-29  153  	/* Sort the ranges in-place */
180adfc532a83c Hari Bathini 2020-07-29  154  	sort(&(mem_rngs->ranges[0]), mem_rngs->nr_ranges,
180adfc532a83c Hari Bathini 2020-07-29  155  	     sizeof(mem_rngs->ranges[0]), rngcmp, NULL);
180adfc532a83c Hari Bathini 2020-07-29  156  
180adfc532a83c Hari Bathini 2020-07-29  157  	if (merge)
180adfc532a83c Hari Bathini 2020-07-29  158  		__merge_memory_ranges(mem_rngs);
180adfc532a83c Hari Bathini 2020-07-29  159  
180adfc532a83c Hari Bathini 2020-07-29  160  	/* For debugging purpose */
180adfc532a83c Hari Bathini 2020-07-29  161  	pr_debug("Memory ranges:\n");
180adfc532a83c Hari Bathini 2020-07-29  162  	for (i = 0; i < mem_rngs->nr_ranges; i++) {
180adfc532a83c Hari Bathini 2020-07-29  163  		pr_debug("\t[%03d][%#016llx - %#016llx]\n", i,
180adfc532a83c Hari Bathini 2020-07-29  164  			 mem_rngs->ranges[i].start,
180adfc532a83c Hari Bathini 2020-07-29  165  			 mem_rngs->ranges[i].end);
180adfc532a83c Hari Bathini 2020-07-29  166  	}
180adfc532a83c Hari Bathini 2020-07-29  167  }
180adfc532a83c Hari Bathini 2020-07-29  168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
