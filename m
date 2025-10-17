Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EFE33437C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760699969; cv=none; b=iL8isY6srzRsqH4k6QhAvmeeuQBF2zN7bbxlFpqvrF2VjzRALviaX8Qj4F+SBozvzVxNcdmHrlVGIp9lk/SHU7DrDNwtJ/OXmIX6qfO3cQT0QpQAORR9JK1k8mF6HYkNWcpfZUtPgclC98QF2Fzxa+6mSqxoaPlZ3DdGtDBtMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760699969; c=relaxed/simple;
	bh=DmKt9BKs/QtrwSf+nG0Lv4JTiqo14W3F/RxkPfMZ/6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+2BYWp20rlHFmGmF7yBIj+FRnr2aWMWKXgW1wsmDLYx7cGYBfohJXTdUDVNIFqRo83jWdGLpRHkb624Eh4uLQVRGQgnrK0Gf4xWiVyPk5ALRCptnGW/TkM/7L19bp8EEJA815iq64CzSb8F3yw/3CDCkXN0EUwr3lzzzLku28U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXnoWwol; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXnoWwol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760699968; x=1792235968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DmKt9BKs/QtrwSf+nG0Lv4JTiqo14W3F/RxkPfMZ/6E=;
  b=bXnoWwolWFYH1PytWPzjHl0RWb1sbAv2asPX5ojjSJENHuK+cO9V8Cr8
   DlZJcP0ncts0y5/98SICbrZU5wa8aq+iWfWCDn7qCZS4Tj/b5U676pmyE
   y2QbFapNPrQtySjgQBD6o0fQTnMqyDRIIueTT1ch/83FK1NFTAfZ36mNn
   A45E3JkSUWQRZzQX5YGUlVo3LJDntFBllSIP4mZRHFLVjXREzlIO4/D8r
   LROafhQ2dcFPViLSiWq8Tiwz3yO5lIhtslwuSVMTMiEVblonDuXdepoMB
   crur6HqMDooWX9ABOf/3LjNaf5spTMVWQyw09FUZ9HjhTIRr7ZYJo5p1N
   g==;
X-CSE-ConnectionGUID: qcNj+1SEQLmzU/ujvezN1g==
X-CSE-MsgGUID: YmVLuEfrS/WYAl1/bZN4xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66555793"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="66555793"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 04:19:27 -0700
X-CSE-ConnectionGUID: duncPpEVRqWDRNxVXAYiGA==
X-CSE-MsgGUID: tuVGNuyeQDuE9+vW/ggZsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="213679215"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2025 04:19:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9iUV-0005uH-0W;
	Fri, 17 Oct 2025 11:19:23 +0000
Date: Fri, 17 Oct 2025 19:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1842/1842]
 block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of
 function 'hierarchy_show_slow_io'; did you mean 'hierarchy_account_slow_io'?
Message-ID: <202510171938.CpWQmIQR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   045418106c25769e424b67183bab8f2333dc6278
commit: b2f723aef027af0f194ff0c9f53f8ae6a7cb7de3 [1842/1842] blk-io-hierarchy: support to recored the number of slow IO
config: arm64-randconfig-001-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171938.CpWQmIQR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171938.CpWQmIQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171938.CpWQmIQR-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-io-hierarchy/debugfs.c: In function '__hierarchy_stats_show':
>> block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of function 'hierarchy_show_slow_io'; did you mean 'hierarchy_account_slow_io'? [-Werror=implicit-function-declaration]
      63 |  hierarchy_show_slow_io(hstats_data, m);
         |  ^~~~~~~~~~~~~~~~~~~~~~
         |  hierarchy_account_slow_io
   cc1: some warnings being treated as errors


vim +63 block/blk-io-hierarchy/debugfs.c

    28	
    29	static int __hierarchy_stats_show(struct hierarchy_stats_data *hstats_data,
    30					  struct seq_file *m, enum stage_group stage)
    31	{
    32		u64 dispatched[NR_NEW_STAT_GROUPS] = {0};
    33		u64 completed[NR_NEW_STAT_GROUPS] = {0};
    34		u64 latency[NR_NEW_STAT_GROUPS] = {0};
    35		int cpu;
    36		int i;
    37	
    38		for_each_possible_cpu(cpu) {
    39			struct hierarchy_stats *stat =
    40				per_cpu_ptr(hstats_data->hstats, cpu);
    41	
    42			for (i = 0; i < NR_NEW_STAT_GROUPS; ++i) {
    43				dispatched[i] += stat->dispatched[i];
    44				completed[i] += stat->completed[i];
    45				latency[i] += stage_is_rq(stage) ?
    46					      stat->jiffies[i] : stat->nsecs[i];
    47			}
    48		}
    49	
    50		if (stage_is_rq(stage))
    51			for (i = 0; i < NR_NEW_STAT_GROUPS; ++i)
    52				latency[i] =
    53					jiffies_to_msecs(latency[i]) * NSEC_PER_MSEC;
    54	
    55		seq_printf(m, "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
    56			   dispatched[STAT_READ], completed[STAT_READ],
    57			   latency[STAT_READ], dispatched[STAT_WRITE],
    58			   completed[STAT_WRITE], latency[STAT_WRITE],
    59			   dispatched[STAT_DISCARD], completed[STAT_DISCARD],
    60			   latency[STAT_DISCARD], dispatched[STAT_FLUSH],
    61			   completed[STAT_FLUSH], latency[STAT_FLUSH]);
    62	
  > 63		hierarchy_show_slow_io(hstats_data, m);
    64		seq_putc(m, '\n');
    65		return 0;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
