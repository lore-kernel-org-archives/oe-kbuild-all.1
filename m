Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B43C0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 01:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766368392; cv=none; b=Ox0WWKqeFjwjM5nCiFhHSLNndeA8+DhKuvmjBBwtosnTO79wfIFyzC5xdMtyGhcepqywR7tOi0JGQX32d/tHsJNBPMNh1vNHQpuHcou/RnapXctIuPXnxRp50E5GpjaXwHroHAPMuuTX6BszKizhlEGOF03xJVKaa6sTKd7WGsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766368392; c=relaxed/simple;
	bh=DTlFQD8eo+rWx7Yua1cjD6FI1NSmw1+tUmlJnt6Zn8w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TDe7tMW0tzl9Q0SihAFjfs8/JFDWE5f2KOYRTHsj1x1pB2gLeofyLUk700cvx4cMSSowA/hMypfmxlht1b4sB66N2AON766JcneqWLKzq2zeyoJuQH9rNFPMVjCKcDIcm7DWDzj7mTd+lc9/IRr8tehfLKjfCFxCIbi7ovrw+yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCFwqUOh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCFwqUOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766368390; x=1797904390;
  h=date:from:to:cc:subject:message-id;
  bh=DTlFQD8eo+rWx7Yua1cjD6FI1NSmw1+tUmlJnt6Zn8w=;
  b=TCFwqUOhYkszgQ/BnGGDhPLJfNtT0twjhngNzLh7974i/lLEvQi6VP41
   0xya8S+coeRNRjK6Z/17/flIwwbKZhwu+5DcdYyJmh886TRuT0LaL3elY
   6xeOwRgxOy4xgPaPbpMgLYjZXaAL3pZJ1zpXIlswDQVweG8jewu3A+ggx
   G/KgL4Kfhm2TAiWlxk8CyhhEGPUWxMyZGsVoCHjp089kezZPeOzIPCO6g
   cxSBtlkqZ16Q+A4c7QXMLJZsiloNcIIgAT6Sp8CwbHo3rMie5NxpuqDZj
   GXLUEFIZWst6uqk9q34co28PTN2CNp9Lw/JFVMjnQsMQ8UYi9aipQyEIA
   g==;
X-CSE-ConnectionGUID: yRi8snc0TNO2OnxhQprCKA==
X-CSE-MsgGUID: 5y9QjqynSeCqitk5qX4ovw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85641394"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85641394"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:53:09 -0800
X-CSE-ConnectionGUID: k4gz10A/QyuHc9Cn843d0w==
X-CSE-MsgGUID: fW8dsf/9TBC8sn/PKHCmZQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 9d662e18a02b) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 17:53:08 -0800
Received: from kbuild by 9d662e18a02b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXV6S-0000000002P-1GWZ;
	Mon, 22 Dec 2025 01:52:55 +0000
Date: Mon, 22 Dec 2025 09:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jia Qingtong <jiaqingtong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3415/3415]
 drivers/irqchip/irq-gic-v3-its.c:504:6: warning: no previous prototype for
 'build_devid_pools'
Message-ID: <202512220941.znSG62CM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jia,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: af552f9d957def499065ed6e194bcd5f0c75dbc5 [3415/3415] irqchip/gic-v3-its: Move build_devid_pools from its to acpi iort init
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251222/202512220941.znSG62CM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220941.znSG62CM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220941.znSG62CM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3-its.c:504:6: warning: no previous prototype for 'build_devid_pools' [-Wmissing-prototypes]
     504 | void build_devid_pools(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/build_devid_pools +504 drivers/irqchip/irq-gic-v3-its.c

   500	
   501	/*
   502	 * Currently we only build *one* devid pool.
   503	 */
 > 504	void build_devid_pools(void)
   505	{
   506		struct its_node *its;
   507	
   508		its = list_first_entry(&its_nodes, struct its_node, entry);
   509		if (readl_relaxed(its->base + GITS_IIDR) != 0x00051736)
   510			return;
   511	
   512		if (!probe_devid_pool_one())
   513			rsv_devid_pool_cap = true;
   514	
   515		if (rsv_devid_pool_cap)
   516			pr_info("ITS: reserved device id pools enabled\n");
   517	}
   518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
