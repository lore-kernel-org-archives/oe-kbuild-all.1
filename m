Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07ADDDA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 10:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692269328; x=1723805328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XLqUX7/lIhi1ZGkG9MAtMjpW7r/Dv/9kj976aB+NmIM=;
  b=jYLmUEpAH7Sox5n+IN/Qk9JO5mae7XX1xBCMllj24J83eTcH/sp2z9jv
   hu6r91q9XSgbxE4fHMlP2zDT8Tq6CvfhCKQBEBTDwTERO5svKhmBb5gdY
   B7T3PF37VSFW+kyrST+OrRk84Ww8C3cw7nNolJl+lv8G1MSFpzQMKF0JX
   ntwVxk/Ty7O4WTYZXCWsrwOSRxaM/b34j3lRBvUz1mlI8v9+9Ntd6LF29
   ezQWbUlo7ID4zjhgwwH/ggCJ64qx7j8+ZIx/5IFqh6sNebYdOs9x3jOhG
   IQrK1N1xVAnu1pCTDS36gk8EADO1xpzuAUJ7NsP8JVX6vSeZJytbJuaMK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403757398"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403757398"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 03:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="878181075"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2023 03:48:48 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWaYW-00013h-0U;
	Thu, 17 Aug 2023 10:48:44 +0000
Date: Thu, 17 Aug 2023 18:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/input/keyboard/cros_ec_keyb.c:66: warning: Function
 parameter or member 'switch_map' not described in 'cros_ec_keyb'
Message-ID: <202308171801.BL00G6ig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-61
head:   a12a9bd00b095b42f606b124f67769641193a99c
commit: 7bad091411dcd77ef9b9974962437f33c5492e42 UPSTREAM: Input: cros_ec_keyb - struct headers should start with 'struct <name>'
date:   2 years, 7 months ago
config: x86_64-buildonly-randconfig-r001-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171801.BL00G6ig-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171801.BL00G6ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171801.BL00G6ig-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/keyboard/cros_ec_keyb.c:66: warning: Function parameter or member 'switch_map' not described in 'cros_ec_keyb'
>> drivers/input/keyboard/cros_ec_keyb.c:66: warning: Function parameter or member 'button_map' not described in 'cros_ec_keyb'
   drivers/input/keyboard/cros_ec_keyb.c:212: warning: Function parameter or member 'ckdev' not described in 'cros_ec_keyb_bs_event'
   drivers/input/keyboard/cros_ec_keyb.c:212: warning: Function parameter or member 'map' not described in 'cros_ec_keyb_bs_event'
   drivers/input/keyboard/cros_ec_keyb.c:212: warning: Function parameter or member 'mask' not described in 'cros_ec_keyb_bs_event'
   drivers/input/keyboard/cros_ec_keyb.c:224: warning: Function parameter or member 'ckdev' not described in 'cros_ec_keyb_bs_set'
   drivers/input/keyboard/cros_ec_keyb.c:224: warning: Function parameter or member 'map' not described in 'cros_ec_keyb_bs_set'
   drivers/input/keyboard/cros_ec_keyb.c:224: warning: Function parameter or member 'mask' not described in 'cros_ec_keyb_bs_set'
   drivers/input/keyboard/cros_ec_keyb.c:243: warning: Function parameter or member 'work_fn' not described in 'cros_ec_keyb_walker_bs'


vim +66 drivers/input/keyboard/cros_ec_keyb.c

cdd7950e7aa4a4 Douglas Anderson 2017-01-20  30  
7bad091411dcd7 Lee Jones        2020-11-04  31  /**
7bad091411dcd7 Lee Jones        2020-11-04  32   * struct cros_ec_keyb - Structure representing EC keyboard device
7bad091411dcd7 Lee Jones        2020-11-04  33   *
6af6dc2d2aa654 Simon Glass      2013-02-25  34   * @rows: Number of rows in the keypad
6af6dc2d2aa654 Simon Glass      2013-02-25  35   * @cols: Number of columns in the keypad
6af6dc2d2aa654 Simon Glass      2013-02-25  36   * @row_shift: log2 or number of rows, rounded up
6af6dc2d2aa654 Simon Glass      2013-02-25  37   * @keymap_data: Matrix keymap data used to convert to keyscan values
6af6dc2d2aa654 Simon Glass      2013-02-25  38   * @ghost_filter: true to enable the matrix key-ghosting filter
017f14e88bf15c Todd Broch       2014-09-03  39   * @valid_keys: bitmap of existing keys for each matrix column
64757eba624422 Doug Anderson    2013-12-29  40   * @old_kb_state: bitmap of keys pressed last scan
6af6dc2d2aa654 Simon Glass      2013-02-25  41   * @dev: Device pointer
6af6dc2d2aa654 Simon Glass      2013-02-25  42   * @ec: Top level ChromeOS device to use to talk to EC
cdd7950e7aa4a4 Douglas Anderson 2017-01-20  43   * @idev: The input device for the matrix keys.
cdd7950e7aa4a4 Douglas Anderson 2017-01-20  44   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
44051a6825d58c Vic Yang         2016-08-10  45   * @notifier: interrupt event notifier for transport devices
6af6dc2d2aa654 Simon Glass      2013-02-25  46   */
6af6dc2d2aa654 Simon Glass      2013-02-25  47  struct cros_ec_keyb {
6af6dc2d2aa654 Simon Glass      2013-02-25  48  	unsigned int rows;
6af6dc2d2aa654 Simon Glass      2013-02-25  49  	unsigned int cols;
6af6dc2d2aa654 Simon Glass      2013-02-25  50  	int row_shift;
6af6dc2d2aa654 Simon Glass      2013-02-25  51  	const struct matrix_keymap_data *keymap_data;
6af6dc2d2aa654 Simon Glass      2013-02-25  52  	bool ghost_filter;
017f14e88bf15c Todd Broch       2014-09-03  53  	uint8_t *valid_keys;
64757eba624422 Doug Anderson    2013-12-29  54  	uint8_t *old_kb_state;
6af6dc2d2aa654 Simon Glass      2013-02-25  55  
6af6dc2d2aa654 Simon Glass      2013-02-25  56  	struct device *dev;
6af6dc2d2aa654 Simon Glass      2013-02-25  57  	struct cros_ec_device *ec;
cdd7950e7aa4a4 Douglas Anderson 2017-01-20  58  
9ca19612c3eb34 Gwendal Grignou  2017-01-10  59  	/* Keyboard input device */
cdd7950e7aa4a4 Douglas Anderson 2017-01-20  60  	struct input_dev *idev;
9ca19612c3eb34 Gwendal Grignou  2017-01-10  61  	/* BUttons and switches input device */
cdd7950e7aa4a4 Douglas Anderson 2017-01-20  62  	struct input_dev *bs_idev;
9ca19612c3eb34 Gwendal Grignou  2017-01-10  63  	u32 switch_map;
9ca19612c3eb34 Gwendal Grignou  2017-01-10  64  	u32 button_map;
44051a6825d58c Vic Yang         2016-08-10  65  	struct notifier_block notifier;
6af6dc2d2aa654 Simon Glass      2013-02-25 @66  };
6af6dc2d2aa654 Simon Glass      2013-02-25  67  

:::::: The code at line 66 was first introduced by commit
:::::: 6af6dc2d2aa654e928ed0a64c28724d1cd2c36c1 input: Add ChromeOS EC keyboard driver

:::::: TO: Simon Glass <sjg@chromium.org>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
