Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F2E1E25F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738238253; cv=none; b=HXNS7gdXW+wg3mILsqKzfN7y3rwfts9lCGhM6vFx8PJiBDtEg0lKhTVQ5/jeemBAF9NqIbl5mVtFL5Bm6MRKKMO7oBMNmeyHBOXHEQXbA9I/xjADavmGAATlNFXju+8BIhCQfKSvl3RPsGg+5uQ5TtGO3Jf+dsToc02ZAUiJ/Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738238253; c=relaxed/simple;
	bh=ujip5E8FBPyYCoFI/gToFJZkQMOwtz/toETD6o63fiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QUyyYeVdrO1/SAIDIGLGzNcZZPbmbuhOqUJsLDWASNkA3QVYOP5yOz+Vj9hp/d22U99MltvK1oqpV1FeRdut/GPV6sixJebD9wLN+EjFedSg1fTJGCdK85c9ccHNuI+8WMumJ2sLNXEyn9PFSNfBT3XakRpSVtyACDgzh8FtgrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxNIY/d7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxNIY/d7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738238252; x=1769774252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujip5E8FBPyYCoFI/gToFJZkQMOwtz/toETD6o63fiY=;
  b=fxNIY/d7Ib5vy8/fxkGvI8dlfeZ9T6uOpUQwH/xjgQ1derVQL0fPKpKF
   0n5zOiHOyW6HFYmra6wI2AnG59tkEFxZAC1JZuWH3dJnQaoTM+qC9R+FN
   mi8CsyZ8HeYbHl7JgHtj9NEwXW2VXHUmBge83fw7Pjwf/QsQB90mmilJw
   Ey32qctLZMUn1JdvVU1gYUDkp/QVIboNOroPG60Wqvrs5wFteyVC/lWAC
   9qPgcv4SNhLKG7cz8o08KqvxvIgDrEzmMSR9ZR5YtiBrbk2EqbgVJhLxH
   +81l9ge4sOVMLmAT47ZnERbduS/tYnomtZv9A81ZckupUO4QXDYG0Aiy1
   A==;
X-CSE-ConnectionGUID: i1K9vrTjQyiQ7wF6Le9QDg==
X-CSE-MsgGUID: L5qwkUFxRduFrUiX8haKrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="50160679"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="50160679"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 03:57:29 -0800
X-CSE-ConnectionGUID: nkz1IXUUREuZ7NU9taV0kQ==
X-CSE-MsgGUID: leigBUROR3qXeBrICSTMjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109211479"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2025 03:57:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdTAj-000k1l-0I;
	Thu, 30 Jan 2025 11:57:25 +0000
Date: Thu, 30 Jan 2025 19:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 17/25] drivers/cxl/core/features.c:202: undefined
 reference to `fwctl_unregister'
Message-ID: <202501301920.Seg3Ke0X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   a94a98755ebe43e2cf8fa8b60eb78c64f9d9bdce
commit: 50bb7ff9edf14d384d8cd902ac40e41abee77651 [17/25] cxl: Add FWCTL support to the CXL memdev driver
config: i386-randconfig-054-20250130 (https://download.01.org/0day-ci/archive/20250130/202501301920.Seg3Ke0X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301920.Seg3Ke0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301920.Seg3Ke0X-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/cxl/core/features.o: in function `remove_cxlfs':
>> drivers/cxl/core/features.c:202: undefined reference to `fwctl_unregister'
   ld: drivers/cxl/core/features.o: in function `devm_cxl_add_features':
>> drivers/cxl/core/features.c:222: undefined reference to `_fwctl_alloc_device'
>> ld: drivers/cxl/core/features.c:233: undefined reference to `fwctl_register'
   ld: drivers/cxl/core/features.o: in function `remove_cxlfs':
>> drivers/cxl/core/features.c:202: undefined reference to `fwctl_unregister'


vim +202 drivers/cxl/core/features.c

   194	
   195	static void remove_cxlfs(void *_md)
   196	{
   197		struct cxl_memdev *cxlmd = _md;
   198		struct cxl_features_state *cxlfs = cxlmd->cxlfs;
   199		struct fwctl_device *fwctl = &cxlfs->fwctl;
   200	
   201		cxlmd->cxlfs = NULL;
 > 202		fwctl_unregister(fwctl);
   203		fwctl_put(fwctl);
   204	}
   205	
   206	DEFINE_FREE(free_cxlfs, struct cxl_features_state *, if (_T) fwctl_put(&_T->fwctl))
   207	
   208	/**
   209	 * devm_cxl_add_features() - Allocate and initalize features context
   210	 * @cxlmd: CXL memory device
   211	 * @ops: FWCTL ops
   212	 *
   213	 * Return 0 on success or -errno on failure.
   214	 */
   215	int devm_cxl_add_features(struct cxl_memdev *cxlmd,
   216				  const struct fwctl_ops *ops)
   217	{
   218		struct device *dev = &cxlmd->dev;
   219		int rc;
   220	
   221		struct cxl_features_state *cxlfs __free(free_cxlfs) =
 > 222			fwctl_alloc_device(dev, ops, struct cxl_features_state, fwctl);
   223		if (!cxlfs)
   224			return -ENOMEM;
   225	
   226		enumerate_feature_cmds(cxlmd, cxlfs);
   227		rc = get_supported_features(cxlmd, cxlfs);
   228		if (rc) {
   229			dev_dbg(dev, "Retrieving features failed.\n");
   230			return 0;
   231		}
   232	
 > 233		rc = fwctl_register(&cxlfs->fwctl);
   234		if (rc)
   235			return rc;
   236	
   237		cxlfs->cxlmd = cxlmd;
   238		cxlmd->cxlfs = no_free_ptr(cxlfs);
   239	
   240		return devm_add_action_or_reset(dev, remove_cxlfs, cxlmd);
   241	}
   242	EXPORT_SYMBOL_NS_GPL(devm_cxl_add_features, "CXL");
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
