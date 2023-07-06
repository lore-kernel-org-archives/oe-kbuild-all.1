Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D0315A1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688629702; x=1720165702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xo0fbN1VsjDMVKPWre0XhLetnWjzyPPJcL/tUzOSN2c=;
  b=dIKqaO3qsbAXMVitx38wLT3U8b9ethDvcs5UbpFKQRs6y/DjY3Te1FQ/
   06F03w9BDifG430cJrpYarA9AjZS46Flwf/Aa1IkaK4UHWCZB5/NzvNT7
   R+o6IK+maRsdIb2eWLNk3YuZeam9IX7XInwmziQvLmStH00/vk7GUVrYJ
   +aJlxQ9bRrMSA/yT7AnBtEpUr4nk0kNOWPRHt712zntVD9oDwTfSFV2+h
   u8uUsTszIhJj5cqlKfH33+AW5eHdaAApEgalRAbOAnldyGN5bF5caJnhs
   Gz2s1pdd7cEZBKTdFuujQ9mMdSciXJ/irEXlMXxBc3tngE5cRifVqKvAj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="429577057"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="429577057"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 00:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="789455211"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="789455211"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2023 00:48:20 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHJit-0001AU-1i;
	Thu, 06 Jul 2023 07:48:19 +0000
Date: Thu, 6 Jul 2023 15:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/regulator/raa215300.c:42:12: sparse: sparse: symbol
 'xin_name' was not declared. Should it be static?
Message-ID: <202307061555.Gx6hEBT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c17414a273b81fe4e34e11d69fc30cc8b1431614
commit: 7bce16630837c705f72e8fd53a11ae8c236236f4 regulator: Add Renesas PMIC RAA215300 driver
date:   13 days ago
config: i386-randconfig-i061-20230706 (https://download.01.org/0day-ci/archive/20230706/202307061555.Gx6hEBT4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061555.Gx6hEBT4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061555.Gx6hEBT4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/raa215300.c:42:12: sparse: sparse: symbol 'xin_name' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
