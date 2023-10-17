Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92372D034
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLz0zI1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697560752; x=1729096752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FXwIxIscyM1a6VelEVdI5M4ahsb2QmpdBTUOvPMqNG4=;
  b=GLz0zI1zH5fVnenHabdVF07TlJqMI0D42lIdDN8HjFJhg9tC+hTje6UG
   2rrxgJEOG7D6V2QAKJOkCgBOLcqcm0ojDLbgWpoBDFkGXpkD7fiqfiBS5
   4UOYfeQnWUGWHherm3zmW2RHeA3ebUmJuJvOCy3YKg2mG+lno6AzGz2Nl
   I2yw9XD0/Jv2fBce68nvPi7HGuwPb0B2ISPwPX2Y1yXYlvu1vfWg7yQf8
   N4boDs5lPPCsleSq75CAh84XONy9ddpjWIBpqUcv6jV4sRbTtC7FGZ955
   CJuufkKAyTugh78fuN5DhsYKciwSGC4x3oWYTRyWctMCpWSZwxDYWF6og
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389693712"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="389693712"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 09:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="706068408"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="706068408"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2023 09:39:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsn64-0009ph-1Q;
	Tue, 17 Oct 2023 16:39:08 +0000
Date: Wed, 18 Oct 2023 00:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: madvenka@linux.microsoft.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 08/10] mm/prmem: Implement Persistent Ramdisk
 instances.
Message-ID: <202310180013.sbQM5SPM-lkp@intel.com>
References: <20231016233215.13090-9-madvenka@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016233215.13090-9-madvenka@linux.microsoft.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 2dde18cd1d8fac735875f2e4987f11817cc0bc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/madvenka-linux-microsoft-com/mm-prmem-Allocate-memory-during-boot-for-storing-persistent-data/20231017-194340
base:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
patch link:    https://lore.kernel.org/r/20231016233215.13090-9-madvenka%40linux.microsoft.com
patch subject: [RFC PATCH v1 08/10] mm/prmem: Implement Persistent Ramdisk instances.
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180013.sbQM5SPM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180013.sbQM5SPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180013.sbQM5SPM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/brd.c:323:13: warning: no previous prototype for 'brd_parse' [-Wmissing-prototypes]
     323 | void __init brd_parse(void)
         |             ^~~~~~~~~


vim +/brd_parse +323 drivers/block/brd.c

   322	
 > 323	void __init brd_parse(void)
   324	{
   325		unsigned long		size;
   326		char			*cur, *tmp;
   327		int			i = 0;
   328	
   329		if (!CONFIG_BLK_DEV_PRAM_MAX || !prd_sizes)
   330			return;
   331	
   332		/* Parse persistent ram disk sizes. */
   333		cur = prd_sizes;
   334		do {
   335			/* Get the size of a ramdisk. Sanity check it. */
   336			size = memparse(cur, &tmp);
   337			if (cur == tmp || !size) {
   338				pr_warn("%s: Memory value expected\n", __func__);
   339				return;
   340			}
   341			cur = tmp;
   342	
   343			/* Add the ramdisk size. */
   344			prd_data[i++].size = size;
   345	
   346		} while (*cur++ == ',' && i < CONFIG_BLK_DEV_PRAM_MAX);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
