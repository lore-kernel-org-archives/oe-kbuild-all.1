Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B6E139D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 02:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736563622; cv=none; b=eRRb26uqwCOOMjn34XSYyHTL8HQf8OEIbnWse4ibN+a2NBke5t/m35wrpQDgaogJP1aRGwGweYn4GGiA2Nnjw3OO9u2bOirmgMV7LInhnlycJUK0Y1tMAxzJHeyZ3sRyq0SDHNkiTBOapSN8XKi6kjoI0k5oFrP3cUwITAUXZ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736563622; c=relaxed/simple;
	bh=yjoDE/SRvVeMhy9lm6spESLnvApI7p0dV1BARMk8dcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZTQhJau40S+9ffDZBjFrZk30LIm/PD/89dDM5FDfa/v+dsUk1i/qIX/vwVydyJDJNOlSAv922I888ZjNdnHM1qOdMBXYjVZT4q8tcb9vyCbXyhiJsqnCbR5n+s7reuzdhRzjH/yzgZLRl23RhDzawMdeMy+/wNb5DWT5o4Ntc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R97hZ4Ht; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R97hZ4Ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736563620; x=1768099620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjoDE/SRvVeMhy9lm6spESLnvApI7p0dV1BARMk8dcs=;
  b=R97hZ4Ht9l34CBlzqND6gdyy4+F/7CutBtqKeBlWoYPurkR6b3CTvyBL
   DuYLy/xkJzZi5gA9Bvo9WwIshUXnJ2Ih18t23tLHRVpa6J/A3MxdLcKly
   yGKwPY8bNeii3B+kKwv+qfb78tfhKQYiSodnhHuMchF4oAJvuL4M8AV3x
   +vJFSLUZhFuaemFT5LKbfUenhlyhNJQcGojkvWpeznzrWbhax1yACkJEo
   ZgWedvZr/sGi3C875DhnyWxTf/OykEraqqbk6/VmHtNCeItLVpQKna9WA
   +dBNMxzDfPnhn05iQv1ujyf5IITT5fJhizbqnSSjOIH41k+frINPz0vx1
   w==;
X-CSE-ConnectionGUID: k2j89tv5Qj+2lNG900VJnA==
X-CSE-MsgGUID: KPXMgm2hRE6IwekO3y+mIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62242667"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="62242667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 18:47:00 -0800
X-CSE-ConnectionGUID: 5gtArdU3TVaq3YMs0ARiag==
X-CSE-MsgGUID: IP4b241RQj+9c7VZViS4Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="103681099"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2025 18:46:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWRWa-000K3z-0R;
	Sat, 11 Jan 2025 02:46:56 +0000
Date: Sat, 11 Jan 2025 10:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1817/1817] drivers/irqchip/irq-gic-v3.c:1036:30:
 error: implicit declaration of function 'pde_data'
Message-ID: <202501111013.pP2ro5fl-lkp@intel.com>
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
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [1817/1817] arm64: Introduce Xint software solution
config: arm64-randconfig-r123-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111013.pP2ro5fl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250111/202501111013.pP2ro5fl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111013.pP2ro5fl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_write':
>> drivers/irqchip/irq-gic-v3.c:1036:30: error: implicit declaration of function 'pde_data' [-Wimplicit-function-declaration]
    1036 |         int irq = (int)(long)pde_data(file_inode(file));
         |                              ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_show':
   drivers/irqchip/irq-gic-v3.c:1074:9: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Wimplicit-function-declaration]
    1074 |         seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
         |         ^~~~~~~~~~
         |         bstr_printf
   drivers/irqchip/irq-gic-v3.c:1074:53: error: invalid use of undefined type 'struct seq_file'
    1074 |         seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
         |                                                     ^~
   drivers/irqchip/irq-gic-v3.c: In function 'xint_proc_open':
   drivers/irqchip/irq-gic-v3.c:1080:16: error: implicit declaration of function 'single_open'; did you mean 'simple_open'? [-Wimplicit-function-declaration]
    1080 |         return single_open(file, xint_proc_show, pde_data(inode));
         |                ^~~~~~~~~~~
         |                simple_open
   drivers/irqchip/irq-gic-v3.c: At top level:
