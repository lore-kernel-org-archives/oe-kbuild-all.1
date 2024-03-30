Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E9801
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 01:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711762399; cv=none; b=oP2rZv7ziB6kzPRwk3ExWAtCbHXHLd9a5DuRfzLuZcl9laa+H2dP20gY69IP6mJqumwHf6XPxGSybVSgmQ+R3zE/2DhsWUUdtf+6ozIbmia6iOuwCZlYmg1/jXpoJNyqAvudIvyFqcVEm35YUBKhNtgM3Cdkov86oA4OJDtrcVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711762399; c=relaxed/simple;
	bh=E3vaZlTM+IWG+NCrByLD2iCpHzVT7aXN8VStGXURWsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iYgyT4CWuC38a3xR2LcGw18y1f8DmFTXDv0HNxAK7yXJJEoKZxrZvod4XNr7PfcUggaZcuik4eETLLlsI3NFvvDv/2JQdUvFWB0PnhjCKl1lCmhB3Te+wIcJ4l9Zork7ZfsuOdi6qGMc1bq1MhGCB/LedMlVk69QcqEiFhg4KBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeZLk+12; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeZLk+12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711762396; x=1743298396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3vaZlTM+IWG+NCrByLD2iCpHzVT7aXN8VStGXURWsQ=;
  b=QeZLk+12YKvJmM3dJWk014RwmY5gRJOJDgCaXnMPOSWXFExu4KaD0imw
   TYDeLc/ukrg43IsUjVvIDDVRX+31Cchhf4Fz1EGeE27q5LzR/+lzCY3ud
   v72zMxFdnNf4Uy8BNCqs3VIfKiTK7PWY8FQKyRIiOrQBdKVzVn6b7BIil
   wLDKG9Ye+nKtlmD5Iq6BjYcJbhdZr0KVTd/KuYuNp4PRKuKbjN2r2zmzZ
   W2YtdtrM76uiKpw0OD997yiRMVs7rj45dNwO1NboIZrgAZiafE335XxRW
   5TZqccwWzorj2x+1g1Wg/b3EXzLCk4kmUEa/88maDLzSjKn14nzQJojsW
   Q==;
X-CSE-ConnectionGUID: 0e1HutluSvKI3GBSrNiSXw==
X-CSE-MsgGUID: WAnUUvzvRjaO2gNfW41Ylw==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6852055"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="6852055"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 18:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17215772"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Mar 2024 18:33:14 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqNaq-0003pY-0k;
	Sat, 30 Mar 2024 01:33:12 +0000
Date: Sat, 30 Mar 2024 09:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/incfs/pseudo_files.c:1077:22:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202403300946.GYpsznQ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ff3ecc94ab96bb59039aca3bbb8e1b12eb970d08
commit: 5ac10739bcf2dae9220a7a39392aa41235bc64c2 [1/1] ANDROID: incremental-fs: Make work with 16k pages
config: i386-randconfig-063-20240329 (https://download.01.org/0day-ci/archive/20240330/202403300946.GYpsznQ9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403300946.GYpsznQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403300946.GYpsznQ9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/pseudo_files.c:1077:22: sparse: sparse: Using plain integer as NULL pointer
   fs/incfs/pseudo_files.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

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
