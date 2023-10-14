Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571087E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 05:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6r3flwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697260919; x=1728796919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XuCkWUrF7CEXtwLEePYx9D2wSfgUg5YhQ99tG6NrQU=;
  b=k6r3flwpUZDkvw+7qIcoCUHMO2Y+UbNVAY+AUF5YPuYnfO0EKSg+ROPV
   P/sZFkPlbfW/dFVtFSszdnjiGUOKKqMy8UzuZfjU/RzRs0J2gKVN9XCJk
   fDrWLaftl1nkR4UKoAYxJLXdS3HL7pw0/O4bm6tbgXlzMTHBHnlpU/l5l
   s4aSZ3xMOA63HYfzUhga8FxZFEOJYpLSyYyJ1dc2zmA9VTWjJ5PwOTYnd
   COafY2hzLmNxEh+FPkLjwqOBKTV/jMQz9eLR70lc3siAYyz6j/GjbfeBi
   huP4tIE35eRuyMAcGrFxBv+D0K9RYKHchP/cBwM8NgEBDN4IyL1N5dyA4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365570065"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365570065"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 22:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="878748250"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="878748250"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Oct 2023 22:21:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrX62-0005jn-2P;
	Sat, 14 Oct 2023 05:21:54 +0000
Date: Sat, 14 Oct 2023 13:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/4] media: v4l: subdev: Set sub-device active state
 earlier
Message-ID: <202310141312.treP0hPp-lkp@intel.com>
References: <20231009220906.221303-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009220906.221303-2-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-stage/master]
[also build test WARNING on linus/master v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-subdev-Set-sub-device-active-state-earlier/20231010-061025
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20231009220906.221303-2-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 1/4] media: v4l: subdev: Set sub-device active state earlier
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141312.treP0hPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141312.treP0hPp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/media/v4l2-subdev.h:1350: warning: Function parameter or member 'active' not described in '__v4l2_subdev_state_alloc'

vim +1350 ./include/media/v4l2-subdev.h

  1317	
  1318	/**
  1319	 * v4l2_subdev_has_pad_interdep - MC has_pad_interdep implementation for subdevs
  1320	 *
  1321	 * @entity: pointer to &struct media_entity
  1322	 * @pad0: pad number for the first pad
  1323	 * @pad1: pad number for the second pad
  1324	 *
  1325	 * This function is an implementation of the
  1326	 * media_entity_operations.has_pad_interdep operation for subdevs that
  1327	 * implement the multiplexed streams API (as indicated by the
  1328	 * V4L2_SUBDEV_FL_STREAMS subdev flag).
  1329	 *
  1330	 * It considers two pads interdependent if there is an active route between pad0
  1331	 * and pad1.
  1332	 */
  1333	bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
  1334					  unsigned int pad0, unsigned int pad1);
  1335	
  1336	/**
  1337	 * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  1338	 *
  1339	 * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
  1340	 * @lock_name: name of the state lock
  1341	 * @key: lock_class_key for the lock
  1342	 *
  1343	 * Must call __v4l2_subdev_state_free() when state is no longer needed.
  1344	 *
  1345	 * Not to be called directly by the drivers.
  1346	 */
  1347	struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
  1348							    const char *lock_name,
  1349							    struct lock_class_key *key,
> 1350							    bool active);
  1351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
