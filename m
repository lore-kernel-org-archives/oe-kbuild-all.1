Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847C1132C26
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707229936; cv=none; b=hlqjSutd8FyVEF4S2NRu3djrcD0bGN8DgCxJpMl6ATOlQl2cJTzcazBPxurYYFXMBiZLrvoD1qWi6SHqRaZqGDphk/cdbT8/5cOC7SOsvC4w2R7z3UCydcG2gvnOOvWWt/7frY8NpR6RFoq6gMbagAm2km+8lcgLNjPoHFF70rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707229936; c=relaxed/simple;
	bh=dtktnQb18Y+n+gg84GH6Feur6H+O5T+mC7sj3ne/RDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TixvrtZj53PYH/YIeUdZaqad0KLtlaVClGmu2zzCT3LeYDbpa7EP8q/7E9zx4Wpu3mNDUzswQP2I8a1fkRXoERsaDGkAHIrib8Rfp59VOrVHZoUm0mbxA7KTo9C3bE6hXApWdgg7veddqD2qcYZQEV/X5Fk2CaFaqE7h4GnjU4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpytJmrR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpytJmrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707229934; x=1738765934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dtktnQb18Y+n+gg84GH6Feur6H+O5T+mC7sj3ne/RDk=;
  b=jpytJmrR2pLhe9aLlVM3dS8bxRpWShjAr+UjRo//neC47HevaC7goZqy
   s0aXvXgPtPaWNM/22sZrDfLx84ezqOVNtUVR93SwUiEAAzyWjKGkZqBuW
   4pp9nMEJdHJ2X6hu90t27s/Yg2NSJM5uzTk0VbNyL7tS/XtXt9NP39vHv
   EoxbJTJHTbDeUW5MIw2bW9Ixs0p+tQQuVYm/kHhk2CawECgbfUvG9tbPo
   qAzURmabxj7pWBwb3rgGaSBSCC/22BMAnEIs8U2do0rYTHtWxjVmECXpn
   GLLqF6VGHIVI96fsdOb3Arq9fzuV28dCG7r2dktbPvDpDBq9ntH+rQZFl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4637577"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4637577"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1032140"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2024 06:32:08 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXMUX-0001Ti-0l;
	Tue, 06 Feb 2024 14:32:05 +0000
Date: Tue, 6 Feb 2024 22:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>, NeilBrown <neilb@suse.de>
Subject: [linux-next:master 4030/4465] fs/ceph/locks.c:379:27: warning:
 unused variable 'lock'
Message-ID: <202402062210.3YyBVGF1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac139fc7db67968e5061715508b5fc4aa7c40c56
commit: 75e9570c93c70e8ad7be59cce82cea3872d8e8a7 [4030/4465] ceph: convert to using new filelock helpers
config: arm-randconfig-r071-20240206 (https://download.01.org/0day-ci/archive/20240206/202402062210.3YyBVGF1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062210.3YyBVGF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062210.3YyBVGF1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/locks.c: In function 'ceph_count_locks':
>> fs/ceph/locks.c:379:27: warning: unused variable 'lock' [-Wunused-variable]
     379 |         struct file_lock *lock;
         |                           ^~~~


vim +/lock +379 fs/ceph/locks.c

40819f6fb227c1 Greg Farnum 2010-08-02  371  
5263e31e452fb8 Jeff Layton 2015-01-16  372  /*
5263e31e452fb8 Jeff Layton 2015-01-16  373   * Fills in the passed counter variables, so you can prepare pagelist metadata
5263e31e452fb8 Jeff Layton 2015-01-16  374   * before calling ceph_encode_locks.
40819f6fb227c1 Greg Farnum 2010-08-02  375   */
40819f6fb227c1 Greg Farnum 2010-08-02  376  void ceph_count_locks(struct inode *inode, int *fcntl_count, int *flock_count)
40819f6fb227c1 Greg Farnum 2010-08-02  377  {
38d46409c4639a Xiubo Li    2023-06-12  378  	struct ceph_client *cl = ceph_inode_to_client(inode);
e084c1bd409269 Jeff Layton 2015-02-16 @379  	struct file_lock *lock;
5263e31e452fb8 Jeff Layton 2015-01-16  380  	struct file_lock_context *ctx;
40819f6fb227c1 Greg Farnum 2010-08-02  381  
40819f6fb227c1 Greg Farnum 2010-08-02  382  	*fcntl_count = 0;
40819f6fb227c1 Greg Farnum 2010-08-02  383  	*flock_count = 0;
40819f6fb227c1 Greg Farnum 2010-08-02  384  
d4e78663f6bc83 Jeff Layton 2022-11-16  385  	ctx = locks_inode_context(inode);
5263e31e452fb8 Jeff Layton 2015-01-16  386  	if (ctx) {
e084c1bd409269 Jeff Layton 2015-02-16  387  		spin_lock(&ctx->flc_lock);
75e9570c93c70e Jeff Layton 2024-01-31  388  		for_each_file_lock(lock, &ctx->flc_posix)
e084c1bd409269 Jeff Layton 2015-02-16  389  			++(*fcntl_count);
75e9570c93c70e Jeff Layton 2024-01-31  390  		for_each_file_lock(lock, &ctx->flc_flock)
e084c1bd409269 Jeff Layton 2015-02-16  391  			++(*flock_count);
e084c1bd409269 Jeff Layton 2015-02-16  392  		spin_unlock(&ctx->flc_lock);
bd61e0a9c852de Jeff Layton 2015-01-16  393  	}
38d46409c4639a Xiubo Li    2023-06-12  394  	doutc(cl, "counted %d flock locks and %d fcntl locks\n",
40819f6fb227c1 Greg Farnum 2010-08-02  395  	      *flock_count, *fcntl_count);
40819f6fb227c1 Greg Farnum 2010-08-02  396  }
40819f6fb227c1 Greg Farnum 2010-08-02  397  

:::::: The code at line 379 was first introduced by commit
:::::: e084c1bd40926938ff8d26af3bde34396dd4d06d Revert "locks: keep a count of locks on the flctx lists"

:::::: TO: Jeff Layton <jeff.layton@primarydata.com>
:::::: CC: Jeff Layton <jeff.layton@primarydata.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
