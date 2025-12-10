Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18D318139
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765387542; cv=none; b=RELOasBF1jTHUasalFisYexMII91MHGQzt7p9rZI0Ad9HSXuh+c6c5j8xYb32OpYvDmSmBQ+GZz+THq5Fzib6gBwIUNK+lB1WTx5jy4BAVTFsIwSo2Ppc8bjHs+ULjX/+n1mnRQXFvHouS7ktRGVyGcp3WuO7KDAJojo2E5mZj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765387542; c=relaxed/simple;
	bh=Ljtr9UH2vbrmUEjzpvbFCmEBIbWUuVORDEZkfIsPWbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZHZWdoW9Fzomz/szx9Ezkvnz2PWlApNmdrznyeWqJAXzJPov9FSE0YvH3iWZApPRvwVUIW2ZRv0qqkzV2zlOs8IhqCe/Nwb6cX+7Edy6Si/QaiD8KpfkvUvxwh/qqrbe9BmcbcTxYNhidjNLeELA8/E+oadJ7VdLUFl1+/EXhkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clxQJ+N1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clxQJ+N1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765387541; x=1796923541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ljtr9UH2vbrmUEjzpvbFCmEBIbWUuVORDEZkfIsPWbc=;
  b=clxQJ+N1QWCxV56IEpL1wCl4o8+k8WHxl70ZSHJkofXR8cEXBcFTLjzS
   P/z0LQfr+STRojtqoSpN9CSdMsKwl68SQt14FnpaaU/j4DrEyzdJz0xem
   kCO3DPL8ChxSjDKPCBTAFHe5U4BRRcnf8erPFwVraafdwtxxIULWiyQ7E
   UcxLszjdVTeKNvagPrU2KLdBqWvAVwcDeJr6ZgWcmkLMxbad+Dp0jGh6p
   g1dUvI9EtHNAH4W9T5e6nmy56fax3v2ejizZ9qWQ11flpJlfzoxg8Psej
   DkGg7HXsD/bybeR6mAEe4eWQQKfN+mLEzS0A+WOcbAoHYknUPVsgICaUX
   w==;
X-CSE-ConnectionGUID: pwc6SVpQT0OIqxk35F6/zw==
X-CSE-MsgGUID: XSDV/kdsQrW1mWVSxAqVGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67321625"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67321625"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 09:25:40 -0800
X-CSE-ConnectionGUID: eEVGbD2/Sn6gJg7Gyj5b1w==
X-CSE-MsgGUID: bcQN2TJpR6uF3xw7cw7Wlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="227214946"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 09:25:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTNwW-000000003Vr-0z04;
	Wed, 10 Dec 2025 17:25:36 +0000
Date: Thu, 11 Dec 2025 01:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 fs/incfs/pseudo_files.c:1077:22: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202512110138.RfGn9lju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   cc7f65cd38b29f29c6af5e49bcd7037d10de13e9
commit: 1c1e9693cafba5487c7657f972caca570bb5eca6 [1/1] ANDROID: incremental-fs: Make work with 16k pages
config: arm-randconfig-r122-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110138.RfGn9lju-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110138.RfGn9lju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110138.RfGn9lju-lkp@intel.com/

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
