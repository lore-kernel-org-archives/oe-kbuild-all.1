Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B437E5D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 16:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168587; cv=none; b=YeoKSzauViFLJzjeTD/vSmZIqJHe+z0uRA0DXEGguUqVU7LzxFH60wapqtYAOhkWbAQ+Uge4hK/siqEtYls/npwufCOpMPw9fCGET8Y2l6TfGkObSSGQHaY5GYTviPJc1IZ7/ZpHGdFU/LZF4tXKzvkNVbNnEDFNV8bce2ewsOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168587; c=relaxed/simple;
	bh=Mwg0nBssQqDExHuk0DhnIhqHgy6HbMspT0MYSMhyk5I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sN51a3GcGzFNhg4VbG3odC7VlYVPSyzQJop74wgMQf1ZmNKfVlnNZUdeRlW52XgQT8iUUO8al6mLobOOd+e2dO6tVow25f2+XU5sxaW6gP0PLveO+I3eRdw6I130nAGtDZjWYnRrcP14TxG1YxZqWHgztP0ZduA9gHt1wgPoWmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngzjvu1t; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngzjvu1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792168585; x=1823704585;
  h=date:from:to:cc:subject:message-id;
  bh=Mwg0nBssQqDExHuk0DhnIhqHgy6HbMspT0MYSMhyk5I=;
  b=ngzjvu1tTmwGHlLuf8E4TeLHnRxivoV50H8tG+w6WbtGrIImpaUJrSas
   XN836E/UO4BdHHXghcJmktjzYsndhXeuB1tIi4ugLf4u2FgADzl5VAyYl
   zLl6K8f4MzQm3jUr2Oo4Q8rQiRk5A+Usf8bTeecLjQ8906oG84EyPYLUt
   OOvV2whJz1i4E7cUYhQazm5Skl+me56rE30/OvFaMzLIKlWAYkY62/KG5
   hWY9WuG1Um+jEGlay9u6fHwKzLV/Y+rR49hUxx5z2mch71Q27Hpo3rSc1
   Nfy+R5DBgwk88/Ke+7L7nFMXgMmn/hoLVa4jyOM4LVKoIvMWB+zaSE/hJ
   w==;
X-CSE-ConnectionGUID: ebquIfRjSdWRGHDwUI2OfA==
X-CSE-MsgGUID: IO75ZiUDRiOQhKBcnHIPrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="958864"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="958864"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 09:36:24 -0700
X-CSE-ConnectionGUID: USquns0dQUGu3PxvSeRAtQ==
X-CSE-MsgGUID: nI6o0HO7Sb+gE+14hAJSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1996930"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2026 09:36:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHkuq-00000000CIh-3HV5;
	Fri, 16 Oct 2026 16:36:20 +0000
Date: Fri, 16 Oct 2026 18:35:41 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4669:25: sparse: sparse: incorrect
 type in argument 4 (different base types)
Message-ID: <202610161859.oKWHrBeh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b9d5e9a3a59c79fd6ec703c9780ab38ad1c0505d
commit: 8be15087d03752ee6b53e54bd962f0ecf9bb5658 [1/1] scsi: hisi_sas: Use macro instead of magic number
config: arm64-randconfig-r2307-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161859.oKWHrBeh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161859.oKWHrBeh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161859.oKWHrBeh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1492:26: sparse: sparse: invalid assignment: |=
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1492:26: sparse:    left side has type restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1492:26: sparse:    right side has type unsigned int
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4669:25: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __le32 [usertype] *[assigned] ptr @@     got unsigned int * @@
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4669:25: sparse:     expected restricted __le32 [usertype] *[assigned] ptr
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4669:25: sparse:     got unsigned int *

vim +4669 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

  4660	
  4661	static int debugfs_fifo_data_v3_hw_show(struct seq_file *s, void *p)
  4662	{
  4663		struct hisi_sas_phy *phy = s->private;
  4664	
  4665		debugfs_read_fifo_data_v3_hw(phy);
  4666	
  4667		debugfs_show_row_32_v3_hw(s, 0,
  4668				HISI_SAS_FIFO_DATA_DW_SIZE * HISI_SAS_REG_MEM_SIZE,
> 4669				phy->fifo.rd_data);
  4670	
  4671		return 0;
  4672	}
  4673	DEFINE_SHOW_ATTRIBUTE(debugfs_fifo_data_v3_hw);
  4674	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
