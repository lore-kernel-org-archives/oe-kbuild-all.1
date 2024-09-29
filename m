Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CD326AE4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630687; cv=none; b=aCWSITeG5fqQ57pSnMFAUKvnnWMQw1KGcULuCIDGM5x1TecSyfkmXiLM+6G0wZBZ8a+lyRuBUHVzT+mBp/NlXX59TEfFfc/Ftzd639oqnDGEjdcqFgJxKITFMxM5i1z/o02RzEfD9gFoUPZxnzLtVRB9IywjODjXf3ow/4WRr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630687; c=relaxed/simple;
	bh=iSP9vjolndF4Q2war3BDHHC39ZbiFgmQqgYHNttGpaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XcFC8qrjoO1lX2Ph4hPWogMb0CXHWwrUqKLUleTw9w5gmzITYuDrJa9DpnXe+LCoiOttzfIkcTH1Q5uJzBBexP3a0hHQVhlBrWqDG05zm7OIU7TK1vmqR0wwxQJ1FPighaCFJf2eBaYYaIjfA7cZMS/qyEAa1Q9TRD7Vf11H2LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEq+zlJb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEq+zlJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727630685; x=1759166685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iSP9vjolndF4Q2war3BDHHC39ZbiFgmQqgYHNttGpaA=;
  b=oEq+zlJbg4jg6YccWIOfLnFl2b1j7w6G0blYNtk4jEFX7lXcw3xcpZEv
   +wP7Ky87wV7b6RCliTpcVAW9Q66X0Mrwkueb8ib0Ip7FqnHQEewCRIebR
   ELng6b4EjrIblY5nN715kHLgFpbW1+OS9kbDxPRbks0Drh8GFjBl2pQ0c
   14opeZ1+7rqKdW++gBz4Z/TN3HChqKPeE55UT/tbHwcjxQg2RnkWSx5B/
   7kbz2Ds9YthB2RW+X13v+TIL5nK2BcnDqCDwCvepWQpZMjnxJl4NpgoK7
   oPMSsuagZNZZw38vSXaVgS8HaJcqYEl4hve2RpjkgL/uliiz4BWKOTt4j
   w==;
X-CSE-ConnectionGUID: LPwSzIpfTPyIgAeqoijLsw==
X-CSE-MsgGUID: 4XiHzFoESVGmNzE+Q9ZwXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26592682"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26592682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:24:44 -0700
X-CSE-ConnectionGUID: jQRoWIoVSSK9RZaykpZEuQ==
X-CSE-MsgGUID: 5aMNVubsTZuqKIZjA7bDtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="103858845"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Sep 2024 10:24:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxew-000OVB-12;
	Sun, 29 Sep 2024 17:24:38 +0000
Date: Mon, 30 Sep 2024 01:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 12021/12031] block/blk-cgroup.h:447:8: error:
 redefinition of 'struct blkg_policy_data'
