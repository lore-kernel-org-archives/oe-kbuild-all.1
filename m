Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686563C0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 00:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733791598; cv=none; b=BcgMtS0cHJCOXwhh95wDnodsueL2eWvu2fhBFUaVnYzGhGm/OTiRdV1ioJ4P2wLPloC4ojLKA8Daw2eRn9I2OYiV5Lvy2gx0/pljJQjKChn8vwgKt/jFxIoWCMcMo/vDN04oXyzmnvNIod6LCUwSTJcp8GJplUivjkSSB5+iK64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733791598; c=relaxed/simple;
	bh=5z7AZvJF4eB8EMW8Bp7Ytj8hfb52Rf0LhTOAV2rghTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwSJnnDjJq6X2/ayl8uYMqpzsUwwVi+LAQMAOUlT+x295u8Vv3nQt7rFpQjj5fc6B8nEtolo9ZRYZXAdj5bCXPZ2LPMuwVELzWke5KIOTJ7UiFxZXZTFPtO1uFszBLBGHsIunTv/L4uu/kHFeGiTaX2guMvajI4GS7gQJe0OPug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZzqh2WS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZzqh2WS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733791597; x=1765327597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5z7AZvJF4eB8EMW8Bp7Ytj8hfb52Rf0LhTOAV2rghTo=;
  b=ZZzqh2WSm8TliYPnNs6+/kJjI9VqesknRZaId9yGw9RR3Bi/dFxyCfyb
   M4xMyZMVu4GG2a4Rk6ZySxPMNIGywiCsSf3eEk6zFMjX7DLzx4tqc8qyz
   +KfLCQuSvCpLbBMguMcbVEUb5MX3+DiGwDDzvACWuaGAg0v+SH7pSv5MS
   dYnJ1xBoThWMS1hbTm2hEjeIrQOx16CoZW03L2mVQkneKC9dV8mz0Fy4X
   G7k3IcI7LQZ3X+Sg1nffUmrNPe4gRIcDykqkis0F4qJbU1mbkjQjLpZ0s
   pytoDut8qB/3KP3aQURl6DV79Jbzi6t3wS40KZPColfteI+4874nMXZ/s
   Q==;
X-CSE-ConnectionGUID: 0TE3JNEVSmO7TH7JeoS7iQ==
X-CSE-MsgGUID: ZbshusGGQmmiBWRlSkH7wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44793563"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="44793563"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 16:46:36 -0800
X-CSE-ConnectionGUID: XmquwA9tT56d5LU8KAzzOg==
X-CSE-MsgGUID: VXaCEfSWRI2w9AXUkcbk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="126137785"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 16:46:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKoOV-0004yt-30;
	Tue, 10 Dec 2024 00:46:31 +0000
Date: Tue, 10 Dec 2024 08:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] drivers/irqchip/irq-gic-v3.c:1036:23:
 error: call to undeclared function 'pde_data'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202412100826.ymHdQKlB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [1613/1613] arm64: Introduce Xint software solution
config: arm64-randconfig-003-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100826.ymHdQKlB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100826.ymHdQKlB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100826.ymHdQKlB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-gic-v3.c:25:
   In file included from include/linux/irqchip/arm-gic-v3.h:632:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:1036:23: error: call to undeclared function 'pde_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1036 |         int irq = (int)(long)pde_data(file_inode(file));
         |                              ^
>> drivers/irqchip/irq-gic-v3.c:1074:2: error: call to undeclared function 'seq_printf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1074 |         seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
         |         ^
>> drivers/irqchip/irq-gic-v3.c:1074:46: error: incomplete definition of type 'struct seq_file'
    1074 |         seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
         |                                                    ~^
   arch/arm64/include/asm/smp.h:56:8: note: forward declaration of 'struct seq_file'
      56 | struct seq_file;
         |        ^
>> drivers/irqchip/irq-gic-v3.c:1080:9: error: call to undeclared function 'single_open'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1080 |         return single_open(file, xint_proc_show, pde_data(inode));
         |                ^
   drivers/irqchip/irq-gic-v3.c:1080:9: note: did you mean 'simple_open'?
   include/linux/fs.h:3226:12: note: 'simple_open' declared here
    3226 | extern int simple_open(struct inode *inode, struct file *file);
         |            ^
   drivers/irqchip/irq-gic-v3.c:1080:43: error: call to undeclared function 'pde_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1080 |         return single_open(file, xint_proc_show, pde_data(inode));
         |                                                  ^
>> drivers/irqchip/irq-gic-v3.c:1085:15: error: use of undeclared identifier 'seq_read'
    1085 |         .proc_read      = seq_read,
         |                           ^
>> drivers/irqchip/irq-gic-v3.c:1086:16: error: use of undeclared identifier 'seq_lseek'
    1086 |         .proc_lseek     = seq_lseek,
         |                           ^
>> drivers/irqchip/irq-gic-v3.c:1087:18: error: use of undeclared identifier 'single_release'
    1087 |         .proc_release   = single_release,
         |                           ^
>> drivers/irqchip/irq-gic-v3.c:1083:30: error: variable has incomplete type 'const struct proc_ops'
    1083 | static const struct proc_ops xint_proc_ops = {
         |                              ^
   drivers/irqchip/irq-gic-v3.c:1083:21: note: forward declaration of 'struct proc_ops'
    1083 | static const struct proc_ops xint_proc_ops = {
         |                     ^
>> drivers/irqchip/irq-gic-v3.c:1097:2: error: call to undeclared function 'proc_create_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1097 |         proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |         ^
>> drivers/irqchip/irq-gic-v3.c:1097:39: error: no member named 'dir' in 'struct irq_desc'
    1097 |         proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |                                        ~~~~  ^
>> drivers/irqchip/irq-gic-v3.c:1105:2: error: call to undeclared function 'remove_proc_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1105 |         remove_proc_entry("xint", desc->dir);
         |         ^
   drivers/irqchip/irq-gic-v3.c:1105:34: error: no member named 'dir' in 'struct irq_desc'
    1105 |         remove_proc_entry("xint", desc->dir);
         |                                   ~~~~  ^
   5 warnings and 13 errors generated.


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
> 1074		seq_printf(m, "%d\n", xint_transform((long)m->private, XINT_SET_CHECK));
  1075		return 0;
  1076	}
  1077	
  1078	static int xint_proc_open(struct inode *inode, struct file *file)
  1079	{
> 1080		return single_open(file, xint_proc_show, pde_data(inode));
  1081	}
  1082	
> 1083	static const struct proc_ops xint_proc_ops = {
  1084		.proc_open	= xint_proc_open,
> 1085		.proc_read	= seq_read,
> 1086		.proc_lseek	= seq_lseek,
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
