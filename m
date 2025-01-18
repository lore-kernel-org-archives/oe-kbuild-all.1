Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A741C68F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 01:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737162843; cv=none; b=XZsLGsso7bYm1t20x7g803c/y8/IDswLHne7Cgk7KZmoSgiPl3nhgTEjHr9QMdYsi6PfaTWK2eI8Pmj2MkF4S/9hMSUfP/5CAqKKj+YHcw6lm2rMMbvEtslMxfQJU8N2KYG9Pkx97L/U/QpYpkeSSUk0afjFbK8Ln+xP5+iEz4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737162843; c=relaxed/simple;
	bh=5UBAdDtHBEY4R2Nbcbb9/ECLTsTyYbSkaNBHYfSJmWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cb4hkEsbpS/wTlGjKKU2odLLlHjVRmpz2zJxfBaTBjsEHiSuPCDU/9bg1ub9Hwyx6hCrl5c8mDKAkctA04T8zuoNFA7UT1Ojx/87iLfaKLE5wIAUCLnNjelkJ69lsW/xbAl76Kwr1H7NNTUIcxmmcMd4w7mY/rdACz8mKqMePpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjzVkeeA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjzVkeeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737162841; x=1768698841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5UBAdDtHBEY4R2Nbcbb9/ECLTsTyYbSkaNBHYfSJmWc=;
  b=WjzVkeeAPn6bEW9s+Q6jp8Zg3x1VRM4lSm1vqdQIGNfaxpFQGSfqNhK+
   4jjz6JglE/5Tc8/1yNiiDsnpEmLTUpPV7YTQQitKJu+Nf5BPf4w2vk2DB
   u7yXD8f+5Y5nldE9ZjsxDn2F8ZMVmcLrqDtc7PfrFToc3kbzMMT+7QXYm
   vEpsMkaZXEs8teHQG4iwC2zKn8vh9IE+hTlRBHIg6b2wbYUIc4hUYtiqC
   kS8DtyZeTjb62QdcF37YSPrTBNzMZgsQklYf4k53KNF0LyMmw8l563hqj
   P1wu8w/HRvOVw13Oz4ZxKqaCOrq/b6sMKhnlDSaz0zpGfiKJMOxmqn49K
   g==;
X-CSE-ConnectionGUID: lCgdeNl0Q5aeinnIvHP0/A==
X-CSE-MsgGUID: cGyKoGTSTCeFfgs9OSUsKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="49006622"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="49006622"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 17:14:01 -0800
X-CSE-ConnectionGUID: U5VSYdGYSguf6tEM0WxKhQ==
X-CSE-MsgGUID: IJ0SwktZQNCV9AV3BN+4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143236834"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 17:13:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYxPR-000TuY-26;
	Sat, 18 Jan 2025 01:13:57 +0000
Date: Sat, 18 Jan 2025 09:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1826/1826] drivers/irqchip/irq-gic-v3.c:1036:23:
 error: call to undeclared function 'pde_data'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202501180931.eG4TBbkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5cbe5b715d9cac271b2c6175e728f0c4167f675
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [1826/1826] arm64: Introduce Xint software solution
config: arm64-randconfig-r123-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180931.eG4TBbkV-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501180931.eG4TBbkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180931.eG4TBbkV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1036:23: error: call to undeclared function 'pde_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           int irq = (int)(long)pde_data(file_inode(file));
                                ^
   drivers/irqchip/irq-gic-v3.c:1074:2: error: call to undeclared function 'seq_printf'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
           ^
   drivers/irqchip/irq-gic-v3.c:1074:46: error: incomplete definition of type 'struct seq_file'
           seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
                                                      ~^
   arch/arm64/include/asm/smp.h:56:8: note: forward declaration of 'struct seq_file'
   struct seq_file;
          ^
   drivers/irqchip/irq-gic-v3.c:1080:9: error: call to undeclared function 'single_open'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return single_open(file, xint_proc_show, pde_data(inode));
                  ^
   drivers/irqchip/irq-gic-v3.c:1080:9: note: did you mean 'simple_open'?
   include/linux/fs.h:3226:12: note: 'simple_open' declared here
   extern int simple_open(struct inode *inode, struct file *file);
              ^
   drivers/irqchip/irq-gic-v3.c:1080:43: error: call to undeclared function 'pde_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return single_open(file, xint_proc_show, pde_data(inode));
                                                    ^
   drivers/irqchip/irq-gic-v3.c:1085:15: error: use of undeclared identifier 'seq_read'
           .proc_read      = seq_read,
                             ^
   drivers/irqchip/irq-gic-v3.c:1086:16: error: use of undeclared identifier 'seq_lseek'
           .proc_lseek     = seq_lseek,
                             ^
   drivers/irqchip/irq-gic-v3.c:1087:18: error: use of undeclared identifier 'single_release'
           .proc_release   = single_release,
                             ^
   drivers/irqchip/irq-gic-v3.c:1083:30: error: variable has incomplete type 'const struct proc_ops'
   static const struct proc_ops xint_proc_ops = {
                                ^
   drivers/irqchip/irq-gic-v3.c:1083:21: note: forward declaration of 'struct proc_ops'
   static const struct proc_ops xint_proc_ops = {
                       ^
>> drivers/irqchip/irq-gic-v3.c:1097:2: error: call to undeclared function 'proc_create_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
           ^
>> drivers/irqchip/irq-gic-v3.c:1105:2: error: call to undeclared function 'remove_proc_entry'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           remove_proc_entry("xint", desc->dir);
           ^
   11 errors generated.


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
  1084		.proc_open	= xint_proc_open,
  1085		.proc_read	= seq_read,
  1086		.proc_lseek	= seq_lseek,
> 1087		.proc_release	= single_release,
  1088		.proc_write	= xint_proc_write,
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
