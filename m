Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F41B960
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 01:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750384579; cv=none; b=W+qECulX2uA7XTgPwDhKfVvuUSJ20aQKcMmGThRl9qRoc7rbMb6tM9oKoLedixZ3PiJxV9LryJzocIbqc9cS7c9tJH4vNwPzJRKh9G8SD177IbUxfDNK/dfsg8/sRWNTpxhKeeoW5K/y/tAn2X6ubPlEo9jwSDeajbdxsmiBpLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750384579; c=relaxed/simple;
	bh=i8IajCLbW1M2TsTcgAKlm+783+4r2ciNE3W4rCUKq6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G3QwZKTHlv+iL1KoEkImsnMO3aHRfGPLgB8dv4S86rmmGa0uHVouftq4vgc2CPZxExflXIqfpurNiABg3sxhWOfWCxsWCjI5ghjQ/D5Uu5Z4SpzlnOt7saWN3PyN6cs0HVladQzSfDEpMOtgnc3B2fNQ3RwiN2+Kz9tDCbA6g7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvfwfxhA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvfwfxhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750384576; x=1781920576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8IajCLbW1M2TsTcgAKlm+783+4r2ciNE3W4rCUKq6E=;
  b=PvfwfxhAFBqjjNEFu+X1GOvUdmJgBgV5FTGY1yONnaeK9BYSBhg5qy64
   prmR05WnWvUW1DiQz3yfEPE0a7pzm/0hzEm41xu3+NW7G0h3+lGpGafkm
   a7NNpw15yLzJBaR5eazG+EyA5exBhCu5Op/dsFD80VuaMQPkXCv7512J3
   85sSfJxYLjRXmropZpNi7Mp8ak4kKxXQ3JR1p+QUW6neguC/ootAysgjm
   4oVRNVD/YX/PH9fcs/G8JL4CvTi5AIjO3Wxk9EygkbJZmVs9bcwrDWaAt
   sfwv0hy0M94KAv4gJD7dAsYhkJpU5QcosKomdlt4532RMfY41721Tg3qf
   g==;
X-CSE-ConnectionGUID: wLJkOz3oTsaE8IwXJelvqA==
X-CSE-MsgGUID: MQY1RkVvRTuPNY63SgfmsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52511338"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="52511338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 18:56:13 -0700
X-CSE-ConnectionGUID: mRwMcR2FQ3qf3QkrS0i8Qg==
X-CSE-MsgGUID: d8rHItikQo2YhHORrz3MCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="150274892"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jun 2025 18:56:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSQzC-000LHe-0W;
	Fri, 20 Jun 2025 01:56:10 +0000
Date: Fri, 20 Jun 2025 09:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2974/2974] drivers/irqchip/irq-gic-v3.c:782:23:
 error: implicit declaration of function 'PDE_DATA'; did you mean
 'NODE_DATA'?
Message-ID: <202506200917.vHKIjHAl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0bb9efd4883938dec34f710bce07ec3ecf5a04bd
commit: a05426a568e457640f58698c8ebd636fcde4d202 [2974/2974] arm64: Introduce Xint software solution
config: arm64-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200917.vHKIjHAl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200917.vHKIjHAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200917.vHKIjHAl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_write':
>> drivers/irqchip/irq-gic-v3.c:782:23: error: implicit declaration of function 'PDE_DATA'; did you mean 'NODE_DATA'? [-Werror=implicit-function-declaration]
     782 |  int irq = (int)(long)PDE_DATA(file_inode(file));
         |                       ^~~~~~~~
         |                       NODE_DATA
   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_show':
>> drivers/irqchip/irq-gic-v3.c:820:2: error: implicit declaration of function 'seq_printf'; did you mean 'dev_printk'? [-Werror=implicit-function-declaration]
     820 |  seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
         |  ^~~~~~~~~~
         |  dev_printk
>> drivers/irqchip/irq-gic-v3.c:820:46: error: dereferencing pointer to incomplete type 'struct seq_file'
     820 |  seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
         |                                              ^~
   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_open':
