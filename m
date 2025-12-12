Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B742F3C38
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765542736; cv=none; b=lVMNnUUSBreuOV67eewjtH6DCs9/d5dq3DWpREFVs56uWMYXPbI7NOMMf/o+MxmEckOV3Qz4yUMQrVPaJxsvCrm47bZFI6bC6xaNKcnBVl4W4qRSLCRB1cWStqTC6jZontLsTL1qMLnJ2oOqGUEsYg7Lu7OpOiFotGgp3PXZ2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765542736; c=relaxed/simple;
	bh=Ttwksl/wcqvUoB6OghvHmw7VMkvUCsqOLNejm+QN9Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h9uRoPdgXSg2x3rN7vNiuA0qwKuYMj/ys9r8YVwcEAbWHgARZn2rGD2EezHrZhM0BYTMkNFod3F22mBs4dl2Df7B4pXAlgRvQ/QcrFAjSVjOmMxtrH/XcbR458q/5SqTV6DcnYSmFGJfhe7NJ+0PZzEBE3yzy0gzycnGj1bvwYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsJHhf1D; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsJHhf1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765542735; x=1797078735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ttwksl/wcqvUoB6OghvHmw7VMkvUCsqOLNejm+QN9Q4=;
  b=bsJHhf1DCa+R0WTz8uQn+y/ctVwJ5fVgX8YVD0vFKrGGE68muQKR+SVc
   V3iKeJ6J0x+lqUykfpuqCAjyjuI/rArlTYfZMJS3LRCkSJ0Jj1PhOaJ9D
   NVYxJ5N/Dyc+/hMdaGPqS8RCN7yGjztbONaym7NB4qdSjk8FuK5C7h77B
   3+NEJg8UrYtFYAgS+yyEs1wAUvxHjRozO6R/BeP/X+3SBxfretR3AOz5b
   6R9yt9w+yf325Tr0naIhBeHZansIscRM3JhhWqyL/986n73QV0MGRTjsz
   Xy+RqIg6Vv3vdxZDYrP8DmDRRPtdNnLT5vxyBhl0jEutbnQwO/YtZzZHW
   g==;
X-CSE-ConnectionGUID: 9atrs570TJGLp/525scvGw==
X-CSE-MsgGUID: 2iM90tgGS/6/FYYcL5Ev1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67587511"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67587511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:32:14 -0800
X-CSE-ConnectionGUID: HYNG6VpLTYCocXJHqbp/DQ==
X-CSE-MsgGUID: xVHa6IyrSsuJpLd0MkhqRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="220456269"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Dec 2025 04:32:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU2Jf-000000001i0-0KlE;
	Fri, 12 Dec 2025 12:32:11 +0000
Date: Fri, 12 Dec 2025 13:31:18 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Qinxin Xia <xiaqinxin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] drivers/irqchip/irq-gic-v3.c:561:6:
 warning: no previous prototype for function 'gic_irq_set_prio'
Message-ID: <202512121353.WEzcRxTR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: f0f9be237c2266d30fa01c294577438a2e2ee749 [3541/3541] gic: increase the arch_timer priority to avoid hardlockup
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512121353.WEzcRxTR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121353.WEzcRxTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121353.WEzcRxTR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/irqchip/irq-gic-v3.c:561:6: warning: no previous prototype for function 'gic_irq_set_prio' [-Wmissing-prototypes]
     561 | void gic_irq_set_prio(struct irq_data *d, u8 prio)
         |      ^
   drivers/irqchip/irq-gic-v3.c:561:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     561 | void gic_irq_set_prio(struct irq_data *d, u8 prio)
         | ^
         | static 
   drivers/irqchip/irq-gic-v3.c:1531:6: warning: no previous prototype for function 'gic_dist_enable_ipiv' [-Wmissing-prototypes]
    1531 | void gic_dist_enable_ipiv(void)
         |      ^
   drivers/irqchip/irq-gic-v3.c:1531:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1531 | void gic_dist_enable_ipiv(void)
         | ^
         | static 
   drivers/irqchip/irq-gic-v3.c:1548:6: warning: no previous prototype for function 'gic_get_ipiv_status' [-Wmissing-prototypes]
    1548 | bool gic_get_ipiv_status(void)
         |      ^
   drivers/irqchip/irq-gic-v3.c:1548:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1548 | bool gic_get_ipiv_status(void)
         | ^
         | static 
   4 warnings generated.


vim +/gic_irq_set_prio +561 drivers/irqchip/irq-gic-v3.c

   560	
 > 561	void gic_irq_set_prio(struct irq_data *d, u8 prio)
   562	{
   563		void __iomem *base = gic_dist_base(d);
   564		u32 offset, index;
   565	
   566		offset = convert_offset_index(d, GICD_IPRIORITYR, &index);
   567	
   568		writeb_relaxed(prio, base + offset + index);
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
