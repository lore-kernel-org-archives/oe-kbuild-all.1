Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D7B172BD5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 04:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742705733; cv=none; b=Dq+8e+7tk6tfbME013ytC25S48+qO2TAN69toPk2hjV862ThLzAGc04w3kyyBWvBI+TAYcrkkGhi4NStZkpMtRvRCOMqpviz5A1vf5kr+0GISw/pS1x5RQUkHdBuoq2rJO7HexqkpX5CmWO2Zb7BMEN1OnXzByjxGLNNgnS5JZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742705733; c=relaxed/simple;
	bh=HD+CH3uyoV3zEXq2luunY+hCX9hydDuLCLmev3Qti8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYTTgxXyo0WcO0NfxO6nj+v7ELOc5WtA2Zlllw0ZOOJ4ITb4QOrTbfO0pZdoybn44p976DREYr8lD2bSbRBa9k92nfEletGefVRnCn2qWVENBd/kmwka2zDoFYyWvEb2gejjypQKM60Wf9dL3Cak+uJPl2tO+H1uk8MikOvY9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb0wRBIP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb0wRBIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742705730; x=1774241730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HD+CH3uyoV3zEXq2luunY+hCX9hydDuLCLmev3Qti8I=;
  b=Yb0wRBIPyYfovaoDPMDzR2iCLxarViOKhPVGhWUb9D+jQjjid2QY1PIf
   RBvTawJdEhe0Bj0J6SwWXk+98KlVPiHoFWo0nK3R7ocC473VyGX8k51wp
   WnJoE7oq6zLyJc370jc9xM1Rk5+VCb8919087QFYoyodfj5u4UgPqMuta
   eWdvF0neXwy7rUKi1BKNxCxp4U2xXPTN8Zw9XxYdco+HZhVrz8+OrBVSP
   AF7+tNeid6o48pIPoG9Cuay2AeBync1Ois880neNQvOmuCSQQUbmYEEgs
   GLzhJ0sM2811I3v5egU+9/q2jnE9KdgF+NvYpDmyOH7D5LBlFscOgYhvk
   g==;
X-CSE-ConnectionGUID: dTQ+PuVSSFmUQf8Ut3eDAQ==
X-CSE-MsgGUID: j41DbLNAQEqsGCkcmkXRcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43807657"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="43807657"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 21:55:29 -0700
X-CSE-ConnectionGUID: iKHBFDG6Ry+hWJuERzvFFg==
X-CSE-MsgGUID: OuxJT6QFRkuR6qQX8fsT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="127889609"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2025 21:55:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twDMs-0002al-22;
	Sun, 23 Mar 2025 04:55:26 +0000
Date: Sun, 23 Mar 2025 12:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2051/2051] drivers/irqchip/irq-gic-v3.c:1086:43:
 warning: passing argument 3 of 'single_open' makes pointer from integer
 without a cast
Message-ID: <202503231209.3Hgyvn46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6f6f173b2b8fa65e1ef7ebc6e43b0b02c2a52759
commit: 63f9ef213a477c796c6b343010762513f6315f83 [2051/2051] arm64: Add debugfs dir for xint
config: arm64-randconfig-r111-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231209.3Hgyvn46-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250323/202503231209.3Hgyvn46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231209.3Hgyvn46-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_write':
   drivers/irqchip/irq-gic-v3.c:1042:23: error: implicit declaration of function 'pde_data' [-Werror=implicit-function-declaration]
    1042 |  int irq = (int)(long)pde_data(file_inode(file));
         |                       ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_open':
>> drivers/irqchip/irq-gic-v3.c:1086:43: warning: passing argument 3 of 'single_open' makes pointer from integer without a cast [-Wint-conversion]
    1086 |  return single_open(file, xint_proc_show, pde_data(inode));
         |                                           ^~~~~~~~~~~~~~~
         |                                           |
         |                                           int
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
   drivers/irqchip/irq-gic-v3.c:1090:3: error: 'const struct proc_ops' has no member named 'proc_open'
    1090 |  .proc_open = xint_proc_open,
         |   ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1090:15: warning: excess elements in struct initializer
    1090 |  .proc_open = xint_proc_open,
         |               ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1090:15: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:1091:3: error: 'const struct proc_ops' has no member named 'proc_read'
    1091 |  .proc_read = seq_read,
         |   ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1091:15: warning: excess elements in struct initializer
    1091 |  .proc_read = seq_read,
         |               ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1091:15: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:1092:3: error: 'const struct proc_ops' has no member named 'proc_lseek'
    1092 |  .proc_lseek = seq_lseek,
         |   ^~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1092:16: warning: excess elements in struct initializer
    1092 |  .proc_lseek = seq_lseek,
         |                ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1092:16: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:1093:3: error: 'const struct proc_ops' has no member named 'proc_release'
    1093 |  .proc_release = single_release,
         |   ^~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1093:18: warning: excess elements in struct initializer
    1093 |  .proc_release = single_release,
         |                  ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1093:18: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:1094:3: error: 'const struct proc_ops' has no member named 'proc_write'
    1094 |  .proc_write = xint_proc_write,
         |   ^~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1094:16: warning: excess elements in struct initializer
    1094 |  .proc_write = xint_proc_write,
         |                ^~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1094:16: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c: In function 'register_irqchip_proc':
   drivers/irqchip/irq-gic-v3.c:1103:2: error: implicit declaration of function 'proc_create_data' [-Werror=implicit-function-declaration]
    1103 |  proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |  ^~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c: In function 'unregister_irqchip_proc':
   drivers/irqchip/irq-gic-v3.c:1111:2: error: implicit declaration of function 'remove_proc_entry' [-Werror=implicit-function-declaration]
    1111 |  remove_proc_entry("xint", desc->dir);
         |  ^~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c: At top level:
   drivers/irqchip/irq-gic-v3.c:1089:30: error: storage size of 'xint_proc_ops' isn't known
    1089 | static const struct proc_ops xint_proc_ops = {
         |                              ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


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
