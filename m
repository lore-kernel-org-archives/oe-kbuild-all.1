Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1A15E5DC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 13:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741527839; cv=none; b=GnYKPCvBNrlc5/1Trx92sDECbHo9nFv79KVQuLtlhg8ah6I//zLB5xyQxEZiDaMA9zuQBVQBIYoKt8XyuGpZnGt/aY5TmbbVJ2b42sAqecCctOoNzkGOJWY0i/7rNPjinI8piyyNULGCDWOCJ9A89rsYi9LjdtwwMFzpzhZ1qG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741527839; c=relaxed/simple;
	bh=5gbvNyX7Jq+8JvynQfCTcKZbs50MrdckyCRrFXrcrZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCozVCMtzAEALwbpKMNL60Vc5ETaG0kS//KwxtSuQP+gHzRPHSHLOMrNuFvxp25enNieW29zECAU0DnPd/CvjuDXvV3r3wJ90ALzDfAXFk4Cy+2ox0+6uRMwc5Z+Wed4jO/e199Hji3RoZSnYH65ycIEc80CHChugxU1Bw9xEbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myyhYJTs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myyhYJTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741527836; x=1773063836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gbvNyX7Jq+8JvynQfCTcKZbs50MrdckyCRrFXrcrZU=;
  b=myyhYJTs0LkOSSGyTvdRk+SQnPz8tLDz9vOT0VUffMaMgpGnAnjjvK1J
   SJR2EXKifPU4pn8P5wIWlnXBduWMVsMILFhF3iEAUTxXUIkYqDfLRaUUm
   Tou3qg6MTSFpE/N7VRSfUJrKRpiE3ubwsE878DsA27UEQeUVQ+iBrkLkV
   jLufU5hxFapIzOT1fwEJA+lhqzcjkZlvEyHcWJ+IYqFLCluyyFV+IFoQv
   47WhUY4EHCvcgWi56RgaUcDcZWZH0SrI7tFtaj8nFaj4N/DuYPjmZjNSd
   XA5edBoqAtGxptF0pklLYbVHPUAoLoC8Vj/h578Nrdl4F5QXeQRlAJS+n
   g==;
X-CSE-ConnectionGUID: lszpDnZ5Q/yMKKwxu2V1Ww==
X-CSE-MsgGUID: XCAHu3L3S+e+EWdrsoDo+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="52734613"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="52734613"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 06:43:55 -0700
X-CSE-ConnectionGUID: BIiXZTv3RKKrLP7Ucelkig==
X-CSE-MsgGUID: wCfrLNthTkKR7Te3n3T2CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="142981066"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Mar 2025 06:43:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trGwU-00038Y-00;
	Sun, 09 Mar 2025 13:43:48 +0000
Date: Sun, 9 Mar 2025 21:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Yishai Hadas <yishaih@nvidia.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: [rdma-rdma:wip/leon-for-next 19/29]
 drivers/infiniband/core/ucaps.c:143:5: error: redefinition of
 'ib_create_ucap'
