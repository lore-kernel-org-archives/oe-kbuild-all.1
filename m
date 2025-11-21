Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649F3446B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 14:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735036; cv=none; b=o0LMUfD2BfK4CMCXXcLw7DtCLAK+j2BC3UgclUDfj4ZNGuH5x8KVgIdLgH8u39aDPO6HXmtsY8TpU92RL3IZ72PZSpFM40siX2jWZlAZm5iJsDmGGj85aof/WpWSZ+ozZ6DZp1dzoHCeuN/JvQrhKsyIm8emgPfdBUZQ/K9y2E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735036; c=relaxed/simple;
	bh=/VS4eyTs3v4jR4V0vUTGLxpyn8czpHenJmCAMm25jD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FVTugkarIxHFblMwSZDlo55krnH8BFcb37qYyyW0hX2OnvVycBhuNjopF2Xx1rO0FWun/9MI4OaVj4Ko0/2e7BRwXM3AQ8+cO76blOSvG3991Af/I+lMqzzJZ5Gft20wvuUNtiJqXLvqRDfwcdpVj4SxF+qhBJWw+kNNKK7VKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhShm3nU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhShm3nU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763735035; x=1795271035;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/VS4eyTs3v4jR4V0vUTGLxpyn8czpHenJmCAMm25jD4=;
  b=IhShm3nUuN3fb3akibBFN4vHnsomknE1ToktE4UJf+PugszACKr8D6Rc
   hzyjMAVBzcb1HlAvj1rUXsFvIvNmrAmL8FVPDGFoPZy+aMrsCFAMr+3tn
   7R0UplaTubY30ZeEdBGq0261kaY5Ep/Y0jLoihZz0ynRFgU6njPtjs9l8
   +0+cgk/NrQUAlSBds6dQpbNjh4DsBpwVWdZB7vKLl5zJcqMOAq41aoVe3
   V7aKCKt1wqOhX2VPVqzCRTyQuaAg/5+sak7dbhAlWBHe1AcRDHRM/emeD
   gOGxEDSVWToU/WDUP35KmgHBpWe2v96f7dI1Git7OIhrD2W/t561r8HYu
   Q==;
X-CSE-ConnectionGUID: LjtgKqnRSaap79vZ+aZdcA==
X-CSE-MsgGUID: WzoRDiFSQsasVQglFVy9gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="64831524"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="64831524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:23:52 -0800
X-CSE-ConnectionGUID: EhSvToHATfWMlkUz6GnEAg==
X-CSE-MsgGUID: aF/YeBFsSjuQtyONhkRZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="195869672"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2025 06:23:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMS3A-0006Rn-0R;
	Fri, 21 Nov 2025 14:23:48 +0000
Date: Fri, 21 Nov 2025 22:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/4]
 drivers/platform/x86/inspur_platform_profile.c:35:34: error: field has
 incomplete type 'struct platform_profile_handler'
Message-ID: <202511212241.jBKh0BGV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   40435e5332925bf7429f8e4c796040981fcc4968
commit: 82c3c913af0c82e7da403f126de414662b19d5ab [0/4] UPSTREAM: ACPI: platform_profile: Move platform_profile_handler
config: i386-randconfig-014-20251121 (https://download.01.org/0day-ci/archive/20251121/202511212241.jBKh0BGV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212241.jBKh0BGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511212241.jBKh0BGV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/inspur_platform_profile.c:35:34: error: field has incomplete type 'struct platform_profile_handler'
      35 |         struct platform_profile_handler handler;
         |                                         ^
   drivers/platform/x86/inspur_platform_profile.c:35:9: note: forward declaration of 'struct platform_profile_handler'
      35 |         struct platform_profile_handler handler;
         |                ^
   drivers/platform/x86/inspur_platform_profile.c:192:26: error: too few arguments to function call, single argument 'dev' was not specified
     192 |         platform_profile_remove();
         |         ~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/platform_profile.h:40:5: note: 'platform_profile_remove' declared here
      40 | int platform_profile_remove(struct device *dev);
         |     ^                       ~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +35 drivers/platform/x86/inspur_platform_profile.c

94ace9eda88229 Ai Chao 2023-10-20  32  
94ace9eda88229 Ai Chao 2023-10-20  33  struct inspur_wmi_priv {
94ace9eda88229 Ai Chao 2023-10-20  34  	struct wmi_device *wdev;
94ace9eda88229 Ai Chao 2023-10-20 @35  	struct platform_profile_handler handler;
94ace9eda88229 Ai Chao 2023-10-20  36  };
94ace9eda88229 Ai Chao 2023-10-20  37  

:::::: The code at line 35 was first introduced by commit
:::::: 94ace9eda88229c73698b8dd8d3c06dd0831319c platform/x86: inspur-platform-profile: Add platform profile support

:::::: TO: Ai Chao <aichao@kylinos.cn>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
