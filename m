Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC53188CB2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723489314; cv=none; b=F/xJrV3cEnQsVFkS/3ZGAIURJcUsOrkcF4FQpFMaJG7wr9D9pIQYlFYRvBqppLdSTPGRY7LY8P0/pfInPfJ0s1RUaCQTsMWm65+N1lbnD48DV4Lls75dcMRzoGeIgAKwD9/iaRIkR9YP8WgL/HZH1PUKwJmHaj7asIPnI0iisIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723489314; c=relaxed/simple;
	bh=QgSpf9ZISGbipfjVZE0ZDjHlvVkhE2Ly2L4UbIASmjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chvGSa0orVP7HAIUCJMMqI58+DngpGv+a0OEMGBfS1c01d3lTFqA1+hbIYP8MCYL1QHsSvOVMUadSXAIF2hn3gl6bWHFeZtWPePyDhesU55YBNvM9mS+OLy9K6xFEs/wTpU+dfTP6wBxE5VQeJJugUBNYQJGzZJEhdxaMELxjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+EoUjF3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+EoUjF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723489313; x=1755025313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgSpf9ZISGbipfjVZE0ZDjHlvVkhE2Ly2L4UbIASmjM=;
  b=K+EoUjF3T2q91KRc7E1K9e7hu0qNqeIxgojJCOif8kpRUvuQe2y7NG8P
   LM9CepxOKdk3wr7VsApBO6RPo2RTElYC9dJGgIIW7Et/nnMK0AJzChXOg
   TkmZRJCoAGfZdIGIgmIpNSbfTh+HHdTfZ8iCiyDKuHrrLGFY4GvVWTOWA
   lSWjt+9K3g2c5pHcC5R+nA6k2ssYf3g8vXjkt8yMPZ1hHKTt0fAu4S5kO
   X5w/veLS+LTar8agUTeF7vbmnt0IV37TS/gEmMWSuFemKeQ2m7dMnY6Wz
   2BWgJhPdnSCosbJjJr169XkrhtFukQZlQJfaSuE8u8lRraZfMTx7t7I6d
   A==;
X-CSE-ConnectionGUID: c0wGHoCpQHOBhWf1x4fSJg==
X-CSE-MsgGUID: 6tetkRmbTZWsielPomcZkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39133853"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="39133853"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 12:01:51 -0700
X-CSE-ConnectionGUID: WUffYU+6RN6EGjpniy5AdQ==
X-CSE-MsgGUID: h1ijjm7SS7eo6UwGB4Ygig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58019185"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2024 12:01:49 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdaId-000C5S-19;
	Mon, 12 Aug 2024 19:01:47 +0000
Date: Tue, 13 Aug 2024 03:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Tomas Winkler <tomas.winkler@intel.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Shyam Saini <shyamsaini@linux.microsoft.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [jens-wiklander-tee:testing/tuxbuild 1/4]
 drivers/misc/rpmb-core.c:84: warning: Function parameter or struct member
 'start' not described in 'rpmb_dev_find_device'
Message-ID: <202408130325.kdKEZguN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   1eeef6f8f4da434303136dbb1f5aee3e7fd20703
commit: 3b2f9b7e44dcacad0aa625bda7be163eb59944f9 [1/4] rpmb: add Replay Protected Memory Block (RPMB) subsystem
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240813/202408130325.kdKEZguN-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130325.kdKEZguN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130325.kdKEZguN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/rpmb-core.c:84: warning: Function parameter or struct member 'start' not described in 'rpmb_dev_find_device'
>> drivers/misc/rpmb-core.c:147: warning: Function parameter or struct member 'descr' not described in 'rpmb_dev_register'
>> drivers/misc/rpmb-core.c:147: warning: Excess function parameter 'ops' description in 'rpmb_dev_register'


