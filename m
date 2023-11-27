Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715741108
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VID14HRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092803; x=1732628803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0nmfTqIXCskQILQe48b8NzPXmI0ClO8fcE1j6rSB6fw=;
  b=VID14HRFRrBDmSsGXTD7NDoF1QfWsiGjC1qQ57ig4rgs1xSfXAhYs4Hj
   w5iM00nhJy+C81tA2swIBCD+/Ai7JqCD1Es/6tGOfjn3T2FZXQIY8OGu5
   OEIFsyyfE8rqP6inWzK04J70hHll2paLgFpmN7rVid5Eu4yA6gnz2Bi95
   sILiYICWeqdcX0EP2ATnPDvowX080kmPRqh+ACSFx2BAVDTHQJI2h+M1p
   JrCQ602xgGs3b6AYEe5A5Xtmrxs1Sqxz0LSh20P5wMP0kJcr8QLNokAFS
   F7vtslzsVy31UMR5LKgO9x3lXohNe6kTWC5n+/gNg97VAJXSqcZQPt8DH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372865022"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372865022"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1015575950"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="1015575950"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2023 05:46:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7bwb-0006Hk-0d;
	Mon, 27 Nov 2023 13:46:37 +0000
Date: Mon, 27 Nov 2023 21:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3379/3551] fs/bcachefs/buckets.c:316:21: sparse:
 sparse: symbol 'bucket_m_to_alloc' was not declared. Should it be static?
Message-ID: <202311271915.K18wKCP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48bbaf8b793e0770798519f8ee1ea2908ff0943a
commit: 8192d6956cb6798c4cb28d35712373c9af7897bf [3379/3551] bcachefs: New bucket sector count helpers
config: i386-randconfig-062-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271915.K18wKCP3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271915.K18wKCP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271915.K18wKCP3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/buckets.c: note: in included file:
   fs/bcachefs/bcachefs.h:965:9: sparse: sparse: array of flexible structures
   fs/bcachefs/buckets.c: note: in included file (through fs/bcachefs/btree_types.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/replicas_types.h:24:34: sparse: sparse: array of flexible structures
>> fs/bcachefs/buckets.c:316:21: sparse: sparse: symbol 'bucket_m_to_alloc' was not declared. Should it be static?

vim +/bucket_m_to_alloc +316 fs/bcachefs/buckets.c

   315	
 > 316	struct bch_alloc_v4 bucket_m_to_alloc(struct bucket b)
   317	{
   318		return (struct bch_alloc_v4) {
   319			.gen		= b.gen,
   320			.data_type	= b.data_type,
   321			.dirty_sectors	= b.dirty_sectors,
   322			.cached_sectors	= b.cached_sectors,
   323			.stripe		= b.stripe,
   324		};
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
