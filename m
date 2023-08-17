Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A7411185
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692264446; x=1723800446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dl5xLs9DuNjfsn3nRSaA6OLd3Y2N/wdzYfpgFnOFiJM=;
  b=kEzkvrVQbI02M3ZtlN3M7/C+ZDZb+CEcOz8B0VA+prl9LRovSAQQYUnn
   poTmkWU4KoXD21PllCUYO7fFw3aZ8L3IkKpLO8ISZAUCznRDItSyVNMj4
   /XRgVu1FGZDyibimX0jJC+Xe/xwjt+DK+ouec8tlec+Bf/H7oFz+5bwlP
   xZ5P4j/KkC+sorkbpZ+Xptyot17nRzQUefZaqn9dqVOMXFLcjoR3srK81
   OkGdGThemLfT8xWNMqq9QcjgIvDJjjsfU9FluwRZ7wq6xmoT6lvnRQVqK
   dxjjMMPMkeTUNN00DBStFUpJ1WGrJTFoSaBO6qABAxFfB1g1YKQbMjOwd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459117978"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="459117978"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769553501"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="769553501"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 02:25:50 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWZFf-000105-1Y;
	Thu, 17 Aug 2023 09:25:24 +0000
Date: Thu, 17 Aug 2023 17:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/input/keyboard/cros_ec_keyb.c:206: warning: Function
 parameter or member 'ckdev' not described in 'cros_ec_keyb_bs_event'
Message-ID: <202308171739.1o1cjt2D-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-r001-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171739.1o1cjt2D-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171739.1o1cjt2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171739.1o1cjt2D-lkp@intel.com/

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

    60	
    61	
    62	/**
    63	 * cros_ec_bs_map - Struct mapping Linux keycodes to EC button/switch bitmap
    64	 * #defines
    65	 *
    66	 * @ev_type: The type of the input event to generate (e.g., EV_KEY).
    67	 * @code: A linux keycode
    68	 * @bit: A #define like EC_MKBP_POWER_BUTTON or EC_MKBP_LID_OPEN
    69	 * @inverted: If the #define and EV_SW have opposite meanings, this is true.
    70	 *            Only applicable to switches.
    71	 */
  > 72	struct cros_ec_bs_map {
    73		unsigned int ev_type;
    74		unsigned int code;
    75		u8 bit;
    76		bool inverted;
    77	};
    78	
    79	/* cros_ec_keyb_bs - Map EC button/switch #defines into kernel ones */
    80	static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
    81		/* Buttons */
    82		{
    83			.ev_type	= EV_KEY,
    84			.code		= KEY_POWER,
    85			.bit		= EC_MKBP_POWER_BUTTON,
    86		},
    87		{
    88			.ev_type	= EV_KEY,
    89			.code		= KEY_VOLUMEUP,
    90			.bit		= EC_MKBP_VOL_UP,
    91		},
    92		{
    93			.ev_type	= EV_KEY,
    94			.code		= KEY_VOLUMEDOWN,
    95			.bit		= EC_MKBP_VOL_DOWN,
    96		},
    97	
    98		/* Switches */
    99		{
   100			.ev_type	= EV_SW,
   101			.code		= SW_LID,
   102			.bit		= EC_MKBP_LID_OPEN,
   103			.inverted	= true,
   104		},
   105		{
   106			.ev_type	= EV_SW,
   107			.code		= SW_TABLET_MODE,
   108			.bit		= EC_MKBP_TABLET_MODE,
   109		},
   110	};
   111	
   112	typedef void (*cros_ec_keyb_work_fn)(struct cros_ec_keyb *ckdev,
   113					     const struct cros_ec_bs_map *map,
   114					     u32 mask);
   115	
   116	/*
   117	 * Returns true when there is at least one combination of pressed keys that
   118	 * results in ghosting.
   119	 */
   120	static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
   121	{
   122		int col1, col2, buf1, buf2;
   123		struct device *dev = ckdev->dev;
   124		uint8_t *valid_keys = ckdev->valid_keys;
   125	
   126		/*
   127		 * Ghosting happens if for any pressed key X there are other keys
   128		 * pressed both in the same row and column of X as, for instance,
   129		 * in the following diagram:
   130		 *
   131		 * . . Y . g .
   132		 * . . . . . .
   133		 * . . . . . .
   134		 * . . X . Z .
   135		 *
   136		 * In this case only X, Y, and Z are pressed, but g appears to be
   137		 * pressed too (see Wikipedia).
   138		 */
   139		for (col1 = 0; col1 < ckdev->cols; col1++) {
   140			buf1 = buf[col1] & valid_keys[col1];
   141			for (col2 = col1 + 1; col2 < ckdev->cols; col2++) {
   142				buf2 = buf[col2] & valid_keys[col2];
   143				if (hweight8(buf1 & buf2) > 1) {
   144					dev_dbg(dev, "ghost found at: B[%02d]:0x%02x & B[%02d]:0x%02x",
   145						col1, buf1, col2, buf2);
   146					return true;
   147				}
   148			}
   149		}
   150	
   151		return false;
   152	}
   153	
   154	
   155	/*
   156	 * Compares the new keyboard state to the old one and produces key
   157	 * press/release events accordingly.  The keyboard state is 13 bytes (one byte
   158	 * per column)
   159	 */
   160	static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
   161				 uint8_t *kb_state, int len)
   162	{
   163		struct input_dev *idev = ckdev->idev;
   164		int col, row;
   165		int new_state;
   166		int old_state;
   167	
   168		if (ckdev->ghost_filter && cros_ec_keyb_has_ghosting(ckdev, kb_state)) {
   169			/*
   170			 * Simple-minded solution: ignore this state. The obvious
   171			 * improvement is to only ignore changes to keys involved in
   172			 * the ghosting, but process the other changes.
   173			 */
   174			dev_dbg(ckdev->dev, "ghosting found\n");
   175			return;
   176		}
   177	
   178		for (col = 0; col < ckdev->cols; col++) {
   179			for (row = 0; row < ckdev->rows; row++) {
   180				int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
   181				const unsigned short *keycodes = idev->keycode;
   182	
   183				new_state = kb_state[col] & (1 << row);
   184				old_state = ckdev->old_kb_state[col] & (1 << row);
   185				if (new_state != old_state) {
   186					dev_dbg(ckdev->dev,
   187						"changed: [r%d c%d]: byte %02x\n",
   188						row, col, new_state);
   189	
   190					input_event(idev, EV_MSC, MSC_SCAN, pos);
   191					input_report_key(idev, keycodes[pos],
   192							 new_state);
   193				}
   194			}
   195			ckdev->old_kb_state[col] = kb_state[col];
   196		}
   197		input_sync(ckdev->idev);
   198	}
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
