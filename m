Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F061EB5F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262658; cv=none; b=f51+D+5gyOdAPpcPdF9QycAidWoaV1JoN5UT0EbrB4TPolxGLwHDBhbx2Ofe62CXHjAf5CqJvrze29DyPMONUpifBnB7QmEvUfmVsMD+1vPGaO/cM6dNLDuLdsr+Z2GOlmjJlCYCMlf2+CnFrNRwderdMXXteB/S+rFwruF6j+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262658; c=relaxed/simple;
	bh=JK4LhxIkx/xaAjS+ioXLkW+enrD/FvbconcCnw/x41w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYVRYmlpCzIcyjBSDfLYXVk6grXhz66z6/2/wjshKJ1Mj84cFUvFt6DKRS3AyFX/nr+dGE8CL8iLano9YGGlTCfuDoYHwIA/wfOL8kYteJO7x0PdnxGZFQbKAJh7R3IzlKGhM3yDjKTCOLbizcgiIIyWrxw9KLPAXAwTeUUxoNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4i4xPaR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4i4xPaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745262657; x=1776798657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JK4LhxIkx/xaAjS+ioXLkW+enrD/FvbconcCnw/x41w=;
  b=Q4i4xPaRgblg8mE/uXg9aJbJlrHdbKG7LlBY4pT9pKFoOvgTbnaIwU7N
   FLQCFesjdBhwLBwY0ExkzDO1XelKqX2rWmrKmAQNz9jcAzYGWTeAo74eZ
   b/jYp1kldnXJ091m4AWloA9xdrLQr7w/aF4/R9cWS3OHXjGM5w9DzDSR1
   jOqlfnE4afuuJaTdpb9nPOdfT6mM6lYxp/tZolmRrv9Qmi1QscjoP2uL8
   5SymOTeMj91eBwGVh87JX57Ab84Lfr1RNz1XyJvruYPTFWdmZN/IIsiyP
   Ac/eaUyGSrOSFwAdAmlOBKf6CxeWTv2rpgMAJRe29bAItzkKvHf45lLn5
   g==;
X-CSE-ConnectionGUID: QLmVj5UtT8maRYMIpMii/Q==
X-CSE-MsgGUID: J/F7BT0/QiehHjFpUd4uqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="34420046"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="34420046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 12:10:56 -0700
X-CSE-ConnectionGUID: MUGen6fTR7q9z0aKw2upMw==
X-CSE-MsgGUID: sq/59RffQjWgxgZy8U/Ijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="132756668"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Apr 2025 12:10:56 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6wXd-0000LD-16;
	Mon, 21 Apr 2025 19:10:53 +0000
Date: Tue, 22 Apr 2025 03:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-new-helpers 3/18] block/bio.c:1317: warning:
 Function parameter or struct member 'len' not described in 'bdev_rw_virt'
Message-ID: <202504220307.K00i54m7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-new-helpers
head:   280d8b7173282de4cf4857624def142ed24fad63
commit: dc18223aaea3f28ee4b98928d16baf4a6ffd4212 [3/18] block: add a bdev_rw_virt helper
config: loongarch-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220307.K00i54m7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220307.K00i54m7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220307.K00i54m7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bio.c:1317: warning: Function parameter or struct member 'len' not described in 'bdev_rw_virt'
>> block/bio.c:1317: warning: Excess function parameter 'lem' description in 'bdev_rw_virt'


vim +1317 block/bio.c

  1303	
  1304	/**
  1305	 * bdev_rw_virt - synchronously read into / write from kernel mapping
  1306	 * @bdev:	block device to access
  1307	 * @sector:	sector to accasse
  1308	 * @data:	data to read/write
  1309	 * @lem:	length to read/write
  1310	 * @op:		operation (e.g. REQ_OP_READ/REQ_OP_WRITE)
  1311	 *
  1312	 * Performs synchronous I/O to @bdev for @data/@len.  @data must be in
  1313	 * the kernel direct mapping and not a vmalloc address.
  1314	 */
  1315	int bdev_rw_virt(struct block_device *bdev, sector_t sector, void *data,
  1316			size_t len, enum req_op op)
> 1317	{
  1318		struct bio_vec bv;
  1319		struct bio bio;
  1320		int error;
  1321	
  1322		if (WARN_ON_ONCE(is_vmalloc_addr(data)))
  1323			return -EIO;
  1324	
  1325		bio_init(&bio, bdev, &bv, 1, op);
  1326		bio.bi_iter.bi_sector = sector;
  1327		bio_add_virt_nofail(&bio, data, len);
  1328		error = submit_bio_wait(&bio);
  1329		bio_uninit(&bio);
  1330		return error;
  1331	}
  1332	EXPORT_SYMBOL_GPL(bdev_rw_virt);
  1333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
