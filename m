Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8AD502
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 04:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709699475; cv=none; b=r4VyyqryKgeyHmy5s4rADH8OhGU7wcakzOfcs/q/9VWr6pCU1HQUv3ywyAT1u17RXlsa0S/Q4q7+AM0JzoNrmMwV6X+Pq7VHbwcCvEuljn+mXthFs4wQHIk4+MtgcxAYudVnCdo960JPPHqKaGgOZ+NzCe3cDc+t/CMDODwgOg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709699475; c=relaxed/simple;
	bh=xdfQmWfPUvlHQlT0qUcTsjY+PtCYLwBAOpwjAXda5Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFt4GCfsiDhJdn8RrhlAseFvjmP4Z30sTzFgAf4UowI15zeGVKiQTQn4Iqpa6bwVjW7Hq4q5q+7L4GEqfz8dUqCd5C4jdk81sw55sOe0rB8VApYjujfeeQIYmtekP/gEyRUsSIgsHhcZfA8k3ap5RuhHA/YVMPRfIGVZ7nMT4Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEGw4otL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEGw4otL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709699473; x=1741235473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdfQmWfPUvlHQlT0qUcTsjY+PtCYLwBAOpwjAXda5Bg=;
  b=mEGw4otLB8Uv4YXyVgaIIFP42U02XzwwpUDlWxyWWPbdi8VcjyQEN+LR
   mWjOdxNiELXUpWxXyvA3n89fJHbuArEAQea9QTjzpwWHNIvBu42pmT/9t
   Wm2f2YithvU5+4faoHa6DKLUJAak15qRWWACd8rqpM9wmNOek4eN9E/EY
   4Rz9yg/Gp3yOTAJvnwTAWGxLP4obi8whgTIoLKtSu/T8uP6IZm9danQNj
   H8Wd05pedGLr5iZ44nczlDIGKGEWwoymZfTBNz5ysOQGMjpxc/pFKI3py
   764Bdwdbgd6xUjmS+uGzTkOxcHJc9ok8qrkkno79RXLBgbRzwA7GS6HEC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8056442"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8056442"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 20:31:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="14183954"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2024 20:31:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhivq-0003uD-2E;
	Wed, 06 Mar 2024 04:31:06 +0000
Date: Wed, 6 Mar 2024 12:30:24 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24923/27434]
 drivers/hwmon/k10temp.c:143:12: sparse: sparse: symbol 'k10temp_temp_label'
 was not declared. Should it be static?
Message-ID: <202403061210.KdFqOV7I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 97c2d66a65391cc5e4090c2125f55d185656f7d6 [24923/27434] hmon: (k10temp) Convert to use devm_hwmon_device_register_with_info
config: x86_64-randconfig-122-20240305 (https://download.01.org/0day-ci/archive/20240306/202403061210.KdFqOV7I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061210.KdFqOV7I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061210.KdFqOV7I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/k10temp.c:143:12: sparse: sparse: symbol 'k10temp_temp_label' was not declared. Should it be static?

vim +/k10temp_temp_label +143 drivers/hwmon/k10temp.c

   142	
 > 143	const char *k10temp_temp_label[] = {
   144		"Tdie",
   145		"Tctl",
   146	};
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
