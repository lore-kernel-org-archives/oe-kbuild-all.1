Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EC124C08A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691220; cv=none; b=Lu+GosSKfhxErPD6ucHgfQoURiL9ZZqdJ8/ZEDGQ06TsJ6GCqXgNpzR1jjnP3NKpv+aOypd/xznFlPYT4DSP+ps2QN99fQtRFrydXzHnSxCoqIhE5BhnDoQJEu08IQMcuzF63pmiKJvt5YIXUE3fwQZ6rwyylYu2+QVCIYgHy9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691220; c=relaxed/simple;
	bh=MBK4LS3w96erCLUCSvyg8E8YB6wY8K4fvYF0Ytt/u2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iasvQbYQX6ajeYbekR13gDZ3GWXJ93LDjeqXCmIfnBby3FFcV8lSyTSWO08XAGlh/loNds57fDRIb6GcKsdv9OYWa9vQvlndthyLX7umMOz2vgzcW/QwM+R3xSjPKSrD8NqcSsXVPycm5Ra5uAMQls7A1otLku5Ffzcx9vlhX4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeZ5gEd0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeZ5gEd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743691220; x=1775227220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBK4LS3w96erCLUCSvyg8E8YB6wY8K4fvYF0Ytt/u2Q=;
  b=ZeZ5gEd0Zmsbvi3Y2bt6DgaWXVFoYtVGNSAP8VUxX+f8z6QLznCnib3E
   eh8c0xhAWMEwzsZebrl7wGa7gg+onT6QaGcu8+/mNvasO9SIO2u3WSdx+
   4w5+C5KBiXOG4yMJy1bTiQXcRbrC0GZPsPl37h1KS+yaYj4vyPMcLMGo9
   Lptss1TRsD7cMYADXdDS5rzAqr5zqnzpoxxOXvZAUjoniT6iyLQ4H4P1Q
   6pgzpsXiFPvD0FmchCopf3qM8IEhQrTR1J+RppEauufbfrfm+ii7ajURo
   v0JSZmcVd9EI1NiBut8p93eM23Bd3Bnwng5RNnjEJIQILxgBUPvwW9Byx
   w==;
X-CSE-ConnectionGUID: c4ajW5mPSAi5j3J00CB2jw==
X-CSE-MsgGUID: YNZuai53TxSd54yBlbG/Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55300636"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="55300636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:40:19 -0700
X-CSE-ConnectionGUID: vOYHhB3mQqeZNTt7BCSBPQ==
X-CSE-MsgGUID: 1x4q1FbrTGSbeFpk7vf1UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127013653"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2025 07:40:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0Ljr-0000TL-26;
	Thu, 03 Apr 2025 14:40:15 +0000
Date: Thu, 3 Apr 2025 22:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pci-fixes-for-6.16 2/3] pciehp_hpc.c:undefined reference to
 `pciehp_device_replaced'
Message-ID: <202504032205.uQVJqgL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux pci-fixes-for-6.16
head:   73b540d2a60a396f7283ed327ba43c40f5603b96
commit: 3b1ea06a66a434dd110f54a47abf20ade761e4ed [2/3] PCI: pciehp: Ignore Presence Detect Changed caused by DPC
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250403/202504032205.uQVJqgL6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032205.uQVJqgL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032205.uQVJqgL6-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/pci/hotplug/pciehp_hpc.o: in function `pciehp_ist':
>> pciehp_hpc.c:(.text+0x26e0): undefined reference to `pciehp_device_replaced'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
