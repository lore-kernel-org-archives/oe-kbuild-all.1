Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A66F14F77
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 22:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBSp4XKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697409068; x=1728945068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p/3SmERRUvKqHQMwbHHFniv4dWcdKY6SSI9lA2vcyWw=;
  b=cBSp4XKWkIoc6rEBYgRsEeRLFuCPM9rUTSI8gTQ310inRVoIyX8o4QgA
   gzXIJ+V9shqL4FTKc+r5k+7vxKmsARNU5V5J9fUDcBO0a/GMIATszj8oe
   ACowz6sTRfxverFUok2HX1ExMxEMdZgGpR9vp+79KwbRbwDNtQO7Q1CiF
   htaUXnuDNMQriXS+dhZRV7YtlKxV5YnlxCXvcKfcjbj7HoeZsZpLiq0mW
   YQu6SWkjETmcmWkPy2GJndaBHVCnY8PR+ztxQQJXeuibZlPbabrzBPqJn
   uTARrmdFKTQET3z2aXBze1ehn7DqXp1wImZ3YzuZR1EMxXdT1E7S2kYgc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384293889"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="384293889"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790605179"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790605179"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Oct 2023 15:31:06 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs9d3-0007s3-18;
	Sun, 15 Oct 2023 22:30:45 +0000
Date: Mon, 16 Oct 2023 06:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 69/206] checkpatch: ERROR: code
 indent should use tabs where possible
Message-ID: <202310160647.OQTGeXVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 513fe54f7475c9b4aa30d8a56f3d43725fe91b1d [69/206] arm64: dts: apple: Add initial t602x device trees
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160647.OQTGeXVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160647.OQTGeXVW-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#1090: FILE: arch/arm64/boot/dts/apple/t602x-die0.dtsi:23:
+                <0x2 0x8e10c000 0x0 0x1000>;$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