Message-ID: <202409300116.co6W5K6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: 701147d7b1367cc8864bfc4540c3bc3ef937e96d [12021/12031] rue/io: support readwrite unified configuration
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240930/202409300116.co6W5K6y-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300116.co6W5K6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300116.co6W5K6y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from block/bio.c:26:
>> block/blk-cgroup.h:447:8: error: redefinition of 'struct blkg_policy_data'
     447 | struct blkg_policy_data {
         |        ^~~~~~~~~~~~~~~~
   In file included from block/blk-cgroup.h:17:
   include/linux/blk-cgroup.h:483:8: note: originally defined here
     483 | struct blkg_policy_data {
         |        ^~~~~~~~~~~~~~~~
>> block/blk-cgroup.h:456:8: error: redefinition of 'struct blkcg'
     456 | struct blkcg {
         |        ^~~~~
   include/linux/blk-cgroup.h:486:8: note: originally defined here
     486 | struct blkcg {
         |        ^~~~~
--
   In file included from block/blk-core.c:50:
>> block/blk-cgroup.h:447:8: error: redefinition of 'struct blkg_policy_data'
     447 | struct blkg_policy_data {
         |        ^~~~~~~~~~~~~~~~
   In file included from block/blk-cgroup.h:17:
   include/linux/blk-cgroup.h:483:8: note: originally defined here
     483 | struct blkg_policy_data {
         |        ^~~~~~~~~~~~~~~~
>> block/blk-cgroup.h:456:8: error: redefinition of 'struct blkcg'
     456 | struct blkcg {
         |        ^~~~~
   include/linux/blk-cgroup.h:486:8: note: originally defined here
     486 | struct blkcg {
         |        ^~~~~
   In file included from block/blk-throttle.h:4,
                    from block/blk-core.c:51:
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_read_counter':
>> block/blk-cgroup-rwstat.h:14:37: error: 'struct blkg_rwstat' has no member named 'aux_cnt'
      14 |         return atomic64_read(&rwstat->aux_cnt[idx]) +
         |                                     ^~
>> block/blk-cgroup-rwstat.h:15:52: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      15 |                 percpu_counter_sum_positive(&rwstat->cpu_cnt[idx]);
         |                                                    ^~
>> block/blk-cgroup-rwstat.h:12:30: warning: parameter 'idx' set but not used [-Wunused-but-set-parameter]
      12 |                 unsigned int idx)
         |                 ~~~~~~~~~~~~~^~~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_add':
   block/blk-cgroup-rwstat.h:43:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      43 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_DISCARD];
         |                              ^~
>> block/blk-cgroup-rwstat.h:43:40: error: 'BLKG_RWSTAT_DISCARD' undeclared (first use in this function); did you mean 'BLK_TC_DISCARD'?
      43 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_DISCARD];
         |                                        ^~~~~~~~~~~~~~~~~~~
         |                                        BLK_TC_DISCARD
   block/blk-cgroup-rwstat.h:43:40: note: each undeclared identifier is reported only once for each function it appears in
   block/blk-cgroup-rwstat.h:45:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      45 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_WRITE];
         |                              ^~
>> block/blk-cgroup-rwstat.h:45:40: error: 'BLKG_RWSTAT_WRITE' undeclared (first use in this function); did you mean 'BLK_TC_WRITE'?
      45 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_WRITE];
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        BLK_TC_WRITE
   block/blk-cgroup-rwstat.h:47:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      47 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_READ];
         |                              ^~
>> block/blk-cgroup-rwstat.h:47:40: error: 'BLKG_RWSTAT_READ' undeclared (first use in this function); did you mean 'BLK_TC_READ'?
      47 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_READ];
         |                                        ^~~~~~~~~~~~~~~~
         |                                        BLK_TC_READ
   block/blk-cgroup-rwstat.h:52:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      52 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_SYNC];
         |                              ^~
>> block/blk-cgroup-rwstat.h:52:40: error: 'BLKG_RWSTAT_SYNC' undeclared (first use in this function); did you mean 'BLK_TC_SYNC'?
      52 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_SYNC];
         |                                        ^~~~~~~~~~~~~~~~
         |                                        BLK_TC_SYNC
   block/blk-cgroup-rwstat.h:54:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      54 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_ASYNC];
         |                              ^~
>> block/blk-cgroup-rwstat.h:54:40: error: 'BLKG_RWSTAT_ASYNC' undeclared (first use in this function)
      54 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_ASYNC];
         |                                        ^~~~~~~~~~~~~~~~~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_read':
>> block/blk-cgroup-rwstat.h:70:25: error: 'BLKG_RWSTAT_NR' undeclared (first use in this function); did you mean 'BLK_STAT_H'?
      70 |         for (i = 0; i < BLKG_RWSTAT_NR; i++)
         |                         ^~~~~~~~~~~~~~
         |                         BLK_STAT_H
