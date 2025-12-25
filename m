Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A941A9B58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766699561; cv=none; b=G+0jEWdKz4ESP28LgpqxTO03aUmQKBuiHE+57AwJbE+r+lBauS+KvwDaF1QmRFxXW0S4l3j+1YEzeyZuaTwg4CBstgDBC3xnpYlzYiihHSMo9x1LztXqUr9s03p9HoOPewIkXkBKvqXJF2/SY0wJCgCl8hkPvCeVDdAShC8hSWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766699561; c=relaxed/simple;
	bh=bS63eYFoh6K2KLeNMP1K6+fdp7Po9RGj/ZPVrqfPADU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sqOzgkhhEdjmXR2lXoZYhiA+BY5y84dmf/2T4hr/ItIv/AgqZxKLhEacVKFhdPbj69zZAH4rJELUEugjjdbolIqmKUffXUgbJXrJWQqxZwOKzSSec7tPt/fKDmHEVbK+rGK8zSMIXMCHshbaVj+EKbOLj7cOuunZuW/YFmY5grM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcxCs6Rk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcxCs6Rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766699554; x=1798235554;
  h=date:from:to:cc:subject:message-id;
  bh=bS63eYFoh6K2KLeNMP1K6+fdp7Po9RGj/ZPVrqfPADU=;
  b=IcxCs6RkHxlvjw6ZUNwyZZaLr7LVmf1wAxpw7cIYJjRVz9cucY3AQGD5
   r4FPnYjGINpyou293DwHwCQQpjy0ahBTNcakIEBnRvjFlCLYPU4HU7FZ4
   G5S2eAlE6+rYycNeguXoo0Uu/Sv64ICMn8S5Iv5tfsWllEdYjbeF9Tj8K
   Lp844bXWrcXuRiKJ4XFhvo8+MYg9q6eZEQqnG3el1j8HnixbZkQIUf337
   P3vHPWOFMDUNXL7Dvf8U9w5pqk6rLI/PpUQgHU3sviqk/+0zVS1BaUdp9
   cAGl5teuCOF2E5I9eR97Psk3MtlOucs8C8KwGf4CDiUj9FstBncGvdvag
   A==;
X-CSE-ConnectionGUID: WcOFXlNpRf+55tSVFley5w==
X-CSE-MsgGUID: +zZ/CRXTRDOwF26xGVpa6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68466868"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68466868"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 13:52:34 -0800
X-CSE-ConnectionGUID: ksL2qyhXRuGXEsNLfFK8cw==
X-CSE-MsgGUID: VMreSwkpRWCmm6cRUv2exQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200024769"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Dec 2025 13:52:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYtFf-000000004UH-43Jj;
	Thu, 25 Dec 2025 21:52:22 +0000
Date: Fri, 26 Dec 2025 05:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/irqchip/irq-gic-v3.c:1086:50: warning: passing argument 3 of
 'single_open' makes pointer from integer without a cast
Message-ID: <202512260552.PxMBMdBf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jinjie,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 63f9ef213a477c796c6b343010762513f6315f83 [13/13] arm64: Add debugfs dir for xint
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260552.PxMBMdBf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260552.PxMBMdBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260552.PxMBMdBf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_write':
   drivers/irqchip/irq-gic-v3.c:1042:30: error: implicit declaration of function 'pde_data' [-Werror=implicit-function-declaration]
    1042 |         int irq = (int)(long)pde_data(file_inode(file));
         |                              ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_open':
