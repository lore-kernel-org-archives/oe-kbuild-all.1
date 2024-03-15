Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F959B6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710544711; cv=none; b=WssVVTe4aZIWhoxQzonifEDeqszq7d8Exsv2urx/IYuPI9SkXyOknoctpHhz8tiexMHlcfunUo6dHc+8psfrRdff6rs/RH9iXbzsChYlZ2DsXrsUoV97pa4ieIyQmsvkZTmB3MpUtPOLL+fbgzNh0XedgiIjeHPJIdypLAf8PPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710544711; c=relaxed/simple;
	bh=1BIwJDMgB0ZiUW0rfJVmvQqq6dw1q/9m0HXKqqhMCUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K6d3IqYkfp/xzNJUmvbsZuqA1j7wFDDk8kQr6tgpdmEI3AUKwBeffV8AGvqaQngSM9VE+/gg5fkEayCOggnENV4uQWvQ6P3ujcRzEjZQ5R4Z5n8pz0zgSLmCgJJ1Br7hRo0c7/+elrcjXVcWbpQMA7aQP035w2ZqU0TI6fkbF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPB5IEXp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPB5IEXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710544708; x=1742080708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1BIwJDMgB0ZiUW0rfJVmvQqq6dw1q/9m0HXKqqhMCUk=;
  b=NPB5IEXpmRisUrVLrkMf5Y76XY6FxqjKjoJnXaf1G2WjlIek+r50U20a
   v0qEkBaSV6kUuF/URf6UIP0RlUVQLz+UOc587T4dT0KpAN8+OQVvQ7GOg
   u7GYXL1PomFysqaSFOduxlscP2L1KjcKrEHKLJl8nJdPQ3fnIcRI+OfUM
   yrJ5ff6VvR98jLDoRiN/FMRi3vwSmI1JiQ6eSZzhiyNrDH5EY+QiXjTNK
   QTVNRELQMPR0sXt5PjqsKiQcojK5Ic3gtUVO48GeZNWeR/FBIVFQwDZm0
   JTNIVFOafJMdvcJquHy/3C7GKjKwhA9y3wsyNL5/oYzpMVCyzgYhRMaCv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5299004"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5299004"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 16:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="43882735"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Mar 2024 16:18:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlGog-000Es1-2i;
	Fri, 15 Mar 2024 23:18:22 +0000
Date: Sat, 16 Mar 2024 07:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27030/27507]
 arch/x86/mm/fault.c:1376:12: warning: no previous prototype for
 'handle_simulate_fault'
Message-ID: <202403160757.bkO85lgm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 0a79fdbd088607c19950a1b43d18ffd47be07681 [27030/27507] mm: introduce the write simulate mechanism for special VMA
config: x86_64-buildonly-randconfig-003-20240305 (https://download.01.org/0day-ci/archive/20240316/202403160757.bkO85lgm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160757.bkO85lgm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160757.bkO85lgm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/fault.c:1376:12: warning: no previous prototype for 'handle_simulate_fault' [-Wmissing-prototypes]
    1376 | vm_fault_t handle_simulate_fault(struct vm_area_struct *vma, unsigned long address,
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/handle_simulate_fault +1376 arch/x86/mm/fault.c

  1374	
  1375	/* Simulate the write operation for the special vma. */
> 1376	vm_fault_t handle_simulate_fault(struct vm_area_struct *vma, unsigned long address,
  1377					 struct pt_regs *regs)
  1378	{
  1379		int ret;
  1380		const void __user *from = (void __user *)regs->ip;
  1381		unsigned char buf[MAX_INSN_SIZE];
  1382		struct insn insn;
  1383	
  1384		/*
  1385		 * Copy the data from userspace may cause the pagefault nesting, so we use
  1386		 * copy_from_user_nmi to disable pagefault to avoid pagefault nesting problem.
  1387		 */
  1388		ret = copy_from_user_nmi(buf, from, MAX_INSN_SIZE);
  1389		if (ret)
  1390			return VM_FAULT_SIGBUS;
  1391	
  1392		/* Always be x86_64 */
  1393		insn_init(&insn, buf, MAX_INSN_SIZE, 1);
  1394		insn_get_length(&insn);
  1395	
  1396		/* Make sure there was not a problem decoding the instruction and getting the length. */
  1397		if (!insn.length)
  1398			return VM_FAULT_SIGBUS;
  1399	
  1400		ret = insn_decode(&insn, vma, regs, address);
  1401	
  1402		/* Retry to execute this instruction */
  1403		if (unlikely(ret == SIMULATE_RETRY))
  1404			return 0;
  1405	
  1406		if (unlikely(ret))
  1407			return VM_FAULT_SIGBUS;
  1408	
  1409		/* Skip the instruction that caused the pagefault */
  1410		regs->ip += insn.length;
  1411		return 0;
  1412	}
  1413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