>> drivers/irqchip/irq-gic-v3.c:826:9: error: implicit declaration of function 'single_open'; did you mean 'simple_open'? [-Werror=implicit-function-declaration]
     826 |  return single_open(file, xint_proc_show, PDE_DATA(inode));
         |         ^~~~~~~~~~~
         |         simple_open
   drivers/irqchip/irq-gic-v3.c: At top level:
   drivers/irqchip/irq-gic-v3.c:829:21: error: variable 'xint_proc_ops' has initializer but incomplete type
     829 | static const struct proc_ops xint_proc_ops = {
         |                     ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c:830:3: error: 'const struct proc_ops' has no member named 'proc_open'
     830 |  .proc_open = xint_proc_open,
         |   ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:830:15: warning: excess elements in struct initializer
     830 |  .proc_open = xint_proc_open,
         |               ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:830:15: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:831:3: error: 'const struct proc_ops' has no member named 'proc_read'
     831 |  .proc_read = seq_read,
         |   ^~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:831:15: error: 'seq_read' undeclared here (not in a function)
     831 |  .proc_read = seq_read,
         |               ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c:831:15: warning: excess elements in struct initializer
   drivers/irqchip/irq-gic-v3.c:831:15: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:832:3: error: 'const struct proc_ops' has no member named 'proc_lseek'
     832 |  .proc_lseek = seq_lseek,
         |   ^~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:832:16: error: 'seq_lseek' undeclared here (not in a function)
     832 |  .proc_lseek = seq_lseek,
         |                ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:832:16: warning: excess elements in struct initializer
   drivers/irqchip/irq-gic-v3.c:832:16: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:833:3: error: 'const struct proc_ops' has no member named 'proc_release'
     833 |  .proc_release = single_release,
         |   ^~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:833:18: error: 'single_release' undeclared here (not in a function); did you mean 'spin_release'?
     833 |  .proc_release = single_release,
         |                  ^~~~~~~~~~~~~~
         |                  spin_release
   drivers/irqchip/irq-gic-v3.c:833:18: warning: excess elements in struct initializer
   drivers/irqchip/irq-gic-v3.c:833:18: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c:834:3: error: 'const struct proc_ops' has no member named 'proc_write'
     834 |  .proc_write = xint_proc_write,
         |   ^~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:834:16: warning: excess elements in struct initializer
     834 |  .proc_write = xint_proc_write,
         |                ^~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:834:16: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c: In function 'register_irqchip_proc':
   drivers/irqchip/irq-gic-v3.c:843:2: error: implicit declaration of function 'proc_create_data' [-Werror=implicit-function-declaration]
     843 |  proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |  ^~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c: In function 'unregister_irqchip_proc':
   drivers/irqchip/irq-gic-v3.c:851:2: error: implicit declaration of function 'remove_proc_entry' [-Werror=implicit-function-declaration]
     851 |  remove_proc_entry("xint", desc->dir);
         |  ^~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c: At top level:
   drivers/irqchip/irq-gic-v3.c:829:30: error: storage size of 'xint_proc_ops' isn't known
     829 | static const struct proc_ops xint_proc_ops = {
         |                              ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE
   Depends on [n]: CPU_FREQ [=y] && (ARM || ARM64 [=y]) && ACPI_CPPC_CPUFREQ [=n]
   Selected by [m]:
   - CPU_FREQ_GOV_SEEP [=m] && CPU_FREQ [=y] && (ACPI_CPPC_CPUFREQ [=n] || ARM64 [=y])


vim +782 drivers/irqchip/irq-gic-v3.c

   778	
   779	static ssize_t xint_proc_write(struct file *file,
   780			const char __user *buffer, size_t count, loff_t *pos)
   781	{
 > 782		int irq = (int)(long)PDE_DATA(file_inode(file));
   783		bool xint_state = false;
   784		unsigned long val;
   785		char *buf = NULL;
   786	
   787		if (!xint_transform(irq, XINT_RANGE_CHECK))
   788			return -EPERM;
   789	
   790		buf = memdup_user_nul(buffer, count);
   791		if (IS_ERR(buf))
   792			return PTR_ERR(buf);
   793	
   794		if (kstrtoul(buf, 0, &val) || (val != 0 && val != 1)) {
   795			kfree(buf);
   796			return -EINVAL;
   797		}
   798	
   799		xint_state = xint_transform(irq, XINT_SET_CHECK);
   800		if (xint_state == val) {
   801			kfree(buf);
   802			return -EBUSY;
   803		}
   804	
   805		local_irq_disable();
   806		disable_irq(irq);
   807	
   808		xint_transform(irq, xint_state ? XINT_TO_IRQ : IRQ_TO_XINT);
   809	
   810		enable_irq(irq);
   811		local_irq_enable();
   812	
   813		kfree(buf);
   814	
   815		return count;
   816	}
   817	
   818	static int xint_proc_show(struct seq_file *m, void *v)
   819	{
 > 820		seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
   821		return 0;
   822	}
   823	
   824	static int xint_proc_open(struct inode *inode, struct file *file)
   825	{
 > 826		return single_open(file, xint_proc_show, PDE_DATA(inode));
   827	}
   828	
   829	static const struct proc_ops xint_proc_ops = {
   830		.proc_open	= xint_proc_open,
 > 831		.proc_read	= seq_read,
 > 832		.proc_lseek	= seq_lseek,
 > 833		.proc_release	= single_release,
   834		.proc_write	= xint_proc_write,
   835	};
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
