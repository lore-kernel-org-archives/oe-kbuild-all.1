Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645253A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwZ4QF4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698496825; x=1730032825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vV4ElXatw9lcE3/4ApTKg3mCTw7hdA6TBFDPOpQe76I=;
  b=nwZ4QF4patb+7XU67nwCQkGv9RIIqXi2u1xTwht6rreV+ZHU70oY7pA4
   a1TwLZmSskdIfNgMjNInNxRjX+HlmhyOFSoMxcgsPiALOVR0Y9RjA+PXw
   DCPqJg/TUvHuCFdU0ZECrEXg6KoJ7URwozOLLyDlHcdAPycO4e/zT3sik
   JZ/TFEioCxVgg9YaY91oXIITAFRomt8b9eXWe56u6A3e/QaeSLGu8fqrJ
   8rmZpX4m8/SqjSWKRAdSk1RLpQZ4XqCPmpT1gyZjBj/3CoTsEIy7bHN6T
   Zj2eSi4jyJPJ3jg/GO7BDPzQuyD1Q5P3v4svL8YyP8o/AMubypzxGqEfo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="390758420"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="390758420"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 05:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="876632826"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="876632826"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2023 05:40:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwic0-000Bkh-1i;
	Sat, 28 Oct 2023 12:40:20 +0000
Date: Sat, 28 Oct 2023 20:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:mtk/v6.6/dev/intervals 37/38]
 include/media/v4l2-subdev.h:1576:9: error: implicit declaration of function
 '__v4l2_subdev_state_get_interval___VA_OPT__'; did you mean
 '__v4l2_subdev_state_get_interval_'?
