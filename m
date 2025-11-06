Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208A63C38
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762405092; cv=none; b=r1oQ8nZdHlOwmzu7WYAtajSSp5GA3Z94f7O4g4psS9m7IFjlJ3XU88l23m0V3uemQvbwzg4X12cVnuBn7fIa6WjTIb84UY/tNLvZGZB+qVmQGcEDxjdf2bIORyDaRmyUA4Tf++4SbE7vF5CbsC9uS5EyQwj62mxyazImB2RWT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762405092; c=relaxed/simple;
	bh=zmOs/hv/LODxBpGkiAXckZifF11dWSHUi2Bebdz1LMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YY422OIcO/75fDBjDJOrQEPOyJCKS15aCNigcjx0YOEetprnMm3q2yRU0ncNj6vWM8IJXoSTzZhs35643jwqoL3mbnugOkyTLFmqpYAnciRDtAA8J0s4FoEsuuKqazlFMifCHvJZ7PYrzemgGgYMETWtSrxkpTkuJoj/+fgXMaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHew6YgF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHew6YgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762405091; x=1793941091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmOs/hv/LODxBpGkiAXckZifF11dWSHUi2Bebdz1LMM=;
  b=fHew6YgFUwL9VlX8ppHxKLIooopGb97KfQGUCVO51ZVSd6p7J6n+QKF0
   JROPChLiMxmNsD4NTMEiDQFKZr2n1nMbz0hqGu05Iw9dx2zBH8SuY641L
   YTKuawWz66CAVQSsBTehQyVgFClGyjuAnWj2ObkWj6WB9j4Wreh6bopGo
   b2w7idZsw1tYrSCXR8vcwF5xCfasZCvGKuHUdg3B5DGCeqW+KKlDgu+BY
   9TzEyE42/tg7IJUrwDmvrzHPBLdwOG2GkEoiEKBYLr9BnjbbK9ZkvknjE
   hJvbGnj4wG/MVc4RMRYxnEbSP+ujGsh+vSCqx1F6efjBD1rIpVvEg7JVV
   w==;
X-CSE-ConnectionGUID: 6KdD+yXPTISkz6kdXjjYEw==
X-CSE-MsgGUID: 5p8aDvwjQoyMM5AQKLyOew==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75649335"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="75649335"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:58:10 -0800
X-CSE-ConnectionGUID: WmT07QwqQlCROkzc6iRdTg==
X-CSE-MsgGUID: av4hbY/wQ/q/Gg3Z/pNO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="188376916"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2025 20:58:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGs4U-000TVC-1H;
	Thu, 06 Nov 2025 04:58:06 +0000
Date: Thu, 6 Nov 2025 12:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3116/3116] drivers/ub/ubase/ubase_cmd.c:551:26:
 warning: variable 'desc' set but not used
Message-ID: <202511061247.ZMPukP6K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b2b8512ca97108929f3aca5405875d91577b8c80
commit: 663203772f391e4bd5f17d800974f694137fc2e9 [3116/3116] !18710 ub: ubase: Add support of base driver for ub network
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251106/202511061247.ZMPukP6K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061247.ZMPukP6K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061247.ZMPukP6K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_THREAD__ 1
         |         ^
>> drivers/ub/ubase/ubase_cmd.c:551:26: warning: variable 'desc' set but not used [-Wunused-but-set-variable]
     551 |         struct ubase_cmdq_desc *desc;
         |                                 ^
>> drivers/ub/ubase/ubase_cmd.c:576:6: warning: no previous prototype for function 'ubase_cmd_crq_handler' [-Wmissing-prototypes]
     576 | void ubase_cmd_crq_handler(struct ubase_dev *udev)
         |      ^
   drivers/ub/ubase/ubase_cmd.c:576:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     576 | void ubase_cmd_crq_handler(struct ubase_dev *udev)
         | ^
         | static 
   3 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_THREAD__ 1
         |         ^
>> drivers/ub/ubase/ubase_eq.c:785:6: warning: no previous prototype for function 'ubase_irq_table_free' [-Wmissing-prototypes]
     785 | void ubase_irq_table_free(struct ubase_dev *udev)
         |      ^
   drivers/ub/ubase/ubase_eq.c:785:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     785 | void ubase_irq_table_free(struct ubase_dev *udev)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/ub/ubase/ubase_cmd.c:757: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * When uninstalling, cmdq needs to be successfully sended as much as possible,


