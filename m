Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E63DA7D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444449; cv=none; b=HNbVItAqLMSOOTQiyCCh2jWF8ZZayp+SE5iY+5T0GyfEEwBZkjW+1QVhjzyhvAJvqu2M+Yt5DfQNp72g1TOa+lLbxvlCHZHwGB631J/E16eTScjpaQpAmOfA+KuSsAjZV13p2EwHY4uamx6rBQD6wDPIOOmO5V+MvOVYHqhWB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444449; c=relaxed/simple;
	bh=R6dxLV8NpDIxbLkGrM2/ll4De7n4OFphJkun8r11eDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z31LWLoEKKM99mVwBj1T1bh7+llzec+OeZT9y2YcKwaZGS7B1Uk4lidrOYDA2Z7m2BD2aDWm9U+O61iqn890DpYlhaOOmpnnO01ZulBlW1sG7BayeH7bY8BSd4J9S3cydxFiNLfOY0AZsPuwQ429AgjgiJaBsC5xzvSd2IrcSF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhHfLHpm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhHfLHpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774444447; x=1805980447;
  h=date:from:to:cc:subject:message-id;
  bh=R6dxLV8NpDIxbLkGrM2/ll4De7n4OFphJkun8r11eDM=;
  b=FhHfLHpmnI8jz25IGXka52NjWI8lC0i52f+KKCpA7D3Q4NDK2d/qkmNw
   aXYWAUHvwvoMI67jsIIvhznEPqzkrrRAMM/7mhSUDAEdvekTMt+tYOfZc
   AT4UKiFlzY2Trh8nhpQgCBWO+Ek1cAhYPCbNTMcawZlaEJZuQXg2QWqym
   JN6/d3OIQmJoc0D/wxkef9vpzv/8Ewu6su/rDNRFFHPJga8aCWSHn+Z+0
   bA9XL1C1V5xTdKhP0Qns61VyTxmT1r5WIQ2mShrAo4M5hlLxvWejyJkzr
   y5OXFTM/KVThYP8i+WxvNNmOSKMP5rTRt0mDGhBFb/Auxo6s4iM5TR1Cl
   g==;
X-CSE-ConnectionGUID: 1oTnjA4RTqyiV/LAQhInoA==
X-CSE-MsgGUID: +TvKyAB0QKu9iD4oK72HYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="98099835"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="98099835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:13:47 -0700
X-CSE-ConnectionGUID: RfIyGBxCRpOia8vdRYIALA==
X-CSE-MsgGUID: +Xe37xTKTZC7FX8OfvpstA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="218101749"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2026 06:13:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5O3L-000000006y1-0iFH;
	Wed, 25 Mar 2026 13:13:43 +0000
Date: Wed, 25 Mar 2026 21:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 4/4]
 drivers/usb/common/usb-conn-gpio.c:55: warning: Function parameter or member
 'initial_detection' not described in 'usb_conn_info_vendor'
Message-ID: <202603252127.trm4QDMG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Prashanth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fc88a7504f0f262cc5b2e8a7f58b2a1108034856
commit: e77972189dd10a39cbaf3803ed62183681642c2b [4/4] BACKPORT: FROMGIT: usb: common: usb-conn-gpio: Prevent bailing out if initial role is none
config: x86_64-randconfig-015-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252127.trm4QDMG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252127.trm4QDMG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252127.trm4QDMG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/common/usb-conn-gpio.c:55: warning: Function parameter or member 'initial_detection' not described in 'usb_conn_info_vendor'


vim +55 drivers/usb/common/usb-conn-gpio.c

    46	
    47	/**
    48	 * struct usb_conn_info_vendor - contains parameters without modifying the format of usb_conn_info
    49	 * @info: contains usb_conn_info structure reference
    50	 * initial_detection: bool to check if it's initial detection after probe
    51	 */
    52	struct usb_conn_info_vendor {
    53		struct usb_conn_info info;
    54		bool initial_detection;
  > 55	};
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
