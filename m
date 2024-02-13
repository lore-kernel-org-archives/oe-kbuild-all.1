Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB163127
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 23:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707867625; cv=none; b=m+EC7Wb0SFAP9YLlpo58OxwHIgFxp5+BbNWLhujOSl1rdrNiHs+V3Kyz7jdIh45sLhTqyl3Wc6MuXg+Bf2ktk39hpQP5EVDZQspn1BzLgbsNJDO6ZlS9mm0aMHK4drdfEoZ3SZ0mNUBPxS4CBm1MZtw0kcnPFCByi7EbJANN2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707867625; c=relaxed/simple;
	bh=ixD7N2yn+uwJYiROprOI4raNXxb+TxwvKbmmYK/SU0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7oMgD5cT2x4IfUcB6Ot5HL8x1Oyc3sv5JeDuf2L99yUsJWvDYP29fvj879gH2i5AGUDfRmAypAKa9O9Uz6RcMtuKckR65QhhAOHxeB8pjyOmBZrLcXBvJdVWGHDYfk4QxppNppoT6Dn8DvhainMPl+ZgU07vwcSPPDaL+Ae4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYceXvMe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYceXvMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707867623; x=1739403623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixD7N2yn+uwJYiROprOI4raNXxb+TxwvKbmmYK/SU0Y=;
  b=dYceXvMeepVOabp9weaBg/NLsegdxvdM8Lu05qgnraz5q803oJkG+TG7
   G0dcGqQF3/qgJ8gunjzwo+CgcE02+WwEUFeEfYwoFpJfkPrEX4dgsHEuY
   GviXh/f7UAWWAB+Kg1dZ+Zo5d0S5znBxhOLz40K8+yRZH5XGCb9qER0+y
   yqRhPboYnQOFwdpdCUuvbTIY/3dpHXORf5ENodHRXli9lketX4WVG8Fs+
   wjkRBk5uIXMdhKh1AtphR1MY05hpED4bdnffpdNCALnmD8kg5o8ymhzfC
   5EM7sQc0RKp1TT9KiXy1en8ZI5BKBoH4nrEb9pAaUa10PZj1rB502/Kqz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12620488"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="12620488"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 15:40:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7681683"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Feb 2024 15:40:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra2Nu-00089Y-0N;
	Tue, 13 Feb 2024 23:40:18 +0000
Date: Wed, 14 Feb 2024 07:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-perf 3/5]
 include/linux/fsnotify_backend.h:504:48: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202402140721.wpsybKbh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   7ca5d81f2ffa3303ed4c1d54af3248f38b5a1576
commit: 2ccb035f66111d6c6208ff895cdb945d5776e920 [3/5] fsnotify: attach sb connector for the lifetime of sb
config: x86_64-randconfig-122-20240213 (https://download.01.org/0day-ci/archive/20240214/202402140721.wpsybKbh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140721.wpsybKbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140721.wpsybKbh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/notify/fsnotify.c:386:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:386:16: sparse:    struct fsnotify_mark_connector [noderef] __rcu *
   fs/notify/fsnotify.c:386:16: sparse:    struct fsnotify_mark_connector *
   fs/notify/fsnotify.c:388:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:388:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/notify/fsnotify.c:388:24: sparse:    struct hlist_node *
   fs/notify/fsnotify.c:398:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:398:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/notify/fsnotify.c:398:24: sparse:    struct hlist_node *
   fs/notify/fsnotify.c:563:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:563:38: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:563:38: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c:566:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:566:46: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:566:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c:570:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:570:46: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:570:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c:574:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:574:46: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:574:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c: note: in included file:
>> include/linux/fsnotify_backend.h:504:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsnotify_mark_connector *conn @@     got struct fsnotify_mark_connector [noderef] __rcu * @@
   include/linux/fsnotify_backend.h:504:48: sparse:     expected struct fsnotify_mark_connector *conn
   include/linux/fsnotify_backend.h:504:48: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *
--
   fs/notify/mark.c:599:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsnotify_mark_connector [noderef] __rcu *__new @@     got struct fsnotify_mark_connector *[assigned] conn @@
   fs/notify/mark.c:599:13: sparse:     expected struct fsnotify_mark_connector [noderef] __rcu *__new
   fs/notify/mark.c:599:13: sparse:     got struct fsnotify_mark_connector *[assigned] conn
   fs/notify/mark.c:339:9: sparse: sparse: context imbalance in 'fsnotify_put_mark' - unexpected unlock
   fs/notify/mark.c:619:39: sparse: sparse: context imbalance in 'fsnotify_grab_connector' - different lock contexts for basic block
   fs/notify/mark.c: note: in included file:
>> include/linux/fsnotify_backend.h:504:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsnotify_mark_connector *conn @@     got struct fsnotify_mark_connector [noderef] __rcu * @@
   include/linux/fsnotify_backend.h:504:48: sparse:     expected struct fsnotify_mark_connector *conn
   include/linux/fsnotify_backend.h:504:48: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *
   fs/notify/mark.c:718:20: sparse: sparse: context imbalance in 'fsnotify_add_mark_list' - unexpected unlock
   fs/notify/mark.c:798:25: sparse: sparse: context imbalance in 'fsnotify_find_mark' - unexpected unlock
   fs/notify/mark.c:872:17: sparse: sparse: context imbalance in 'fsnotify_destroy_marks' - unexpected unlock

vim +504 include/linux/fsnotify_backend.h

   500	
   501	static inline struct fsnotify_sb_connector *fsnotify_sb_connector(
   502								struct super_block *sb)
   503	{
 > 504		struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
   505	
   506		return conn ? FSN_SB_CONN(conn) : NULL;
   507	}
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
