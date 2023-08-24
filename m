Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21BFD524
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692872318; x=1724408318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=poAihbucEHEEeKzfGpTvQgm87KOzaDkiK8jW22mubMY=;
  b=SE66mdw5Kf/lG36WuGoEB0k4Hc6Zl295TBaieH3PCKGLS5q4SbecW+U2
   KQ83igixsQvOk7mT04cfsp429YNGpzN3wYoElAFQsrUb+kbEP/SC6ZkCh
   AxpDspTc9oyMpixwn7CE5bMDP8PBCCq447NxsGkJNZHAA7Coe5hoLC8NY
   nCb2MVcjY/Ld9sTJDyFr4dm+7NIBz+e+IMfvk7iEPjY8ETEqNnZuqXGoR
   bvVIViypKOKCdKmomXqJOFshbX1kuBx1r7yHaMqY0dwwuAf1aQwNjjdd1
   xnHeBcBZTAwAK/yIFlu39xNcwRSVfrGmVvQ60aYdBHoZbbpcOD4sxt71d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="371808039"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="371808039"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 03:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730560612"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730560612"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Aug 2023 03:18:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ7Q8-0001wK-0j;
	Thu, 24 Aug 2023 10:18:33 +0000
Date: Thu, 24 Aug 2023 18:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Greenwalt <paul.greenwalt@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, andrew@lunn.ch, aelior@marvell.com,
	manishc@marvell.com, netdev@vger.kernel.org
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v2 2/9] ethtool: Add forced
 speed to supported link modes maps
Message-ID: <202308241737.GzJ3EfdT-lkp@intel.com>
References: <20230819093941.15163-1-paul.greenwalt@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230819093941.15163-1-paul.greenwalt@intel.com>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on next-20230824]
[cannot apply to tnguy-next-queue/dev-queue tnguy-net-queue/dev-queue net/main linus/master horms-ipvs/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Greenwalt/ice-Add-E830-device-IDs-MAC-type-and-registers/20230821-095200
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230819093941.15163-1-paul.greenwalt%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v2 2/9] ethtool: Add forced speed to supported link modes maps
config: i386-randconfig-063-20230824 (https://download.01.org/0day-ci/archive/20230824/202308241737.GzJ3EfdT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241737.GzJ3EfdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241737.GzJ3EfdT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/qlogic/qede/qede_ethtool.c:204:33: sparse: sparse: symbol 'qede_forced_speed_maps' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
