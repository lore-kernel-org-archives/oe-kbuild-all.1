Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFEA1F188
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692828563; x=1724364563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7xLTsJqFb5+CBDRtTHdJoFfEtc1Xi82HpVWJCok8A0=;
  b=J+lNuAM0szzVJOYxzpdlmyYCmSfslJSkVdYXo8T37bnivbLGxWGFQtH2
   +hPWr4viObfptzF0r9JsrH0JVB2yZuI2EKjS0Oy7ojExIVNXxzM6VhCmq
   kzQLBLv96R6w/bYdo/CKCZsR/ZNisYi3c/DPUBCLJaf2hqmmivwKDdYmD
   dt2Yz3B444SUc/vWCmJ4o3lomtOalXYZornAgN9iICUZttOWztR9Hg3ch
   wyHGoGfZn6UCdY6uiAUkejxH0HrpNYCyFVwSS1bPdpfdRCo6cQogFn5WO
   ZJCnQCDA6IPsIDyX26dNuRqpzVEOqyMeXNkkKry4ea9v+NW1YfzlPSUCE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="354614495"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354614495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 15:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802298732"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="802298732"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 15:09:21 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYw2T-0001Xg-0S;
	Wed, 23 Aug 2023 22:09:21 +0000
Date: Thu, 24 Aug 2023 06:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/base/regmap/regmap-raw-ram.c:24:24: sparse: sparse: cast to
 restricted __be16
Message-ID: <202308240651.5l5Q4csN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5e505a99ca748583dbe558b691be1b26f05d678
commit: 65dd2f671875b1d97b6fa9bcf7677f5e1c55f776 regmap: Provide a ram backed regmap with raw support
date:   2 months ago
config: i386-randconfig-061-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240651.5l5Q4csN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240651.5l5Q4csN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240651.5l5Q4csN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/regmap/regmap-raw-ram.c:24:24: sparse: sparse: cast to restricted __be16
>> drivers/base/regmap/regmap-raw-ram.c:26:24: sparse: sparse: cast to restricted __le16

vim +24 drivers/base/regmap/regmap-raw-ram.c

    18	
    19	static unsigned int decode_reg(enum regmap_endian endian, const void *reg)
    20	{
    21		const u16 *r = reg;
    22	
    23		if (endian == REGMAP_ENDIAN_BIG)
  > 24			return be16_to_cpu(*r);
    25		else
  > 26			return le16_to_cpu(*r);
    27	}
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
