Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521EE208A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 01:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733361849; cv=none; b=k6QTumSDmwuxbgdyrQx6BwP0s544sLmfiVjMVs2Uf2QGQuXFvwLGH7jAZJ4TpEH+ZGA12w6AUZE4VvWoDxUYp/97tnNZ0/BUimETomS+unWupDmq9BuAy757JYpCnnnMladhpqX3dmghxkjo0lRSqIQwW2ZO2yLRkLSUz3Nax4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733361849; c=relaxed/simple;
	bh=bj14wD9fWI982Q4yZS6suAMv+T1YtrUdXkmBxl2DsP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nAAVWbFNQadUbG+2EQdM5fOeH45iScV7RCWPHdTfG+tecehhRe3WqQVHswZ7aKkkWPIYq90PEDqB1aERvfk9QC6UouIyd8srvYc/4PqJgTF7qI9oLuta7E7eelNGy9n5goNkZ4mxahU3IpnJkxsx93Ti1TcY4+/les5TaaaRvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bs7gOLBn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs7gOLBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733361847; x=1764897847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bj14wD9fWI982Q4yZS6suAMv+T1YtrUdXkmBxl2DsP0=;
  b=bs7gOLBnigC4/g6LUj7308J1He70WemdGPcnkZdCG6O/3mirGC0GRXTe
   GRtxeWXMouqT/y0ug994/amkTyKnLFWIhq9OqeCczU21EupsRHqRw/jGL
   pWGSVsT2LlW8NILUgWfXvS0Xp6U1BmdbqiOMnIg8zvegBcfixSCejKsnh
   zF/aO9gi/RWyU+UrQ/Azm5A8wS0ofkjow0DFHxzsHLtdvlPxAYV8F3+Nr
   skUWB+rdzXTJl1eTHylKASGDk+oI5wWaX822XS5Ys6aAcAdjdXaSBNy+1
   j9fF9TPzV2ftUvnQt5z52udGDtdiVVBFi3wAjXXhuEF6AqN0xyaf3L3bJ
   Q==;
X-CSE-ConnectionGUID: iQMc0lGkSgmGyGPX1MLefQ==
X-CSE-MsgGUID: pSTJF/1aS0Se3jazK6e4wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44685138"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="44685138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 17:24:07 -0800
X-CSE-ConnectionGUID: VvfBq1XnT9ynjGNMyeoqwQ==
X-CSE-MsgGUID: fUftj7lwRWOz2zwbPh9geA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98003849"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2024 17:24:05 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ0b5-0003eH-0S;
	Thu, 05 Dec 2024 01:24:03 +0000
Date: Thu, 5 Dec 2024 09:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544]
 drivers/ub/urma/uburma/uburma_dev_ops.c:50:19: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202412050919.gZc1zM8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b71af6f00ede58be00cb7306c9acb2660ec90947
