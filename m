Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05360139D0A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771757200; cv=none; b=NzKpxaIcYrV2E4KPAuyRsMjfxarpiRAmMKQfyNENqkKXX5N62JPwR/WiMQB8Edh/7CYcbdQoA5R8wuSD8ifpBWqAHndz5g/4RLt9JdEqp31cWLLGG7HID2j8iOdtc0hCq1afXa5ZQ2Ql6+JmShb2/K524cMkeQB+Xq8Ip76IuvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771757200; c=relaxed/simple;
	bh=Pk4hKqFjReE7GdRb7/rfYYQpLCoy+VRF50wVu8go6P0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uGZCS+Ruil3ssapcCY/fko8wwoEcIpGh5RhcBK4gMyrpjlqFnhqWeIePARWzNqMODuixWRE1pEK9bjjpTqF7Sdh3J4hE644myFqtyqX14ocvSjCDvElTpVrr+AW2qrktYn3NUCJffrvDiMAoyrUoeN31SNNTqzCBeGsXM1Syd80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1jFJbdT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1jFJbdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771757199; x=1803293199;
  h=date:from:to:cc:subject:message-id;
  bh=Pk4hKqFjReE7GdRb7/rfYYQpLCoy+VRF50wVu8go6P0=;
  b=K1jFJbdTZXhf5fDPfR2a0P4DQAKeDDWYGfYcwpGBvjUP1frmDq+GkeQa
   KzrRDzDvfPFTqmiF3CxHYzNQi9XGv21B16c+LyyT8bO/ekwTp+bfvXyzo
   sXsSrvw4EqXyFJ5bIa/biqSrmXy7fpEAWxCZ5fM/dcw3jkHRmz7TuOOrP
   a9C8/lwwA4g7NO9BeD04bXPPI8zNhjnzDRyAh5fScSHt2tBjYGKs/MfLr
   xTLfuXpSHdbfTeyHBJ9FIAdKEc7y5Hd9buN99yOB3rLwc4mVG4GNkuk3N
   Wb8i4bgrPslzVIk6oEIEbJecrqst84TnoXBSFr4eTYgj9F/dR/0auDx8M
   Q==;
X-CSE-ConnectionGUID: 5+U7iy/eTRKyueSeiE9Kiw==
X-CSE-MsgGUID: N3/IbQltSDi/v5Z4Wh3MjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="84230963"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="84230963"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 02:46:39 -0800
X-CSE-ConnectionGUID: mq4BIlF4ROyvQJzwoELH/w==
X-CSE-MsgGUID: kXhMZKT0Qu2dz/Oi6yQMkg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Feb 2026 02:46:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu6yx-000000015RE-0zH8;
	Sun, 22 Feb 2026 10:46:35 +0000
Date: Sun, 22 Feb 2026 18:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 18/60]
 drivers/dax/kmem.c:201:10: error: 'ENOSUPP' undeclared; did you mean
 'ENOTSUPP'?
Message-ID: <202602221845.apN4ulcQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: af7cd15fb8a39fb0d8799c2d54dae5864d67632b [18/60] dax/kmem: extract hotplug/hotremove helper functions
config: s390-randconfig-002-20260222 (https://download.01.org/0day-ci/archive/20260222/202602221845.apN4ulcQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221845.apN4ulcQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221845.apN4ulcQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dax/kmem.c: In function 'dax_kmem_do_hotremove':
>> drivers/dax/kmem.c:201:10: error: 'ENOSUPP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
     return -ENOSUPP;
             ^~~~~~~
             ENOTSUPP
   drivers/dax/kmem.c:201:10: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   drivers/dax/kmem.c:198:12: warning: 'dax_kmem_do_hotremove' defined but not used [-Wunused-function]
    static int dax_kmem_do_hotremove(struct dev_dax *dev_dax,
               ^~~~~~~~~~~~~~~~~~~~~


vim +201 drivers/dax/kmem.c

   152	
   153	#ifdef CONFIG_MEMORY_HOTREMOVE
   154	/**
   155	 * dax_kmem_do_hotremove - hot-remove memory for dax kmem device
   156	 * @dev_dax: the dev_dax instance
   157	 * @data: the dax_kmem_data structure with resource tracking
   158	 *
   159	 * Removes all ranges in the dev_dax region.
   160	 *
   161	 * Returns the number of successfully removed ranges.
   162	 */
   163	static int dax_kmem_do_hotremove(struct dev_dax *dev_dax,
   164					 struct dax_kmem_data *data)
   165	{
   166		struct device *dev = &dev_dax->dev;
   167		int i, success = 0;
   168	
   169		for (i = 0; i < dev_dax->nr_range; i++) {
   170			struct range range;
   171			int rc;
   172	
   173			rc = dax_kmem_range(dev_dax, i, &range);
   174			if (rc)
   175				continue;
   176	
   177			/* Skip ranges not currently added */
   178			if (!data->res[i])
   179				continue;
   180	
   181			rc = remove_memory(range.start, range_len(&range));
   182			if (rc == 0) {
   183				/* Release the resource for the successfully removed range */
   184				remove_resource(data->res[i]);
   185				kfree(data->res[i]);
   186				data->res[i] = NULL;
   187				success++;
   188				continue;
   189			}
   190			any_hotremove_failed = true;
   191			dev_err(dev, "mapping%d: %#llx-%#llx hotremove failed\n",
   192				i, range.start, range.end);
   193		}
   194	
   195		return success;
   196	}
   197	#else
   198	static int dax_kmem_do_hotremove(struct dev_dax *dev_dax,
   199					 struct dax_kmem_data *data)
   200	{
 > 201		return -ENOSUPP;
   202	}
   203	#endif /* CONFIG_MEMORY_HOTREMOVE */
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
