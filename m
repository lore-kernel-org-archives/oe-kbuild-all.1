Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D34C60
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 02:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/cE3ml6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704335659; x=1735871659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lXFyh89sanlQEzwe30FIdA0m2nItqdma1vbozbbOe9k=;
  b=Y/cE3ml6R/hKJnHYubJ9rxvdrsTFbeMroiUBHsrtFDf3GMjpN4IiqnvB
   vrJCLdmmdPYRBJCX7yKSXB5z+HPgEg0eAMTWcG58EGPXUJhdbueMh2MmR
   HWICgwwujtYN8gUQFrcFunTEGFMuTxONDLQ3Z4bTWlaxxIZsUvZEapi7Y
   BdVYWghSOuuO4OVr6ELdYQsZS5PzT69i0x6oAw35Qj04CtH03VAWVJcjk
   FjxvboFFE8F8UVeLnfdIZ4BXlvfkdC2Epj1lU1bktwAsbxXEzfJoA6GZS
   hG5QjMBAXrxqKlZaZ/6tYH3ZPJK+28AyVIwSEn6BwSXVN0QaAsC9QIaLX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="15747779"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="15747779"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 18:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="850611932"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="850611932"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2024 18:34:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLDYk-000MoQ-2f;
	Thu, 04 Jan 2024 02:34:14 +0000
Date: Thu, 4 Jan 2024 10:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/4] htmldocs:
 Documentation/gpu/todo.rst:461: WARNING: Unexpected indentation.
Message-ID: <202401041017.1L4uTBXI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   16ee60846a7043b43cc7d402c207179e0506c37a
commit: 67bab683a3e40e6d31fefe3fd956718caec617d0 [1/4] BACKPORT: drm/panel: Check for already prepared/enabled in drm_panel
reproduce: (https://download.01.org/0day-ci/archive/20240104/202401041017.1L4uTBXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041017.1L4uTBXI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/todo.rst:461: WARNING: Unexpected indentation.

vim +461 Documentation/gpu/todo.rst

   457	
   458	In a whole pile of panel drivers, we have code to make the
   459	prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
   460	been called. To get some idea of the duplicated code, try:
 > 461	  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
   462	  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
