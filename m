Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AA5384
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694570193; x=1726106193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mgt4hJ4Gz1q7qQnoboHCcBn796CD6aUGzc4z1QJo8+c=;
  b=ca9zPjEyCb6jTApP7S1mfC5OVa+34Z++Mn35lbjMKZ73OMoJT0rKpTrG
   JirVNHm6U+k1HbAqbmWJeIJdqvcNh4edMH5ioXBRB2eM83nASippP/zmK
   VDJm2VyJvX4Cqo3SlPaW1v2fKkgGvrJgtJuCUUMQkTOKdXtdazno7wrTR
   zdOqHzrZHiy2NrERdwBpxYcWJKsx6FLh1NHNt4QqKe/bZdDkFdnA5z4N/
   X4LbJe4/MuJ6DKofBKgNkS878FcjJFDFGKSk4xB5/HbWjzK1xYIVH+nR6
   hJdjcX3Nvxjw67SLXFnUDRMkmAel1UjokTRZBtsWTen6VCdGwddI3PToe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377448743"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="377448743"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 18:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="779024219"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="779024219"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 18:56:30 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgF7E-0000b7-1n;
	Wed, 13 Sep 2023 01:56:28 +0000
Date: Wed, 13 Sep 2023 09:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 449/25020] htmldocs:
 ./include/media/v4l2-async.h:240: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202309130952.4ddN2UdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robby,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 660780bb2c44fe378f3e59bc0636c7978aec78cb [449/25020] LF-4575-1 Revert "media: v4l2-async: Remove V4L2_ASYNC_MATCH_DEVNAME"
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309130952.4ddN2UdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130952.4ddN2UdF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/media/v4l2-async.h:240: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

vim +240 ./include/media/v4l2-async.h

   145	
   146	/**
   147	 * __v4l2_async_notifier_add_subdev - Add an async subdev to the
   148	 *				notifier's master asd list.
   149	 *
   150	 * @notifier: pointer to &struct v4l2_async_notifier
   151	 * @asd: pointer to &struct v4l2_async_subdev
   152	 *
   153	 * \warning: Drivers should avoid using this function and instead use one of:
   154	 * v4l2_async_notifier_add_fwnode_subdev(),
   155	 * v4l2_async_notifier_add_fwnode_remote_subdev() or
   156	 * v4l2_async_notifier_add_i2c_subdev().
   157	 *
   158	 * Call this function before registering a notifier to link the provided @asd to
   159	 * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
   160	 * it will be freed by the framework when the notifier is destroyed.
   161	 */
   162	int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
   163					   struct v4l2_async_subdev *asd);
   164	
   165	struct v4l2_async_subdev *
   166	__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
   167						struct fwnode_handle *fwnode,
   168						unsigned int asd_struct_size);
   169	/**
   170	 * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async
   171	 *				subdev to the notifier's master asd_list.
   172	 *
   173	 * @notifier: pointer to &struct v4l2_async_notifier
   174	 * @fwnode: fwnode handle of the sub-device to be matched, pointer to
   175	 *	    &struct fwnode_handle
   176	 * @type: Type of the driver's async sub-device struct. The &struct
   177	 *	  v4l2_async_subdev shall be the first member of the driver's async
   178	 *	  sub-device struct, i.e. both begin at the same memory address.
   179	 *
   180	 * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
   181	 * notifiers @asd_list. The function also gets a reference of the fwnode which
   182	 * is released later at notifier cleanup time.
   183	 */
   184	#define v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, type)	\
   185		((type *)__v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, \
   186								   sizeof(type)))
   187	
   188	struct v4l2_async_subdev *
   189	__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
   190						       struct fwnode_handle *endpoint,
   191						       unsigned int asd_struct_size);
   192	/**
   193	 * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
   194	 *						  remote async subdev to the
   195	 *						  notifier's master asd_list.
   196	 *
   197	 * @notifier: pointer to &struct v4l2_async_notifier
   198	 * @ep: local endpoint pointing to the remote sub-device to be matched,
   199	 *	pointer to &struct fwnode_handle
   200	 * @type: Type of the driver's async sub-device struct. The &struct
   201	 *	  v4l2_async_subdev shall be the first member of the driver's async
   202	 *	  sub-device struct, i.e. both begin at the same memory address.
   203	 *
   204	 * Gets the remote endpoint of a given local endpoint, set it up for fwnode
   205	 * matching and adds the async sub-device to the notifier's @asd_list. The
   206	 * function also gets a reference of the fwnode which is released later at
   207	 * notifier cleanup time.
   208	 *
   209	 * This is just like v4l2_async_notifier_add_fwnode_subdev(), but with the
   210	 * exception that the fwnode refers to a local endpoint, not the remote one.
   211	 */
   212	#define v4l2_async_notifier_add_fwnode_remote_subdev(notifier, ep, type) \
   213		((type *)							\
   214		 __v4l2_async_notifier_add_fwnode_remote_subdev(notifier, ep,	\
   215								sizeof(type)))
   216	
   217	struct v4l2_async_subdev *
   218	__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
   219					     int adapter_id, unsigned short address,
   220					     unsigned int asd_struct_size);
   221	/**
   222	 * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
   223	 *				subdev to the notifier's master asd_list.
   224	 *
   225	 * @notifier: pointer to &struct v4l2_async_notifier
   226	 * @adapter: I2C adapter ID to be matched
   227	 * @address: I2C address of sub-device to be matched
   228	 * @type: Type of the driver's async sub-device struct. The &struct
   229	 *	  v4l2_async_subdev shall be the first member of the driver's async
   230	 *	  sub-device struct, i.e. both begin at the same memory address.
   231	 *
   232	 * Same as v4l2_async_notifier_add_fwnode_subdev() but for I2C matched
   233	 * sub-devices.
   234	 */
   235	#define v4l2_async_notifier_add_i2c_subdev(notifier, adapter, address, type) \
   236		((type *)__v4l2_async_notifier_add_i2c_subdev(notifier, adapter, \
   237							      address, sizeof(type)))
   238	
   239	/**
 > 240	 * * v4l2_async_notifier_add_devname_subdev - Allocate and add a device-name
   241	 *				async subdev to the notifier's master asd_list.
   242	 *
   243	 * @notifier: pointer to &struct v4l2_async_notifier
   244	 * @device_name: device name string to be matched
   245	 * @asd_struct_size: size of the driver's async sub-device struct, including
   246	 *		     sizeof(struct v4l2_async_subdev). The &struct
   247	 *		     v4l2_async_subdev shall be the first member of
   248	 *		     the driver's async sub-device struct, i.e. both
   249	 *		     begin at the same memory address.
   250	 *
   251	 * Same as above but for device-name matched sub-devices.
   252	 */
   253	struct v4l2_async_subdev *
   254	v4l2_async_notifier_add_devname_subdev(struct v4l2_async_notifier *notifier,
   255					       const char *device_name,
   256					       unsigned int asd_struct_size);
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
