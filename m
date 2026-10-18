Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04C38DC73
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 15:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338521; cv=none; b=qlmde9xV+sJrJOQb8LWcFNi5Lk0okyK1gjGp5bMhvbKjT1/uFjYm0SESVuaWaQ6L6iNCZfxfdBGt+Vegd3ABBKKKwDnO/jMDwIZ/AAGnYOxuxR+au5ofM7/xDIPvIOU/dmYrNlqeZYr/0Wd1iZURDRHApzlozzUQyaI6KvyLJGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338521; c=relaxed/simple;
	bh=WjCSeIN67YSRBsfxAiCtRRwOhqiqfgUCm83X8lKAlP0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=at3GZ6VqcaLtFFOne19dBAWbt49iMcr77xlen47nLJ9xQASHIQkvw+QvTHBykOqwWhAaJ8QwkPZoywZVjuGq9U6TBSuywQPtwMH5V3E4rXB/QPU15B2wedEXUdzJqGQMantpAmeCkinbjktM2mHShrfEB4bZSV90e0AehQCjjE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6vMxrOP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6vMxrOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792338519; x=1823874519;
  h=date:from:to:cc:subject:message-id;
  bh=WjCSeIN67YSRBsfxAiCtRRwOhqiqfgUCm83X8lKAlP0=;
  b=n6vMxrOP9YgsxXAvuaRkmGRDioVM1TGQ+eZpwUR0Y88xpeeRuir7xq33
   o8Q3jJmpnTIS1UjwCB2jWqYg3LBJ7/2XrI2zqIXx4GMHCD/qtkQ2behCY
   sjQfIdiEf65gCEgtZOvmlVFvfgH1CoU+HKKR1dFEhVuQ1c/iQT7XqFU7J
   DVM+4CroY5rJ2Uu3gL+sr7dmZ5fGFfUY8kbuae2MCNzBpQe8Rotk02QgW
   8SnhVsdQYyEWteSwUNN9gMDW8xEvK2FhUZJSt5NXO3TPjTTTssCNOE5cF
   94bRCO5n/WWLxzbAc91BwoHn12BpRmNYMN+8gopZhxF+avrTIvTn3m42O
   w==;
X-CSE-ConnectionGUID: ZlEOz2r4Sy+WVHyj/G9u2Q==
X-CSE-MsgGUID: K6VdW048S/6UA9mKdZVgHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1047124"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1047124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 08:48:38 -0700
X-CSE-ConnectionGUID: Fq7ibaOfROOsr1EFCDARPg==
X-CSE-MsgGUID: PlWcRDdLQE+gsMH1Xib1Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2325528"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2026 08:48:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIT7i-0000000059z-3ZJJ;
	Sun, 18 Oct 2026 15:48:34 +0000
Date: Sun, 18 Oct 2026 17:47:58 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 fs/incfs/pseudo_files.c:1077:22: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202610181707.0Ub9AJXr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8a4809044467faad32878517d4d0d3dde2f64adb
commit: 1c1e9693cafba5487c7657f972caca570bb5eca6 [1/1] ANDROID: incremental-fs: Make work with 16k pages
config: arm-randconfig-r2304-20261018 (https://download.01.org/0day-ci/archive/20261018/202610181707.0Ub9AJXr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181707.0Ub9AJXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181707.0Ub9AJXr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/pseudo_files.c:1077:22: sparse: sparse: Using plain integer as NULL pointer

vim +1077 fs/incfs/pseudo_files.c

  1067	
  1068	static ssize_t log_read(struct file *f, char __user *buf, size_t len,
  1069				loff_t *ppos)
  1070	{
  1071		struct log_file_state *log_state = f->private_data;
  1072		struct mount_info *mi = get_mount_info(file_superblock(f));
  1073		int total_reads_collected = 0;
  1074		int rl_size;
  1075		ssize_t result = 0;
  1076		bool report_uid;
> 1077		void *page = 0;
  1078		struct incfs_pending_read_info *reads_buf = NULL;
  1079		struct incfs_pending_read_info2 *reads_buf2 = NULL;
  1080		size_t record_size;
  1081		ssize_t reads_to_collect;
  1082		ssize_t reads_per_page;
  1083	
  1084		if (!mi)
  1085			return -EFAULT;
  1086	
  1087		report_uid = mi->mi_options.report_uid;
  1088		record_size = report_uid ? sizeof(*reads_buf2) : sizeof(*reads_buf);
  1089		reads_to_collect = len / record_size;
  1090		reads_per_page = INCFS_DATA_FILE_BLOCK_SIZE / record_size;
  1091	
  1092		rl_size = READ_ONCE(mi->mi_log.rl_size);
  1093		if (rl_size == 0)
  1094			return 0;
  1095	
  1096		page = kzalloc(INCFS_DATA_FILE_BLOCK_SIZE, GFP_NOFS);
  1097		if (!page)
  1098			return -ENOMEM;
  1099	
  1100		if (report_uid)
  1101			reads_buf2 = (struct incfs_pending_read_info2 *)page;
  1102		else
  1103			reads_buf = (struct incfs_pending_read_info *)page;
  1104	
  1105		reads_to_collect = min_t(ssize_t, rl_size, reads_to_collect);
  1106		while (reads_to_collect > 0) {
  1107			struct read_log_state next_state;
  1108			int reads_collected;
  1109	
  1110			memcpy(&next_state, &log_state->state, sizeof(next_state));
  1111			reads_collected = incfs_collect_logged_reads(
  1112				mi, &next_state, reads_buf, reads_buf2,
  1113				min_t(ssize_t, reads_to_collect, reads_per_page));
  1114			if (reads_collected <= 0) {
  1115				result = total_reads_collected ?
  1116					       total_reads_collected * record_size :
  1117					       reads_collected;
  1118				goto out;
  1119			}
  1120			if (copy_to_user(buf, page,
  1121					 reads_collected * record_size)) {
  1122				result = total_reads_collected ?
  1123					       total_reads_collected * record_size :
  1124					       -EFAULT;
  1125				goto out;
  1126			}
  1127	
  1128			memcpy(&log_state->state, &next_state, sizeof(next_state));
  1129			total_reads_collected += reads_collected;
  1130			buf += reads_collected * record_size;
  1131			reads_to_collect -= reads_collected;
  1132		}
  1133	
  1134		result = total_reads_collected * record_size;
  1135		*ppos = 0;
  1136	out:
  1137		kfree(page);
  1138		return result;
  1139	}
  1140	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
