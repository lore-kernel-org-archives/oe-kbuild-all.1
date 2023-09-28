Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F6428E04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 07:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695885075; x=1727421075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUhVY03wZnFJs0tTwMV3WkNee2rutGQ7upmu8sHvdJU=;
  b=Mtmrt5VkIb06zEcC0PpKKfM5zLAsd4oghK0HyvlzjvctFfdCOEpbX7+e
   gxcPWfZn4RYR/QsiHQlXzXEK9YFimozUx+RomgOtw6W34yXu3vUGLi/ft
   bP9sYhS4HVyZ1m+dYlK6Q5H1qvtCrYCBcsiUpGvZy2Kp/hzIR+FujyrCE
   WMKrm9pteLfEyQ1VHDtPSa//ot1tkk5MEmoTtKYrjAF0uxVtnm9EizAyL
   33u+2azzpA7tqgthroM+7nVdCDh0KQQIIEQMMBvuvyAwHLXJAiMCOXT/v
   aossMTsXjx1T3HpEBOQ9D7ViqK+rwqduFI7F3KsN0vcdgzoQsjyexPQzA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="446145829"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="446145829"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 00:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839752294"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="839752294"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2023 00:11:05 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qllAj-0001Dd-1r;
	Thu, 28 Sep 2023 07:11:00 +0000
Date: Thu, 28 Sep 2023 15:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 15/38]
 sound/soc/codecs/cs42l84.c:1019:34: warning: 'cs42l84_of_match' defined but
 not used
Message-ID: <202309281522.X0566IC9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   84126be72ac9e0b38c992e806417952deb3cd540
commit: ac14347921cf091e7a8e0d54f9fa0fc8590e7c6f [15/38] wip: ASoC: cs42l84: Start new codec driver
config: x86_64-buildonly-randconfig-004-20230928 (https://download.01.org/0day-ci/archive/20230928/202309281522.X0566IC9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281522.X0566IC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281522.X0566IC9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs42l84.c:1019:34: warning: 'cs42l84_of_match' defined but not used [-Wunused-const-variable=]
    1019 | static const struct of_device_id cs42l84_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/cs42l84_of_match +1019 sound/soc/codecs/cs42l84.c

  1018	
> 1019	static const struct of_device_id cs42l84_of_match[] = {
  1020		{ .compatible = "cirrus,cs42l84", },
  1021		{}
  1022	};
  1023	MODULE_DEVICE_TABLE(of, cs42l84_of_match);
  1024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
