Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C61095A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 17:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694106979; x=1725642979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=afmGlHVX3jfkiFsbgwlDo3XdcRjsnCP2tSrxre0c2tQ=;
  b=iTQTmEE6LlJCip2ynDF3s75N7HF9GDuW3bvVKdC9knZXd0Cqc5uLR5Bo
   hgy7X5BJl7aQjA3HB/vFLveYU58EYCCyF0k7VPM73ukWV0Yu+bDJ8W8/R
   KWOzGA4knMlJSuGuhUW8trEL00NDpc4ugtfxl3CMqREc0XAJKQ+EZiEdQ
   bOfWxHwxbKN5UWtPEyxx8ZHULYOAGx0eTgN2ncadu1HSf9YLGjs4EgxEv
   CY46OF5Ca86k8jrddIAHm0aEdollvl+2JgqRQML474ZjOPmS9ANNOPXbH
   2n8doHrVgSyCUWfkUEX2LHpCpn/l0n/8KK+eMlnAhsfwBnNN/nhUFK4Na
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357732849"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357732849"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 10:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777151150"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="777151150"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 10:15:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIb5-0001Pz-1f;
	Thu, 07 Sep 2023 17:15:15 +0000
Date: Fri, 8 Sep 2023 01:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 89/159] Error:
 arch/arm64/boot/dts/qcom/sdm845.dtsi:250.29-30 syntax error
Message-ID: <202309080139.FWczqzch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   de158c39329c476963b106f32fc47e0ea04b4f48
commit: 3d51557fea72ac4557a61e77eee52cb8ad61aa3b [89/159] arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC
config: arm64-randconfig-r015-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080139.FWczqzch-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080139.FWczqzch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080139.FWczqzch-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sdm845.dtsi:250.29-30 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
