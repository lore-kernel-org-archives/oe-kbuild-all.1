Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0BB19D090
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721140986; cv=none; b=bKsbk6oPyWl5LcZnF44r0l5mRfD2EnPI+ztYYnm8MjyXk4RcMj/q0FBUlikwxeWjHo+zL6jfPnpQ3p2Nj3biY5saRs+Tqo9Kc/U01BYE/D12mhi56KqzV6uRghU6PHSI/VCg11sQv2jx4QoM4WaNJ5Uo2RLDwi2LOyHmzwEou/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721140986; c=relaxed/simple;
	bh=VjOgOVr5EyzMhq/GLS7erlMPouo2fjhppL5XHYuI4A4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oC329kzP226f5xfHNR+lfSBJQuzX5ZhrIUQzUP9nV9pwaBB54zzbcChLF8e8dPVR04EX2xHaT9RRQwF5JmBVyzUBcENIbhUmbCHGolwtbM0mMsGpdtpEAbh48wutw5jsqix10fXGV1aUZsawctgNcO1qiU8M1lYPIvlI2ZEDoA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dc+pr5F6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc+pr5F6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721140984; x=1752676984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VjOgOVr5EyzMhq/GLS7erlMPouo2fjhppL5XHYuI4A4=;
  b=Dc+pr5F6ajFi8lnyFuCn9OpPJslB9/gYItdkyvoMUeu8KUpPyQXUQI1w
   OJK/Ga5pEDZ2HvOuh4djSBNLuND+WcXU1RawsbkQvA1Yw1RChiWpLnT0b
   JEPvDpDoUV+dOtYP9FlcDxvUhXZYfs9+SJkc+LjUFrmXR5SkJFaMNx83u
   K6+1ypXoMUe8BpMiYJ9Y7DrHOldZfCxgk3jwrwr8zZ3twzA7ZxlCfC7Lt
   qF9jlf5ONaAMnLYzVsVepv3ZEw8T1w7rXoyAxn9Wc2RumYIuJhRtOm1qq
   TfHX21zbCf2HQc+huVYAOGK29pKIU2LxuQtv9XxdlesgDB6Jb+N/zalYI
   g==;
X-CSE-ConnectionGUID: EVWl9oOXRwCICJFG0S+FIQ==
X-CSE-MsgGUID: sUrU41J4SmKtqUd/CwEv9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29732399"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="29732399"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 07:43:03 -0700
X-CSE-ConnectionGUID: qy8hWj6UTe+OBjj7lcj+DQ==
X-CSE-MsgGUID: x+QEiqS+S1yl3lcwMOARbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49983499"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jul 2024 07:43:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTjOL-000fKf-1s;
	Tue, 16 Jul 2024 14:42:57 +0000
Date: Tue, 16 Jul 2024 22:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 27/48] include/linux/suspend.h:36:60: error:
 expected ')' before numeric constant
Message-ID: <202407162210.gR7amMuo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   11cf99a210e4916f7a066658c851c08ab6b123ce
commit: ac93e44ddb3b32e7a8c35fe0f5c9ae10de2fb269 [27/48] PCI: PM: fix pcie mrrs restoring
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240716/202407162210.gR7amMuo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407162210.gR7amMuo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407162210.gR7amMuo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci.c:35:
>> include/linux/suspend.h:36:60: error: expected ')' before numeric constant
      36 | #define PM_SUSPEND_ON           ((__force suspend_state_t) 0)
         |                                                            ^
   include/linux/suspend.h:341:34: note: in expansion of macro 'PM_SUSPEND_ON'
     341 | #define pm_suspend_target_state (PM_SUSPEND_ON)
         |                                  ^~~~~~~~~~~~~
   drivers/pci/pci.c:177:17: note: in expansion of macro 'pm_suspend_target_state'
     177 | suspend_state_t pm_suspend_target_state;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +36 include/linux/suspend.h

95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  35  
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18 @36  #define PM_SUSPEND_ON		((__force suspend_state_t) 0)
690cbb90a709c1 Rafael J. Wysocki 2017-08-10  37  #define PM_SUSPEND_TO_IDLE	((__force suspend_state_t) 1)
7e73c5ae6e7991 Zhang Rui         2013-02-06  38  #define PM_SUSPEND_STANDBY	((__force suspend_state_t) 2)
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  39  #define PM_SUSPEND_MEM		((__force suspend_state_t) 3)
690cbb90a709c1 Rafael J. Wysocki 2017-08-10  40  #define PM_SUSPEND_MIN		PM_SUSPEND_TO_IDLE
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  41  #define PM_SUSPEND_MAX		((__force suspend_state_t) 4)
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  42  

:::::: The code at line 36 was first introduced by commit
:::::: 95d9ffbe01fb21d524c86bf77871255066bc6e55 PM: Move definition of struct pm_ops to suspend.h

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
