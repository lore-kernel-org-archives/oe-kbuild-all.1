Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE9E38B138
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774094026; cv=none; b=G1n8AwR/DMupkpbmRGcAqmxM+/VTT+k2z7c3bUoddjzKvPFd4bAw7bfNxigeNg7GWrElDFq2HVppqPmVGsJSUXu/e5xHys8BIl/9pgQRuc+K8KhWFVR2aBmf8n6XsibBYMeKjEIzwdpxkEk1TuAQXvrwn/C6zY67fongpBfxAWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774094026; c=relaxed/simple;
	bh=w2beA97dDU1NsWnM1rsDCCwR/Dfzv3+TXZXKnRhN/os=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KOJQEqqrOm55xliOgRfGVHAPmX2egn+6Cy/jSIVlrpG+IxXFKfXrgiGR3g9N+GZ25/kUX3YAdopwbGqyNBnpccv3DdSR8xauhZoOVw3sb1n3eKqwb4zBhsxRngctrWvbFMi8UnYo7Vegn/mDNZsJgnp/VhK1d8S3uHmuTXbwjC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqTFjlDH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqTFjlDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774094024; x=1805630024;
  h=date:from:to:cc:subject:message-id;
  bh=w2beA97dDU1NsWnM1rsDCCwR/Dfzv3+TXZXKnRhN/os=;
  b=DqTFjlDHfn1+nco/Wf0ZxL2Ne3eyW0WurT+oiC6I0mnUgsmZBal4g4Eo
   bOEiFR13K1Uk6aftA4je7nK7nowb4a00mtzgN/l03y55znWDpeJZO0wa3
   qb3u4fjdXTd1JP9xUlAdOIqfTw8Aki0nfyZDXqJ70IubrVJE89qWj2zwy
   RlaR/g1E8cln2XiDCYvws6a/pimWAMdikL9lIxg5HnMEFsszufsn5V56A
   X4acr3mhsvye+aXj399B0+kDsY8vMCPjBA/LeCJTcIi3OJ+atRNJfNcU/
   Jd4BZVYBpDMpW8b7xikJqOIrE8bCSluXWILHnu5e5IqtOrBEn2RYrr3be
   A==;
X-CSE-ConnectionGUID: jl7BImDLT421WLFnaNrt3w==
X-CSE-MsgGUID: O8yoqVeBT6Ohckzgy7O+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75133463"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75133463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 04:53:43 -0700
X-CSE-ConnectionGUID: mjdsCeNBQ3OWJFyYEy2ZxA==
X-CSE-MsgGUID: oHUURUl2Sje1OOrGvMV3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="219272599"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Mar 2026 04:53:41 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3utf-000000000hl-1FQt;
	Sat, 21 Mar 2026 11:53:39 +0000
Date: Sat, 21 Mar 2026 19:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:dax_cleanup 7/8] drivers/dax/kmem.c:201:10:
 error: use of undeclared identifier 'ENOSUPP'
Message-ID: <202603211907.fEfmrNkp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux dax_cleanup
head:   15ec1a9fd125949defd6aeed1d4c87d7698b0c00
commit: 8feccabee6bc5184e4f2d7aad92729c392437860 [7/8] dax/kmem: extract hotplug/hotremove helper functions
config: s390-randconfig-r071-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211907.fEfmrNkp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211907.fEfmrNkp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211907.fEfmrNkp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dax/kmem.c:201:10: error: use of undeclared identifier 'ENOSUPP'
     201 |         return -ENOSUPP;
         |                 ^~~~~~~
   1 error generated.


vim +/ENOSUPP +201 drivers/dax/kmem.c

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
