Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113112C544
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 05:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736572595; cv=none; b=Dl5BfsOQjiF4xx/rpc+E8SvWdd2egs0X1tp43Ct1uL1rkDvUNkrrxzBTB5FxEpRula/fEr8WmaZRLaL0aHBiD8A3UNc8b3+0SMjTA021PKx+vIPiCGicNTNAmGzu2sZLx0IxogZaXI1W9R/TAf1qVj2GSel8gcF3aaxQ3akJuPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736572595; c=relaxed/simple;
	bh=7dRSucGUXI8CVdU0+6WTAf9xgunGW/oN9nrOSjpqARA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WAKVAnEwJ2B+0IpQU5gU+DVJKusNBhjFKALk/sd5j1a6738Bd9AxCRwW51unYfi1V9BYOTBXSdeY+csrcfvznmg6a/2rRFET0GNhRqxIrZaU6xQ1UnMTfMA2HTvUQc+iaqpXZT7FtpuIjkqwzkpKyyxzvJbps+kowMWnqku0PUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7TVMHfr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7TVMHfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736572592; x=1768108592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7dRSucGUXI8CVdU0+6WTAf9xgunGW/oN9nrOSjpqARA=;
  b=A7TVMHfrlDxyheVRfrS55kAg0bCeywLTdVNvgNZYbflf6FVSUA9C7F9K
   mzH3tTPG7OJUPuYwMGPO6Y1nWx3+dUSJ2Jm98iLpb4g2lKge+CN1nGpI/
   FtTVn30ZnA8nLek19eW/tTgwHBON6uvyy86AFTyR7RdweZwIbXFv7ScnD
   A/SpBzPSOb+ogKlf0MsF+aalBPEdeFtHDcttz+6Ki3vljozX+yZ+PiQ8O
   1W5b3raZNPoARlFZxAJa1qbmT8FAqWUX3CZv+DvONrVn6FnVzqzb9Kg6o
   DAcseeOWI7BMLbBp8lEA2toPf/v5kMk70tFGwWK6w5W+mdL6fAkbzaRAr
   A==;
X-CSE-ConnectionGUID: REd6CYXERS2seazOwLUNyQ==
X-CSE-MsgGUID: 5/PNSJHsTACW0ZuVmP7XGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47866583"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="47866583"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 21:16:31 -0800
X-CSE-ConnectionGUID: PT8KoEKpSZuS1K1a0m8Q3g==
X-CSE-MsgGUID: oKOG9oKsRSKmZt9PA77TFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="103863754"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 21:16:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWTrH-000KE1-1H;
	Sat, 11 Jan 2025 05:16:27 +0000
Date: Sat, 11 Jan 2025 13:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1817/1817] drivers/irqchip/irq-gic-v3.c:1086:50:
 error: passing argument 3 of 'single_open' makes pointer from integer
 without a cast
Message-ID: <202501111313.p0ymXxwj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   628e30bc9a3c48a6ab38868cb77fc6497d6ebaa5
commit: 63f9ef213a477c796c6b343010762513f6315f83 [1817/1817] arm64: Add debugfs dir for xint
config: arm64-randconfig-r123-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111313.p0ymXxwj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250111/202501111313.p0ymXxwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111313.p0ymXxwj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_write':
   drivers/irqchip/irq-gic-v3.c:1042:30: error: implicit declaration of function 'pde_data' [-Wimplicit-function-declaration]
    1042 |         int irq = (int)(long)pde_data(file_inode(file));
         |                              ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_open':
