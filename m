Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D50AEDE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715986116; cv=none; b=urhxhMTumSMTXn9SFVaBuhMKU8LjvkEFi/MotGXduevq6b90NAooUg+Y4BL/oL/5zybmY3pCN05WMuE13CkQN/F2wVMGKssunrkRxhmjSP0JltVxyrbK2w8R1qh325OYyymD5EeHKbH51KLaHQZR3D6NrEROmQjXvENwSHKB8UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715986116; c=relaxed/simple;
	bh=8XWfGZvEPqq/H6w/VDsfbHQkUawAuShFuxl+RFtx6gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOmqu0iXBnbazhX8oGAKjl/+jHfeoc31oB5icg/eyt/yvdSsCfdMIGKo/Og7SfgCZduDBbwWNJ0hbXdN2vrFB+NtnJ6+KDZwSdR+X4v7U2GhtJKq+liQH2mkDvq/1W2KO8AEMROXG7DWlC0fKoulID6MURsiCm28EzSClLTlGNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Auard4lp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Auard4lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715986114; x=1747522114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8XWfGZvEPqq/H6w/VDsfbHQkUawAuShFuxl+RFtx6gw=;
  b=Auard4lp/xc3XDqGbqkFV9BekwgxfGnqxXYS8ErmxeaGAM7btMPCu4Q5
   30xbX/2nizvW3skbuzK8DEUgM4tm4la4lMA0WNPEtOTKAeppOkzOoJ1YE
   VZLxT+ib1tly1Q6nar65Eq6K/lZg8XhKt1ypaYNopxhSyKm7i2l5QnThF
   yAAjXuFH4B6Jc4U91CdtQbfuaU71f3IZ5AsX7N+gFtCMIHlkQL/mpnS0j
   8cnJE99f9z9TyzTR0TchUlvN7OlKUhywYR8DoSuGNyGR4tVXd50isrGtY
   S233LF/JkgGzePjVnieioqVm8YAK9I61dDRdSColQuQgGiCary0D/060P
   g==;
X-CSE-ConnectionGUID: j6yHn6QiQpS9X/vrgHyqcQ==
X-CSE-MsgGUID: ILBXCbsIQv+ZTMOx+7A6gA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22765456"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="22765456"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 15:48:34 -0700
X-CSE-ConnectionGUID: xspTHdKxTHSVVoX2ImCjjA==
X-CSE-MsgGUID: j5IY9QlBThiM9vKGKQ2s0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="36493206"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 May 2024 15:48:31 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s86Me-0001CU-2z;
	Fri, 17 May 2024 22:47:55 +0000
Date: Sat, 18 May 2024 06:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6623/6628] include/linux/psp-hygon.h:346:5:
 warning: no previous prototype for 'psp_register_cmd_notifier'
Message-ID: <202405180613.FWJM1nnq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95dac159be359bc7ba42421426462f1a96f50ee9
commit: d1a84dd07d691b3b5acb6b5f83188b95564764cb [6623/6628] Support psp virtualization
config: x86_64-randconfig-015-20240518 (https://download.01.org/0day-ci/archive/20240518/202405180613.FWJM1nnq-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405180613.FWJM1nnq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405180613.FWJM1nnq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/psp.c:14:
>> include/linux/psp-hygon.h:346:5: warning: no previous prototype for 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     346 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/psp-hygon.h:347:5: warning: no previous prototype for 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     347 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/psp.c:22:5: warning: no previous prototype for 'guest_addr_map_table_op' [-Wmissing-prototypes]
      22 | int guest_addr_map_table_op(void *data_hva, gpa_t data_gpa, gpa_t table_gpa,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/psp_register_cmd_notifier +346 include/linux/psp-hygon.h

88a4c829d362f1 chench 2024-03-18  345  
88a4c829d362f1 chench 2024-03-18 @346  int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
88a4c829d362f1 chench 2024-03-18 @347  int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
88a4c829d362f1 chench 2024-03-18  348  

:::::: The code at line 346 was first introduced by commit
:::::: 88a4c829d362f1c2d23ddf92e59b6d8bfdfe3704 crypto: ccp: Add another mailbox interrupt support for PSP sending command to X86

:::::: TO: chench <chench@hygon.cn>
:::::: CC: hanliyang <hanliyang@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
