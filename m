Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6A32868AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 16:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671279; cv=none; b=O5ygjilkBlEqGgNQL2oIZJJ6jqITOahD10K6hHZtT1V9J1yG9s3bjAaAA27hbO3NIk7T45JD0/zRjJjGIHK9BJhUOd+fad5CHyuN5T5ebyyxFTNJ2IhUB2Agk4x8PYIygImhSGVBBWxSDGD7NNf5teH9B9wBHbNpLbCw23DfPXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671279; c=relaxed/simple;
	bh=GfNBEK+ku323Nj4gTeKIwvDHkB3JbDvoC4OZ99RYslA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnzkilkg6KvVuD6JJlK9JAHB8agIPVSHbZn9hfcy+RFrfkW/JZOZzsIXfKx4TWJjdpuqfaMrEjxIaSagP2s+cAgt8hB9sn2TC4Usq149GUX65KczuBwGR+eWykHyKrMvT17evgEPsh5B+UPYc4VCjP83Kg8O8IPfOHxmke6ipn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiCc/Our; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiCc/Our"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747671278; x=1779207278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GfNBEK+ku323Nj4gTeKIwvDHkB3JbDvoC4OZ99RYslA=;
  b=NiCc/OurHfjh7pqCMaP1D62A5GofXKk7Fsqgd3g5t9fzf8vWboaPSTh2
   LRS/UeH5tyyYC6HpTFAvu/26W0+vG6w5OczjbBA1qheQHW/0TjoeK69zt
   iddhurxaQazLjCxhRE8cLOW1DJrPUOcOAXtERMQa4kchnAnLYrrAa08o0
   zsTkxDfjaSaVaBiNhB6papENMNB4yUdk8hJLBFdiFMFTGlwgWcTROiuPM
   n7sVS8Oe6+vUX69LBNIY7VQbcS7JBBqFRESChLeyIJzJw45ZnI9Xi1KCk
   RYlD6/FTzDn0i6G0lK/QV4YGiQQfhPkc2Fvmb7/vXZFUVNk9CSUL9/3Tf
   A==;
X-CSE-ConnectionGUID: p7Vb0wlQSFuf26wCfG5KWg==
X-CSE-MsgGUID: v8zrua1FTxKoApF7EW9JeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53392193"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="53392193"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 09:14:37 -0700
X-CSE-ConnectionGUID: /Vw7eZBVRu2Wc3RRTZB/nQ==
X-CSE-MsgGUID: 7t4ayJmbRWe9nNHL1zApiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="170449856"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2025 09:14:36 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH38M-0000rD-0x;
	Mon, 19 May 2025 16:14:34 +0000
Date: Tue, 20 May 2025 00:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 drivers/usb/typec/altmodes/thunderbolt.c:16: warning: cannot understand
 function prototype: 'enum tbt_state '
Message-ID: <202505200003.CqxcB12K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: 4320746d0bf1f9d57dff4d8d772bf0bb040e6022 [0/1] BACKPORT: FROMLIST: usb: typec: Add driver for Thunderbolt 3 Alternate Mode
config: x86_64-buildonly-randconfig-2002-20250519 (https://download.01.org/0day-ci/archive/20250520/202505200003.CqxcB12K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200003.CqxcB12K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200003.CqxcB12K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/altmodes/thunderbolt.c:16: warning: cannot understand function prototype: 'enum tbt_state '


vim +16 drivers/usb/typec/altmodes/thunderbolt.c

    15	
  > 16	enum tbt_state {
    17		TBT_STATE_IDLE,
    18		TBT_STATE_SOP_P_ENTER,
    19		TBT_STATE_SOP_PP_ENTER,
    20		TBT_STATE_ENTER,
    21		TBT_STATE_EXIT,
    22		TBT_STATE_SOP_PP_EXIT,
    23		TBT_STATE_SOP_P_EXIT
    24	};
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