Message-ID: <202503092123.k98EVJpD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   2213213e177666ec3750484c571060f5c8309499
commit: 22dc95b314682fe8167f233de611c53ecce9d39b [19/29] RDMA/uverbs: Introduce UCAP (User CAPabilities) API
config: sparc-randconfig-001-20250309 (https://download.01.org/0day-ci/archive/20250309/202503092123.k98EVJpD-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503092123.k98EVJpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503092123.k98EVJpD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/core/ucaps.c:143:5: error: redefinition of 'ib_create_ucap'
     143 | int ib_create_ucap(enum rdma_user_cap type)
         |     ^~~~~~~~~~~~~~
   In file included from drivers/infiniband/core/ucaps.c:11:
   include/rdma/ib_ucaps.h:23:19: note: previous definition of 'ib_create_ucap' with type 'int(enum rdma_user_cap)'
      23 | static inline int ib_create_ucap(enum rdma_user_cap type)
         |                   ^~~~~~~~~~~~~~
>> drivers/infiniband/core/ucaps.c:221:6: error: redefinition of 'ib_remove_ucap'
     221 | void ib_remove_ucap(enum rdma_user_cap type)
         |      ^~~~~~~~~~~~~~
   include/rdma/ib_ucaps.h:27:20: note: previous definition of 'ib_remove_ucap' with type 'void(enum rdma_user_cap)'
      27 | static inline void ib_remove_ucap(enum rdma_user_cap type) {}
         |                    ^~~~~~~~~~~~~~


vim +/ib_create_ucap +143 drivers/infiniband/core/ucaps.c

   130	
   131	/**
   132	 * ib_create_ucap - Add a ucap character device
   133	 * @type: UCAP type
   134	 *
   135	 * Creates a ucap character device in the /dev/infiniband directory. By default,
   136	 * the device has root-only read-write access.
   137	 *
   138	 * A driver may call this multiple times with the same UCAP type. A reference
   139	 * count tracks creations and deletions.
   140	 *
   141	 * Return: 0 on success, or a negative errno value on failure
   142	 */
 > 143	int ib_create_ucap(enum rdma_user_cap type)
   144	{
   145		struct ib_ucap *ucap;
   146		int ret;
   147	
   148		if (type >= RDMA_UCAP_MAX)
   149			return -EINVAL;
   150	
   151		mutex_lock(&ucaps_mutex);
   152		ret = ib_ucaps_init();
   153		if (ret)
   154			goto unlock;
   155	
   156		ucap = ucaps_list[type];
   157		if (ucap) {
   158			kref_get(&ucap->ref);
   159			mutex_unlock(&ucaps_mutex);
   160			return 0;
   161		}
   162	
   163		ucap = kzalloc(sizeof(*ucap), GFP_KERNEL);
   164		if (!ucap) {
   165			ret = -ENOMEM;
   166			goto unlock;
   167		}
   168	
   169		device_initialize(&ucap->dev);
   170		ucap->dev.class = &ucaps_class;
   171		ucap->dev.devt = MKDEV(MAJOR(ucaps_base_dev), type);
   172		ucap->dev.release = ucap_dev_release;
   173		ret = dev_set_name(&ucap->dev, ucap_names[type]);
   174		if (ret)
   175			goto err_device;
   176	
   177		cdev_init(&ucap->cdev, &ucaps_cdev_fops);
   178		ucap->cdev.owner = THIS_MODULE;
   179	
   180		ret = cdev_device_add(&ucap->cdev, &ucap->dev);
   181		if (ret)
   182			goto err_device;
   183	
   184		kref_init(&ucap->ref);
   185		ucaps_list[type] = ucap;
   186		mutex_unlock(&ucaps_mutex);
   187	
   188		return 0;
   189	
   190	err_device:
   191		put_device(&ucap->dev);
   192	unlock:
   193		mutex_unlock(&ucaps_mutex);
   194		return ret;
   195	}
   196	EXPORT_SYMBOL(ib_create_ucap);
   197	
   198	static void ib_release_ucap(struct kref *ref)
   199	{
   200		struct ib_ucap *ucap = container_of(ref, struct ib_ucap, ref);
   201		enum rdma_user_cap type;
   202	
   203		for (type = RDMA_UCAP_FIRST; type < RDMA_UCAP_MAX; type++) {
   204			if (ucaps_list[type] == ucap)
   205				break;
   206		}
   207		WARN_ON(type == RDMA_UCAP_MAX);
   208	
   209		ucaps_list[type] = NULL;
   210		cdev_device_del(&ucap->cdev, &ucap->dev);
   211		put_device(&ucap->dev);
   212	}
   213	
   214	/**
   215	 * ib_remove_ucap - Remove a ucap character device
   216	 * @type: User cap type
   217	 *
   218	 * Removes the ucap character device according to type. The device is completely
   219	 * removed from the filesystem when its reference count reaches 0.
   220	 */
 > 221	void ib_remove_ucap(enum rdma_user_cap type)
   222	{
   223		struct ib_ucap *ucap;
   224	
   225		mutex_lock(&ucaps_mutex);
   226		ucap = ucaps_list[type];
   227		if (WARN_ON(!ucap))
   228			goto end;
   229	
   230		kref_put(&ucap->ref, ib_release_ucap);
   231	end:
   232		mutex_unlock(&ucaps_mutex);
   233	}
   234	EXPORT_SYMBOL(ib_remove_ucap);
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
