Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70515A93A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 23:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690414030; x=1721950030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/LalIiZo9IvflODCSqzRzGt8GVtou+uN6XNZMeXz8K0=;
  b=S5NSNZPRQ1xFWN8TOnYd7fQbH9JGaaM+KNWoJoLEQEBryRsg9WzySoqe
   PKCM5m36BwcANgVtSgVLQPhcj43000l9SVJMQU8yRQnxWILpRPsoeWyfO
   Jk1XKeTJwfNwke8S9gO4XCSYbqkYU8QamH1ujtXS2CFMCmyz6ce8la9AR
   iJN1ZcaqaLhztfUKeYvh8dMx0rVLnjmuKFQcMr1nIsIZWBaVOsb21R3ac
   pZVTbP1OQq+dkw6FfDKxrcUi2baT++GrW6hv39nBLNiO/dX4gwKdWzDFQ
   pe4AD0Cc98WblHitC8zpAfDGumUIo8EZvNe42Xv1LMjyvqzPaxU5ZhF8+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370832141"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="370832141"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 16:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057417096"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="1057417096"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 16:26:55 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOnuA-0001RN-2v;
	Wed, 26 Jul 2023 23:26:54 +0000
Date: Thu, 27 Jul 2023 07:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>, olivia@selenic.com,
	herbert@gondor.apana.org.au, jiajie.ho@starfivetech.com,
	conor.dooley@microchip.com, martin@kaiser.cx, mmyangfl@gmail.com,
	jenny.zhang@starfivetech.com, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, leoliu@zhaoxin.com, CobeChen@zhaoxin.com,
	YunShen@zhaoxin.com, TonyWWang@zhaoxin.com,
	leoliu-oc <leoliu-oc@zhaoxin.com>
Subject: Re: [PATCH] hwrng: add Zhaoxin HW RNG driver
Message-ID: <202307270707.SlAbd4tx-lkp@intel.com>
References: <20230726113553.1965627-1-LeoLiu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726113553.1965627-1-LeoLiu-oc@zhaoxin.com>

Hi LeoLiu-oc,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/LeoLiu-oc/hwrng-add-Zhaoxin-HW-RNG-driver/20230726-193710
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230726113553.1965627-1-LeoLiu-oc%40zhaoxin.com
patch subject: [PATCH] hwrng: add Zhaoxin HW RNG driver
config: i386-randconfig-r006-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270707.SlAbd4tx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270707.SlAbd4tx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270707.SlAbd4tx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/hw_random/zhaoxin-rng.c: Assembler messages:
>> drivers/char/hw_random/zhaoxin-rng.c:57: Error: bad register name `%rcx'
>> drivers/char/hw_random/zhaoxin-rng.c:58: Error: bad register name `%rdx'
>> drivers/char/hw_random/zhaoxin-rng.c:59: Error: bad register name `%rdi'


vim +57 drivers/char/hw_random/zhaoxin-rng.c

    54	
    55	static inline int rep_xstore(size_t size, size_t factor, void *result)
    56	{
  > 57		__asm__ __volatile__ (
  > 58		"movq %0, %%rcx\n"
  > 59		"movq %1, %%rdx\n"
    60		"movq %2, %%rdi\n"
    61		".byte 0xf3, 0x0f, 0xa7, 0xc0"
    62		:
    63		: "r"(size), "r"(factor), "r"(result)
    64		: "%rcx", "%rdx", "%rdi", "memory");
    65	
    66		return 0;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
