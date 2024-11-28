Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD514D444
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783412; cv=none; b=icIErpyNIqd0P9sdBQYls5aZc5+Y52Fh3VeHqWdIK8WSX6tVfznzLONtHVQ0XGPsojROchZdnLX33RLWV4xu7qkyJsFNiIl0Eo51z4M+hEDkpgj0hJ4KkT+p9WdiEaKfOkkQ0lIfoEv5+YBZ2PVyZXlFjfzSIXahL7CFhz0zKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783412; c=relaxed/simple;
	bh=664VbXU9VdxvQMXJhp+NadPfvqlvXwyU1JUuXu2sVl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsmc+P/6KhjGJm4CjxH+uLo+gJtWU1Sg5MduOpnkkGi/hdRgkJvqTVLD+TXjtZf6XoyUkltjxjZFfkqQQReRLRlI1otpoaOywIYtEzvmyhqjTgtyXHk21CgtWUyECsPM3f2aMau4FTT2LdK54pMWTLGHsY49m+em+Yn5d8/G2nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBk4V7Vk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBk4V7Vk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732783411; x=1764319411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=664VbXU9VdxvQMXJhp+NadPfvqlvXwyU1JUuXu2sVl0=;
  b=YBk4V7Vkpy3U+maEjwYr1zbJZ8wgexAR0WI9FVCkzTjdgfHqGfxvkP4O
   ZSgb3qXEFsquvAFytW/YxY8pMNWSwwK5qmDxwPw0Cu83JM5pqkpLohcrn
   2YMyQUFdJytDg+XLReHBO852uh+mWACBLfO50i8/KAPx5B3zkGX4cm79d
   zyvEwWtwE1agEVFLlBKm8SdryEsUqr/yIqnnvEhD/gwVJazEoeOyjKVLT
   DCs8PCHnsrqxNX09o+MtaSxiR4sGeBm37hF9WDGROtHujCtSOt3NIby+g
   0lBC+r6iXYRkY5BatBiMHUL6WcmZJwd6XdD5njAmRrrEYXGfK/8xkXbi4
   w==;
X-CSE-ConnectionGUID: gaoxDYPFSgO1D7gkjK1WlQ==
X-CSE-MsgGUID: 654A+d+OTyuklh197xsegQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32943760"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32943760"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 00:43:30 -0800
X-CSE-ConnectionGUID: w7P0UpdJRZWFpQ/Pwz7bOw==
X-CSE-MsgGUID: x8IeFQwTQH+GstawFxMfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="96609044"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2024 00:43:30 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGa7S-0009MJ-2Y;
	Thu, 28 Nov 2024 08:43:26 +0000
Date: Thu, 28 Nov 2024 16:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1546/1546] kernel/irq/proc.c:334:13: warning: no
 previous prototype for 'register_irqchip_proc'
Message-ID: <202411281636.uf1FPOs2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f63ebb23914c3b2e597112d96eba6edb440e907
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [1546/1546] arm64: Introduce Xint software solution
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241128/202411281636.uf1FPOs2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281636.uf1FPOs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281636.uf1FPOs2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/proc.c:334:13: warning: no previous prototype for 'register_irqchip_proc' [-Wmissing-prototypes]
     334 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         |             ^~~~~~~~~~~~~~~~~~~~~
>> kernel/irq/proc.c:335:13: warning: no previous prototype for 'unregister_irqchip_proc' [-Wmissing-prototypes]
     335 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/register_irqchip_proc +334 kernel/irq/proc.c

   333	
 > 334	void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
 > 335	void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
