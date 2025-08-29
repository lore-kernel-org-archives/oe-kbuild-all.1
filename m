Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F778237172
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 20:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756500318; cv=none; b=rZfE8k6m8n/I77iIncJvMbToM0bSWg3ygmLBazwob9kHbFpf1PmgqYZH0mwxk4DkCi1e5wOXqyBrNkRLisY2KaUl9nDuyrdIKwsODSgQ6xOxcrriPhGtmz/s9m7yWj+Cv1pfzmdM5UPklKeWNK6fa6E2hMkQMkIlwvdrVGJcxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756500318; c=relaxed/simple;
	bh=HBe8msaGfnWYHJycdEfmZ76oRSBDoqQAcYCDpWRMzvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ToTLBrv4mHnMpWNLuD8DqnIfSsFtvKewf+EO56LEppNnPhmCzBrwPCmzRYdZG9TcxyJ+s6+ZXlekx+RSgciVmaXNLAlE37wa7+L2++J8t0rqZdZZRQHw3yXypeuYIQD2Xs+jwZm9ch8VCZvoInRI8cGFi1s+zgB3TMFTuN3/nzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdlD6nmB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdlD6nmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756500317; x=1788036317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBe8msaGfnWYHJycdEfmZ76oRSBDoqQAcYCDpWRMzvY=;
  b=fdlD6nmBl3SuDfVhXkfNYm+n7RH7Krfy1G6tQUNrM0vy7PYMr5ymPCnF
   RYspurTRa37W7PDHijxUMTk9xUhtF1km5+JxsajxXTikKVbozZs87sZdM
   IsLlGrwgtFTcf8H76olsGUhLER6l4J9qTY5FciynegriT08iQw558Mtjj
   w71h9p7O6KtZ/RXPDKx3a7kET94VYmzgC/hxIWBvQmVYmnKm8fVRLb4K6
   DCALVWJUvSPANNmFh4f0jrOy5iOhCgh1W4O7cTTqMULJO3N80mNRRMDt9
   5wJiPo9s03Ud0NvYxjK/vimV+sI3EQYq/jlC+BgquR0lvCQ5AWaHLOhpX
   Q==;
X-CSE-ConnectionGUID: iR1ZussxQriEuyc+kmct9A==
X-CSE-MsgGUID: SDOceGv5TuuNoCQOcxVgCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="84200345"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="84200345"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 13:45:16 -0700
X-CSE-ConnectionGUID: umDUNHVeTW+lfAYiR3v2kw==
X-CSE-MsgGUID: qaBi+C6dQYmu9CxN5oJAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170369674"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Aug 2025 13:45:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us5yC-000Uxh-1S;
	Fri, 29 Aug 2025 20:45:12 +0000
Date: Sat, 30 Aug 2025 04:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-perf-core-ANBZ23411 0/26]
 mm/shrinker.c:688:6: warning: no previous prototype for
 'register_shrinker_prepared'
Message-ID: <202508300450.GatgX1UY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-perf-core-ANBZ23411
head:   ca90878d49ef2c923d72947e387bfafc2c6d1b89
commit: f1dadc895ed84d664e6d2d008be8225d3b051db7 [0/26] mm: shrinker: remove old APIs
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250830/202508300450.GatgX1UY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300450.GatgX1UY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300450.GatgX1UY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_shrinker_prepared +688 mm/shrinker.c

314369bb029a4d Qi Zheng 2023-09-11  687  
314369bb029a4d Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
314369bb029a4d Qi Zheng 2023-09-11  689  {
314369bb029a4d Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
314369bb029a4d Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
314369bb029a4d Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
314369bb029a4d Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
314369bb029a4d Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
314369bb029a4d Qi Zheng 2023-09-11  695  }
314369bb029a4d Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: 314369bb029a4d7f5018a64217e28d549e42fb65 mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
