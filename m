Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3EF2F44
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 22:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694471400; x=1726007400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbBYYsdoPGkIHJDg/4C9D1Tu8IxxjO9vE0yn8Xe8Gg4=;
  b=aNmFq6N29dNvS/X6sRzwt926758UK9ka20fzluevAYjmjb0RWdN39+m+
   b5jgB4pbo6KNEaObwLjLm3Ypov6A8SVchwPHjeSwkNtAgQoXBWZwCYLxB
   S318mSsDLMtFpb/37JGwNawkBuwE7N589d+rs/MVBF0tedNSy1ir3H9OU
   fOuIY4DwOv6mSQrjrQIWUamohw7b9rqmbUJ33fVDdmhUf9GfRiYAD7OOi
   P2oAtDhJD/d0jmTg4zraKO1KGCRogOoewPcGx5NhXPjATYuRqLE+o0whP
   Ie5IGRcByrv9gHxjavBONn0SLluCwgeKl8T4mVDBH7l1VWsFjub7yoEvb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368476012"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="368476012"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 15:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886712292"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="886712292"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2023 15:29:31 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfpPh-0006oT-1f;
	Mon, 11 Sep 2023 22:29:49 +0000
Date: Tue, 12 Sep 2023 06:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: cs42l43.c:undefined reference to `devm_regmap_add_irq_chip'
Message-ID: <202309120614.y7xm6iqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: ace6d14481386ec6c1b63cc2b24c71433a583dc2 mfd: cs42l43: Add support for cs42l43 core driver
date:   4 weeks ago
config: nios2-randconfig-r013-20230912 (https://download.01.org/0day-ci/archive/20230912/202309120614.y7xm6iqp-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120614.y7xm6iqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120614.y7xm6iqp-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/mfd/cs42l43.o: in function `cs42l43_boot_work':
>> cs42l43.c:(.text+0x614): undefined reference to `devm_regmap_add_irq_chip'
   cs42l43.c:(.text+0x614): relocation truncated to fit: R_NIOS2_CALL26 against `devm_regmap_add_irq_chip'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
