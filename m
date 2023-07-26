Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BFC1108
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 03:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690341170; x=1721877170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uIwbu4L2MloP1+HvS50IpzccwfAmAZM4+anEsLRR/0w=;
  b=H5BcrPojgoMlIP6dKXSZaD64sgV0jOpGA8cDQdchRhbJauYJ4cUvSDrL
   2Xaft3jLjIXQxmI/Cv+qahvZ50Xoql3Ejuan6K9jmd0mE407tpBW063IJ
   GEIUB6jhkMjMmx2hVPl8lOVhLD/DSf1Sa4sot6bANOo71Ez7zxr63SUxi
   JXRAiWIcG6Uv82vVbSvsjyxyDD609gSCV34maLTLy7FL26xp4p97kphlG
   WvQ3bumso2bYiyOMuuTI5xdNBd2LZeo5vM806iOVYkIpJQJ5RK3YxxatA
   EXXJiz+4JxuhzStL9OEwQ+q7rlrwpjpdYQPYWk47Z+GqHEL7rrZrGAzCx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370574385"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="370574385"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 20:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869716691"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 20:12:50 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOUxE-0000ad-0h;
	Wed, 26 Jul 2023 03:12:48 +0000
Date: Wed, 26 Jul 2023 11:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Derek Fang <derek.fang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.6 21/23]
 sound/soc/codecs/rt1017-sdca-sdw.h:183:33: warning:
 'rt1017_sdca_mbq_defaults' defined but not used
Message-ID: <202307261130.2dLXdvPF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.6
head:   5bdeb6f5c7b94f653183f08eca8a08022b2efac6
commit: 2b7aecd58528551e6e3da58091ff7ceb4718e6be [21/23] ASoC: rt1017: Add RT1017 SDCA amplifier driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307261130.2dLXdvPF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261130.2dLXdvPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261130.2dLXdvPF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/rt1017-sdca-sdw.c:22:
>> sound/soc/codecs/rt1017-sdca-sdw.h:183:33: warning: 'rt1017_sdca_mbq_defaults' defined but not used [-Wunused-const-variable=]
     183 | static const struct reg_default rt1017_sdca_mbq_defaults[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/rt1017_sdca_mbq_defaults +183 sound/soc/codecs/rt1017-sdca-sdw.h

   182	
 > 183	static const struct reg_default rt1017_sdca_mbq_defaults[] = {
   184		{ SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, RT1017_SDCA_ENT_FU,
   185				RT1017_SDCA_CTL_FU_VOLUME, 0x01), 0x00 },
   186	};
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
