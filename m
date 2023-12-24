Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DFA10783
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7RMNy26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703459912; x=1734995912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53dkdngotIuf6N0ofFKaXoXsDdziRciDgIdsVY2ONKY=;
  b=E7RMNy26scVIK6ZDV7p/y/WASGkAtrkGBGo6gBhUlFxIIoN5gfN6VNmr
   O43/89bzDeiYoaIZk5U9fK9ssd9cmX/CAIce1MNNIX15zMiQ1G9/FVy8r
   moA+Iit+XZHAZ0tDWNLo7FsVPW0JyZ7d+GqneNYpekIL8a5sNM9d8WZH/
   883dlBJuXVmHltTZTgUq1zBxwxFnr/auewY28gmPDeSKxaXV6vNVDWFqH
   FaijAOh85xKEEFhW9Y6E0PxAPK5UWiC5DPjkqWsGdM0nZdgp3sEe68Oqh
   goQSz6KisJEcArZJLbATxBsWuV2QrxnF5hBEwdCHh7TzkOHwAYqv9zxWx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="14931693"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="14931693"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 15:18:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="12065502"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Dec 2023 15:18:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHXjZ-000Civ-04;
	Sun, 24 Dec 2023 23:18:17 +0000
Date: Mon, 25 Dec 2023 07:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daniel-lezcano:thermal/debugfs-v4 2/4]
 drivers/thermal/thermal_debugfs.c:82: warning: expecting prototype for
 struct cdev_value. Prototype was for struct cdev_record instead
Message-ID: <202312250728.JoJLi25n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/daniel.lezcano/linux thermal/debugfs-v4
head:   9f3c7e51a6ae452e988bd443b8b7f608e13a3e42
commit: e545b113036794411d8b7165997af9ec2c80695c [2/4] comment from v3 - cdev
config: nios2-randconfig-r081-20231225 (https://download.01.org/0day-ci/archive/20231225/202312250728.JoJLi25n-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312250728.JoJLi25n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250728.JoJLi25n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/thermal_debugfs.c:82: warning: expecting prototype for struct cdev_value. Prototype was for struct cdev_record instead
>> drivers/thermal/thermal_debugfs.c:101: warning: Function parameter or member 'cdev_dbg' not described in 'thermal_debugfs'


vim +82 drivers/thermal/thermal_debugfs.c

853ad2eba4d85b Daniel Lezcano 2022-04-25   61  
853ad2eba4d85b Daniel Lezcano 2022-04-25   62  /**
853ad2eba4d85b Daniel Lezcano 2022-04-25   63   * struct cdev_value - Common structure for cooling device entry
853ad2eba4d85b Daniel Lezcano 2022-04-25   64   *
853ad2eba4d85b Daniel Lezcano 2022-04-25   65   * The following common structure allows to store the information
853ad2eba4d85b Daniel Lezcano 2022-04-25   66   * related to the transitions and to the state residencies. They are
853ad2eba4d85b Daniel Lezcano 2022-04-25   67   * identified with a id which is associated to a value. It is used as
853ad2eba4d85b Daniel Lezcano 2022-04-25   68   * nodes for the "transitions" and "durations" above.
853ad2eba4d85b Daniel Lezcano 2022-04-25   69   *
853ad2eba4d85b Daniel Lezcano 2022-04-25   70   * @node: node to insert the structure in a list
853ad2eba4d85b Daniel Lezcano 2022-04-25   71   * @id: identifier of the value which can be a state or a transition
e545b113036794 Daniel Lezcano 2023-12-23   72   * @residency: a ktime_t representing a state residency duration
e545b113036794 Daniel Lezcano 2023-12-23   73   * @count: a number of occurrences
853ad2eba4d85b Daniel Lezcano 2022-04-25   74   */
e545b113036794 Daniel Lezcano 2023-12-23   75  struct cdev_record {
853ad2eba4d85b Daniel Lezcano 2022-04-25   76  	struct list_head node;
853ad2eba4d85b Daniel Lezcano 2022-04-25   77  	int id;
e545b113036794 Daniel Lezcano 2023-12-23   78  	union {
e545b113036794 Daniel Lezcano 2023-12-23   79                  ktime_t residency;
e545b113036794 Daniel Lezcano 2023-12-23   80                  u64 count;
e545b113036794 Daniel Lezcano 2023-12-23   81          };
853ad2eba4d85b Daniel Lezcano 2022-04-25  @82  };
853ad2eba4d85b Daniel Lezcano 2022-04-25   83  
853ad2eba4d85b Daniel Lezcano 2022-04-25   84  /**
853ad2eba4d85b Daniel Lezcano 2022-04-25   85   * struct thermal_debugfs - High level structure for a thermal object in debugfs
853ad2eba4d85b Daniel Lezcano 2022-04-25   86   *
853ad2eba4d85b Daniel Lezcano 2022-04-25   87   * The thermal_debugfs structure is the common structure used by the
853ad2eba4d85b Daniel Lezcano 2022-04-25   88   * cooling device to compute the statistics.
853ad2eba4d85b Daniel Lezcano 2022-04-25   89   *
853ad2eba4d85b Daniel Lezcano 2022-04-25   90   * @d_top: top directory of the thermal object directory
853ad2eba4d85b Daniel Lezcano 2022-04-25   91   * @lock: per object lock to protect the internals
853ad2eba4d85b Daniel Lezcano 2022-04-25   92   *
853ad2eba4d85b Daniel Lezcano 2022-04-25   93   * @cdev: a cooling device debug structure
853ad2eba4d85b Daniel Lezcano 2022-04-25   94   */
853ad2eba4d85b Daniel Lezcano 2022-04-25   95  struct thermal_debugfs {
853ad2eba4d85b Daniel Lezcano 2022-04-25   96  	struct dentry *d_top;
853ad2eba4d85b Daniel Lezcano 2022-04-25   97  	struct mutex lock;
853ad2eba4d85b Daniel Lezcano 2022-04-25   98  	union {
e545b113036794 Daniel Lezcano 2023-12-23   99  		struct cdev_debugfs cdev_dbg;
853ad2eba4d85b Daniel Lezcano 2022-04-25  100  	};
853ad2eba4d85b Daniel Lezcano 2022-04-25 @101  };
853ad2eba4d85b Daniel Lezcano 2022-04-25  102  

:::::: The code at line 82 was first introduced by commit
:::::: 853ad2eba4d85b6f31434d76ec33194d85a4eddd thermal/debugfs: Add thermal cooling device debugfs information

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
