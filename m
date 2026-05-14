Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE13254AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 01:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778723469; cv=none; b=nyBhos/9S0I2jqP5qdtO8fvxGqM/cIbHSi8YhB8+PXUGVNHf8ejxlmVUxzjKS16X38KgsqyfnTiwXdqtKD+CcvzdnIX4+48H33RZMaO/wYc/zX1vXRFRrFpb/x+dJx9H2fC+ityTKhvf7l9fKothMH6YYIytL7OlmAighYtFtGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778723469; c=relaxed/simple;
	bh=2IUUTfHo3t+hxPoF/DmThs36PfClrBINIBdulzdNGR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TIbuy21/FSGeZ5Yd63/KuLbkMWKIDOlibJsmQP8QG1PCKdmQN6emQtTKrrKRs4X6zVnlVyGH6ycusKqcfcq8+SA+qHuz9gb72As5OBNSN3U14fPJ3scA8S8/cSBztK6RYivFCn06npEt5blbUBg5X5xfD/262edwqOkPOBivmzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k252xVe+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k252xVe+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778723468; x=1810259468;
  h=date:from:to:cc:subject:message-id;
  bh=2IUUTfHo3t+hxPoF/DmThs36PfClrBINIBdulzdNGR8=;
  b=k252xVe+cHFT4ibkMYvdhGsMdk/NBGXZmG8aa/7FlTFTiZ9vPLniV9FN
   Sc7It6CInZmO43A4QUfktu3GfZNHnazDPW/8y0s63OUen8GObZod98MdL
   Z59sQC8oWIROlO0a/45AzxlnYifMynYzXeqovDC9kQZxw2JHqPlRPYl2S
   hqsFggo5qfPCtl/WHBYq07DX2xi4lKzLoFm9y6lC9idPAWxs5xLZFp19v
   M0YS0VhGXHQJVsAF0k/UMVcAO3Tv+Fz1WbV6rD2V5ey7LOo4IwMpmFV64
   ocJFEgSt4c+mt5fShLVK8f7l194nbDGW05glDdFl9i9KUEpXg/vtF+xLi
   Q==;
X-CSE-ConnectionGUID: uG+yv0JVS8WuiVD2acBrLg==
X-CSE-MsgGUID: bHAxcMUtRai2JpiDEbOURw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79614527"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79614527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:51:06 -0700
X-CSE-ConnectionGUID: L8tCvmc4TQGCLX55XJmBMg==
X-CSE-MsgGUID: gObyHYhWTY25VyFUhMNJtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238365353"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2026 18:51:04 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNLE5-000000005ZX-2dnU;
	Thu, 14 May 2026 01:51:01 +0000
Date: Thu, 14 May 2026 09:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Daniel Vacek <neelx@suse.com>
Subject: [kdave-btrfs-devel:ext/dv/fscrypt 32/43]
 fs/btrfs/fscrypt.c:240:34: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202605140957.DjseWRNF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
commit: fda37caa264ff597b0fc03039dc95e392432bbc5 [32/43] btrfs: implement process_bio cb for fscrypt
config: alpha-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140957.DjseWRNF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140957.DjseWRNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140957.DjseWRNF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/fscrypt.c:240:34: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted blk_status_t @@     got int @@
   fs/btrfs/fscrypt.c:240:34: sparse:     expected restricted blk_status_t
   fs/btrfs/fscrypt.c:240:34: sparse:     got int

vim +240 fs/btrfs/fscrypt.c

   215	
   216	static blk_status_t btrfs_process_encrypted_bio(struct bio *orig_bio,
   217							struct bio *enc_bio)
   218	{
   219		struct btrfs_bio *bbio;
   220	
   221		/*
   222		 * If our bio is from the normal fs_bio_set then we know this is a
   223		 * mirror split and we can skip it, we'll get the real bio on the last
   224		 * mirror and we can process that one.
   225		 */
   226		if (orig_bio->bi_pool == &fs_bio_set)
   227			return BLK_STS_OK;
   228	
   229		bbio = btrfs_bio(orig_bio);
   230	
   231		if (bio_op(orig_bio) == REQ_OP_READ) {
   232			/*
   233			 * We have ->saved_iter based on the orig_bio, so if the block
   234			 * layer changes we need to notice this asap so we can update
   235			 * our code to handle the new world order.
   236			 */
   237			ASSERT(orig_bio == enc_bio);
   238			return btrfs_check_encrypted_read_bio(bbio, enc_bio);
   239		}
 > 240		return btrfs_csum_one_bio(bbio, enc_bio, false);
   241	}
   242	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