>> block/blk-cgroup-rwstat.h:71:23: error: 'struct blkg_rwstat_sample' has no member named 'cnt'
      71 |                 result->cnt[i] =
         |                       ^~
   block/blk-cgroup-rwstat.h:72:60: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      72 |                         percpu_counter_sum_positive(&rwstat->cpu_cnt[i]);
         |                                                            ^~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_total':
   block/blk-cgroup-rwstat.h:88:19: error: 'struct blkg_rwstat_sample' has no member named 'cnt'
      88 |         return tmp.cnt[BLKG_RWSTAT_READ] + tmp.cnt[BLKG_RWSTAT_WRITE];
         |                   ^
   block/blk-cgroup-rwstat.h:88:24: error: 'BLKG_RWSTAT_READ' undeclared (first use in this function); did you mean 'BLK_TC_READ'?
      88 |         return tmp.cnt[BLKG_RWSTAT_READ] + tmp.cnt[BLKG_RWSTAT_WRITE];
         |                        ^~~~~~~~~~~~~~~~
         |                        BLK_TC_READ
   block/blk-cgroup-rwstat.h:88:47: error: 'struct blkg_rwstat_sample' has no member named 'cnt'
      88 |         return tmp.cnt[BLKG_RWSTAT_READ] + tmp.cnt[BLKG_RWSTAT_WRITE];
         |                                               ^
   block/blk-cgroup-rwstat.h:88:52: error: 'BLKG_RWSTAT_WRITE' undeclared (first use in this function); did you mean 'BLK_TC_WRITE'?
      88 |         return tmp.cnt[BLKG_RWSTAT_READ] + tmp.cnt[BLKG_RWSTAT_WRITE];
         |                                                    ^~~~~~~~~~~~~~~~~
         |                                                    BLK_TC_WRITE
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_reset':
   block/blk-cgroup-rwstat.h:99:25: error: 'BLKG_RWSTAT_NR' undeclared (first use in this function); did you mean 'BLK_STAT_H'?
      99 |         for (i = 0; i < BLKG_RWSTAT_NR; i++) {
         |                         ^~~~~~~~~~~~~~
         |                         BLK_STAT_H
   block/blk-cgroup-rwstat.h:100:43: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
     100 |                 percpu_counter_set(&rwstat->cpu_cnt[i], 0);
         |                                           ^~
   block/blk-cgroup-rwstat.h:101:37: error: 'struct blkg_rwstat' has no member named 'aux_cnt'
     101 |                 atomic64_set(&rwstat->aux_cnt[i], 0);
         |                                     ^~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_add_aux':
   block/blk-cgroup-rwstat.h:115:17: error: 'BLKG_RWSTAT_NR' undeclared (first use in this function); did you mean 'BLK_STAT_H'?
     115 |         u64 sum[BLKG_RWSTAT_NR];
         |                 ^~~~~~~~~~~~~~
         |                 BLK_STAT_H
   block/blk-cgroup-rwstat.h:119:59: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
     119 |                 sum[i] = percpu_counter_sum_positive(&from->cpu_cnt[i]);
         |                                                           ^~
   block/blk-cgroup-rwstat.h:122:58: error: 'struct blkg_rwstat' has no member named 'aux_cnt'
     122 |                 atomic64_add(sum[i] + atomic64_read(&from->aux_cnt[i]),
         |                                                          ^~
   block/blk-cgroup-rwstat.h:123:33: error: 'struct blkg_rwstat' has no member named 'aux_cnt'
     123 |                              &to->aux_cnt[i]);
         |                                 ^~
>> block/blk-cgroup-rwstat.h:115:13: warning: unused variable 'sum' [-Wunused-variable]
     115 |         u64 sum[BLKG_RWSTAT_NR];
         |             ^~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from block/blk-core.c:15:
   block/blk-throttle.h: In function 'pd_to_tg':
>> include/linux/container_of.h:20:54: error: 'struct throtl_grp' has no member named 'pd'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   block/blk-throttle.h:16:21: note: in expansion of macro 'container_of'
      16 |         return pd ? container_of(pd, struct throtl_grp, pd) : NULL;
         |                     ^~~~~~~~~~~~
>> include/linux/compiler_types.h:384:27: error: expression in static assertion is not an integer
     384 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   block/blk-throttle.h:16:21: note: in expansion of macro 'container_of'
      16 |         return pd ? container_of(pd, struct throtl_grp, pd) : NULL;
         |                     ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/limits.h:6,
                    from include/linux/kernel.h:16:
>> include/linux/stddef.h:16:33: error: 'struct throtl_grp' has no member named 'pd'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   block/blk-throttle.h:16:21: note: in expansion of macro 'container_of'
      16 |         return pd ? container_of(pd, struct throtl_grp, pd) : NULL;
         |                     ^~~~~~~~~~~~
--
   In file included from block/blk-cgroup-rwstat.h:9,
                    from block/blk-throttle.h:4,
                    from block/genhd.c:30:
>> block/blk-cgroup.h:447:8: error: redefinition of 'struct blkg_policy_data'
     447 | struct blkg_policy_data {
         |        ^~~~~~~~~~~~~~~~
   In file included from block/blk-cgroup.h:17:
   include/linux/blk-cgroup.h:483:8: note: originally defined here
     483 | struct blkg_policy_data {
         |        ^~~~~~~~~~~~~~~~
>> block/blk-cgroup.h:456:8: error: redefinition of 'struct blkcg'
     456 | struct blkcg {
         |        ^~~~~
   include/linux/blk-cgroup.h:486:8: note: originally defined here
     486 | struct blkcg {
         |        ^~~~~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_read_counter':
>> block/blk-cgroup-rwstat.h:14:37: error: 'struct blkg_rwstat' has no member named 'aux_cnt'
      14 |         return atomic64_read(&rwstat->aux_cnt[idx]) +
         |                                     ^~
>> block/blk-cgroup-rwstat.h:15:52: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      15 |                 percpu_counter_sum_positive(&rwstat->cpu_cnt[idx]);
         |                                                    ^~
>> block/blk-cgroup-rwstat.h:12:30: warning: parameter 'idx' set but not used [-Wunused-but-set-parameter]
      12 |                 unsigned int idx)
         |                 ~~~~~~~~~~~~~^~~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_add':
   block/blk-cgroup-rwstat.h:43:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      43 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_DISCARD];
         |                              ^~
>> block/blk-cgroup-rwstat.h:43:40: error: 'BLKG_RWSTAT_DISCARD' undeclared (first use in this function); did you mean 'BLK_TC_DISCARD'?
      43 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_DISCARD];
         |                                        ^~~~~~~~~~~~~~~~~~~
         |                                        BLK_TC_DISCARD
   block/blk-cgroup-rwstat.h:43:40: note: each undeclared identifier is reported only once for each function it appears in
   block/blk-cgroup-rwstat.h:45:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      45 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_WRITE];
         |                              ^~
>> block/blk-cgroup-rwstat.h:45:40: error: 'BLKG_RWSTAT_WRITE' undeclared (first use in this function); did you mean 'BLK_TC_WRITE'?
      45 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_WRITE];
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        BLK_TC_WRITE
   block/blk-cgroup-rwstat.h:47:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      47 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_READ];
         |                              ^~
