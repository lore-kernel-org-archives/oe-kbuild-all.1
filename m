Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8E13ADB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694106983; x=1725642983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YeQykjiAvWaqhb3HeYEnn1nYQFBJPEvL4CSD87MkXAw=;
  b=R44vuuhobUommixn8qfbFzrIyJqfkGxEptiJOFuykPekuSAV02ZfiUqk
   RTml66//ncqJkoGj/i7UCpyKhIhaaJC/AN3hqsSkLR4yqFIKAAsw9jZB4
   OboipQS9fmJh4rRvxh/fakDxNWV237m+a8Y4GqMho1jdqqg7mUznzRi7h
   /FVdrFA3YeTzXFR5GUPhEjUC0YyGEtU8grCeVo4NS/MpFlInfzw82tXJX
   eKXXn4eJDp8659HDyGO/ysZ4JrZxEP5FvjONwqVGd/j8JZq4u9HL5hDCv
   BxDutTUOb8qg7ahFY7S01VRGqgYdYGxGFH09jy3G4rF+Ajcp9408pHjJS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357732869"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357732869"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 10:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="915826976"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="915826976"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Sep 2023 10:15:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIb5-0001Q7-1x;
	Thu, 07 Sep 2023 17:15:15 +0000
Date: Fri, 8 Sep 2023 01:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 381/627] Error:
 arch/arm/boot/dts/qcom-sdx65-mtp.dts:259.26-27 syntax error
Message-ID: <202309080108.WED2Hs0A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   5d9f1945e8e8e59e5dda60c28229fa68fdbca80b
commit: 1ffb7fdbf46e1a1c9ec2bfe1ae1cd187e4d0282a [381/627] ARM: dts: qcom: sdx65-mtp: Enable PCIe EP
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230908/202309080108.WED2Hs0A-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080108.WED2Hs0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080108.WED2Hs0A-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/qcom-sdx65-mtp.dts:259.26-27 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
