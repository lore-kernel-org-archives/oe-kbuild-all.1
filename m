Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948734;
	b=nsGyPbK+VO0Y1poaqsYzvcJIsXwdJBlTYG3EsA+Ff6YlOG89kvnA6W9cGL8UrmQel7IL
	 1JZ/9R8pxlHKey/qH4zlv35Ap56sXXUp90QwtOBQRAvsV7fXW4oXoCV42U13MqnBtfg9W
	 bWCvDnUsoco6qwYG8VzHP3wIyALzrWAsHZXLAbVJVTFWSWHVm7YxeK3GLdv4Hpu6FPTSQ
	 +T6ZkxevKlzGXNKg3HE4xfRfJbxHxpnj2ecikwxX1pWav45go9gytkpA44arUUpReKPq/
	 wx7ZVgBK0ELpmOkHSilK8n1AZGJ5qQyK6u1C45t4ZbgF2vUavY2gEtlF8iqlH+Nzlog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948734;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=D3vK2Q6qudImPWSZNs1UpY6K4AcRgCyu/O/gZPCJo7M=;
	b=h9fmLgiNPzRhInu1ltZK/wVeYedT7A1q6aSs9eCL0kIJkZMjKe6czz79DsdyKRqeSKtd
	 Cti4HyEVSA70dkqNJDSrkIBA4mj364k2ciW8Et84xVVRP4X/AuLKXjQmsmmnat5DHvzGF
	 3La1A3tsiLvjppJYGnVG+Ym1YcfZ1xsljcEk+pDqV60cIGInyP2Y7Qf02IDq5K035HSU+
	 sf/5LI+ij2hBPz60/9K63BFK0idJfLvB4iW+w0S41iJqqxZeEY7Ek+jqgXkkuag0GzVd1
	 KfQzQho/hJ6ws4iVKfild/jdKKOXld+MnG8hTnqbs+SQQ+k73cRdFaOrpJJldtEGlSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E2twA284;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B760606A334
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 20:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B760606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E2twA284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794948734; x=1826484734;
  h=date:from:to:cc:subject:message-id;
  bh=JMDc9VXDX4rZeP83be2rJePeIH71EIFa39dxbInANOg=;
  b=E2twA284p8rvqyaPd2kITTj1v0oIHLB70/Bh772mSdIxo6kOX3R9v8Iy
   II7e3hU9/XkAl+ztBDVAHHU26zmxc0RZiDfV24NdNUpBkx7BZ6XdTnKuZ
   4KwchDdUvknWz9mMwzbKJmTHV9b6ppquMBJFfPIEQkK27VgsfJDthah+6
   iBAcwDE2RtUss/yzBUZDDOiOxjWVUC4Nrp68rZ7s9uW7OCqw/gWRhSQyC
   UaHrQ5RnWD+/KS9aY6Gju+p/zmmkgZFyNV9ar6moARwC3QBiu7aWzBH6v
   fn+7Pr5TqgtWQTWyMJGb7MlJhs1iPI1nfrjKRQm3Di0x43D/A5wFETzTt
   A==;
X-CSE-ConnectionGUID: +BItcmfjTcqMZfmbCN4pWA==
X-CSE-MsgGUID: bVAOR7L+SE6auA/cGE6vjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3782096"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3782096"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 12:52:14 -0800
X-CSE-ConnectionGUID: nJwnoK7XSaSF0QS/ylGkLg==
X-CSE-MsgGUID: d+Mg86YvRPukdFDZVr5GEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11660003"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 17 Nov 2026 12:52:13 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTQ9x-000000003CM-2fGg;
	Tue, 17 Nov 2026 20:52:09 +0000
Date: Tue, 17 Nov 2026 21:51:40 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_dir_access 13/13] fs/nfsd/nfsfh.c:422:13:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <20261117214158.e39MaUag-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/amir73il/linux fan_pre_dir_access
head:   cfc22130c59cc87392fe9ce601cd5823dff2781d
commit: cfc22130c59cc87392fe9ce601cd5823dff2781d [13/13] nfsd: add pre-dir-content fsnotify hooks
config: alpha-randconfig-r2305-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117214158.e39MaUag-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117214158.e39MaUag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117214158.e39MaUag-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfsfh.c:422:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted __be32 @@
   fs/nfsd/nfsfh.c:422:13: sparse:     expected int ret
   fs/nfsd/nfsfh.c:422:13: sparse:     got restricted __be32

vim +422 fs/nfsd/nfsfh.c

   403	
   404	/**
   405	 * fh_want_write - Get write access to an export
   406	 * @fhp: File handle of file to be written
   407	 *
   408	 * Caller must invoke fh_drop_write() when its write operation
   409	 * is complete.
   410	 *
   411	 * Returns 0 if the file handle's export can be written to. Otherwise
   412	 * the export is not prepared for updates, and the returned negative
   413	 * errno value reflects the reason for the failure.
   414	 */
   415	int fh_want_write(struct svc_fh *fhp)
   416	{
   417		int ret;
   418	
   419		if (fhp->fh_got_write)
   420			return 0;
   421	
 > 422		ret = nfsd_pre_dir_content(fhp);
   423		if (ret)
   424			return ret;
   425	
   426		ret = mnt_want_write(fhp->fh_export->ex_path.mnt);
   427		if (!ret)
   428			fhp->fh_got_write = true;
   429		return ret;
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
