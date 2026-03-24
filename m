Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830882857F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341227; cv=none; b=dZT7ntei7zyveGtCJ9A02S9XFt2pivKD1u8KO+dZz4XMAVrXv0dn17oHbeA9Oj01zLbW83cAZilrRh6XiPd5QoZpfLFzlfGVgNUCTfOUzVEBEu4Q8UCFns5HgMNP/O3EQWMF4+FI2WtaMkURTa4L8s3+60ISp0AW8WPb4xZEnfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341227; c=relaxed/simple;
	bh=PvwZcL0HYi3KP8WBH+m+9q3VxXLw9vCNrzYEd5AUnTg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=goMW831wVXUWSR+2340UkKlGkjwBZO1JLG9XqauUIgJlLu4bc/dWUpl8Lrlq0CArWXOVOqjyACL1vXbZsMipU3e97IvqlMaXKU8Bn69+d1MonHLrO2yyn5aNBKOO/3qqg3Jm82hFOI8q2wivz45j56rq0P8zTtTVB7uOVIQVZK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvSvg9WD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvSvg9WD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774341217; x=1805877217;
  h=date:from:to:cc:subject:message-id;
  bh=PvwZcL0HYi3KP8WBH+m+9q3VxXLw9vCNrzYEd5AUnTg=;
  b=kvSvg9WDEX9S8OD597x2NaLtErIxsw7pBLBXYyiJhlmyFuhV5I3WR6DG
   mJT4Cjn030lGd2gPxnY9S2AaWppEux3cafxeaMeFQF7pwv6X8TIE6jlMK
   L2KVBel3AMch4zIzsv7VDlf9109L2riTB5cFNbjeVEpfLWO6z2eoayg+m
   d+iw+JLmkYYGt/xMa0lgQ0HadsJLYasa20rAMGJmeCvZKpAMAmIGVyezG
   CquRgA0B7xZNpli6p+8VsecQyKpqhqfx9gka+x6CMZDLLs3EWm/mz6Pc9
   KM2Tci3/tkqAXv8D6ByOIG+YX0Ui7qAQtA8cL+OAAULXz08/LMPt61UXG
   w==;
X-CSE-ConnectionGUID: UfRTrqfpThmV03A153K2MA==
X-CSE-MsgGUID: cGEjmXd6QEikcAD6mrN5wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75322706"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75322706"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:33:37 -0700
X-CSE-ConnectionGUID: nZOXp9K8S0md/EsHFbLV3g==
X-CSE-MsgGUID: xdfkxaABRxe+xlJyFM6wyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221394530"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Mar 2026 01:33:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4xCf-000000004Dx-0Yq3;
	Tue, 24 Mar 2026 08:33:33 +0000
Date: Tue, 24 Mar 2026 16:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 7/7]
 fs/incfs/pseudo_files.c:1076:22: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202603241635.VXniY6dM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c0665c721df9b82c4652604d24aa91456058230b
commit: e302f3a21b6554722c72787fddc4780c0280e88b [7/7] ANDROID: incremental-fs: Make work with 16k pages
config: arm64-randconfig-r122-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241635.VXniY6dM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241635.VXniY6dM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241635.VXniY6dM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/pseudo_files.c:1076:22: sparse: sparse: Using plain integer as NULL pointer

vim +1076 fs/incfs/pseudo_files.c

  1066	
  1067	static ssize_t log_read(struct file *f, char __user *buf, size_t len,
  1068				loff_t *ppos)
  1069	{
  1070		struct log_file_state *log_state = f->private_data;
  1071		struct mount_info *mi = get_mount_info(file_superblock(f));
  1072		int total_reads_collected = 0;
  1073		int rl_size;
  1074		ssize_t result = 0;
  1075		bool report_uid;
> 1076		void *page = 0;
  1077		struct incfs_pending_read_info *reads_buf = NULL;
  1078		struct incfs_pending_read_info2 *reads_buf2 = NULL;
  1079		size_t record_size;
  1080		ssize_t reads_to_collect;
  1081		ssize_t reads_per_page;
  1082	
  1083		if (!mi)
  1084			return -EFAULT;
  1085	
  1086		report_uid = mi->mi_options.report_uid;
  1087		record_size = report_uid ? sizeof(*reads_buf2) : sizeof(*reads_buf);
  1088		reads_to_collect = len / record_size;
  1089		reads_per_page = INCFS_DATA_FILE_BLOCK_SIZE / record_size;
  1090	
  1091		rl_size = READ_ONCE(mi->mi_log.rl_size);
  1092		if (rl_size == 0)
  1093			return 0;
  1094	
  1095		page = kzalloc(INCFS_DATA_FILE_BLOCK_SIZE, GFP_NOFS);
  1096		if (!page)
  1097			return -ENOMEM;
  1098	
  1099		if (report_uid)
  1100			reads_buf2 = (struct incfs_pending_read_info2 *)page;
  1101		else
  1102			reads_buf = (struct incfs_pending_read_info *)page;
  1103	
  1104		reads_to_collect = min_t(ssize_t, rl_size, reads_to_collect);
  1105		while (reads_to_collect > 0) {
  1106			struct read_log_state next_state;
  1107			int reads_collected;
  1108	
  1109			memcpy(&next_state, &log_state->state, sizeof(next_state));
  1110			reads_collected = incfs_collect_logged_reads(
  1111				mi, &next_state, reads_buf, reads_buf2,
  1112				min_t(ssize_t, reads_to_collect, reads_per_page));
  1113			if (reads_collected <= 0) {
  1114				result = total_reads_collected ?
  1115					       total_reads_collected * record_size :
  1116					       reads_collected;
  1117				goto out;
  1118			}
  1119			if (copy_to_user(buf, page,
  1120					 reads_collected * record_size)) {
  1121				result = total_reads_collected ?
  1122					       total_reads_collected * record_size :
  1123					       -EFAULT;
  1124				goto out;
  1125			}
  1126	
  1127			memcpy(&log_state->state, &next_state, sizeof(next_state));
  1128			total_reads_collected += reads_collected;
  1129			buf += reads_collected * record_size;
  1130			reads_to_collect -= reads_collected;
  1131		}
  1132	
  1133		result = total_reads_collected * record_size;
  1134		*ppos = 0;
  1135	out:
  1136		kfree(page);
  1137		return result;
  1138	}
  1139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