>> drivers/irqchip/irq-gic-v3.c:1086:50: warning: passing argument 3 of 'single_open' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/irqchip/irq-gic-v3.c:1103:9: error: implicit declaration of function 'proc_create_data' [-Werror=implicit-function-declaration]
    1103 |         proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |         ^~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c: In function 'unregister_irqchip_proc':
   drivers/irqchip/irq-gic-v3.c:1111:9: error: implicit declaration of function 'remove_proc_entry' [-Werror=implicit-function-declaration]
    1111 |         remove_proc_entry("xint", desc->dir);
         |         ^~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c: At top level:
   drivers/irqchip/irq-gic-v3.c:1089:30: error: storage size of 'xint_proc_ops' isn't known
    1089 | static const struct proc_ops xint_proc_ops = {
         |                              ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/single_open +1086 drivers/irqchip/irq-gic-v3.c

3053668e6b2119 Jinjie Ruan 2024-11-25  1038  
3053668e6b2119 Jinjie Ruan 2024-11-25  1039  static ssize_t xint_proc_write(struct file *file,
3053668e6b2119 Jinjie Ruan 2024-11-25  1040  		const char __user *buffer, size_t count, loff_t *pos)
3053668e6b2119 Jinjie Ruan 2024-11-25  1041  {
3053668e6b2119 Jinjie Ruan 2024-11-25 @1042  	int irq = (int)(long)pde_data(file_inode(file));
3053668e6b2119 Jinjie Ruan 2024-11-25  1043  	bool xint_state = false;
3053668e6b2119 Jinjie Ruan 2024-11-25  1044  	unsigned long val;
3053668e6b2119 Jinjie Ruan 2024-11-25  1045  	char *buf = NULL;
3053668e6b2119 Jinjie Ruan 2024-11-25  1046  
3053668e6b2119 Jinjie Ruan 2024-11-25  1047  	if (!xint_transform(irq, XINT_RANGE_CHECK))
3053668e6b2119 Jinjie Ruan 2024-11-25  1048  		return -EPERM;
3053668e6b2119 Jinjie Ruan 2024-11-25  1049  
3053668e6b2119 Jinjie Ruan 2024-11-25  1050  	buf = memdup_user_nul(buffer, count);
3053668e6b2119 Jinjie Ruan 2024-11-25  1051  	if (IS_ERR(buf))
3053668e6b2119 Jinjie Ruan 2024-11-25  1052  		return PTR_ERR(buf);
3053668e6b2119 Jinjie Ruan 2024-11-25  1053  
3053668e6b2119 Jinjie Ruan 2024-11-25  1054  	if (kstrtoul(buf, 0, &val) || (val != 0 && val != 1)) {
3053668e6b2119 Jinjie Ruan 2024-11-25  1055  		kfree(buf);
3053668e6b2119 Jinjie Ruan 2024-11-25  1056  		return -EINVAL;
3053668e6b2119 Jinjie Ruan 2024-11-25  1057  	}
3053668e6b2119 Jinjie Ruan 2024-11-25  1058  
3053668e6b2119 Jinjie Ruan 2024-11-25  1059  	xint_state = xint_transform(irq, XINT_SET_CHECK);
3053668e6b2119 Jinjie Ruan 2024-11-25  1060  	if (xint_state == val) {
3053668e6b2119 Jinjie Ruan 2024-11-25  1061  		kfree(buf);
3053668e6b2119 Jinjie Ruan 2024-11-25  1062  		return -EBUSY;
3053668e6b2119 Jinjie Ruan 2024-11-25  1063  	}
3053668e6b2119 Jinjie Ruan 2024-11-25  1064  
3053668e6b2119 Jinjie Ruan 2024-11-25  1065  	local_irq_disable();
3053668e6b2119 Jinjie Ruan 2024-11-25  1066  	disable_irq(irq);
3053668e6b2119 Jinjie Ruan 2024-11-25  1067  
3053668e6b2119 Jinjie Ruan 2024-11-25  1068  	xint_transform(irq, xint_state ? XINT_TO_IRQ : IRQ_TO_XINT);
3053668e6b2119 Jinjie Ruan 2024-11-25  1069  
3053668e6b2119 Jinjie Ruan 2024-11-25  1070  	enable_irq(irq);
3053668e6b2119 Jinjie Ruan 2024-11-25  1071  	local_irq_enable();
3053668e6b2119 Jinjie Ruan 2024-11-25  1072  
3053668e6b2119 Jinjie Ruan 2024-11-25  1073  	kfree(buf);
3053668e6b2119 Jinjie Ruan 2024-11-25  1074  
3053668e6b2119 Jinjie Ruan 2024-11-25  1075  	return count;
3053668e6b2119 Jinjie Ruan 2024-11-25  1076  }
3053668e6b2119 Jinjie Ruan 2024-11-25  1077  
3053668e6b2119 Jinjie Ruan 2024-11-25  1078  static int xint_proc_show(struct seq_file *m, void *v)
3053668e6b2119 Jinjie Ruan 2024-11-25  1079  {
3053668e6b2119 Jinjie Ruan 2024-11-25  1080  	seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
3053668e6b2119 Jinjie Ruan 2024-11-25  1081  	return 0;
3053668e6b2119 Jinjie Ruan 2024-11-25  1082  }
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
