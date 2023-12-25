Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0EE7F2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 02:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJKnDYcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703472477; x=1735008477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JL6XP5RumBUnOu1AkobRPo0R218WziHGLfHhhtmbKvQ=;
  b=HJKnDYcbva8cybn7mPiuBawL2F9nfutM4gehL8NDEdZ8FnTrnTWfZnVD
   qH0cDsFyOAeofSEL8dAksGxbwKTaw3L+ItxEksa++0WXFaiHS4ZHzDXcy
   TcXqpbUwINyD8qkoQm+iBmdp/WSl62bLds8eMBwL4/0ex4rIzUNaWY0MD
   SFYy7T1XDeDcCiIMs7BZKnEZIgGE+noUePFan+L5q9m0NHZBOC9sYCvUZ
   pq7ycNQOiFHJXT76Ir1Puynbog0mwm44npjjBk66HE1vftlLkLT8C6E3Q
   rpdLmms6TJkV1Ds2Wp+VlIpcpB1i5G4rY+KHoogNofDQW45Ppu4bbSQnC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="393423733"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="393423733"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 18:47:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="19684490"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Dec 2023 18:47:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHazW-000CrF-1w;
	Mon, 25 Dec 2023 02:47:21 +0000
Date: Mon, 25 Dec 2023 10:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daniel-lezcano:thermal/debugfs-v4 4/4]
 drivers/thermal/thermal_debugfs.c:169: warning: Function parameter or member
 'tz_dbg' not described in 'thermal_debugfs'
