Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231162A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 01:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+H1mOwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701824469; x=1733360469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2iaWxRX3c3j5QPIOlLMFQXQ6e4ajD/bAV9pR4qPJ7Ps=;
  b=g+H1mOwU0O5Xh6lHW08vLhqfytVSq/dNpl7vxofH3tyaZsVjx+KeGSiu
   t6qbQHFiJQGApGjDS1kyw9kJ2/n7NPnacuXvDte1oWJkWsbgnVbYha+mW
   MSf7vKUzqKreE5Bp6hgrxvGtFeiUM5sIZXKBzR/6lDqriSVg3O5+Q2T7D
   gWtFSjxDoSa5NmViZZt3CuLkmp+i/5l53NNudYNRUAGuoCTcZOBt5o+ZO
   lLzMZb87wrlWYDA0APB2Yitl6YbN6KZ0+m0QmqgPTyvxdnMtzuh8Gog6F
   ftMuSbIAFtuQtiEKqXYBiSxoVbrFE4kT679sHQC5vuMtGAqv0jmk0m91B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7281807"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="7281807"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 17:01:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800166533"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="800166533"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 17:01:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAgHd-0009zy-32;
	Wed, 06 Dec 2023 01:01:03 +0000
Date: Wed, 6 Dec 2023 09:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/7] media: v4l2-subdev: Store frame interval in
 subdev state
Message-ID: <202312060829.GmtNe4FB-lkp@intel.com>
References: <20231205140810.22368-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205140810.22368-3-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build errors:

[auto build test ERROR on bec3db03911bd85da29c1c8ee556162153002c9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-v4l2-subdev-Add-which-field-to-struct-v4l2_subdev_frame_interval/20231205-220946
base:   bec3db03911bd85da29c1c8ee556162153002c9a
patch link:    https://lore.kernel.org/r/20231205140810.22368-3-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v3 3/7] media: v4l2-subdev: Store frame interval in subdev state
config: x86_64-randconfig-002-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060829.GmtNe4FB-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060829.GmtNe4FB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060829.GmtNe4FB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/media/v4l2-device.h:13:0,
                    from drivers/media/v4l2-core/v4l2-subdev.c:24:
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_get_frame_interval':
   include/media/v4l2-subdev.h:1577:9: error: implicit declaration of function '__v4l2_subdev_state_get_interval___VA_OPT__'; did you mean '__v4l2_subdev_state_get_interval_'? [-Werror=implicit-function-declaration]
            __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
            ^
   include/media/v4l2-subdev.h:1577:9: note: in definition of macro 'v4l2_subdev_state_get_interval'
            __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1577:57: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
            __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
                                                            ^
   drivers/media/v4l2-core/v4l2-subdev.c:1762:13: note: in expansion of macro 'v4l2_subdev_state_get_interval'
     interval = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1577:57: note: each undeclared identifier is reported only once for each function it appears in
            __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
                                                            ^
   drivers/media/v4l2-core/v4l2-subdev.c:1762:13: note: in expansion of macro 'v4l2_subdev_state_get_interval'
     interval = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1578:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/media/v4l2-core/v4l2-subdev.c:1762:13: note: in expansion of macro 'v4l2_subdev_state_get_interval'
     interval = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1577 include/media/v4l2-subdev.h

  1483	
  1484	/**
  1485	 * v4l2_subdev_get_fmt() - Fill format based on state
  1486	 * @sd: subdevice
  1487	 * @state: subdevice state
  1488	 * @format: pointer to &struct v4l2_subdev_format
  1489	 *
  1490	 * Fill @format->format field based on the information in the @format struct.
  1491	 *
  1492	 * This function can be used by the subdev drivers which support active state to
  1493	 * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
  1494	 * do anything special in their get_fmt op.
  1495	 *
  1496	 * Returns 0 on success, error value otherwise.
  1497	 */
  1498	int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
  1499				struct v4l2_subdev_format *format);
  1500	
  1501	/**
  1502	 * v4l2_subdev_get_frame_interval() - Fill frame interval based on state
  1503	 * @sd: subdevice
  1504	 * @state: subdevice state
  1505	 * @fi: pointer to &struct v4l2_subdev_frame_interval
  1506	 *
  1507	 * Fill @fi->interval field based on the information in the @fi struct.
  1508	 *
  1509	 * This function can be used by the subdev drivers which support active state to
  1510	 * implement v4l2_subdev_pad_ops.get_frame_interval if the subdev driver does
  1511	 * not need to do anything special in their get_frame_interval op.
  1512	 *
  1513	 * Returns 0 on success, error value otherwise.
  1514	 */
  1515	int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
  1516					   struct v4l2_subdev_state *state,
  1517					   struct v4l2_subdev_frame_interval *fi);
  1518	
  1519	/**
  1520	 * v4l2_subdev_set_routing() - Set given routing to subdev state
  1521	 * @sd: The subdevice
  1522	 * @state: The subdevice state
  1523	 * @routing: Routing that will be copied to subdev state
  1524	 *
  1525	 * This will release old routing table (if any) from the state, allocate
  1526	 * enough space for the given routing, and copy the routing.
  1527	 *
  1528	 * This can be used from the subdev driver's set_routing op, after validating
  1529	 * the routing.
  1530	 */
  1531	int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
  1532				    struct v4l2_subdev_state *state,
  1533				    const struct v4l2_subdev_krouting *routing);
  1534	
  1535	struct v4l2_subdev_route *
  1536	__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
  1537					struct v4l2_subdev_route *route);
  1538	
  1539	/**
  1540	 * for_each_active_route - iterate on all active routes of a routing table
  1541	 * @routing: The routing table
  1542	 * @route: The route iterator
  1543	 */
  1544	#define for_each_active_route(routing, route) \
  1545		for ((route) = NULL;                  \
  1546		     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
  1547	
  1548	/**
  1549	 * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
  1550	 *					state
  1551	 * @sd: The subdevice
  1552	 * @state: The subdevice state
  1553	 * @routing: Routing that will be copied to subdev state
  1554	 * @fmt: Format used to initialize all the streams
  1555	 *
  1556	 * This is the same as v4l2_subdev_set_routing, but additionally initializes
  1557	 * all the streams using the given format.
  1558	 */
  1559	int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  1560					     struct v4l2_subdev_state *state,
  1561					     const struct v4l2_subdev_krouting *routing,
  1562					     const struct v4l2_mbus_framefmt *fmt);
  1563	
  1564	/**
  1565	 * v4l2_subdev_state_get_interval() - Get pointer to a stream frame interval
  1566	 * @state: subdevice state
  1567	 * @pad: pad id
  1568	 * @...: stream id (optional argument)
  1569	 *
  1570	 * This returns a pointer to the frame interval for the given pad + stream in
  1571	 * the subdev state.
  1572	 *
  1573	 * For stream-unaware drivers the frame interval for the corresponding pad is
  1574	 * returned. If the pad does not exist, NULL is returned.
  1575	 */
  1576	#define v4l2_subdev_state_get_interval(state, pad, ...)         \
> 1577	        __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
> 1578	        (state, pad __VA_OPT__(,) __VA_ARGS__)
  1579	#define __v4l2_subdev_state_get_interval_(state, pad)	\
  1580	        __v4l2_subdev_state_get_interval(state, pad, 0)
  1581	#define __v4l2_subdev_state_get_interval_stream(state, pad, stream)	\
  1582	        __v4l2_subdev_state_get_interval(state, pad, stream)
  1583	struct v4l2_fract *
  1584	__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
  1585					 unsigned int pad, u32 stream);
  1586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
