Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1571B2186
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740244248; cv=none; b=fnGBE8Aj9Mm0/EE9govUQ18ijXJ1x/Nvz99tkxOoAc6khGLy2RlRRd/g/wxcVVzIHIVXh+7uNzxrIFkwYhYCVFINp6lUjx/Nlpg7JRSTIUYbY2CjMQSz53jG4nkMOYfNnZpo89ZyRq+Yr7C0WIhRomp0GNKpfZCmqhuqXNn58oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740244248; c=relaxed/simple;
	bh=adHvPw/1WhEt3zpJntgBqu9m/DRK+QyyUcKJO56MuLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFQk5rAegvUU4LKFiXrcy1S9038M5RKbNb5Exwizf6plibFZuJXFm/t69GZLUnPqMknLV9ID2hSWlcriduV1/UNUtIC74pMy8k3Et+ez7olPqWgqyJTupzLA1z7Liqpcg/GDLd+T3AJ/4CoQzck6ve3vsBQbTbpbWYobs7JgitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbXxVPnq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbXxVPnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740244247; x=1771780247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=adHvPw/1WhEt3zpJntgBqu9m/DRK+QyyUcKJO56MuLg=;
  b=MbXxVPnqR9CtT5s8ld+iycBjs+9fkT3pDY2CbAwUUA1np1PEV3AmGP0C
   lZMkgW9FUXk6yMR7f8pGA8MOIz0WLEDz5f/LNC0cSH8QXCnzMzQCn5x9p
   339GDasQSrtyzYpzNee5VScmPgfnI/xhgIh5K3t3acGgUuybW3Wknjadn
   qH7aFbUEESRmcmuwu+ZIJ/ZssuRyMtqV+Wcqv+zSl2qNY2YryNbW0F3QG
   5oU+MttIfpTS7QLxN902QTh8DTRxK/qVZ0jL2B7YtGEItEJPDSbK2H3Xb
   JqZC20ClqySb7sYd+VfPmTTALgVCvtgMueb2pyOJV7N/1Cw7AxytNSxWy
   A==;
X-CSE-ConnectionGUID: BKq5vJCfQGONjyRZjNRFLA==
X-CSE-MsgGUID: LL6XdwcqRl+Szx+gIzPiXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40894011"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40894011"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 09:10:46 -0800
X-CSE-ConnectionGUID: Ah7fTkm5QWGXzlEawULLLg==
X-CSE-MsgGUID: q3EAt0a1R626CmD+kDg1lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="116170111"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2025 09:10:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlt1V-0006l9-2x;
	Sat, 22 Feb 2025 17:10:41 +0000
Date: Sun, 23 Feb 2025 01:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <202502230100.z4YCnXZg-lkp@intel.com>
References: <20250221145718.115076-17-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221145718.115076-17-ajones@ventanamicro.com>

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Jones/riscv-Annotate-unaligned-access-init-functions/20250221-230314
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20250221145718.115076-17-ajones%40ventanamicro.com
patch subject: [PATCH v2 7/8] riscv: Add parameter for skipping access speed tests
config: riscv-randconfig-002-20250222 (https://download.01.org/0day-ci/archive/20250223/202502230100.z4YCnXZg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230100.z4YCnXZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230100.z4YCnXZg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/unaligned_access_speed.c: In function 'set_unaligned_access_static_branches_except_cpu':
   arch/riscv/kernel/unaligned_access_speed.c:201:39: error: 'fast_misaligned_access' undeclared (first use in this function); did you mean 'vector_misaligned_access'?
     201 |         cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       vector_misaligned_access
   arch/riscv/kernel/unaligned_access_speed.c:201:39: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/unaligned_access_speed.c: In function 'set_unaligned_access_static_branches':
   arch/riscv/kernel/unaligned_access_speed.c:220:40: error: 'fast_misaligned_access' undeclared (first use in this function); did you mean 'vector_misaligned_access'?
     220 |         cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                        vector_misaligned_access
   arch/riscv/kernel/unaligned_access_speed.c: In function 'riscv_online_cpu':
>> arch/riscv/kernel/unaligned_access_speed.c:238:29: warning: unused variable 'buf' [-Wunused-variable]
     238 |         static struct page *buf;
         |                             ^~~


vim +/buf +238 arch/riscv/kernel/unaligned_access_speed.c

f413aae96cda05 Charlie Jenkins 2024-03-08  235  
f413aae96cda05 Charlie Jenkins 2024-03-08  236  static int riscv_online_cpu(unsigned int cpu)
f413aae96cda05 Charlie Jenkins 2024-03-08  237  {
f413aae96cda05 Charlie Jenkins 2024-03-08 @238  	static struct page *buf;
f413aae96cda05 Charlie Jenkins 2024-03-08  239  
f413aae96cda05 Charlie Jenkins 2024-03-08  240  	/* We are already set since the last check */
cf73109e3f3716 Andrew Jones    2025-02-21  241  	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
f413aae96cda05 Charlie Jenkins 2024-03-08  242  		goto exit;
cf73109e3f3716 Andrew Jones    2025-02-21  243  	} else if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
cf73109e3f3716 Andrew Jones    2025-02-21  244  		per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
cf73109e3f3716 Andrew Jones    2025-02-21  245  		goto exit;
cf73109e3f3716 Andrew Jones    2025-02-21  246  	}
f413aae96cda05 Charlie Jenkins 2024-03-08  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
