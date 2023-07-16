Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18844161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 01:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689472632; x=1721008632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXLFuKFqiaRDiaxo+Qxxp2dSJsQcZjG+J1xqrLQq+9A=;
  b=kSsmOpUc9Uh6s35SpjiifyC84q2d/HVb28V/PrTd+rUM9RakZHPwCMP2
   ovE41GppecEjPaEe6Ltl3bq3FeW/fFPBwbs38FTAOQ5nL0KiMNU6B3PPO
   zLUGkc9SWMVPQJ4XL6wSgOUAsfxLxtUvJmbroXtXJlztG3Td7xGX5Km6h
   FGyrcgMnAXTGOpHpyH94ZxfaaKc9jPqpo9DV0SFMZbrAqNKcK7nAWvA71
   V9sXLA41kKEIj8qGi+9eA/sKHIiqO01nPt1uVWawwuuNLdpzcMslYQw/m
   Hv7sEzFSvB6CLmj7wjzbMXIIpGSvpLk0N6aAHbMNJhTZUypM+5tvcjTKc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="452095647"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="452095647"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 18:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="752471089"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="752471089"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jul 2023 18:57:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKr0W-0008SZ-2g;
	Sun, 16 Jul 2023 01:57:08 +0000
Date: Sun, 16 Jul 2023 09:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regmap-cache-check 5/5] sound/hda/hdac_regmap.c:567:14:
 error: too few arguments to function 'regcache_reg_cached'
Message-ID: <202307160958.HxAyUyBM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regmap-cache-check
head:   b6ade97498afd7bc2191e97d9807ae3469e5e5c0
commit: b6ade97498afd7bc2191e97d9807ae3469e5e5c0 [5/5] ALSA: hda: Use regcache_reg_cached() rather than open coding
config: x86_64-buildonly-randconfig-r003-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160958.HxAyUyBM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160958.HxAyUyBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160958.HxAyUyBM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/hda/hdac_regmap.c: In function 'reg_raw_update_once':
>> sound/hda/hdac_regmap.c:567:34: warning: passing argument 1 of 'regcache_reg_cached' makes pointer from integer without a cast [-Wint-conversion]
     567 |         if (!regcache_reg_cached(reg))
         |                                  ^~~
         |                                  |
         |                                  unsigned int
   In file included from sound/hda/hdac_regmap.c:17:
   include/linux/regmap.h:1290:41: note: expected 'struct regmap *' but argument is of type 'unsigned int'
    1290 | bool regcache_reg_cached(struct regmap *map, unsigned int reg);
         |                          ~~~~~~~~~~~~~~~^~~
>> sound/hda/hdac_regmap.c:567:14: error: too few arguments to function 'regcache_reg_cached'
     567 |         if (!regcache_reg_cached(reg))
         |              ^~~~~~~~~~~~~~~~~~~
   include/linux/regmap.h:1290:6: note: declared here
    1290 | bool regcache_reg_cached(struct regmap *map, unsigned int reg);
         |      ^~~~~~~~~~~~~~~~~~~
>> sound/hda/hdac_regmap.c:559:22: warning: unused variable 'orig' [-Wunused-variable]
     559 |         unsigned int orig;
         |                      ^~~~


vim +/regcache_reg_cached +567 sound/hda/hdac_regmap.c

   555	
   556	static int reg_raw_update_once(struct hdac_device *codec, unsigned int reg,
   557				       unsigned int mask, unsigned int val)
   558	{
 > 559		unsigned int orig;
   560		int err = 0;
   561	
   562		if (!codec->regmap)
   563			return reg_raw_update(codec, reg, mask, val);
   564	
   565		mutex_lock(&codec->regmap_lock);
   566		/* Discard any updates to already initialised registers. */
 > 567		if (!regcache_reg_cached(reg))
   568			err = regmap_update_bits(codec->regmap, reg, mask, val);
   569		mutex_unlock(&codec->regmap_lock);
   570		return err;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
