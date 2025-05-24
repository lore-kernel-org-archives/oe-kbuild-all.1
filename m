Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92F322E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748088117; cv=none; b=XW/YX6ly8uFj+CDzz1exP2h+qq8o65tap92M44JkDI6gpc1KjrWazz6A0P4lmUmxv1xPviVpPyRUoDCkOTTOx/Uqkya+JF0/53KWF6ygrJzkIJ+ID0GWlNjsG6cia3C2yFKYCIIEBYiYReow3MtODK5oiWoRzYDukZR0GbAMhEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748088117; c=relaxed/simple;
	bh=+/Ae4Klv8LYZF54G/X5XOf9MYYc7bKyHF70L7Tm9eL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/zcyMIyDQZGU+T7JoceMD181t8do2aorBA1a15kPOlTZ/kfMmzWA191PKYhel0faqjE9TIYBOTCWpP8/0y6nwAx4N/gi3IcBP7zSncB4anrVl8pvnJkMNVqrh2iBYuM+elh6a8MxF1CuxXwyDhG4s7qA/KiujE09ufoQJ2fzWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSgnxpqi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSgnxpqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748088112; x=1779624112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+/Ae4Klv8LYZF54G/X5XOf9MYYc7bKyHF70L7Tm9eL4=;
  b=hSgnxpqiTaDs4XgOE+1849z6Dacvq+WA6Hst/YSIwXBE6KMp8odoVLRx
   08e+MtPcAU6H+HNQ+rwMNJJho7oV340NLuptWcrJ8zkjgeo/mI1gvSIQN
   jMBOebGNke7kWNIYHZC1sl23I3kXaAxqbuXGPisvbHUA7p2UQsGtY8mnJ
   rF9nfBmVmJ7UU61bmjXfvugBxRCIPj78nxsKG9SDIQ2N92vYHLDste0/D
   EHh4oALdYttdBYnM+rM6Mhh9c8ySCVlFRPZrCLnj5rvrqr4St4jZY5ak6
   CqgIU9z1zkh1lw3we4eYmJiwcsdpUMIy8duG3K2J+kbJ7EzNO9UxDTHz6
   w==;
X-CSE-ConnectionGUID: Iwe1HdJFT/2V/AINhcVQig==
X-CSE-MsgGUID: W1LY0rT2RcCij1DGEFUO+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50017501"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50017501"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 05:01:52 -0700
X-CSE-ConnectionGUID: 8b/F38zqSjK18T8XrzBC0g==
X-CSE-MsgGUID: hnZfM8yHTcygbwYRHhS8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142103816"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 May 2025 05:01:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uInZU-000RBC-2p;
	Sat, 24 May 2025 12:01:48 +0000
Date: Sat, 24 May 2025 20:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2280/2280] vmlinux.o: warning: objtool:
 __tsan_func_entry+0xf: RET before UNTRAIN
Message-ID: <202505242013.F4Eq83Tt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6fd4cdadb171b0cb7f3dad5b71441cfcb5b0d61
commit: b73666e1e9554c77a69a647427cf77782e0bd9aa [2280/2280] x86/xen: don't do PV iret hypercall through hypercall page
config: x86_64-buildonly-randconfig-004-20250524 (https://download.01.org/0day-ci/archive/20250524/202505242013.F4Eq83Tt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505242013.F4Eq83Tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505242013.F4Eq83Tt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __tsan_func_entry+0xf: RET before UNTRAIN

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
