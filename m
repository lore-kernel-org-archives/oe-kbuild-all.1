Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7AE5820E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711021608; cv=none; b=KvvnX5c2ptNGbB4DC+gdnz0YjQvXspKnl/ZofY6fiaWdEB83yOKvs65KZZHguAdFsuSGW9fOh8Zp+F1WqfinMzv52kyNb9QQlNbW37BcNYuBBHby/D3I3eRkKgJsr+TPdsNHoOCJBYFl1u/T8Sgd39AZ+ZgRfMVXGTRSxoVyPow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711021608; c=relaxed/simple;
	bh=0l5LPZC8q3ghJDq5fw1hcZxqP016+wSDXJkN4vAkN9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYfDb6/Q2RYns5+UsdEWPYEjGHh4CFcJsaO56QyEiHfCTxtHobee1nXq23ZSRxb+30Z00eQEfNXe9QOqzmcGkDE5G2BUswIuSd3Q2q8NxVkW8+muP/9COTMQ9/zEobH89BGB7gmno1OG5z0gCDhpBhKFu6cQfzJYV6bPjKHSKog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgFupRqH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgFupRqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711021605; x=1742557605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0l5LPZC8q3ghJDq5fw1hcZxqP016+wSDXJkN4vAkN9M=;
  b=kgFupRqHsS5SW/veFsi4aaxyOuBlIVhWo1/BcUAng/nrkW9kY0NsIpCd
   HvMtgCd5u+ms3dC0diJfdHlGG/GDpUieLIiSUGySCYO5hrvZaOI2nYo+3
   HICWxsat/xJAzpSItRxVxZOYIZL/42+8lAVDOgSR1DBY4k372klatBBwp
   7ZnYwWp1zWUtOmZQRjH8LGaea3Lxfma9fHjjcu6rT2fyDztIxaZr0EOJv
   XtmZXwxRCPh3vHGoRz+w+3fkFmBSC2ku6pQ1FxdrOtNY1L1ZRC68t3KG0
   dhFqE0utnt7YGwLSLx6xDujFtqXEDbXNEtI1odfxIEecPDG5kr5KnxCHq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6182474"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6182474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="19207102"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Mar 2024 04:46:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnGsc-000JNL-0k;
	Thu, 21 Mar 2024 11:46:42 +0000
Date: Thu, 21 Mar 2024 19:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 566/627] fs/verity/verify.c:391: warning:
 Function parameter or struct member 'sb' not described in
 'fsverity_enqueue_verify_work'
Message-ID: <202403211948.nzNJPqqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git twf-hoist
head:   709c2aed7586c3ac6a9d636355c623611d5c14d1
commit: d31a4aee9f1d98ba52cc871df07c35edc8e367e3 [566/627] fsverity: remove system-wide workqueue
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240321/202403211948.nzNJPqqx-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211948.nzNJPqqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211948.nzNJPqqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/verity/verify.c:391: warning: Function parameter or struct member 'sb' not described in 'fsverity_enqueue_verify_work'


vim +391 fs/verity/verify.c

2c5f5bfebb781a Darrick J. Wong 2024-03-19  382  
8a1d0f9cacc997 Eric Biggers    2019-07-22  383  /**
8a1d0f9cacc997 Eric Biggers    2019-07-22  384   * fsverity_enqueue_verify_work() - enqueue work on the fs-verity workqueue
6377a38bd345b7 Eric Biggers    2020-05-11  385   * @work: the work to enqueue
8a1d0f9cacc997 Eric Biggers    2019-07-22  386   *
8a1d0f9cacc997 Eric Biggers    2019-07-22  387   * Enqueue verification work for asynchronous processing.
8a1d0f9cacc997 Eric Biggers    2019-07-22  388   */
d31a4aee9f1d98 Darrick J. Wong 2024-03-20  389  void fsverity_enqueue_verify_work(struct super_block *sb,
d31a4aee9f1d98 Darrick J. Wong 2024-03-20  390  				  struct work_struct *work)
8a1d0f9cacc997 Eric Biggers    2019-07-22 @391  {
d31a4aee9f1d98 Darrick J. Wong 2024-03-20  392  	queue_work(sb->s_verify_wq, work);
8a1d0f9cacc997 Eric Biggers    2019-07-22  393  }
8a1d0f9cacc997 Eric Biggers    2019-07-22  394  EXPORT_SYMBOL_GPL(fsverity_enqueue_verify_work);
8a1d0f9cacc997 Eric Biggers    2019-07-22  395  

:::::: The code at line 391 was first introduced by commit
:::::: 8a1d0f9cacc997bedc017056a94f35dc823394ed fs-verity: add data verification hooks for ->readpages()

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