>> block/blk-cgroup-rwstat.h:47:40: error: 'BLKG_RWSTAT_READ' undeclared (first use in this function); did you mean 'BLK_TC_READ'?
      47 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_READ];
         |                                        ^~~~~~~~~~~~~~~~
         |                                        BLK_TC_READ
   block/blk-cgroup-rwstat.h:52:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      52 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_SYNC];
         |                              ^~
>> block/blk-cgroup-rwstat.h:52:40: error: 'BLKG_RWSTAT_SYNC' undeclared (first use in this function); did you mean 'BLK_TC_SYNC'?
      52 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_SYNC];
         |                                        ^~~~~~~~~~~~~~~~
         |                                        BLK_TC_SYNC
   block/blk-cgroup-rwstat.h:54:30: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      54 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_ASYNC];
         |                              ^~
>> block/blk-cgroup-rwstat.h:54:40: error: 'BLKG_RWSTAT_ASYNC' undeclared (first use in this function)
      54 |                 cnt = &rwstat->cpu_cnt[BLKG_RWSTAT_ASYNC];
         |                                        ^~~~~~~~~~~~~~~~~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_read':
   block/blk-cgroup-rwstat.h:70:25: error: 'BLKG_RWSTAT_NR' undeclared (first use in this function)
      70 |         for (i = 0; i < BLKG_RWSTAT_NR; i++)
         |                         ^~~~~~~~~~~~~~
