Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A151CD22
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 18:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705428990; cv=none; b=RbZPz8bZpqaHa9lb4xsmY4LV6eioXXdab/xOtlgCZ718HUL5BXvkef048yv/qkNWUkNqeg80zvfz69wPAf9ukWS0alaltInotTaa8Y1SDseyi6N4UV9/tbcP/SdYLMdr+625tjr15Uh/U9d3b9Zf5dlLYIW1LomPzKQKn4yOBy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705428990; c=relaxed/simple;
	bh=x+odquCrrDirQ7x/gEmUiUWe1JUp/VumXQ48unawjto=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=hKXjxlXPKgKtbGdTfMydZmUe7NWoPDDiuGMqfkw7RjtE/3/grsiLgOsVSEBndsWUnp/xdBynoUrHrR9G/nmygnf8KPSZGcYY5KZRxAupqGkYAzTUC2Ngz76iQWEKGPZazYvuDKDDKtfs0pC4gpuMprEZ6BcaiOgeLU75Vt50TWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPFf+tc1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPFf+tc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705428987; x=1736964987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x+odquCrrDirQ7x/gEmUiUWe1JUp/VumXQ48unawjto=;
  b=iPFf+tc1C8sLttL1hCjccwt60UqlqPTFoG6vEjHnWIq1Cky07SyCf2v4
   pGj+STZEku4WGzZw85aoyDVnPoEy3GblHANIp4sMjrYw/04RRKCSvKtsc
   c58EL6h92+WKpinL+c0BJ1RuW8kBNl+FEhDYjLCnmfojy2ybzQpKnlE7a
   hShPXPAaHHRFxt9G0UvUff2i6mxeWZlI9UdgNBjeELv4OJj/OuXHI/2Yw
   M5sB4vUjAkPNtHMSOhsJn53lAAKpT0ZJ/TlWyzxfIjh7KX+MEFJr0UEH/
   y/GTw7NKG9wA5aUsQbZlRhAjI/2Ih729LGknVkYCyWAggF1psPGQCgbvd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7037954"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="7037954"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 10:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="733689661"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="733689661"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jan 2024 10:16:23 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPnz3-00013o-1O;
	Tue, 16 Jan 2024 18:16:21 +0000
Date: Wed, 17 Jan 2024 02:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/3] riscv: add support for SBI Supervisor
 Software Events extension
Message-ID: <202401170228.sBZ0HUhl-lkp@intel.com>
References: <20240112111720.2975069-3-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240112111720.2975069-3-cleger@rivosinc.com>

Hi Clément,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7]
[cannot apply to next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-add-SBI-SSE-extension-definitions/20240112-191943
base:   linus/master
patch link:    https://lore.kernel.org/r/20240112111720.2975069-3-cleger%40rivosinc.com
patch subject: [RFC PATCH v2 2/3] riscv: add support for SBI Supervisor Software Events extension
config: riscv-randconfig-r111-20240116 (https://download.01.org/0day-ci/archive/20240117/202401170228.sBZ0HUhl-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce: (https://download.01.org/0day-ci/archive/20240117/202401170228.sBZ0HUhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170228.sBZ0HUhl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/sse.c:57:15: sparse: sparse: symbol 'sse_stack_alloc' was not declared. Should it be static?
>> arch/riscv/kernel/sse.c:62:6: sparse: sparse: symbol 'sse_stack_free' was not declared. Should it be static?

vim +/sse_stack_alloc +57 arch/riscv/kernel/sse.c

    55	
    56	#ifdef CONFIG_VMAP_STACK
  > 57	unsigned long *sse_stack_alloc(unsigned int cpu, unsigned int size)
    58	{
    59		return arch_alloc_vmap_stack(size, cpu_to_node(cpu));
    60	}
    61	
  > 62	void sse_stack_free(unsigned long *stack)
    63	{
    64		vfree(stack);
    65	}
    66	#else /* CONFIG_VMAP_STACK */
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
