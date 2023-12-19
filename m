Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51F14F68
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCUeEQTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702972773; x=1734508773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0upSswZ0Xd6dcT/oM8lNS0OH1ttggCDjkiIsk5hjd4=;
  b=LCUeEQTWM5dX8OP5jN9EZXtiJadw6exU+EmJ08ZK3DogMloNp9p3eRUW
   lljWwTqk74Ts24/iIrg8jy7qvgAhYlQmvMPoHqArlO02fh2s1BYAkV7G8
   hFHjPMwCoSzEimF7idxHA74DRB0IR9AOMheYgXmEtvL0l04KOg+1VHGZu
   5Tt2NsWsDutXYYNyZOonPNea5QWTqxmc/G/MJbObSY9/szB/4p7PFDQ7l
   5RNcUlqK30dfdykjoFNSkheHfpEb6DxspyDBnAs5Z6fT/vPGH61nuDwLz
   uLNSdYTjBdrXOFApeh+ufQtTPO8KS4xtSLjSf2ZkqAiFdJ18xB79yRhKD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="8994651"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="8994651"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 23:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="846253287"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="846253287"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2023 23:59:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFV0j-00050h-1w;
	Tue, 19 Dec 2023 07:59:29 +0000
Date: Tue, 19 Dec 2023 15:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:mq-deadline 4/4] block/mq-deadline.c:118:17: warning:
 'prio_to_ioprio_class' defined but not used
Message-ID: <202312191501.5J9jn1Eo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux mq-deadline
head:   f6b0783d68d20926e1e54a081cfd5d85a05e4cfd
commit: f6b0783d68d20926e1e54a081cfd5d85a05e4cfd [4/4] block/mq-deadline: Prevent zoned write reordering due to I/O prioritization
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231219/202312191501.5J9jn1Eo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191501.5J9jn1Eo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191501.5J9jn1Eo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/mq-deadline.c:118:17: warning: 'prio_to_ioprio_class' defined but not used [-Wunused-const-variable=]
     118 | static const u8 prio_to_ioprio_class[] = {
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/prio_to_ioprio_class +118 block/mq-deadline.c

   117	
 > 118	static const u8 prio_to_ioprio_class[] = {
   119		[DD_RT_PRIO]	= IOPRIO_CLASS_RT,
   120		[DD_BE_PRIO]	= IOPRIO_CLASS_BE,
   121		[DD_IDLE_PRIO]	= IOPRIO_CLASS_IDLE,
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