>> block/blk-cgroup-rwstat.h:71:23: error: 'struct blkg_rwstat_sample' has no member named 'cnt'
      71 |                 result->cnt[i] =
         |                       ^~
   block/blk-cgroup-rwstat.h:72:60: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
      72 |                         percpu_counter_sum_positive(&rwstat->cpu_cnt[i]);
         |                                                            ^~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_total':
   block/blk-cgroup-rwstat.h:88:19: error: 'struct blkg_rwstat_sample' has no member named 'cnt'
      88 |         return tmp.cnt[BLKG_RWSTAT_READ] + tmp.cnt[BLKG_RWSTAT_WRITE];
         |                   ^
   block/blk-cgroup-rwstat.h:88:24: error: 'BLKG_RWSTAT_READ' undeclared (first use in this function); did you mean 'BLK_TC_READ'?
      88 |         return tmp.cnt[BLKG_RWSTAT_READ] + tmp.cnt[BLKG_RWSTAT_WRITE];
         |                        ^~~~~~~~~~~~~~~~
         |                        BLK_TC_READ
   block/blk-cgroup-rwstat.h:88:47: error: 'struct blkg_rwstat_sample' has no member named 'cnt'
      88 |         return tmp.cnt[BLKG_RWSTAT_READ] + tmp.cnt[BLKG_RWSTAT_WRITE];
         |                                               ^
   block/blk-cgroup-rwstat.h:88:52: error: 'BLKG_RWSTAT_WRITE' undeclared (first use in this function); did you mean 'BLK_TC_WRITE'?
      88 |         return tmp.cnt[BLKG_RWSTAT_READ] + tmp.cnt[BLKG_RWSTAT_WRITE];
         |                                                    ^~~~~~~~~~~~~~~~~
         |                                                    BLK_TC_WRITE
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_reset':
   block/blk-cgroup-rwstat.h:99:25: error: 'BLKG_RWSTAT_NR' undeclared (first use in this function)
      99 |         for (i = 0; i < BLKG_RWSTAT_NR; i++) {
         |                         ^~~~~~~~~~~~~~
   block/blk-cgroup-rwstat.h:100:43: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
     100 |                 percpu_counter_set(&rwstat->cpu_cnt[i], 0);
         |                                           ^~
   block/blk-cgroup-rwstat.h:101:37: error: 'struct blkg_rwstat' has no member named 'aux_cnt'
     101 |                 atomic64_set(&rwstat->aux_cnt[i], 0);
         |                                     ^~
   block/blk-cgroup-rwstat.h: In function 'blkg_rwstat_add_aux':
   block/blk-cgroup-rwstat.h:115:17: error: 'BLKG_RWSTAT_NR' undeclared (first use in this function)
     115 |         u64 sum[BLKG_RWSTAT_NR];
         |                 ^~~~~~~~~~~~~~
   block/blk-cgroup-rwstat.h:119:59: error: 'struct blkg_rwstat' has no member named 'cpu_cnt'
     119 |                 sum[i] = percpu_counter_sum_positive(&from->cpu_cnt[i]);
         |                                                           ^~
   block/blk-cgroup-rwstat.h:122:58: error: 'struct blkg_rwstat' has no member named 'aux_cnt'
     122 |                 atomic64_add(sum[i] + atomic64_read(&from->aux_cnt[i]),
         |                                                          ^~
   block/blk-cgroup-rwstat.h:123:33: error: 'struct blkg_rwstat' has no member named 'aux_cnt'
     123 |                              &to->aux_cnt[i]);
         |                                 ^~
>> block/blk-cgroup-rwstat.h:115:13: warning: unused variable 'sum' [-Wunused-variable]
     115 |         u64 sum[BLKG_RWSTAT_NR];
         |             ^~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from block/genhd.c:8:
   block/blk-throttle.h: In function 'pd_to_tg':
>> include/linux/container_of.h:20:54: error: 'struct throtl_grp' has no member named 'pd'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   block/blk-throttle.h:16:21: note: in expansion of macro 'container_of'
      16 |         return pd ? container_of(pd, struct throtl_grp, pd) : NULL;
         |                     ^~~~~~~~~~~~
>> include/linux/compiler_types.h:384:27: error: expression in static assertion is not an integer
     384 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   block/blk-throttle.h:16:21: note: in expansion of macro 'container_of'
      16 |         return pd ? container_of(pd, struct throtl_grp, pd) : NULL;
         |                     ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/loongarch/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5:
>> include/linux/stddef.h:16:33: error: 'struct throtl_grp' has no member named 'pd'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   block/blk-throttle.h:16:21: note: in expansion of macro 'container_of'
      16 |         return pd ? container_of(pd, struct throtl_grp, pd) : NULL;
         |                     ^~~~~~~~~~~~


vim +447 block/blk-cgroup.h

672fdcf0e7de3b1 Ming Lei          2022-02-11  446  
672fdcf0e7de3b1 Ming Lei          2022-02-11 @447  struct blkg_policy_data {
672fdcf0e7de3b1 Ming Lei          2022-02-11  448  };
672fdcf0e7de3b1 Ming Lei          2022-02-11  449  
672fdcf0e7de3b1 Ming Lei          2022-02-11  450  struct blkcg_policy_data {
672fdcf0e7de3b1 Ming Lei          2022-02-11  451  };
672fdcf0e7de3b1 Ming Lei          2022-02-11  452  
672fdcf0e7de3b1 Ming Lei          2022-02-11  453  struct blkcg_policy {
672fdcf0e7de3b1 Ming Lei          2022-02-11  454  };
672fdcf0e7de3b1 Ming Lei          2022-02-11  455  
bbb1ebe7a909db4 Christoph Hellwig 2022-04-20 @456  struct blkcg {
bbb1ebe7a909db4 Christoph Hellwig 2022-04-20  457  };
bbb1ebe7a909db4 Christoph Hellwig 2022-04-20  458  

:::::: The code at line 447 was first introduced by commit
:::::: 672fdcf0e7de3b1e39416ac85abf178f023271f1 block: partition include/linux/blk-cgroup.h

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