>> drivers/irqchip/irq-gic-v3.c:1086:50: error: passing argument 3 of 'single_open' makes pointer from integer without a cast [-Wint-conversion]
    1086 |         return single_open(file, xint_proc_show, pde_data(inode));
         |                                                  ^~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   In file included from include/linux/debugfs.h:16,
                    from arch/arm64/include/../../../kernel/irq/internals.h:495,
                    from drivers/irqchip/irq-gic-v3.c:39:
   include/linux/seq_file.h:166:68: note: expected 'void *' but argument is of type 'int'
     166 | int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
         |                                                                    ^~~~~~
   drivers/irqchip/irq-gic-v3.c: At top level:
   drivers/irqchip/irq-gic-v3.c:1089:21: error: variable 'xint_proc_ops' has initializer but incomplete type
    1089 | static const struct proc_ops xint_proc_ops = {
         |                     ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1090:10: error: 'const struct proc_ops' has no member named 'proc_open'
    1090 |         .proc_open      = xint_proc_open,
         |          ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1090:27: warning: excess elements in struct initializer
    1090 |         .proc_open      = xint_proc_open,
         |                           ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1090:27: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:1091:10: error: 'const struct proc_ops' has no member named 'proc_read'
    1091 |         .proc_read      = seq_read,
         |          ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1091:27: warning: excess elements in struct initializer
    1091 |         .proc_read      = seq_read,
         |                           ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1091:27: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:1092:10: error: 'const struct proc_ops' has no member named 'proc_lseek'
    1092 |         .proc_lseek     = seq_lseek,
         |          ^~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1092:27: warning: excess elements in struct initializer
    1092 |         .proc_lseek     = seq_lseek,
         |                           ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1092:27: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:1093:10: error: 'const struct proc_ops' has no member named 'proc_release'
    1093 |         .proc_release   = single_release,
         |          ^~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1093:27: warning: excess elements in struct initializer
    1093 |         .proc_release   = single_release,
         |                           ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1093:27: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:1094:10: error: 'const struct proc_ops' has no member named 'proc_write'
    1094 |         .proc_write     = xint_proc_write,
         |          ^~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1094:27: warning: excess elements in struct initializer
    1094 |         .proc_write     = xint_proc_write,
         |                           ^~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1094:27: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c: In function 'register_irqchip_proc':
   drivers/irqchip/irq-gic-v3.c:1103:9: error: implicit declaration of function 'proc_create_data' [-Wimplicit-function-declaration]
    1103 |         proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |         ^~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1103:44: error: 'struct irq_desc' has no member named 'dir'
    1103 |         proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |                                            ^~
   drivers/irqchip/irq-gic-v3.c: In function 'unregister_irqchip_proc':
   drivers/irqchip/irq-gic-v3.c:1111:9: error: implicit declaration of function 'remove_proc_entry' [-Wimplicit-function-declaration]
    1111 |         remove_proc_entry("xint", desc->dir);
         |         ^~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1111:39: error: 'struct irq_desc' has no member named 'dir'
    1111 |         remove_proc_entry("xint", desc->dir);
         |                                       ^~
   drivers/irqchip/irq-gic-v3.c: At top level:
   drivers/irqchip/irq-gic-v3.c:1089:30: error: storage size of 'xint_proc_ops' isn't known
    1089 | static const struct proc_ops xint_proc_ops = {
         |                              ^~~~~~~~~~~~~


vim +/single_open +1086 drivers/irqchip/irq-gic-v3.c

3053668e6b2119 Jinjie Ruan 2024-11-25  1083  
3053668e6b2119 Jinjie Ruan 2024-11-25  1084  static int xint_proc_open(struct inode *inode, struct file *file)
3053668e6b2119 Jinjie Ruan 2024-11-25  1085  {
3053668e6b2119 Jinjie Ruan 2024-11-25 @1086  	return single_open(file, xint_proc_show, pde_data(inode));
3053668e6b2119 Jinjie Ruan 2024-11-25  1087  }
3053668e6b2119 Jinjie Ruan 2024-11-25  1088  

:::::: The code at line 1086 was first introduced by commit
:::::: 3053668e6b211924bb67c19d791a5a532eca2ad8 arm64: Introduce Xint software solution

:::::: TO: Jinjie Ruan <ruanjinjie@huawei.com>
:::::: CC: Jinjie Ruan <ruanjinjie@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
