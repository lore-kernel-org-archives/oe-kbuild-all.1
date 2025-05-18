Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE6A747F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555093; cv=none; b=OC044Icf2im2unvzzJU8LigxcDKhVCkV/3QYHWFPNA3TthUCBTWfUdwKtREFWl49vEE0DNzvFomoD+XIftYwR++/8kwgJXv2AdxmVmUVc1O5wqCqmIjlK3w9FKLahApABHB2ob/tUh7rdoNiZcbAzAfGEE2alvZVzgYGD9+IlDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555093; c=relaxed/simple;
	bh=i++wM2dMw5c2p6/L7ho5opFy6zY+Z/rCGXPevbiVqlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMxk9WonqRf8cjpX+Vp9bHN9adHsMvPW/S9NDYhbVr1gqBlPWfmmVo8NU1/hkx1s3W1grQOm4TLaZBuilucIpQH6LV6N2XGR9s0bj0flNNXgurofe92Pj31ay0NIExw8VZO903KsemXNSoLdTE6AtazylZd3LH6/+t3y136UJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ng8KuLMS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ng8KuLMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747555091; x=1779091091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i++wM2dMw5c2p6/L7ho5opFy6zY+Z/rCGXPevbiVqlQ=;
  b=ng8KuLMSQgnSnaBrJoYKyezboNExOfjq3MJyTxiFl3edY6UlIbqHl9D8
   RfD94ZN1nMYJ8+nnCVmXXakut2vkIbybP+uOBx35g0ZlMwnj16mH/Ayhr
   9YRhqmPMKW7JfexNBChBEuj7drQTTWK5xPmrM51RF+AOr+mON48MAdnCu
   StE042HZe3dgto2NFZZ6U/PV/inbB6B4p4ug/s+cLS0/rU3f7olcDVIaW
   U7ktpQz+02D1JlS6Ilrtkdt0Y4CJTS8SxbZmEPQKX4+HmJWTJnCUrWeg6
   eXUBcIrlJSlAAkcMb9d6GBzYQE8ayl70H2/mACgN9BnpY1EFGnsas6Y4X
   w==;
X-CSE-ConnectionGUID: uQLxsgF5TNWjNZefA1YM7Q==
X-CSE-MsgGUID: vnQWOYICRWq6hlHGm5/Iyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60111061"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="60111061"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 00:58:10 -0700
X-CSE-ConnectionGUID: Fe8oIXPbTuCQDFaybs3FGA==
X-CSE-MsgGUID: lfcjDrHDRwOMF99SU4WC8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139607291"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2025 00:58:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGYuM-000Kgx-1I;
	Sun, 18 May 2025 07:58:06 +0000
Date: Sun, 18 May 2025 15:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] fs/ext4/fast_commit.c:1133:6:
 warning: variable 'start_time' is used uninitialized whenever 'if' condition
 is true
Message-ID: <202505181532.5hjY1pQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ritesh,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: 5a6b734b7f5ed2ee98c21d6424f40ccc1f3011ac [11/11] ext4: do not call FC trace event in ext4_fc_commit() if FS does not support FC
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250518/202505181532.5hjY1pQJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181532.5hjY1pQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181532.5hjY1pQJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/fast_commit.c:1133:6: warning: variable 'start_time' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1133 |         if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1134 |                 (ext4_fc_is_ineligible(sb))) {
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1192:51: note: uninitialized use occurs here
    1192 |         commit_time = ktime_to_ns(ktime_sub(ktime_get(), start_time));
         |                                                          ^~~~~~~~~~
   include/linux/ktime.h:47:39: note: expanded from macro 'ktime_sub'
      47 | #define ktime_sub(lhs, rhs)     ((lhs) - (rhs))
         |                                           ^~~
   fs/ext4/fast_commit.c:1133:2: note: remove the 'if' if its condition is always false
    1133 |         if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1134 |                 (ext4_fc_is_ineligible(sb))) {
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1135 |                 reason = EXT4_FC_REASON_INELIGIBLE;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1136 |                 goto out;
         |                 ~~~~~~~~~
    1137 |         }
         |         ~
>> fs/ext4/fast_commit.c:1133:6: warning: variable 'start_time' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    1133 |         if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1192:51: note: uninitialized use occurs here
    1192 |         commit_time = ktime_to_ns(ktime_sub(ktime_get(), start_time));
         |                                                          ^~~~~~~~~~
   include/linux/ktime.h:47:39: note: expanded from macro 'ktime_sub'
      47 | #define ktime_sub(lhs, rhs)     ((lhs) - (rhs))
         |                                           ^~~
   fs/ext4/fast_commit.c:1133:6: note: remove the '||' if its condition is always false
    1133 |         if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1131:20: note: initialize the variable 'start_time' to silence this warning
    1131 |         ktime_t start_time, commit_time;
         |                           ^
         |                            = 0
   fs/ext4/fast_commit.c:1830:27: warning: unused function 'tag2str' [-Wunused-function]
    1830 | static inline const char *tag2str(u16 tag)
         |                           ^~~~~~~
   3 warnings generated.


vim +1133 fs/ext4/fast_commit.c

aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1117  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1118  /*
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1119   * The main commit entry point. Performs a fast commit for transaction
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1120   * commit_tid if needed. If it's not possible to perform a fast commit
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1121   * due to various reasons, we fall back to full commit. Returns 0
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1122   * on success, error otherwise.
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1123   */
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1124  int ext4_fc_commit(journal_t *journal, tid_t commit_tid)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1125  {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1126  	struct super_block *sb = (struct super_block *)(journal->j_private);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1127  	struct ext4_sb_info *sbi = EXT4_SB(sb);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1128  	int nblks = 0, ret, bsize = journal->j_blocksize;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1129  	int subtid = atomic_read(&sbi->s_fc_subtid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1130  	int reason = EXT4_FC_REASON_OK, fc_bufs_before = 0;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1131  	ktime_t start_time, commit_time;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1132  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15 @1133  	if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1134  		(ext4_fc_is_ineligible(sb))) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1135  		reason = EXT4_FC_REASON_INELIGIBLE;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1136  		goto out;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1137  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1138  
5a6b734b7f5ed2 Ritesh Harjani     2022-03-12  1139  	trace_ext4_fc_commit_start(sb);
5a6b734b7f5ed2 Ritesh Harjani     2022-03-12  1140  
5a6b734b7f5ed2 Ritesh Harjani     2022-03-12  1141  	start_time = ktime_get();
5a6b734b7f5ed2 Ritesh Harjani     2022-03-12  1142  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1143  restart_fc:
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1144  	ret = jbd2_fc_begin_commit(journal, commit_tid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1145  	if (ret == -EALREADY) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1146  		/* There was an ongoing commit, check if we need to restart */
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1147  		if (atomic_read(&sbi->s_fc_subtid) <= subtid &&
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1148  			commit_tid > journal->j_commit_sequence)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1149  			goto restart_fc;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1150  		reason = EXT4_FC_REASON_ALREADY_COMMITTED;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1151  		goto out;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1152  	} else if (ret) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1153  		sbi->s_fc_stats.fc_ineligible_reason_count[EXT4_FC_COMMIT_FAILED]++;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1154  		reason = EXT4_FC_REASON_FC_START_FAILED;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1155  		goto out;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1156  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1157  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1158  	fc_bufs_before = (sbi->s_fc_bytes + bsize - 1) / bsize;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1159  	ret = ext4_fc_perform_commit(journal);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1160  	if (ret < 0) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1161  		sbi->s_fc_stats.fc_ineligible_reason_count[EXT4_FC_COMMIT_FAILED]++;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1162  		reason = EXT4_FC_REASON_FC_FAILED;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1163  		goto out;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1164  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1165  	nblks = (sbi->s_fc_bytes + bsize - 1) / bsize - fc_bufs_before;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1166  	ret = jbd2_fc_wait_bufs(journal, nblks);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1167  	if (ret < 0) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1168  		sbi->s_fc_stats.fc_ineligible_reason_count[EXT4_FC_COMMIT_FAILED]++;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1169  		reason = EXT4_FC_REASON_FC_FAILED;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1170  		goto out;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1171  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1172  	atomic_inc(&sbi->s_fc_subtid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1173  	jbd2_fc_end_commit(journal);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1174  out:
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1175  	/* Has any ineligible update happened since we started? */
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1176  	if (reason == EXT4_FC_REASON_OK && ext4_fc_is_ineligible(sb)) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1177  		sbi->s_fc_stats.fc_ineligible_reason_count[EXT4_FC_COMMIT_FAILED]++;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1178  		reason = EXT4_FC_REASON_INELIGIBLE;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1179  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1180  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1181  	spin_lock(&sbi->s_fc_lock);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1182  	if (reason != EXT4_FC_REASON_OK &&
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1183  		reason != EXT4_FC_REASON_ALREADY_COMMITTED) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1184  		sbi->s_fc_stats.fc_ineligible_commits++;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1185  	} else {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1186  		sbi->s_fc_stats.fc_num_commits++;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1187  		sbi->s_fc_stats.fc_numblks += nblks;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1188  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1189  	spin_unlock(&sbi->s_fc_lock);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1190  	nblks = (reason == EXT4_FC_REASON_OK) ? nblks : 0;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1191  	trace_ext4_fc_commit_stop(sb, nblks, reason);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1192  	commit_time = ktime_to_ns(ktime_sub(ktime_get(), start_time));
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1193  	/*
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1194  	 * weight the commit time higher than the average time so we don't
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1195  	 * react too strongly to vast changes in the commit time
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1196  	 */
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1197  	if (likely(sbi->s_fc_avg_commit_time))
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1198  		sbi->s_fc_avg_commit_time = (commit_time +
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1199  				sbi->s_fc_avg_commit_time * 3) / 4;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1200  	else
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1201  		sbi->s_fc_avg_commit_time = commit_time;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1202  	jbd_debug(1,
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1203  		"Fast commit ended with blks = %d, reason = %d, subtid - %d",
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1204  		nblks, reason, subtid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1205  	if (reason == EXT4_FC_REASON_FC_FAILED)
0bce577bf9cae1 Harshad Shirwadkar 2020-11-05  1206  		return jbd2_fc_end_commit_fallback(journal);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1207  	if (reason == EXT4_FC_REASON_FC_START_FAILED ||
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1208  		reason == EXT4_FC_REASON_INELIGIBLE)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1209  		return jbd2_complete_transaction(journal, commit_tid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1210  	return 0;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1211  }
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1212  

:::::: The code at line 1133 was first introduced by commit
:::::: aa75f4d3daaeb1389b9cce9d6b84401eaf228d4e ext4: main fast-commit commit path

:::::: TO: Harshad Shirwadkar <harshadshirwadkar@gmail.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
