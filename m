Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A6332EAD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 03:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775014921; cv=none; b=ikuDDG3X5YOyD9ej+so9tFkfg6r2fMiABklioR17SYzeD8TijB2IE3eXRIRzUloGAtR3X6P99PrGe2Fp+h5PqcVUtdjqAK2nnqFWNkLLnivn4/udoamuo5txokeqLPd9YWiIzWq4JT5qqDO2qHHwN60TUCiAjAf91rve4IsvQMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775014921; c=relaxed/simple;
	bh=Qb3884c3q9zTzm7aMk2fAlIRf0bCcJO3uSH93oHwuh8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a/iScVNPXcj7gYKKRjaRGhBrXta4MR31aYgYuGI2qSU7+g/bsJpLK5p2E4KhDXuU3t8aTeDoW8dkehK1xhM3juSVw0mL+ZJ1VMfATcYbKD/y/bc3zjX4Mjv0dFki1ObOAh52zGBpSLhMTDBgA/47gGtbTPUgn60Y5RwJq+QI9B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMe+pxXc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMe+pxXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775014919; x=1806550919;
  h=date:from:to:cc:subject:message-id;
  bh=Qb3884c3q9zTzm7aMk2fAlIRf0bCcJO3uSH93oHwuh8=;
  b=iMe+pxXcONEpo/iMSRLHuo5VeSqu26yPWjjdeDoCv+JWxl2iJJ/ovOke
   YE2k77tNhTbkYHL9e3b4QqQ5H0FngTkw2CR3qaWPhdyvTPoJoSEqt9qmr
   3CJhB6IYFRDm3KHTsXRD9qNO3UBuBwfd2RLDjIt4gR15rrYM5DEUe97hF
   QoyjG0MtLnXhce3hHOwFPYKQlZSahT5Zj2OMj9IOBU4rozOenDBKMVq4w
   HVKyYXrdDsS0D+HXaEGlKAx34uB0kWcqMi4LNYxGf16+LIu8uR4jg7J/h
   chJuYHJU7Q+2LrU/7Bo3w0HMjziiBqK2dqwMSi3pTQOEzbNr/IrKOZXFY
   w==;
X-CSE-ConnectionGUID: MeWB26TPSW6G7jbMJrwglQ==
X-CSE-MsgGUID: kFPpfMJtTiK7pHx5m07bUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75757989"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75757989"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 20:41:58 -0700
X-CSE-ConnectionGUID: +Os2NOd+QAWq/w2TGD7vYw==
X-CSE-MsgGUID: AXAl2sMMT/i2o0AxaTfnVA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2026 20:41:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7mSo-000000008dH-25d9;
	Wed, 01 Apr 2026 03:41:54 +0000
Date: Wed, 01 Apr 2026 05:41:40 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:rdma_uapi 10/11]
 drivers/infiniband/hw/qedr/verbs.c:1285:13: warning: unused variable 'rc'
Message-ID: <202604010504.VSGQEwwF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux rdma_uapi
head:   634b50f8d2d215b6a2e13fc6648d52428bd0c9d3
commit: 5ad53d60513269a60c8641ce42cceb8bbaacd908 [10/11] RDMA: Replace memset with = {} pattern for ib_respond_udata()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260401/202604010504.VSGQEwwF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010504.VSGQEwwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010504.VSGQEwwF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/qedr/verbs.c: In function 'qedr_copy_qp_uresp':
>> drivers/infiniband/hw/qedr/verbs.c:1285:13: warning: unused variable 'rc' [-Wunused-variable]
    1285 |         int rc;
         |             ^~


vim +/rc +1285 drivers/infiniband/hw/qedr/verbs.c

  1280	
  1281	static int qedr_copy_qp_uresp(struct qedr_dev *dev,
  1282				      struct qedr_qp *qp, struct ib_udata *udata,
  1283				      struct qedr_create_qp_uresp *uresp)
  1284	{
> 1285		int rc;
  1286	
  1287		if (qedr_qp_has_sq(qp))
  1288			qedr_copy_sq_uresp(dev, uresp, qp);
  1289	
  1290		if (qedr_qp_has_rq(qp))
  1291			qedr_copy_rq_uresp(dev, uresp, qp);
  1292	
  1293		uresp->atomic_supported = dev->atomic_cap != IB_ATOMIC_NONE;
  1294		uresp->qp_id = qp->qp_id;
  1295	
  1296		return ib_respond_udata(udata, *uresp);
  1297	}
  1298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
