Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061E231825
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752565173; cv=none; b=phixQkEmRui9eSIgL8ikQndurMx1xnlk4VBAznOQatnlCWYigrOPxNloFrJE7trkxdl8iG3H0r8Ea64jxXYueWCY3abIRzhY2V8yV19RpPf1ITJPk0y5WRhfIOp/fj+g3zyJ+sUZyDrL9C9f80r+gmRUaGDqHr3SZVPqMF+Jkl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752565173; c=relaxed/simple;
	bh=3u+zRlkTA7IpIrPZ+v3kc3rQNUSw0T/aoVdtsdkucA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrzUEjHSUvvU579szVwrpGNcliV04mjJp5O0gxJx/uug6jPw+vOHqNoNnOO5/kosNVew3c6lMygqNPgAZNms7nerRJHh3qn6uJC1E51WxdnyJN0nZYXpmKVHA0iD1U5uwXvR40o5fmUIInyT3UKrQ4BSJkBppmjfM/dzLUmmm8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUsVWlUn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUsVWlUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752565172; x=1784101172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3u+zRlkTA7IpIrPZ+v3kc3rQNUSw0T/aoVdtsdkucA8=;
  b=mUsVWlUnKdO46mHgVJcIynhMDFQrqUxFC6bMUa1hHpLxrkuqaFUfoYuW
   BPoYfQ5oriDoftFn09Ws/aYzJnYu3ugZkTbkfc0qJ3/NCAByXSQ2gv53u
   RbnBJ8tBLWbX14QEPDK2JaFNY/LVAoIOhMDXYLHR+Qt+krA16uyfcDTlw
   nawUGONho/+pMOQB4qn+d9hesXCR0q577HHSWTnq4yxLAgatc+KY1deMA
   K0xMWjVIPWgtzJNORYFwjW9KDwfkVakRYsGXgwrkfY2oUPe95MnHqujML
   d6sdBEFbBoCAI7Z9wbF1wEu9FoEkyAKsNw4CpZEyuT1AqTXcP3poCOBHD
   Q==;
X-CSE-ConnectionGUID: LRa95EiGSUqFJmRlCPXLkw==
X-CSE-MsgGUID: oW45+WSiTfqvtIzMQDOl5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54710537"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54710537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:39:31 -0700
X-CSE-ConnectionGUID: PTJKXJADQEurmQ8Ds6OZbQ==
X-CSE-MsgGUID: CV2TigMSRBCoD+NGQJLiPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="162700477"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jul 2025 00:39:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubaG8-0009nb-0C;
	Tue, 15 Jul 2025 07:39:28 +0000
Date: Tue, 15 Jul 2025 15:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3] kismet: WARNING: unmet
 direct dependencies detected for GPIO_SWNODE_UNDEFINED when selected by
 GKI_HIDDEN_GPIO_CONFIGS
Message-ID: <202507151519.UObmDjQy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2227fd0f90c185fcbd05e70ecb752e9580045c56
commit: feb0be0c1302a55148a66cfd506047ea0c425836 [3/3] Revert "ANDROID: suppress GKI configs for 32-bit builds" am: 8b9a794068
config: i386-kismet-CONFIG_GPIO_SWNODE_UNDEFINED-CONFIG_GKI_HIDDEN_GPIO_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250715/202507151519.UObmDjQy-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250715/202507151519.UObmDjQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151519.UObmDjQy-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_SWNODE_UNDEFINED when selected by GKI_HIDDEN_GPIO_CONFIGS
   WARNING: unmet direct dependencies detected for P2SB
     Depends on [n]: PCI [=n] && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_I2C_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for GPIO_SWNODE_UNDEFINED
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - GKI_HIDDEN_GPIO_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
