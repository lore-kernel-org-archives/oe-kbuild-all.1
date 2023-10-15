Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CE315D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 21:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSIG0Osl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697406312; x=1728942312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aKvKxZ/jw46c/LiK+zop410egu3vx5EoyFYKKg2wNrY=;
  b=WSIG0OslQIgFw1VhbaezIGQAylDUd1njQkft5e66iv4YEXv1Ue57u0uD
   KkEA9v356wmCtxB9PSYclT5ta3sttW8eW+siW9/9JW8wTOhmKJjLuhaWq
   Te+OX68WnkV6JEfwfZqlkWvjra14vjFv8m726rJAQuFKWHUduRRSZjAU3
   WFsuBCzfVuxZKoaWH3JCvaI4VN6yuxuh03tPnHINsBX9tX5sjTbvNXxfI
   hhLm9jeg7yjeLKUCJH1lwoPYoZMFq0QAmt5B0iv6wrPc+HYP3e2cLrsl+
   LObzvLEd4mPS9l4WZQXYtRNnCiREWuRfRtcwrjbcrwaRHfrItZXKX0SX3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365681024"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="365681024"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 14:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784865082"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="784865082"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Oct 2023 14:45:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs8v5-0007pr-2Y;
	Sun, 15 Oct 2023 21:45:07 +0000
Date: Mon, 16 Oct 2023 05:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 7606/15768] /tmp/ccQIvbJm.s:615:
 Error: selected processor does not support `dmb st' in ARM mode
Message-ID: <202310160524.qKeJlkz3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: be2b0d018d12aa88400c90d6cb6c8f9854dda6ca [7606/15768] fsl_qbman: fix alignment issues in packed structures
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231016/202310160524.qKeJlkz3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160524.qKeJlkz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160524.qKeJlkz3-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccQIvbJm.s: Assembler messages:
>> /tmp/ccQIvbJm.s:615: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/ccQIvbJm.s:2840: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/ccQIvbJm.s:3233: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/ccQIvbJm.s:3639: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/ccQIvbJm.s:4803: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/ccQIvbJm.s:5183: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/ccQIvbJm.s:6312: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/ccQIvbJm.s:6684: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/ccQIvbJm.s:6745: Error: selected processor does not support `dmb st' in ARM mode

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
