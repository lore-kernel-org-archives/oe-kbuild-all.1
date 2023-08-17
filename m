Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD3633C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692261665; x=1723797665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=llzyTGJOEwjNHMK0mfQZ4dVhZq0hehxMexdLqKKCXjU=;
  b=ndoKYEaiDNTzDIEibyftvULoy1OKBtXTYkQsDoyU/r3vJxmmCf+Sb3We
   FcGzpR+6jPmUUaIfEfsz0oVZpowJ+rI4bwm2SPt7F7OH3I7BjMEsNvyC3
   fzVlLZl4noWa/x/d8EkR3dPnqCmxrOWYhbU+329jHFRumjVwPrTgfIikS
   8M7fVzorvoy1LZeLw9+1gyV4Mh9c7F7m7RcE5plrJdkphoJY4DEm5z2Gu
   Pz7cJlDkJ7xEnk1ZW5d3VtPFs+BRhfePx4MqFvS2Ge5dKpV1MyGnMYEpp
   oR5B3/9RTvXoa/W8uJeqMWbMolzivEVEcOtS8BCO7tLR7nJ2MzP6xQA4l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371649929"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="371649929"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="684360087"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="684360087"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Aug 2023 01:41:02 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWYYv-0000xf-3A;
	Thu, 17 Aug 2023 08:41:01 +0000
Date: Thu, 17 Aug 2023 16:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/input/keyboard/cros_ec_keyb.c:206: warning: Function
 parameter or member 'ckdev' not described in 'cros_ec_keyb_bs_event'
Message-ID: <202308171646.lEoga8pV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 3880014a2162ceae2f5f9e33d9964db3635cabe3 CHROMIUM: input: Add walker for buttons/switches map
date:   2 years, 8 months ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308171646.lEoga8pV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171646.lEoga8pV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171646.lEoga8pV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/keyboard/cros_ec_keyb.c:72: warning: cannot understand function prototype: 'struct cros_ec_bs_map '
>> drivers/input/keyboard/cros_ec_keyb.c:206: warning: Function parameter or member 'ckdev' not described in 'cros_ec_keyb_bs_event'
>> drivers/input/keyboard/cros_ec_keyb.c:206: warning: Function parameter or member 'map' not described in 'cros_ec_keyb_bs_event'
>> drivers/input/keyboard/cros_ec_keyb.c:206: warning: Function parameter or member 'mask' not described in 'cros_ec_keyb_bs_event'
>> drivers/input/keyboard/cros_ec_keyb.c:218: warning: Function parameter or member 'ckdev' not described in 'cros_ec_keyb_bs_set'
>> drivers/input/keyboard/cros_ec_keyb.c:218: warning: Function parameter or member 'map' not described in 'cros_ec_keyb_bs_set'
>> drivers/input/keyboard/cros_ec_keyb.c:218: warning: Function parameter or member 'mask' not described in 'cros_ec_keyb_bs_set'
>> drivers/input/keyboard/cros_ec_keyb.c:237: warning: Function parameter or member 'work_fn' not described in 'cros_ec_keyb_walker_bs'


vim +206 drivers/input/keyboard/cros_ec_keyb.c

   199	
   200	/**
   201	 * cros_ec_keyb_bs_event - Report a given button switch event
   202	 */
   203	void cros_ec_keyb_bs_event(struct cros_ec_keyb *ckdev,
   204				   const struct cros_ec_bs_map *map,
   205				   u32 mask)
 > 206	{
   207		input_event(ckdev->bs_idev, map->ev_type, map->code,
   208			    !!(mask & BIT(map->bit)) ^ map->inverted);
   209	}
   210	
   211	
   212	/**
   213	 * cros_ec_keyb_bs_set - Set capability for a given button switch
   214	 */
   215	void cros_ec_keyb_bs_set(struct cros_ec_keyb *ckdev,
   216				 const struct cros_ec_bs_map *map,
   217				 u32 mask)
 > 218	{
   219		if (mask & BIT(map->bit))
   220			input_set_capability(ckdev->bs_idev, map->ev_type, map->code);
   221	}
   222	
   223	/**
   224	 * cros_ec_keyb_walker_bs - Report non-matrixed buttons or switches
   225	 *
   226	 * This takes a bitmap of buttons or switches from the EC and reports events,
   227	 * syncing at the end.
   228	 *
   229	 * @ckdev: The keyboard device.
   230	 * @ev_type: The input event type (e.g., EV_KEY).
   231	 * @mask: A bitmap of buttons from the EC.
   232	 */
   233	static void cros_ec_keyb_walker_bs(struct cros_ec_keyb *ckdev,
   234					   unsigned int ev_type, u32 mask,
   235					   cros_ec_keyb_work_fn work_fn)
   236	
 > 237	{
   238		int i;
   239	
   240		for (i = 0; i < ARRAY_SIZE(cros_ec_keyb_bs); i++) {
   241			const struct cros_ec_bs_map *map = &cros_ec_keyb_bs[i];
   242	
   243			if (map->ev_type != ev_type)
   244				continue;
   245			work_fn(ckdev, map, mask);
   246		}
   247		input_sync(ckdev->bs_idev);
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
