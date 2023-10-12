Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD24224CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7fUA7wl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697124035; x=1728660035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tDAOmOdYu8N6f1u0EkZcxj6snqAN5cQAFVuRN3g32V4=;
  b=P7fUA7wl88cpGmgB13jlNAn1+tuzjEAltWBNYnD7JaHpw77T3eOLJWa5
   T8MhPIL0Iu4eK7dbLaqEmzxpW3qJIxZqRnAm+EBtCceFxpk9AYIjDoey0
   9jcGPA5qQgjKXpmsq1oVffmC1qaCqSMBYxpmwUKBkpUZa0HFvWaH5FqIM
   0bDnv8985jR6mx+mOYTe1L3SbaqoejOwf7+6AONCSS+ya39N+tJ+5u4QN
   gPRpx8CL7samkzcvoB4oCVh5ha8C29Qz567aHJAQVuh3SrOR06RFSrPzY
   /iO9jU7QgtuIP6Gbo2tEz453nqo/L65DvPaexyA1xsFv26YFq1lLVD1Dd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382183118"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="382183118"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 08:20:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820179777"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="820179777"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2023 08:20:22 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqxU4-0003ZF-1r;
	Thu, 12 Oct 2023 15:20:20 +0000
Date: Thu, 12 Oct 2023 23:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm:zii 45/94] checkpatch: ERROR: Macros with complex values should
 be enclosed in parentheses
Message-ID: <202310122317.OsTgPG5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   6f5d2f0af9152dabd1cf8a2d23196fe28d88bc18
commit: 921f4f7b940e92cea0e805093198c75a4e86b9cc [45/94] net: mvneta: convert to phylink EEE implementation
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310122317.OsTgPG5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122317.OsTgPG5g-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#27: FILE: drivers/net/ethernet/marvell/mvneta.c:287:
+#define      MVNETA_LPI_CTRL_0_TS                0xff << 8

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#30: FILE: drivers/net/ethernet/marvell/mvneta.c:290:
+#define      MVNETA_LPI_CTRL_1_TW                0xfff << 4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
