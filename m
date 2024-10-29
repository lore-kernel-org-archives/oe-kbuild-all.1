Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D1205ACD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730231793; cv=none; b=bbO7+OJcZIuUquaOGcULtOqrD9DmLIrZIyNEUcq4L/0x8bMEN9BHyl6mr+FYzTGX5n2Ob0fnIUdBXEJ76LQvYR4OyMClVhjZ2d/FlpRXZ/8pD8ihqjssf5xz54xujf90Z+Z3XGYs2JGx9RAxhTCaQIABgecSvR7QtoI7dR6CpYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730231793; c=relaxed/simple;
	bh=O3SyNavAYgHfqrP34bthEuGismgMjg2Ut/EVoAfYr6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owOVLYtp9VjoA2C2sjPuibX77KMk6bCkiazLxhx5Z+I5X8el1c5tpaw+T8uIOUiKDnGpcUKcyqgumd3e91fbpYTGHnfJ/MeFa2AC3OId2QPlUgdPXgOnZu+nU6XNS1KRPZxU1IrXWu9ktr2/j9QW3xBQIEczaY/9iNftV2g4WlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEfkzs8u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEfkzs8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730231791; x=1761767791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3SyNavAYgHfqrP34bthEuGismgMjg2Ut/EVoAfYr6k=;
  b=KEfkzs8u4cEjDpMA5X3Zq2LO6AgqnJE+sreerHDnCTO5Yun/dPOF00lT
   LsDwTRHs6NtcpC170haSnkFtEDN/wJM2d4k6HLhr/E8yHiFMtbWAsZmOr
   iK2N9H+98h2uAXES5al+aWPNlOYKyqfMTT+x9UkN+Ke+PbYYldeQcFd6h
   aavTOJy9W951pXq/AL01wiyB3AJvzqkZfMJdYUlA6w2fjgtxRjQwQJaXZ
   53jQUlQqeVDRNAStpgPeLbteadzRokiGvnS2hgx3alMn65vvCgwWlBB1y
   MI5ojRfl36AjkJFPcXAqNwy9xiJzon/wdFRcAcx2hIjHgxnTp8mg5xVws
   A==;
X-CSE-ConnectionGUID: fdFx4om1SOW+RhR0KPRZKg==
X-CSE-MsgGUID: QXf0YPCGSbqMHrayk5D//g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17539361"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="17539361"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 12:56:31 -0700
X-CSE-ConnectionGUID: u+o1qwNiQne16kl3qnVkUQ==
X-CSE-MsgGUID: KogJYq7gSii4XKAkUvExlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82001089"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2024 12:56:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5sKG-000e5O-37;
	Tue, 29 Oct 2024 19:56:24 +0000
Date: Wed, 30 Oct 2024 03:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9265/13046] block/blk-mq.c:887:13: warning:
 'sli_iolat_stat_end_check' defined but not used
Message-ID: <202410300329.wTRbr2aC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: aa493c7aa24a8bfeafb0e8a2b806c57e6b431ac4 [9265/13046] sli/io: backport iolat function from tk3
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300329.wTRbr2aC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300329.wTRbr2aC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300329.wTRbr2aC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq.c:887:13: warning: 'sli_iolat_stat_end_check' defined but not used [-Wunused-function]
     887 | static void sli_iolat_stat_end_check(u64 rq_alloc_time_ns, u64 rq_io_start_time_ns,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/sli.c:549:12: sparse: sparse: symbol 'bio_devname' was not declared. Should it be static?
   kernel/cgroup/sli.c:807:15: sparse: sparse: symbol 'get_cgroup_from_task_id' was not declared. Should it be static?
   kernel/cgroup/sli.c:1491:27: sparse: sparse: dubious: !x & y
   kernel/cgroup/sli.c:1491:29: sparse: sparse: restricted fmode_t degrades to integer
   kernel/cgroup/sli.c:1584:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   kernel/cgroup/sli.c:1584:24: sparse:     expected restricted __poll_t
   kernel/cgroup/sli.c:1584:24: sparse:     got int
   kernel/cgroup/sli.c: note: in included file (through include/linux/mutex.h, include/linux/seq_file.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/sli_iolat_stat_end_check +887 block/blk-mq.c

   885	
   886	#ifdef CONFIG_CGROUP_SLI
 > 887	static void sli_iolat_stat_end_check(u64 rq_alloc_time_ns, u64 rq_io_start_time_ns,
   888			struct bio *bio, struct blkcg *blkcg)
   889	{
   890		struct cgroup *cgrp;
   891		u64 sli_iolat_end_time = 0;
   892		u64 bio_start = bio_issue_time(&bio->bi_issue);
   893	
   894		if (!bio_start || !rq_alloc_time_ns || !rq_io_start_time_ns || !blkcg ||
   895			blkcg == &blkcg_root)
   896			return;
   897	
   898		cgrp = blkcg->css.cgroup;
   899		if (!cgrp || !cgroup_parent(cgrp))
   900			return;
   901	
   902		sli_iolat_end_time = __bio_issue_time(ktime_get_ns());
   903		if (sli_iolat_end_time <= bio_start)
   904			return;
   905	
   906		sli_iolat_stat_end(IO_LAT_DELAY, bio_start, rq_alloc_time_ns, rq_io_start_time_ns,
   907				sli_iolat_end_time, sli_iolat_end_time - bio_start, bio, cgrp);
   908	}
   909	#endif
   910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
