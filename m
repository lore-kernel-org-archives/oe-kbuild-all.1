Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91231B822
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 12:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072463; cv=none; b=irztYOimt7tOJLyH5Pl9WrrjxTRkos1LTYentnAvIc4eCycQU1NT8uyRk0iluJWICwBELTpdavxuVct2NWW1JxcKQW0KcNgjs4QloO1HK4UBzGDogky8C/XPTk2zTGpXksJ5zQN01OtXQsauC+KjoZrJ3yMksNnoB1PdzgxsEWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072463; c=relaxed/simple;
	bh=q689SXFSw+bA8HlC6pV07sXZDiD6ipRkxdVqiqUwJ4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8dSFvgKwlv04sAweFA74yQX9DxdQuZjn/066cgXmeqbzIlVHPgLTXX5QsXGdb/bEUtM7Lz5YVcjmcXoOt2LwOf6wF0ysI6PtXGAAC6tknbi9fEGOuBzXamNZHszJiRjUqqOMH14CZEkFwGP8G/FrQiN6eDShdYeR70toZLuQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/iRha45; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/iRha45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764072460; x=1795608460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q689SXFSw+bA8HlC6pV07sXZDiD6ipRkxdVqiqUwJ4M=;
  b=l/iRha45UcWX3RQp/4UqTGWveatbmBWPcu3wNonBFlqLtD/93OUcWXc9
   PJ5eE3VhBgp59ErYepAmiBQ0WJwC9LeX6ssI/MPtqVc7lW0vzbw5+S/Oe
   Ku+egzaI619gnq0nIxlAoc1mUqyo8gwZ0Y8ZB1Sja7QjqCnbnizQ22orJ
   cHMdkkXaASAZvNHyzNgqYdAmAwHes5ozNnI/oLYBqjzttjmcYE5m++Q4O
   r+1Novf0OORSFAcX5N2Ca6gQlcEo56sPOGuoxDh0uoeyqAWBoYkRkxGqB
   HxucrYnf8aLiIw3p7vprydvlktk78hl7TCtLUpd2DsRKyfOoeZMatSFsL
   Q==;
X-CSE-ConnectionGUID: uZvQmZCZRYG3mtxWXr53RA==
X-CSE-MsgGUID: vaOK4BivSXOnHQH6xQgUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65271995"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="65271995"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 04:07:40 -0800
X-CSE-ConnectionGUID: /s/cz45zT+GU7ULFey3eIg==
X-CSE-MsgGUID: ymqzsSV7THOX23ZbkP/oaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223297134"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2025 04:07:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNrpX-000000001lI-3oDB;
	Tue, 25 Nov 2025 12:07:35 +0000
Date: Tue, 25 Nov 2025 20:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316] kernel/xsched/core.c:497:12: warning:
 no previous prototype for 'xsched_sched_init'
Message-ID: <202511251921.jfyR52m4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c1bc27c0f90c1e34d319455cb1e28b2705987616
commit: 832ec54e11a079d968d8f23780ab455b1537b214 [3316/3316] xsched: Add xsched RT class
config: x86_64-buildonly-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251921.jfyR52m4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251921.jfyR52m4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251921.jfyR52m4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/xsched/core.c:189:5: warning: no previous prototype for 'xsched_xse_set_class' [-Wmissing-prototypes]
     189 | int xsched_xse_set_class(struct xsched_entity *xse)
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/xsched/core.c:497:12: warning: no previous prototype for 'xsched_sched_init' [-Wmissing-prototypes]
     497 | __init int xsched_sched_init(void)
         |            ^~~~~~~~~~~~~~~~~
--
>> kernel/xsched/rt.c:207:6: warning: no previous prototype for 'rq_init_rt' [-Wmissing-prototypes]
     207 | void rq_init_rt(struct xsched_cu *xcu)
         |      ^~~~~~~~~~
>> kernel/xsched/rt.c:218:6: warning: no previous prototype for 'xse_init_rt' [-Wmissing-prototypes]
     218 | void xse_init_rt(struct xsched_entity *xse)
         |      ^~~~~~~~~~~
>> kernel/xsched/rt.c:228:6: warning: no previous prototype for 'xse_deinit_rt' [-Wmissing-prototypes]
     228 | void xse_deinit_rt(struct xsched_entity *xse)
         |      ^~~~~~~~~~~~~


vim +/xsched_sched_init +497 kernel/xsched/core.c

   496	
 > 497	__init int xsched_sched_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