>> drivers/irqchip/irq-gic-v3.c:1083:21: error: variable 'xint_proc_ops' has initializer but incomplete type
    1083 | static const struct proc_ops xint_proc_ops = {
         |                     ^~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:1084:10: error: 'const struct proc_ops' has no member named 'proc_open'
    1084 |         .proc_open      = xint_proc_open,
         |          ^~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:1084:27: warning: excess elements in struct initializer
    1084 |         .proc_open      = xint_proc_open,
         |                           ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1084:27: note: (near initialization for 'xint_proc_ops')
>> drivers/irqchip/irq-gic-v3.c:1085:10: error: 'const struct proc_ops' has no member named 'proc_read'
    1085 |         .proc_read      = seq_read,
         |          ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1085:27: error: 'seq_read' undeclared here (not in a function)
    1085 |         .proc_read      = seq_read,
         |                           ^~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1085:27: warning: excess elements in struct initializer
   drivers/irqchip/irq-gic-v3.c:1085:27: note: (near initialization for 'xint_proc_ops')
>> drivers/irqchip/irq-gic-v3.c:1086:10: error: 'const struct proc_ops' has no member named 'proc_lseek'
    1086 |         .proc_lseek     = seq_lseek,
         |          ^~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1086:27: error: 'seq_lseek' undeclared here (not in a function)
    1086 |         .proc_lseek     = seq_lseek,
         |                           ^~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1086:27: warning: excess elements in struct initializer
   drivers/irqchip/irq-gic-v3.c:1086:27: note: (near initialization for 'xint_proc_ops')
>> drivers/irqchip/irq-gic-v3.c:1087:10: error: 'const struct proc_ops' has no member named 'proc_release'
    1087 |         .proc_release   = single_release,
         |          ^~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1087:27: error: 'single_release' undeclared here (not in a function); did you mean 'spin_release'?
    1087 |         .proc_release   = single_release,
         |                           ^~~~~~~~~~~~~~
         |                           spin_release
   drivers/irqchip/irq-gic-v3.c:1087:27: warning: excess elements in struct initializer
   drivers/irqchip/irq-gic-v3.c:1087:27: note: (near initialization for 'xint_proc_ops')
>> drivers/irqchip/irq-gic-v3.c:1088:10: error: 'const struct proc_ops' has no member named 'proc_write'
    1088 |         .proc_write     = xint_proc_write,
         |          ^~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1088:27: warning: excess elements in struct initializer
    1088 |         .proc_write     = xint_proc_write,
         |                           ^~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1088:27: note: (near initialization for 'xint_proc_ops')
   drivers/irqchip/irq-gic-v3.c: In function 'register_irqchip_proc':
>> drivers/irqchip/irq-gic-v3.c:1097:9: error: implicit declaration of function 'proc_create_data' [-Wimplicit-function-declaration]
    1097 |         proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |         ^~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:1097:44: error: 'struct irq_desc' has no member named 'dir'
    1097 |         proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |                                            ^~
   drivers/irqchip/irq-gic-v3.c: In function 'unregister_irqchip_proc':
>> drivers/irqchip/irq-gic-v3.c:1105:9: error: implicit declaration of function 'remove_proc_entry' [-Wimplicit-function-declaration]
    1105 |         remove_proc_entry("xint", desc->dir);
         |         ^~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3.c:1105:39: error: 'struct irq_desc' has no member named 'dir'
    1105 |         remove_proc_entry("xint", desc->dir);
         |                                       ^~
   drivers/irqchip/irq-gic-v3.c: At top level:
>> drivers/irqchip/irq-gic-v3.c:1083:30: error: storage size of 'xint_proc_ops' isn't known
    1083 | static const struct proc_ops xint_proc_ops = {
         |                              ^~~~~~~~~~~~~


vim +/pde_data +1036 drivers/irqchip/irq-gic-v3.c

  1032	
  1033	static ssize_t xint_proc_write(struct file *file,
  1034			const char __user *buffer, size_t count, loff_t *pos)
  1035	{
> 1036		int irq = (int)(long)pde_data(file_inode(file));
  1037		bool xint_state = false;
  1038		unsigned long val;
  1039		char *buf = NULL;
  1040	
  1041		if (!xint_transform(irq, XINT_RANGE_CHECK))
  1042			return -EPERM;
  1043	
  1044		buf = memdup_user_nul(buffer, count);
  1045		if (IS_ERR(buf))
  1046			return PTR_ERR(buf);
  1047	
  1048		if (kstrtoul(buf, 0, &val) || (val != 0 && val != 1)) {
  1049			kfree(buf);
  1050			return -EINVAL;
  1051		}
  1052	
  1053		xint_state = xint_transform(irq, XINT_SET_CHECK);
  1054		if (xint_state == val) {
  1055			kfree(buf);
  1056			return -EBUSY;
  1057		}
  1058	
  1059		local_irq_disable();
  1060		disable_irq(irq);
  1061	
  1062		xint_transform(irq, xint_state ? XINT_TO_IRQ : IRQ_TO_XINT);
  1063	
  1064		enable_irq(irq);
  1065		local_irq_enable();
  1066	
  1067		kfree(buf);
  1068	
  1069		return count;
  1070	}
  1071	
  1072	static int xint_proc_show(struct seq_file *m, void *v)
  1073	{
  1074		seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
  1075		return 0;
  1076	}
  1077	
  1078	static int xint_proc_open(struct inode *inode, struct file *file)
  1079	{
  1080		return single_open(file, xint_proc_show, pde_data(inode));
  1081	}
  1082	
> 1083	static const struct proc_ops xint_proc_ops = {
> 1084		.proc_open	= xint_proc_open,
> 1085		.proc_read	= seq_read,
> 1086		.proc_lseek	= seq_lseek,
> 1087		.proc_release	= single_release,
> 1088		.proc_write	= xint_proc_write,
  1089	};
  1090	
  1091	void register_irqchip_proc(struct irq_desc *desc, void *irqp)
  1092	{
  1093		if (!is_xint_support)
  1094			return;
  1095	
  1096		/* create /proc/irq/<irq>/xint */
> 1097		proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
  1098	}
  1099	
  1100	void unregister_irqchip_proc(struct irq_desc *desc)
  1101	{
  1102		if (!is_xint_support)
  1103			return;
  1104	
> 1105		remove_proc_entry("xint", desc->dir);
  1106	}
  1107	#endif /* CONFIG_FAST_IRQ */
  1108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
