Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24936D500
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764012880; cv=none; b=QYHvVHSXkU1Tn3xhYzxE95FsMcrnk6MEPv/Z/EEv5UK9GG3ukqdrHElLeMj1N3W7rePV+iCByyoDxZMUYnN09eHe9Vg7KmdQ+ZJk6M1I9ShnHRn/aOxH6Sc8OnWUzpttv86LyC75Z3PniDQbCLr3yGuFa2PNu0w2aJiZFW01TTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764012880; c=relaxed/simple;
	bh=dBRNhVw7rDjF4HxlW49/SgaIP0AO/WG9yTVvEOislho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukMfPqnqZMYhDH03eFRjgiBsdnCQTkPIgOgMlOunVSP6x7wlisITlWQjzbgmQbgZCopdlNhOADTADqk9HI403Voft/e3SrtH7Wr1+68SoG7EHUrDChDlz6Y+caDRIPauOvssn6Q2BR6WZRq6tUJDMLmIdNi+0tKYK9rsslABlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBT0PgCR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBT0PgCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764012879; x=1795548879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dBRNhVw7rDjF4HxlW49/SgaIP0AO/WG9yTVvEOislho=;
  b=iBT0PgCRQFPxN2BpRTEr7vwWaJPS6DdUdrN2x2HqT/yZUBsGZBqZ67iy
   Rt/P+vmQRMbWNvcr6yUhL5VsFiIlxzwsuANpPJdKYT6DbGfVtzwGmVWzd
   PV7+pGrXyDe6daqd0XMI28uxKk8jvI0xSCFFLHVD/YtINcyPLkHXkIJ74
   2hvD3F8vnChaKkmi2WWPtz6jU4ioBXV1IeZQ5SdTsi7+iXYqOSx/eE2oy
   /d1MIo0mLiC4/EjAslSaCGNUTTlvveB+LRdorDBUKdJFkNsHBSCkpsRZH
   +I6z4CstXTubxXXdzrrVj9fCriTmhtED4TU+yn3rEhn9cmfAXlK5fvJXD
   g==;
X-CSE-ConnectionGUID: /LLkxPT1QSySoNkR1vY5iQ==
X-CSE-MsgGUID: +UszBQYWSBWIyAPYKGFzww==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66182638"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="66182638"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:34:38 -0800
X-CSE-ConnectionGUID: vHUt/pcqRT2RnpoPCW/0tA==
X-CSE-MsgGUID: vK3fd5bCRE6rYO1+LrzilQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="191688873"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Nov 2025 11:34:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNcKY-0000000014r-1qGJ;
	Mon, 24 Nov 2025 19:34:34 +0000
Date: Tue, 25 Nov 2025 03:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316]
 block/blk-io-hierarchy/iodump.c:188:22: error: 'struct bio' has no member
 named 'bi_blkg'
Message-ID: <202511250327.zVFjEAbx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   041fb9446ce5643d6c19a4b5bcbb3068054a42fd
commit: 1bf8f90fb90c600d9f372e6be4ef251cc8905f04 [3316/3316] block-io-hierarchy: core hierarchy stats and iodump implementation
config: x86_64-buildonly-randconfig-001-20251125 (https://download.01.org/0day-ci/archive/20251125/202511250327.zVFjEAbx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250327.zVFjEAbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250327.zVFjEAbx-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-io-hierarchy/iodump.c: In function '__hierarchy_show_bio':
>> block/blk-io-hierarchy/iodump.c:188:22: error: 'struct bio' has no member named 'bi_blkg'
     188 |         blkg_path(bio->bi_blkg, path, PATH_LEN);
         |                      ^~
>> block/blk-io-hierarchy/iodump.c:188:9: error: too many arguments to function 'blkg_path'
     188 |         blkg_path(bio->bi_blkg, path, PATH_LEN);
         |         ^~~~~~~~~
   In file included from block/blk-io-hierarchy/iodump.c:21:
   block/blk-io-hierarchy/../blk-cgroup.h:535:21: note: declared here
     535 | static inline char *blkg_path(struct blkcg_gq *blkg) { return NULL; }
         |                     ^~~~~~~~~


vim +188 block/blk-io-hierarchy/iodump.c

   179	
   180	static void __hierarchy_show_bio(struct seq_file *m, struct bio *bio,
   181					 enum stage_group stage, u64 duration)
   182	{
   183		char rwbs[RWB_LEN];
   184		char path[PATH_LEN] = {0};
   185		struct task_struct *task = get_pid_task(bio->pid, PIDTYPE_PID);
   186	
   187		blk_fill_rwbs(rwbs, bio->bi_opf);
 > 188		blkg_path(bio->bi_blkg, path, PATH_LEN);
   189	
   190		seq_printf(m, "%s-%d %s stage %s bio %s %llu + %u cgroup %s started %llu ns ago\n",
   191			   task ? task->comm : "null", task ? task->pid : 0,
   192			   bio->bi_bdev->bd_disk->disk_name,
   193			   hierarchy_stage_name(stage), rwbs, bio->bi_iter.bi_sector,
   194			   bio_sectors(bio), path, duration);
   195	
   196		if (task)
   197			put_task_struct(task);
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
