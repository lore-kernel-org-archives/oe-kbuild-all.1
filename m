Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5D94086A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727134435; cv=none; b=FJO/IHz6Gx4jFK/CsMZAxpSgwpyQsUcvNQtBtQlGowsBZCwvGDIrMVE+8pVjyt4BEdd7S4Gmmyu5tpo5MuV8X+SF5uECBqa1eq9EssbrIbSlnALr6KKdM9rrkmf47NHZ7Lf9o6KBQ3PBktFXw6olz4W3mD4Wj3aP48oHI3yFGdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727134435; c=relaxed/simple;
	bh=Myff/7an7Wh6smtT+XXzqa5QhZYYxS7HlFDT5HOJhHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XP72nh8xDez0M0ZE4v0ylXWanKTR+pxIOteqF7D229GYkpAep1ETYs8UIxy7TAjuYXNIZCDEpiVtO2lFVjFJNopIa+8DchILcbdhf1Xxpfb1mW+9u06xghgdEzhLW8z4uKFZ+0kbuU8DbhEiyE6A6HOPPIsgkYAqqf6fPYjpq8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buPisfys; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buPisfys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727134433; x=1758670433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Myff/7an7Wh6smtT+XXzqa5QhZYYxS7HlFDT5HOJhHg=;
  b=buPisfysOD5eJFSNP0lQD5rWg8h8yqOhCJgV2vq661b3IhgEVTyam6jG
   kfkvYMUbQl37Zu9A6VVob9s0FYQDH/yyzpC3VD5qe8Idq8sZtmKWFmfWQ
   UQfB5ojKU3Xcf+b+HhQRHvWdUvN1qLmPpIIUYmBqDaDetxPT25rxcH0MW
   giWQl28jqSJQAA3GbTYjxv5nhtV05GgNHTMcGQQy/ncH0bvD5IeWpOmfd
   IxlpmSapvSR42wJQp+WqmuDxTiD4+TZHN8byKf9GKhv5HFcX58uOBkgpf
   yJpg85x5ph5jjhlloWwYh2yzCQf8OwxF9Y0WvF2Bw8W3xN4Un+pcHWV1/
   w==;
X-CSE-ConnectionGUID: ThcrJy5bQcSE9f/JzRImxg==
X-CSE-MsgGUID: eM8a+oLnSvOOuu6xbq2Z6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="51525062"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="51525062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 16:33:52 -0700
X-CSE-ConnectionGUID: lA/jQJvOSpeBp6dHNRlUnw==
X-CSE-MsgGUID: DWEt47L0RMCc1P02h6SjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75997134"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Sep 2024 16:33:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sssYs-000Hh7-35;
	Mon, 23 Sep 2024 23:33:46 +0000
Date: Tue, 24 Sep 2024 07:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9265/10987] block/blk-mq.c:892:44: error: 'struct
 bio' has no member named 'bi_issue'
Message-ID: <202409240751.lisxWEXq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   32c289d299ef397e4df3f8fdf99c99c07b3192d4
commit: aa493c7aa24a8bfeafb0e8a2b806c57e6b431ac4 [9265/10987] sli/io: backport iolat function from tk3
config: x86_64-randconfig-013-20240924 (https://download.01.org/0day-ci/archive/20240924/202409240751.lisxWEXq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240751.lisxWEXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240751.lisxWEXq-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-mq.c: In function 'sli_iolat_stat_end_check':
>> block/blk-mq.c:892:44: error: 'struct bio' has no member named 'bi_issue'
     892 |         u64 bio_start = bio_issue_time(&bio->bi_issue);
         |                                            ^~
>> block/blk-mq.c:895:27: error: 'blkcg_root' undeclared (first use in this function); did you mean 'blkg_put'?
     895 |                 blkcg == &blkcg_root)
         |                           ^~~~~~~~~~
         |                           blkg_put
   block/blk-mq.c:895:27: note: each undeclared identifier is reported only once for each function it appears in
>> block/blk-mq.c:898:21: error: 'struct blkcg' has no member named 'css'
     898 |         cgrp = blkcg->css.cgroup;
         |                     ^~
   At top level:
   block/blk-mq.c:887:13: warning: 'sli_iolat_stat_end_check' defined but not used [-Wunused-function]
     887 | static void sli_iolat_stat_end_check(u64 rq_alloc_time_ns, u64 rq_io_start_time_ns,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +892 block/blk-mq.c

   885	
   886	#ifdef CONFIG_CGROUP_SLI
   887	static void sli_iolat_stat_end_check(u64 rq_alloc_time_ns, u64 rq_io_start_time_ns,
   888			struct bio *bio, struct blkcg *blkcg)
   889	{
   890		struct cgroup *cgrp;
   891		u64 sli_iolat_end_time = 0;
 > 892		u64 bio_start = bio_issue_time(&bio->bi_issue);
   893	
   894		if (!bio_start || !rq_alloc_time_ns || !rq_io_start_time_ns || !blkcg ||
 > 895			blkcg == &blkcg_root)
   896			return;
   897	
 > 898		cgrp = blkcg->css.cgroup;
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