vim +84 drivers/misc/rpmb-core.c

    63	
    64	/**
    65	 * rpmb_dev_find_device() - return first matching rpmb device
    66	 * @data: data for the match function
    67	 * @match: the matching function
    68	 *
    69	 * Iterate over registered RPMB devices, and call @match() for each passing
    70	 * it the RPMB device and @data.
    71	 *
    72	 * The return value of @match() is checked for each call. If it returns
    73	 * anything other 0, break and return the found RPMB device.
    74	 *
    75	 * It's the callers responsibility to call rpmb_dev_put() on the returned
    76	 * device, when it's done with it.
    77	 *
    78	 * Returns: a matching rpmb device or NULL on failure
    79	 */
    80	struct rpmb_dev *rpmb_dev_find_device(const void *data,
    81					      const struct rpmb_dev *start,
    82					      int (*match)(struct rpmb_dev *rdev,
    83							   const void *data))
  > 84	{
    85		struct rpmb_dev *rdev;
    86		struct list_head *pos;
    87	
    88		mutex_lock(&rpmb_mutex);
    89		if (start)
    90			pos = start->list_node.next;
    91		else
    92			pos = rpmb_dev_list.next;
    93	
    94		while (pos != &rpmb_dev_list) {
    95			rdev = container_of(pos, struct rpmb_dev, list_node);
    96			if (match(rdev, data)) {
    97				rpmb_dev_get(rdev);
    98				goto out;
    99			}
   100			pos = pos->next;
   101		}
   102		rdev = NULL;
   103	
   104	out:
   105		mutex_unlock(&rpmb_mutex);
   106	
   107		return rdev;
   108	}
   109	EXPORT_SYMBOL_GPL(rpmb_dev_find_device);
   110	
   111	/**
   112	 * rpmb_dev_unregister() - unregister RPMB partition from the RPMB subsystem
   113	 * @rdev: the rpmb device to unregister
   114	 *
   115	 * This function should be called from the release function of the
   116	 * underlying device used when the RPMB device was registered.
   117	 *
   118	 * Returns: < 0 on failure
   119	 */
   120	int rpmb_dev_unregister(struct rpmb_dev *rdev)
   121	{
   122		if (!rdev)
   123			return -EINVAL;
   124	
   125		mutex_lock(&rpmb_mutex);
   126		list_del(&rdev->list_node);
   127		mutex_unlock(&rpmb_mutex);
   128		kfree(rdev->descr.dev_id);
   129		kfree(rdev);
   130	
   131		return 0;
   132	}
   133	EXPORT_SYMBOL_GPL(rpmb_dev_unregister);
   134	
   135	/**
   136	 * rpmb_dev_register - register RPMB partition with the RPMB subsystem
   137	 * @dev: storage device of the rpmb device
   138	 * @ops: device specific operations
   139	 *
   140	 * While registering the RPMB partition extract needed device information
   141	 * while needed resources are available.
   142	 *
   143	 * Returns: a pointer to a 'struct rpmb_dev' or an ERR_PTR on failure
   144	 */
   145	struct rpmb_dev *rpmb_dev_register(struct device *dev,
   146					   struct rpmb_descr *descr)
 > 147	{
   148		struct rpmb_dev *rdev;
   149	
   150		if (!dev || !descr || !descr->route_frames || !descr->dev_id ||
   151		    !descr->dev_id_len)
   152			return ERR_PTR(-EINVAL);
   153	
   154		rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
   155		if (!rdev)
   156			return ERR_PTR(-ENOMEM);
   157		rdev->descr = *descr;
   158		rdev->descr.dev_id = kmemdup(descr->dev_id, descr->dev_id_len,
   159					     GFP_KERNEL);
   160		if (!rdev->descr.dev_id) {
   161			kfree(rdev);
   162			return ERR_PTR(-ENOMEM);
   163		}
   164	
   165		rdev->parent_dev = dev;
   166	
   167		dev_dbg(rdev->parent_dev, "registered device\n");
   168	
   169		mutex_lock(&rpmb_mutex);
   170		list_add_tail(&rdev->list_node, &rpmb_dev_list);
   171		blocking_notifier_call_chain(&rpmb_interface, RPMB_NOTIFY_ADD_DEVICE,
   172					     rdev);
   173		mutex_unlock(&rpmb_mutex);
   174	
   175		return rdev;
   176	}
   177	EXPORT_SYMBOL_GPL(rpmb_dev_register);
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
