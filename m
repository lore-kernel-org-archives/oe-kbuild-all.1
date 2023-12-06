Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05E10A37
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7riAted"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701846044; x=1733382044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62zt6JItOjXrTMCXrh0JiyfLQjGDq31IWHjF8RZXofA=;
  b=L7riAtedAmtosjiLJcS96uR9B1k3rU8Slw3luSm0jO1ql7IPlSpgZO8R
   Z5df/b6a92uN3f0Yo/DV6rOodYqLAzmzZQBRdG8q5/qfw8h+HpNM0gTRE
   T0BetX482Fi042oXU0jnt8Zvm3zvyzs8emKc8Hk5HhEWSgbJEgoF74m4K
   akinN1YK/CP6btaMMHqjAVXOx7tupZPvU8aVXVD/M1uZ9KojvOuM0H6nB
   U6Mc0WtxULSoBNhoxCJNCmqReodnTmoIPKr3oyW8oy73hzDLzTSvJVVTa
   wXod3QmTH/XAvSr6DmuFmb+8P+/B8lRSvsQcGvLvrt7ajh1CinfWUJi+A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458339930"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="458339930"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 23:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889242376"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="889242376"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 23:00:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAltg-000AR6-0s;
	Wed, 06 Dec 2023 07:00:40 +0000
Date: Wed, 6 Dec 2023 15:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 807/1891] htmldocs:
 ./include/media/v4l2-async.h:177: warning: Function parameter or member
 'asd' not described in '__v4l2_async_nf_add_subdev'
Message-ID: <202312061429.rwQqd9OY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b92a48381564e28f2ab3a5b9379814f2330bc9d1
commit: a8047e30907e009520c42f61073a10f3a8f6bf35 [807/1891] Revert "media: v4l: async: Drop v4l2_async_nf_parse_fwnode_endpoints()"
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061429.rwQqd9OY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061429.rwQqd9OY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/media/v4l2-async.h:177: warning: Function parameter or member 'asd' not described in '__v4l2_async_nf_add_subdev'
>> ./include/media/v4l2-async.h:177: warning: expecting prototype for v4l2_async_subdev_nf_init(). Prototype was for __v4l2_async_nf_add_subdev() instead
>> ./include/media/v4l2-fwnode.h:412: warning: Function parameter or member 'asc' not described in 'parse_endpoint_func'

vim +177 ./include/media/v4l2-async.h

   146	
   147	/**
   148	 * v4l2_async_nf_init - Initialize a notifier.
   149	 *
   150	 * @notifier: pointer to &struct v4l2_async_notifier
   151	 * @v4l2_dev: pointer to &struct v4l2_device
   152	 *
   153	 * This function initializes the notifier @asc_entry. It must be called
   154	 * before adding a subdevice to a notifier, using one of:
   155	 * v4l2_async_nf_add_fwnode_remote(),
   156	 * v4l2_async_nf_add_fwnode() or
   157	 * v4l2_async_nf_add_i2c().
   158	 */
   159	void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
   160				struct v4l2_device *v4l2_dev);
   161	
   162	/**
   163	 * v4l2_async_subdev_nf_init - Initialize a sub-device notifier.
   164	 *
   165	 * @notifier: pointer to &struct v4l2_async_notifier
   166	 * @sd: pointer to &struct v4l2_subdev
   167	 *
   168	 * This function initializes the notifier @asc_list. It must be called
   169	 * before adding a subdevice to a notifier, using one of:
   170	 * v4l2_async_nf_add_fwnode_remote(),
   171	 * v4l2_async_nf_add_fwnode(),
   172	 * v4l2_async_nf_add_i2c(),
   173	 * __v4l2_async_nf_add_subdev() or
   174	 * v4l2_async_nf_parse_fwnode_endpoints().
   175	 */
   176	int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 > 177	                              struct v4l2_async_connection *asd);
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