commit: aeda8188894b2ed9ecf04dabaf5e147bce811725 [2544/2544] ub: change name in kconfig, and kconfig content of ub
config: x86_64-randconfig-121-20241205 (https://download.01.org/0day-ci/archive/20241205/202412050919.gZc1zM8m-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050919.gZc1zM8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050919.gZc1zM8m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ub/urma/uburma/uburma_dev_ops.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/wait.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_dev_ops.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_dev_ops.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/ub/urma/uburma/uburma_dev_ops.c:50:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_dev_ops.c:50:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_dev_ops.c:50:19: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_dev_ops.c:71:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_dev_ops.c:71:9: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_dev_ops.c:71:9: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_dev_ops.c:98:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_dev_ops.c:98:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_dev_ops.c:98:19: sparse:    struct ubcore_device *
--
   drivers/ub/urma/uburma/uburma_event.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_event.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_event.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/ub/urma/uburma/uburma_event.c:102:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_event.c:102:20: sparse:    void [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_event.c:102:20: sparse:    void *
--
   drivers/ub/urma/uburma/uburma_main.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_main.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_main.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/ub/urma/uburma/uburma_main.c:215:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_main.c:215:9: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_main.c:215:9: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_main.c:239:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_main.c:239:9: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_main.c:239:9: sparse:    struct ubcore_device *
--
   drivers/ub/urma/uburma/uburma_uobj.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_uobj.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_uobj.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/ub/urma/uburma/uburma_uobj.c:95:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_uobj.c:95:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_uobj.c:95:19: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_uobj.c:396:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_uobj.c:396:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_uobj.c:396:19: sparse:    struct ubcore_device *
--
   drivers/ub/urma/uburma/uburma_cmd.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/wait.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_cmd.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/ub/urma/uburma/uburma_cmd.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/ub/urma/uburma/uburma_cmd.c:296:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cmd.c:296:16: sparse:    void [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cmd.c:296:16: sparse:    void *
   drivers/ub/urma/uburma/uburma_cmd.c:1568:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cmd.c:1568:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cmd.c:1568:19: sparse:    struct ubcore_device *

vim +50 drivers/ub/urma/uburma/uburma_dev_ops.c

cd637a6dded9c0 Yizhen Fan 2023-09-12  32  
7d130c6018dbfd Yizhen Fan 2023-09-12  33  int uburma_mmap(struct file *filp, struct vm_area_struct *vma)
7d130c6018dbfd Yizhen Fan 2023-09-12  34  {
7d130c6018dbfd Yizhen Fan 2023-09-12  35  	struct uburma_file *file = filp->private_data;
7d130c6018dbfd Yizhen Fan 2023-09-12  36  	struct uburma_device *ubu_dev;
7d130c6018dbfd Yizhen Fan 2023-09-12  37  	struct ubcore_device *ubc_dev;
7d130c6018dbfd Yizhen Fan 2023-09-12  38  	int srcu_idx;
7d130c6018dbfd Yizhen Fan 2023-09-12  39  	int ret;
7d130c6018dbfd Yizhen Fan 2023-09-12  40  
7d130c6018dbfd Yizhen Fan 2023-09-12  41  	if (file == NULL || file->ucontext == NULL) {
7d130c6018dbfd Yizhen Fan 2023-09-12  42  		uburma_log_err("can not find ucontext.\n");
7d130c6018dbfd Yizhen Fan 2023-09-12  43  		return -EINVAL;
7d130c6018dbfd Yizhen Fan 2023-09-12  44  	}
7d130c6018dbfd Yizhen Fan 2023-09-12  45  
7d130c6018dbfd Yizhen Fan 2023-09-12  46  	ubu_dev = file->ubu_dev;
7d130c6018dbfd Yizhen Fan 2023-09-12  47  	uburma_cmd_inc(ubu_dev);
7d130c6018dbfd Yizhen Fan 2023-09-12  48  
7d130c6018dbfd Yizhen Fan 2023-09-12  49  	srcu_idx = srcu_read_lock(&ubu_dev->ubc_dev_srcu);
7d130c6018dbfd Yizhen Fan 2023-09-12 @50  	ubc_dev = srcu_dereference(ubu_dev->ubc_dev, &ubu_dev->ubc_dev_srcu);
7d130c6018dbfd Yizhen Fan 2023-09-12  51  	if (ubc_dev == NULL || ubc_dev->ops == NULL || ubc_dev->ops->mmap == NULL) {
7d130c6018dbfd Yizhen Fan 2023-09-12  52  		uburma_log_err("can not find ubcore device.\n");
7d130c6018dbfd Yizhen Fan 2023-09-12  53  		ret = -ENODEV;
7d130c6018dbfd Yizhen Fan 2023-09-12  54  		goto out;
7d130c6018dbfd Yizhen Fan 2023-09-12  55  	}
7d130c6018dbfd Yizhen Fan 2023-09-12  56  
7d130c6018dbfd Yizhen Fan 2023-09-12  57  	ret = ubc_dev->ops->mmap(file->ucontext, vma);
7d130c6018dbfd Yizhen Fan 2023-09-12  58  
7d130c6018dbfd Yizhen Fan 2023-09-12  59  out:
7d130c6018dbfd Yizhen Fan 2023-09-12  60  	srcu_read_unlock(&ubu_dev->ubc_dev_srcu, srcu_idx);
7d130c6018dbfd Yizhen Fan 2023-09-12  61  	uburma_cmd_dec(ubu_dev);
7d130c6018dbfd Yizhen Fan 2023-09-12  62  	return ret;
7d130c6018dbfd Yizhen Fan 2023-09-12  63  }
7d130c6018dbfd Yizhen Fan 2023-09-12  64  

:::::: The code at line 50 was first introduced by commit
:::::: 7d130c6018dbfd09c6e1c5d91b347fdbf3924321 ub: add mmap ops support in ubcore and uburma

:::::: TO: Yizhen Fan <fanyizhen@huawei.com>
:::::: CC: fanyizhen1995 <en_0015767@163.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
