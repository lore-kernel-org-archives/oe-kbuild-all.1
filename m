Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313351DF996
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729185464; cv=none; b=t1FAnQZ0rezYztPESPKvNxD9YHmCjZRDJF5ODZB82H0iYSs2LWl4SO7grbXCUUypk5NGaap3rWVVXnz47dTn372ZT6Nbt320++DJv1K/l16Rf1S7XSJ4mPNdKS+y7bkAGLbUxz/r2TV7Kf1Xpzv0w9uhvBi3ySJ5S8iSZjwP1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729185464; c=relaxed/simple;
	bh=wpvuEDXums1m6O521kOjxqffZakKuWvDVnAFZTZBgRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aH40j9qItUeuo+AScDlMIojzM0Ya21cbvBPBoNXev/xY9Z91uXP6KbMFKAIDo54eJboBA7czFeLN0K1pQ9P5K0YrIXOslnVM7pKQnlm+RkQ+jLIQoMQzM9xJos6/gSQnSGHcrlv6zVoUhe6M3c/wVdRl3DKoyNsnEu3M2amFPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OU2/BqG0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OU2/BqG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729185459; x=1760721459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wpvuEDXums1m6O521kOjxqffZakKuWvDVnAFZTZBgRM=;
  b=OU2/BqG0DJRuSCT3DpYLDP3GBfeuOqu91/CCRN90xBc0+IztaOJ0IDBr
   1DpaQcozAGmEy7rMKfSjrdbR8FLKhaiPDekEa0qrSXWbgmZZ/qKbAHMH4
   AnXRqSrKGYmqPXAhfDFc+dwCxUOF9icn1aYxeZvWm4RBK28Tqnbc5T+od
   12qIfaYLQ2cD0L09g2Q44GHCrg9J+xWLIoeIlgn+N0rmuKXvlPI6NrZzJ
   iKpH+BuUWLuAbHWq+myf+GNFjUNQN+T/XK+u8861W4OsUc49Pk6e/g7t4
   NPF/oXLJxi7/ts9Fxrd7UcbNsninsdILzGMxbHb1wbCKujgmrcqNoy371
   w==;
X-CSE-ConnectionGUID: SE7bhrWNQuuSiOLd6hVTdA==
X-CSE-MsgGUID: j4q0aq22QLy5/dtV2w+Qyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28898087"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="28898087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 10:17:39 -0700
X-CSE-ConnectionGUID: hkDxSFMIR8yzk0rlIhmlKw==
X-CSE-MsgGUID: ai2W42M+T2CM1vcLTZapgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78233914"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Oct 2024 10:17:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1U7z-000Mev-0N;
	Thu, 17 Oct 2024 17:17:35 +0000
Date: Fri, 18 Oct 2024 01:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: Naohiro Aota <naohiro.aota@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Qu Wenruo <wqu@suse.com>, Christoph Hellwig <hch@lst.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [linux-next:master 4259/5321] fs/btrfs/bio.c:132:17: sparse: sparse:
 cast from restricted blk_status_t
Message-ID: <202410180159.O8S1AyaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: c87222d18145c93b0ebd860ae9166afb1457129c [4259/5321] btrfs: fix error propagation of split bios
config: microblaze-randconfig-r133-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180159.O8S1AyaN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241018/202410180159.O8S1AyaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180159.O8S1AyaN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/bio.c:132:17: sparse: sparse: cast from restricted blk_status_t
>> fs/btrfs/bio.c:132:17: sparse: sparse: cast to restricted blk_status_t
   fs/btrfs/bio.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +132 fs/btrfs/bio.c

   116	
   117	void btrfs_bio_end_io(struct btrfs_bio *bbio, blk_status_t status)
   118	{
   119		bbio->bio.bi_status = status;
   120		if (bbio->bio.bi_pool == &btrfs_clone_bioset) {
   121			struct btrfs_bio *orig_bbio = bbio->private;
   122	
   123			btrfs_cleanup_bio(bbio);
   124			bbio = orig_bbio;
   125		}
   126	
   127		/*
   128		 * At this point, bbio always points to the original btrfs_bio. Save
   129		 * the first error in it.
   130		 */
   131		if (status != BLK_STS_OK)
 > 132			cmpxchg(&bbio->status, BLK_STS_OK, status);
   133	
   134		if (atomic_dec_and_test(&bbio->pending_ios)) {
   135			/* Load split bio's error which might be set above. */
   136			if (status == BLK_STS_OK)
   137				bbio->bio.bi_status = READ_ONCE(bbio->status);
   138			__btrfs_bio_end_io(bbio);
   139		}
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