Message-ID: <202310282057.PPRTx1h5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/dev/intervals
head:   358c0c0ab9826452f42f79daa9ffbf1018246ad9
commit: ad832384c41f409f8647bff877d4fa600fe42948 [37/38] media: v4l2-subdev: Store frame interval in subdev state
config: x86_64-buildonly-randconfig-003-20231028 (https://download.01.org/0day-ci/archive/20231028/202310282057.PPRTx1h5-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310282057.PPRTx1h5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310282057.PPRTx1h5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/media/v4l2-device.h:13:0,
                    from drivers/media/v4l2-core/v4l2-subdev.c:24:
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_get_frame_interval':
>> include/media/v4l2-subdev.h:1576:9: error: implicit declaration of function '__v4l2_subdev_state_get_interval___VA_OPT__'; did you mean '__v4l2_subdev_state_get_interval_'? [-Werror=implicit-function-declaration]
            __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
            ^
   include/media/v4l2-subdev.h:1576:9: note: in definition of macro 'v4l2_subdev_state_get_interval'
            __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1576:57: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
            __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
                                                            ^
   drivers/media/v4l2-core/v4l2-subdev.c:1624:13: note: in expansion of macro 'v4l2_subdev_state_get_interval'
     interval = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1576:57: note: each undeclared identifier is reported only once for each function it appears in
            __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
                                                            ^
   drivers/media/v4l2-core/v4l2-subdev.c:1624:13: note: in expansion of macro 'v4l2_subdev_state_get_interval'
     interval = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1577:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/media/v4l2-core/v4l2-subdev.c:1624:13: note: in expansion of macro 'v4l2_subdev_state_get_interval'
     interval = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1576 include/media/v4l2-subdev.h

  1404	
  1405	/**
  1406	 * v4l2_subdev_get_fmt() - Fill format based on state
  1407	 * @sd: subdevice
  1408	 * @state: subdevice state
  1409	 * @format: pointer to &struct v4l2_subdev_format
  1410	 *
  1411	 * Fill @format->format field based on the information in the @format struct.
  1412	 *
  1413	 * This function can be used by the subdev drivers which support active state to
  1414	 * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
  1415	 * do anything special in their get_fmt op.
  1416	 *
  1417	 * Returns 0 on success, error value otherwise.
  1418	 */
  1419	int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
  1420				struct v4l2_subdev_format *format);
  1421	
  1422	/**
  1423	 * v4l2_subdev_get_frame_interval() - Fill frame interval based on state
  1424	 * @sd: subdevice
  1425	 * @state: subdevice state
  1426	 * @fi: pointer to &struct v4l2_subdev_frame_interval
  1427	 *
  1428	 * Fill @fi->interval field based on the information in the @fi struct.
  1429	 *
  1430	 * This function can be used by the subdev drivers which support active state to
  1431	 * implement v4l2_subdev_pad_ops.get_frame_interval if the subdev driver does
  1432	 * not need to do anything special in their get_frame_interval op.
  1433	 *
  1434	 * Returns 0 on success, error value otherwise.
  1435	 */
  1436	int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
  1437					   struct v4l2_subdev_state *state,
  1438					   struct v4l2_subdev_frame_interval *fi);
  1439	
  1440	/**
  1441	 * v4l2_subdev_set_routing() - Set given routing to subdev state
  1442	 * @sd: The subdevice
  1443	 * @state: The subdevice state
  1444	 * @routing: Routing that will be copied to subdev state
  1445	 *
  1446	 * This will release old routing table (if any) from the state, allocate
  1447	 * enough space for the given routing, and copy the routing.
  1448	 *
  1449	 * This can be used from the subdev driver's set_routing op, after validating
  1450	 * the routing.
  1451	 */
  1452	int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
  1453				    struct v4l2_subdev_state *state,
  1454				    const struct v4l2_subdev_krouting *routing);
  1455	
  1456	struct v4l2_subdev_route *
  1457	__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
  1458					struct v4l2_subdev_route *route);
  1459	
  1460	/**
  1461	 * for_each_active_route - iterate on all active routes of a routing table
  1462	 * @routing: The routing table
  1463	 * @route: The route iterator
  1464	 */
  1465	#define for_each_active_route(routing, route) \
  1466		for ((route) = NULL;                  \
  1467		     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
  1468	
  1469	/**
  1470	 * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
  1471	 *					state
  1472	 * @sd: The subdevice
  1473	 * @state: The subdevice state
  1474	 * @routing: Routing that will be copied to subdev state
  1475	 * @fmt: Format used to initialize all the streams
  1476	 *
  1477	 * This is the same as v4l2_subdev_set_routing, but additionally initializes
  1478	 * all the streams using the given format.
  1479	 */
  1480	int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  1481					     struct v4l2_subdev_state *state,
  1482					     const struct v4l2_subdev_krouting *routing,
  1483					     const struct v4l2_mbus_framefmt *fmt);
  1484	
  1485	/**
  1486	 * v4l2_subdev_state_get_format() - Get pointer to a stream format
  1487	 * @state: subdevice state
  1488	 * @pad: pad id
  1489	 * @...: stream id (optional argument)
  1490	 *
  1491	 * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
  1492	 * stream in the subdev state.
  1493	 *
  1494	 * For stream-unaware drivers the format for the corresponding pad is returned.
  1495	 * If the pad does not exist, NULL is returned.
  1496	 */
  1497	/*
  1498	 * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
  1499	 * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
  1500	 * macro below is to come up with the name of the function or macro to call,
  1501	 * using the last two arguments (_stream and _pad). The selected function or
  1502	 * macro is then called using the arguments specified by the caller. A similar
  1503	 * arrangement is used for v4l2_subdev_state_crop() and
  1504	 * v4l2_subdev_state_compose() below.
  1505	 */
  1506	#define v4l2_subdev_state_get_format(...)				\
  1507		__v4l2_subdev_state_get_format(__VA_ARGS__,			\
  1508					       _stream, _pad)(__VA_ARGS__)
  1509	#define __v4l2_subdev_state_get_format(_1, _2, _3, ARG, ...)	\
  1510		__v4l2_subdev_state_get_format ## ARG
  1511	#define __v4l2_subdev_state_get_format_pad(state, pad)		\
  1512		__v4l2_subdev_state_get_format_stream(state, pad, 0)
  1513	struct v4l2_mbus_framefmt *
  1514	__v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
  1515					      unsigned int pad, u32 stream);
  1516	
  1517	/**
  1518	 * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
  1519	 * @state: subdevice state
  1520	 * @pad: pad id
  1521	 * @...: stream id (optional argument)
  1522	 *
  1523	 * This returns a pointer to crop rectangle for the given pad + stream in the
  1524	 * subdev state.
  1525	 *
  1526	 * For stream-unaware drivers the crop rectangle for the corresponding pad is
  1527	 * returned. If the pad does not exist, NULL is returned.
  1528	 */
  1529	#define v4l2_subdev_state_get_crop(...)					\
  1530		__v4l2_subdev_state_get_crop(__VA_ARGS__,			\
  1531					     _stream, _pad)(__VA_ARGS__)
  1532	#define __v4l2_subdev_state_get_crop(_1, _2, _3, ARG, ...)	\
  1533		__v4l2_subdev_state_get_crop ## ARG
  1534	#define __v4l2_subdev_state_get_crop_pad(state, pad)		\
  1535		__v4l2_subdev_state_get_crop_stream(state, pad, 0)
  1536	struct v4l2_rect *
  1537	__v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
  1538					    unsigned int pad, u32 stream);
  1539	
  1540	/**
  1541	 * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
  1542	 * @state: subdevice state
  1543	 * @pad: pad id
  1544	 * @...: stream id (optional argument)
  1545	 *
  1546	 * This returns a pointer to compose rectangle for the given pad + stream in the
  1547	 * subdev state.
  1548	 *
  1549	 * For stream-unaware drivers the compose rectangle for the corresponding pad is
  1550	 * returned. If the pad does not exist, NULL is returned.
  1551	 */
  1552	#define v4l2_subdev_state_get_compose(...)				\
  1553		__v4l2_subdev_state_get_compose(__VA_ARGS__,		\
  1554						_stream, _pad)(__VA_ARGS__)
  1555	#define __v4l2_subdev_state_get_compose(_1, _2, _3, ARG, ...)	\
  1556		__v4l2_subdev_state_get_compose ## ARG
  1557	#define __v4l2_subdev_state_get_compose_pad(state, pad)		\
  1558		__v4l2_subdev_state_get_compose_stream(state, pad, 0)
  1559	struct v4l2_rect *
  1560	__v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
  1561					       unsigned int pad, u32 stream);
  1562	
  1563	/**
  1564	 * v4l2_subdev_state_get_interval() - Get pointer to a stream frame interval
  1565	 * @state: subdevice state
  1566	 * @pad: pad id
  1567	 * @...: stream id (optional argument)
  1568	 *
  1569	 * This returns a pointer to the frame interval for the given pad + stream in
  1570	 * the subdev state.
  1571	 *
  1572	 * For stream-unaware drivers the frame interval for the corresponding pad is
  1573	 * returned. If the pad does not exist, NULL is returned.
  1574	 */
  1575	#define v4l2_subdev_state_get_interval(state, pad, ...)         \
> 1576	        __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
  1577	        (state, pad __VA_OPT__(,) __VA_ARGS__)
  1578	#define __v4l2_subdev_state_get_interval_(state, pad)	\
  1579	        __v4l2_subdev_state_get_interval(state, pad, 0)
  1580	#define __v4l2_subdev_state_get_interval_stream(state, pad, stream)	\
  1581	        __v4l2_subdev_state_get_interval(state, pad, stream)
  1582	struct v4l2_fract *
  1583	__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
  1584					 unsigned int pad, u32 stream);
  1585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
