Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D877125B2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088854; cv=none; b=WIOrwZ8j4iBLc+kY7gPNuH8mWJruw5/YI+ThKKi/xmnq5Dq/iA0q7v+LolOhAIgsgklaaNHVKmyt9BrqOlWu8d17bB8oBKEeWpiXcMo825U3IsDJkmEzL48Teg8MM1V8K9LEvaOgWfp5UAOee3Hmt7p4y2Opk3+Turx/dCTVlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088854; c=relaxed/simple;
	bh=+rVkFSLTDu0soJmTwFTVvlqXvs18aGW7mHg4kxjI3IQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aVgN0AndHnZQG8CmE2LAaJvS3nOpNeyXeAumOpnb0sgzeeXNveSLyenq6A0DPHk+nrJhOGP8DJUfom72U4dHXf+IfMeDAhlltakd7FRIRCxkmGqeOaLOCnmB8krmjmGX8Zt6Ha6OHAuVDVRTQQf737bcGGuxt6Vrw89OYgxUj/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nygh2oK7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nygh2oK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767088852; x=1798624852;
  h=date:from:to:cc:subject:message-id;
  bh=+rVkFSLTDu0soJmTwFTVvlqXvs18aGW7mHg4kxjI3IQ=;
  b=Nygh2oK79Ke219m2jsNSIIuWEhVfwBk8U7Tw67qZ85BPSsWB1QxI4udH
   ZyE0mwwZ8qDHBw74eOiA35WyowVrQ8DIrolA8VEjOI0E66l2i5PqeYD+Y
   SJmn2uykgtbSmGzzoC8IRSbLdHA/aUGSariA+8cxPSNfH1o5F1JY0L3nz
   97zcyEdcfxpIhOOb5JVdQ03ekKnWS1/w3jEP5lW7X33zxyLFBM01cdT9F
   TbUKBjVI4vtxtRVakQaXG6i4EYwYc1QtOIdU8aY5mRM+fWPs3CxnGqWHM
   46/svqI7ByNQGm5ILwFKtVTp7ddz76mz6NwQKI6YqEd+zeF9X6CBp/aTF
   g==;
X-CSE-ConnectionGUID: PWjsi+kyTFifRk03rWHk6w==
X-CSE-MsgGUID: pGx9LmEMQzqDXEIEngVd9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86259332"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="86259332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:00:51 -0800
X-CSE-ConnectionGUID: 0GFor+BMQR27x3hRqzXvgQ==
X-CSE-MsgGUID: omB1pmS2SO+xzTVEtz8ILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206243824"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Dec 2025 02:00:51 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaWX2-000000000IS-2qLR;
	Tue, 30 Dec 2025 10:00:48 +0000
Date: Tue, 30 Dec 2025 18:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 41/41] Warning:
 net/netfilter/xt_quota2.c:47 Cannot find identifier on line:
Message-ID: <202512301720.5XVJwmHC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   f67716d31c857383550e6c15e675780ea62be6eb
commit: e9b494f04d4f01eca4146d044b6143afde11c3ff [41/41] Merge 2b60145734a0 ("Merge tag 'wq-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq") into android-mainline
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251230/202512301720.5XVJwmHC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512301720.5XVJwmHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301720.5XVJwmHC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/netfilter/xt_quota2.c:47 Cannot find identifier on line:
    * @lock:       lock to protect quota writers from each other
   Warning: net/netfilter/xt_quota2.c:48 Cannot find identifier on line:
    */
   Warning: net/netfilter/xt_quota2.c:49 Cannot find identifier on line:
   struct xt_quota_counter {
   Warning: net/netfilter/xt_quota2.c:50 Cannot find identifier on line:
           u_int64_t quota;
   Warning: net/netfilter/xt_quota2.c:51 Cannot find identifier on line:
           spinlock_t lock;
   Warning: net/netfilter/xt_quota2.c:52 Cannot find identifier on line:
           struct list_head list;
   Warning: net/netfilter/xt_quota2.c:53 Cannot find identifier on line:
           atomic_t ref;
   Warning: net/netfilter/xt_quota2.c:54 Cannot find identifier on line:
           char name[sizeof(((struct xt_quota_mtinfo2 *)NULL)->name)];
>> Warning: net/netfilter/xt_quota2.c:56 bad line: };
   Warning: net/netfilter/xt_quota2.c:57 bad line: 
>> Warning: net/netfilter/xt_quota2.c:58 bad line: #ifdef CONFIG_NETFILTER_XT_MATCH_QUOTA2_LOG
>> Warning: net/netfilter/xt_quota2.c:60 static int qlog_nl_event = 112; error: Cannot parse struct or union!
   Warning: net/netfilter/xt_quota2.c:200 function parameter 'q' not described in 'q2_get_counter'
   Warning: net/netfilter/xt_quota2.c:200 function parameter 'q' not described in 'q2_get_counter'
--
>> Warning: drivers/md/dm-default-key.c:50 expecting prototype for struct dm_default_c. Prototype was for struct default_key_c instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
