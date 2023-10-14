Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A8F18E1D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Say7zYCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697302681; x=1728838681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4lSgwJB/0ZKUTX5BCdAMYOqWtaSCY2EpdFO52MzLJc=;
  b=Say7zYCl7MKmgVWUtBpcKWvDqTt7NdA/v/2v5TqDP4Yf8E39caC7H/6L
   curlc5jNl/9FCvLTtmcd4dpMRCqJDJaKjNlSfUOui5SpVhQT12N5QOcVO
   FgkDnTgY0xGXlg9zUBGonyiap89oGQQlbxhJrfj5jnzfhj9rBTjz6lS4z
   k398SOmK8H72iximMc1JdpNkn8Y4xRHKma2/7uMB42qHW9367roKDrz1M
   UKwmZivkr40tdq/39NOBvCO+0eJHrnCYQGtbXJ4o67zZpFjD9rtLT/3Vf
   HSW/JXJinfx5oe5zpZSssi2zjcSYUv2+DQ5LIo/ERzU9o51pHKf6cT193
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="3947128"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="3947128"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748712370"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748712370"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 09:57:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhxX-0006QK-0E;
	Sat, 14 Oct 2023 16:57:51 +0000
Date: Sun, 15 Oct 2023 00:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 64/101] checkpatch: WARNING: please,
 no space before tabs
Message-ID: <202310150045.FxovDy8Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc5
head:   5923ca9112dd53a998ef4b986edcf65ee0b9065d
commit: 0ae7c802a8b352fd7ad3645dfc0f22341f827a18 [64/101] resctrl2: Register the RDT monitor core code
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150045.FxovDy8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150045.FxovDy8Z-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#49: FILE: fs/resctrl2/arch/x86/rdt_monitor.c:82:
+^I^I.name ^I= "max_threshold_occupancy",$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#50: FILE: fs/resctrl2/arch/x86/rdt_monitor.c:83:
+^I^I.show ^I= max_threshold_occupancy_show,$

WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#74: FILE: fs/resctrl2/arch/x86/rdt_monitor.c:107:
+	if (mon_features)
+		kfree(mon_features);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
