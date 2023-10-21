Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55820EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8fKWPz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697910860; x=1729446860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bsGL0qvSCk5NvXS2CdDwSWd2M+uZQ23nYV1rvkI7fr8=;
  b=e8fKWPz7fxQRGL/JPQ+2Z+mXWRa2nx+1zqUDLnqLDOTXWkqJasiI7tD6
   qSgXq/eFkXELoN6kZqjvHAWxHOQ5Fu254rma8iMvhnI1xH0EGlOwpGBDo
   HydQ9X8ZfbLyl4PsQotNqWQUXyhsoUmJTtgLw/749VhT2AtRNp8CCcEgV
   9O23bLYoA49EWxUbxyPByAe9V+N6S4hy1iEpsoz5i2p7HuzeiuMzmJTdl
   UMfu0aKkvfvoNQy7JH6L/sux+yqUYGmJVLWWcA2sl/4un+dqTnzLAWpzl
   JYfFW4pDheT2M0LbgTa0uwRI66OmDBEIWFHrnygnvAzVs+2Kb87floUs/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="5269405"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="5269405"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 10:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="5666750"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2023 10:54:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quGAy-00056Y-1O;
	Sat, 21 Oct 2023 17:54:16 +0000
Date: Sun, 22 Oct 2023 01:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 148/209] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310220133.FtHnH6JA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: 83972e6f3e1fc50a892dd5396232388d2082d051 [148/209] ASoC: macaudio: Start speaker sense capture support
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220133.FtHnH6JA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220133.FtHnH6JA-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#104: FILE: sound/soc/apple/macaudio.c:988:
+^I{ "PCM2 RX", NULL, "Speaker Sense Capture" },^I$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
