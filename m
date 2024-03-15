Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E5214003
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710490987; cv=none; b=eI7VNgTfKQKqIPfJPkvmiq2boJ73qwtqK5TBZWOaol/G1Wvc3PP4tMhw4CJtTPtH7WPxA4/EC3n/aOAAVijRmIu0BnxMeH/dCYib/mXBHfkhtvj0CIqAIirXTZEb8+5OOxqRxWoVQk04KEmtt+tpYjYZnRGmEusPpJyCecHsTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710490987; c=relaxed/simple;
	bh=RWCwo4uFbQSSggHl9q4X9iwN3D8SFxFTev8T2lp6csQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NRL5PiPOFkKMtCdhmVmttJ/NXMeMNj8v9Qkpeksp+86b1pJMGEhyJQl4LSfMUygYrvn2IO5ua3HXueHck1r+mb1X4ymBg2zK+gDLfl6iU6/El8B52ruSGgtVOio9Hq70Y6/rmUZ5BXOC60Rt+hwCS9T7BIsjQmac+1UsAlZoQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEuWEYMp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEuWEYMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710490986; x=1742026986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWCwo4uFbQSSggHl9q4X9iwN3D8SFxFTev8T2lp6csQ=;
  b=SEuWEYMpD22NHTEyG9SYS9ghwSDGNkzq5fcu6He/tYy5HcLgmF9FPNRn
   wQYGElMc6YO9YBo+ZvqBKf29TsAkjXc39IoWHcvlw1SHZekyob2PI6yee
   wMZ83qfdUJlAbvfZMztN8MQXssXUVylf8nXdwL6rHuhBE7w0tC59U5b9F
   fp6Kxy7DifI3WxcvfoqdQfuZ6HyBnwCI9WA4eq7FJ0gXx8OQIcrQ/6mxU
   TH2St7JMoVJUOkr8xZ1UhumwSbwZSN4NbqBR4lndGh7SVcUHdNh2rNLlM
   gNg5P0yre86d9D8XJwd11iEqMEZ5yB59Mj0qVHbP8fyzU73ulzrBN26Xs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5534469"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5534469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 01:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12654571"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Mar 2024 01:23:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl2qA-000EG0-2U;
	Fri, 15 Mar 2024 08:22:58 +0000
Date: Fri, 15 Mar 2024 16:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27030/27507] fault.c:undefined reference
 to `sysctl_gpu_qos'
Message-ID: <202403151656.7TKlLop6-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20240310 (https://download.01.org/0day-ci/archive/20240315/202403151656.7TKlLop6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151656.7TKlLop6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151656.7TKlLop6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/mm/fault.o: in function `do_user_addr_fault':
>> fault.c:(.text+0x11e9): undefined reference to `sysctl_gpu_qos'
   ld: kernel/rue.o: in function `rue_io_enabled':
   rue.c:(.text+0x7): undefined reference to `sysctl_io_qos_enabled'
   ld: mm/page_alloc.o: in function `proc_pagecacache_system_usage':
   page_alloc.c:(.text+0x6e47): undefined reference to `vm_pagecacache_system_usage'
   ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_evaluate_cst':
   acpi_processor.c:(.text+0x348): undefined reference to `acpi_processor_ffh_cstate_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
