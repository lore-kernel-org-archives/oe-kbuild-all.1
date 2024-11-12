Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3CF1990AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 05:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731387759; cv=none; b=a4KPqMTgCKxy1X6qej1fiMdO+453QE1zKsWHsg8la0PX/1NSq8EEtR3/6VKbj3Ggk1qqvC8skvRr6Ust0l6XPC9PhlZirBmhrf2CaUsbflxWbkaMTSr1JUcTJ6JxPb3R0ov3KtlZpOklk99QtWnK87SRKTrWA/A2lbF17sSoVzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731387759; c=relaxed/simple;
	bh=CT94ZACvA3oPHsOZI4LAgs/ioFqO3GpegVPZMODWBzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+ELEeoARaN7q/PmCoKwlvcSYO73sf/aL1S9wMySP/HQGA2wcykJ3g0fBRW3xCaHPRL53ht/nDgFDTfVg2RN4e+sVV3H9qbVw1afE6nOW3cKR25VFAABdIwB2e6YLlfwmYG6F4JQIwb7XLMhQ9FBr0I61uwUU/V6+5H0VYIorkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFdoOR5N; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFdoOR5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731387758; x=1762923758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CT94ZACvA3oPHsOZI4LAgs/ioFqO3GpegVPZMODWBzk=;
  b=gFdoOR5NisezEXx6pjNaMzZ/FrD4AF/sL/Qm4cnhW6bmyVglHNKDfzDf
   4syXAR+2tO8jmmtg6KUfV8pnl2iYfvocmY9rvcVEMIprQXfnmM/ZqBEEO
   qtm99gx8cgYKUCKWDV5fAms/4j4cHCl2uMR9emsZbIjBZHKxHcoq6fDEd
   2o7WIQ4ceDIlRoQZczL2wtKM1hDk3CzWhYxxFTvft5G4yXwhlQDaiLl38
   Jm9Ln+pnbwgiMrCDZ6UfeJPHpp7dCWhUUk0+uOg8k//Zf4DhbChSV9BEn
   pnxgttR7/5IUWeT3Eur2ypq5OQQv05icksaCCoZUwRZEQxEzh52VAxsCF
   w==;
X-CSE-ConnectionGUID: 0uqpdxSZRqGXMKtgw6RN5A==
X-CSE-MsgGUID: mUOXLtSMQYebo0j2saGQ4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31432799"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="31432799"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 21:02:37 -0800
X-CSE-ConnectionGUID: 11U6lTHTT+iEZfhEkPGJfw==
X-CSE-MsgGUID: /eoGNL7tQbSB9NEqfgDSZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92204180"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Nov 2024 21:02:37 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAj2w-0000Tx-05;
	Tue, 12 Nov 2024 05:02:34 +0000
Date: Tue, 12 Nov 2024 13:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1658/30000] ERROR:
 "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!
Message-ID: <202411121246.69lpXkrC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   104cc535f91241da2629d8e2d5abcf57a97b0afd
commit: 3ebeb5687243e405fbf34032249cada998ee4779 [1658/30000] FROMGIT: power: supply: Allow charger manager can be built as a module
config: i386-buildonly-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241112/202411121246.69lpXkrC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121246.69lpXkrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121246.69lpXkrC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