vim +/desc +551 drivers/ub/ubase/ubase_cmd.c

8d68017f37faef Xiongchuan Zhou 2025-09-12  547  
8d68017f37faef Xiongchuan Zhou 2025-09-12  548  static void ubase_gen_single_bd_data(struct ubase_dev *udev, void **msg_data)
8d68017f37faef Xiongchuan Zhou 2025-09-12  549  {
8d68017f37faef Xiongchuan Zhou 2025-09-12  550  	struct ubase_cmdq_ring *crq = &udev->hw.cmdq.crq;
8d68017f37faef Xiongchuan Zhou 2025-09-12 @551  	struct ubase_cmdq_desc *desc;
8d68017f37faef Xiongchuan Zhou 2025-09-12  552  
8d68017f37faef Xiongchuan Zhou 2025-09-12  553  	desc = &crq->desc[crq->ci];
8d68017f37faef Xiongchuan Zhou 2025-09-12  554  	*msg_data = crq->desc[crq->ci].data;
8d68017f37faef Xiongchuan Zhou 2025-09-12  555  	UBASE_MOVE_CRQ_RING_PTR(crq);
8d68017f37faef Xiongchuan Zhou 2025-09-12  556  }
8d68017f37faef Xiongchuan Zhou 2025-09-12  557  
8d68017f37faef Xiongchuan Zhou 2025-09-12  558  static void ubase_gen_bd_data(struct ubase_dev *udev, u32 bd_num,
8d68017f37faef Xiongchuan Zhou 2025-09-12  559  			      void **msg_data, u32 msg_data_len)
8d68017f37faef Xiongchuan Zhou 2025-09-12  560  {
8d68017f37faef Xiongchuan Zhou 2025-09-12  561  	if (bd_num == 1) {
8d68017f37faef Xiongchuan Zhou 2025-09-12  562  		ubase_gen_single_bd_data(udev, msg_data);
8d68017f37faef Xiongchuan Zhou 2025-09-12  563  		return;
8d68017f37faef Xiongchuan Zhou 2025-09-12  564  	}
8d68017f37faef Xiongchuan Zhou 2025-09-12  565  
8d68017f37faef Xiongchuan Zhou 2025-09-12  566  	ubase_gen_multi_bd_data(udev, bd_num, msg_data, msg_data_len);
8d68017f37faef Xiongchuan Zhou 2025-09-12  567  }
8d68017f37faef Xiongchuan Zhou 2025-09-12  568  
8d68017f37faef Xiongchuan Zhou 2025-09-12  569  static bool ubase_cmd_crq_empty(struct ubase_dev *udev, struct ubase_hw *hw)
8d68017f37faef Xiongchuan Zhou 2025-09-12  570  {
8d68017f37faef Xiongchuan Zhou 2025-09-12  571  	hw->cmdq.crq.pi = ubase_read_dev(hw, UBASE_CRQ_TAIL_REG);
8d68017f37faef Xiongchuan Zhou 2025-09-12  572  
8d68017f37faef Xiongchuan Zhou 2025-09-12  573  	return hw->cmdq.crq.pi == hw->cmdq.crq.ci;
8d68017f37faef Xiongchuan Zhou 2025-09-12  574  }
8d68017f37faef Xiongchuan Zhou 2025-09-12  575  
8d68017f37faef Xiongchuan Zhou 2025-09-12 @576  void ubase_cmd_crq_handler(struct ubase_dev *udev)
8d68017f37faef Xiongchuan Zhou 2025-09-12  577  {
8d68017f37faef Xiongchuan Zhou 2025-09-12  578  	struct ubase_cmdq_ring *crq = &udev->hw.cmdq.crq;
8d68017f37faef Xiongchuan Zhou 2025-09-12  579  	u32 msg_data_len;
8d68017f37faef Xiongchuan Zhou 2025-09-12  580  	void *msg_data;
8d68017f37faef Xiongchuan Zhou 2025-09-12  581  	u16 opcode;
8d68017f37faef Xiongchuan Zhou 2025-09-12  582  	u8 bd_num;
8d68017f37faef Xiongchuan Zhou 2025-09-12  583  	u8 flag;
8d68017f37faef Xiongchuan Zhou 2025-09-12  584  
8d68017f37faef Xiongchuan Zhou 2025-09-12  585  	while (!ubase_cmd_crq_empty(udev, &udev->hw)) {
8d68017f37faef Xiongchuan Zhou 2025-09-12  586  		if (test_bit(UBASE_STATE_CMD_DISABLE, &udev->hw.state)) {
8d68017f37faef Xiongchuan Zhou 2025-09-12  587  			ubase_warn(udev,
8d68017f37faef Xiongchuan Zhou 2025-09-12  588  				   "command queue needs re-initializing.\n");
8d68017f37faef Xiongchuan Zhou 2025-09-12  589  			return;
8d68017f37faef Xiongchuan Zhou 2025-09-12  590  		}
8d68017f37faef Xiongchuan Zhou 2025-09-12  591  
8d68017f37faef Xiongchuan Zhou 2025-09-12  592  		opcode = crq->desc[crq->ci].opcode;
8d68017f37faef Xiongchuan Zhou 2025-09-12  593  		bd_num = crq->desc[crq->ci].bd_num;
8d68017f37faef Xiongchuan Zhou 2025-09-12  594  		flag = crq->desc[crq->ci].flag;
8d68017f37faef Xiongchuan Zhou 2025-09-12  595  		msg_data_len = bd_num * sizeof(struct ubase_cmdq_desc) -
8d68017f37faef Xiongchuan Zhou 2025-09-12  596  			       UBASE_CMD_HEADER_LENGTH;
8d68017f37faef Xiongchuan Zhou 2025-09-12  597  
8d68017f37faef Xiongchuan Zhou 2025-09-12  598  		if (unlikely(!bd_num || !(flag & UBASE_CMD_FLAG_OUT))) {
8d68017f37faef Xiongchuan Zhou 2025-09-12  599  			ubase_err(udev,
8d68017f37faef Xiongchuan Zhou 2025-09-12  600  				  "drop invalid crq message, opcode = 0x%x, bd_num = %u, flag = 0x%x.",
8d68017f37faef Xiongchuan Zhou 2025-09-12  601  				  opcode, bd_num, flag);
8d68017f37faef Xiongchuan Zhou 2025-09-12  602  			UBASE_MOVE_CRQ_RING_PTR(crq);
8d68017f37faef Xiongchuan Zhou 2025-09-12  603  			continue;
8d68017f37faef Xiongchuan Zhou 2025-09-12  604  		}
8d68017f37faef Xiongchuan Zhou 2025-09-12  605  
8d68017f37faef Xiongchuan Zhou 2025-09-12  606  		ubase_gen_bd_data(udev, bd_num, &msg_data, msg_data_len);
8d68017f37faef Xiongchuan Zhou 2025-09-12  607  
8d68017f37faef Xiongchuan Zhou 2025-09-12  608  		ubase_cmd_exec_callback(udev, opcode, msg_data,
8d68017f37faef Xiongchuan Zhou 2025-09-12  609  					msg_data_len);
8d68017f37faef Xiongchuan Zhou 2025-09-12  610  
8d68017f37faef Xiongchuan Zhou 2025-09-12  611  		ubase_free_bd_data(msg_data, bd_num);
8d68017f37faef Xiongchuan Zhou 2025-09-12  612  	}
8d68017f37faef Xiongchuan Zhou 2025-09-12  613  
8d68017f37faef Xiongchuan Zhou 2025-09-12  614  	ubase_write_dev(&udev->hw, UBASE_CRQ_HEAD_REG, crq->ci);
8d68017f37faef Xiongchuan Zhou 2025-09-12  615  }
8d68017f37faef Xiongchuan Zhou 2025-09-12  616  

:::::: The code at line 551 was first introduced by commit
:::::: 8d68017f37faefe5f545dbfd994e1b5141ec06e1 ub: ubase: support for command process

:::::: TO: Xiongchuan Zhou <zhouxiongchuan@h-partners.com>
:::::: CC: Fengyan Mu <mufengyan@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