Message-ID: <202312251019.fDw8n90e-lkp@intel.com>
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
commit: 9f3c7e51a6ae452e988bd443b8b7f608e13a3e42 [4/4] WIP
config: nios2-randconfig-r081-20231225 (https://download.01.org/0day-ci/archive/20231225/202312251019.fDw8n90e-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312251019.fDw8n90e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312251019.fDw8n90e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/thermal_debugfs.c:85: warning: expecting prototype for struct cdev_value. Prototype was for struct cdev_record instead
   drivers/thermal/thermal_debugfs.c:169: warning: Function parameter or member 'cdev_dbg' not described in 'thermal_debugfs'
>> drivers/thermal/thermal_debugfs.c:169: warning: Function parameter or member 'tz_dbg' not described in 'thermal_debugfs'


vim +169 drivers/thermal/thermal_debugfs.c

853ad2eba4d85b Daniel Lezcano 2022-04-25   64  
853ad2eba4d85b Daniel Lezcano 2022-04-25   65  /**
853ad2eba4d85b Daniel Lezcano 2022-04-25   66   * struct cdev_value - Common structure for cooling device entry
853ad2eba4d85b Daniel Lezcano 2022-04-25   67   *
853ad2eba4d85b Daniel Lezcano 2022-04-25   68   * The following common structure allows to store the information
853ad2eba4d85b Daniel Lezcano 2022-04-25   69   * related to the transitions and to the state residencies. They are
853ad2eba4d85b Daniel Lezcano 2022-04-25   70   * identified with a id which is associated to a value. It is used as
853ad2eba4d85b Daniel Lezcano 2022-04-25   71   * nodes for the "transitions" and "durations" above.
853ad2eba4d85b Daniel Lezcano 2022-04-25   72   *
853ad2eba4d85b Daniel Lezcano 2022-04-25   73   * @node: node to insert the structure in a list
853ad2eba4d85b Daniel Lezcano 2022-04-25   74   * @id: identifier of the value which can be a state or a transition
e545b113036794 Daniel Lezcano 2023-12-23   75   * @residency: a ktime_t representing a state residency duration
e545b113036794 Daniel Lezcano 2023-12-23   76   * @count: a number of occurrences
853ad2eba4d85b Daniel Lezcano 2022-04-25   77   */
e545b113036794 Daniel Lezcano 2023-12-23   78  struct cdev_record {
853ad2eba4d85b Daniel Lezcano 2022-04-25   79  	struct list_head node;
853ad2eba4d85b Daniel Lezcano 2022-04-25   80  	int id;
e545b113036794 Daniel Lezcano 2023-12-23   81  	union {
e545b113036794 Daniel Lezcano 2023-12-23   82                  ktime_t residency;
e545b113036794 Daniel Lezcano 2023-12-23   83                  u64 count;
e545b113036794 Daniel Lezcano 2023-12-23   84          };
853ad2eba4d85b Daniel Lezcano 2022-04-25  @85  };
853ad2eba4d85b Daniel Lezcano 2022-04-25   86  
1dfdfdc602553d Daniel Lezcano 2023-12-11   87  /**
1dfdfdc602553d Daniel Lezcano 2023-12-11   88   * struct trip_stats - Thermal trip statistics
1dfdfdc602553d Daniel Lezcano 2023-12-11   89   *
1dfdfdc602553d Daniel Lezcano 2023-12-11   90   * The trip_stats structure has the relevant information to show the
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24   91   * statistics related to temperature going above a trip point.
1dfdfdc602553d Daniel Lezcano 2023-12-11   92   *
1dfdfdc602553d Daniel Lezcano 2023-12-11   93   * @timestamp: the trip crossing timestamp
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24   94   * @duration: total time when the zone temperature was above the trip point
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24   95   * @count: the number of times the zone temperature was above the trip point
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24   96   * @max: maximum recorded temperature above the trip point
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24   97   * @min: minimum recorded temperature above the trip point
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24   98   * @avg: average temperature above the trip point
1dfdfdc602553d Daniel Lezcano 2023-12-11   99   */
1dfdfdc602553d Daniel Lezcano 2023-12-11  100  struct trip_stats {
1dfdfdc602553d Daniel Lezcano 2023-12-11  101  	ktime_t timestamp;
1dfdfdc602553d Daniel Lezcano 2023-12-11  102  	ktime_t duration;
1dfdfdc602553d Daniel Lezcano 2023-12-11  103  	int count;
1dfdfdc602553d Daniel Lezcano 2023-12-11  104  	int max;
1dfdfdc602553d Daniel Lezcano 2023-12-11  105  	int min;
1dfdfdc602553d Daniel Lezcano 2023-12-11  106  	int avg;
1dfdfdc602553d Daniel Lezcano 2023-12-11  107  };
1dfdfdc602553d Daniel Lezcano 2023-12-11  108  
1dfdfdc602553d Daniel Lezcano 2023-12-11  109  /**
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24  110   * struct tz_events - Collection of all mitigation episodes for a thermal zone
1dfdfdc602553d Daniel Lezcano 2023-12-11  111   *
1dfdfdc602553d Daniel Lezcano 2023-12-11  112   * The tz_events structure describes a mitigation episode. A
1dfdfdc602553d Daniel Lezcano 2023-12-11  113   * mitigation episode is when the mitigation begins and ends. During
1dfdfdc602553d Daniel Lezcano 2023-12-11  114   * this episode we can have multiple trip points crossed the way up
1dfdfdc602553d Daniel Lezcano 2023-12-11  115   * and down if there are multiple trip describes in the firmware.
1dfdfdc602553d Daniel Lezcano 2023-12-11  116   *
1dfdfdc602553d Daniel Lezcano 2023-12-11  117   * @node: a list element to be added to the list of tz events
1dfdfdc602553d Daniel Lezcano 2023-12-11  118   * @trip_stats: per trip point statistics
1dfdfdc602553d Daniel Lezcano 2023-12-11  119   * @timestamp: First trip point crossed the way up
1dfdfdc602553d Daniel Lezcano 2023-12-11  120   * @duration: total duration of the mitigation episode
1dfdfdc602553d Daniel Lezcano 2023-12-11  121   */
1dfdfdc602553d Daniel Lezcano 2023-12-11  122  struct tz_events {
1dfdfdc602553d Daniel Lezcano 2023-12-11  123  	struct list_head node;
1dfdfdc602553d Daniel Lezcano 2023-12-11  124  	struct trip_stats *trip_stats;
1dfdfdc602553d Daniel Lezcano 2023-12-11  125  	ktime_t timestamp;
1dfdfdc602553d Daniel Lezcano 2023-12-11  126  	ktime_t duration;
1dfdfdc602553d Daniel Lezcano 2023-12-11  127  };
1dfdfdc602553d Daniel Lezcano 2023-12-11  128  
1dfdfdc602553d Daniel Lezcano 2023-12-11  129  /**
1dfdfdc602553d Daniel Lezcano 2023-12-11  130   * struct tz_debugfs - Store all mitigations episodes for a thermal zone
1dfdfdc602553d Daniel Lezcano 2023-12-11  131   *
1dfdfdc602553d Daniel Lezcano 2023-12-11  132   * The tz_debugfs structure contains the list of the mitigation
1dfdfdc602553d Daniel Lezcano 2023-12-11  133   * episodes and has to track which trip point has been crossed in
1dfdfdc602553d Daniel Lezcano 2023-12-11  134   * order to handle correctly nested trip point mitigation episodes.
1dfdfdc602553d Daniel Lezcano 2023-12-11  135   *
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24  136   * We keep the history of the trip point crossed in an array and as we
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24  137   * can go back and forth inside this history, eg. trip 0,1,2,1,2,1,0,
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24  138   * we keep track of the current position in the history array.
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24  139   *
1dfdfdc602553d Daniel Lezcano 2023-12-11  140   * @tz_events: a list of thermal mitigation episodes
1dfdfdc602553d Daniel Lezcano 2023-12-11  141   * @trips_crossed: an array of trip point crossed by id
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24  142   * @trip_index: the current trip point index in the trip points history
1dfdfdc602553d Daniel Lezcano 2023-12-11  143   */
1dfdfdc602553d Daniel Lezcano 2023-12-11  144  struct tz_debugfs {
1dfdfdc602553d Daniel Lezcano 2023-12-11  145  	struct list_head tz_events;
1dfdfdc602553d Daniel Lezcano 2023-12-11  146  	int *trips_crossed;
1dfdfdc602553d Daniel Lezcano 2023-12-11  147  	int trip_index;
1dfdfdc602553d Daniel Lezcano 2023-12-11  148  };
1dfdfdc602553d Daniel Lezcano 2023-12-11  149  
853ad2eba4d85b Daniel Lezcano 2022-04-25  150  /**
853ad2eba4d85b Daniel Lezcano 2022-04-25  151   * struct thermal_debugfs - High level structure for a thermal object in debugfs
853ad2eba4d85b Daniel Lezcano 2022-04-25  152   *
853ad2eba4d85b Daniel Lezcano 2022-04-25  153   * The thermal_debugfs structure is the common structure used by the
1dfdfdc602553d Daniel Lezcano 2023-12-11  154   * cooling device and the thermal zone to store the statistics.
853ad2eba4d85b Daniel Lezcano 2022-04-25  155   *
853ad2eba4d85b Daniel Lezcano 2022-04-25  156   * @d_top: top directory of the thermal object directory
853ad2eba4d85b Daniel Lezcano 2022-04-25  157   * @lock: per object lock to protect the internals
853ad2eba4d85b Daniel Lezcano 2022-04-25  158   *
853ad2eba4d85b Daniel Lezcano 2022-04-25  159   * @cdev: a cooling device debug structure
1dfdfdc602553d Daniel Lezcano 2023-12-11  160   * @tz: a thermal zone debug structure
853ad2eba4d85b Daniel Lezcano 2022-04-25  161   */
853ad2eba4d85b Daniel Lezcano 2022-04-25  162  struct thermal_debugfs {
853ad2eba4d85b Daniel Lezcano 2022-04-25  163  	struct dentry *d_top;
853ad2eba4d85b Daniel Lezcano 2022-04-25  164  	struct mutex lock;
853ad2eba4d85b Daniel Lezcano 2022-04-25  165  	union {
e545b113036794 Daniel Lezcano 2023-12-23  166  		struct cdev_debugfs cdev_dbg;
9f3c7e51a6ae45 Daniel Lezcano 2023-12-24  167  		struct tz_debugfs tz_dbg;
853ad2eba4d85b Daniel Lezcano 2022-04-25  168  	};
853ad2eba4d85b Daniel Lezcano 2022-04-25 @169  };
853ad2eba4d85b Daniel Lezcano 2022-04-25  170  

:::::: The code at line 169 was first introduced by commit
:::::: 853ad2eba4d85b6f31434d76ec33194d85a4eddd thermal/debugfs: Add thermal cooling device debugfs information

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
