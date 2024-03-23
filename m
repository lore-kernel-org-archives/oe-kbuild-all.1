Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78063D75
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 04:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711167471; cv=none; b=Zaq27t5mZWLiwpC89gQy3zsTvx9agDhe6yOHk1Y5swQwlwjjMLPMSVJW7NiEBbLnPqrurEGTrzubV6f9o6pocTL5IF3nxOd3NHS3fLUDThrFs4uqeIAAnKjKyEhKFmLIUF1/0Jp+iyTI+WKFTtREZIIUOwxrWS6TIi7PiyKruNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711167471; c=relaxed/simple;
	bh=HRFZCPs7pAzkr6u45tjv4jOSJf6apTx36ZSOH9G6ghE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sA6WxDaDX9uS30QuF1C23Z7pk37DK4hnZNGlMc6rRI3eAcjfkZUFEDwNfe3YLW4Z5n8ExBZDFbG1A3JPhXHVcWJV54akOyZx5gvP4h72Ku35nhF/JVbY4NqOZm7wDblA7Bhh0VCSRmkk5dRtBFLccpW6nnUDVu7x+6l/tlVjq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZzIENR4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZzIENR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711167468; x=1742703468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HRFZCPs7pAzkr6u45tjv4jOSJf6apTx36ZSOH9G6ghE=;
  b=dZzIENR4VIvx05SMZMpv7NSeF3EVUdAYGov7Upy//5ciA90aeuBlYSa2
   jCN9XF4haC2YRb81v/6ikToXZAn3mhMnjLtwu4wYOXpwnVbI1GDin/oAP
   LMXt6D5M9Opt/z5CjEM/Y++q31SGA3Vil48sfzYnZNPYaetIbJ2w8cCUo
   B14wjFAd+kFd8n4YPhS4rX33NY4JEkQ2NHJ7ocDf/DUdlBz9g8GkUmfYA
   b5O/9Zxs1DYBGmFdFq7m3nZZUDMzuqHFPRSjw8kFxmXud04zfg7yc6S+D
   yg/1HJnpH3y5TuwM9E4bJBugCPmut+fQm7PZILze2D+/izQLgVjiArRLr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="9179541"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="9179541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 21:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="38222906"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Mar 2024 21:17:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnspE-000KrT-0Q;
	Sat, 23 Mar 2024 04:17:44 +0000
Date: Sat, 23 Mar 2024 12:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: Heming Zhao <heming.zhao@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [akpm-mm:mm-nonmm-unstable 38/38] fs/ocfs2/resize.c:127:46: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202403231258.mU2k0fih-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   e393dbc9246c3ae0160a07c8666838056eafbc44
commit: e393dbc9246c3ae0160a07c8666838056eafbc44 [38/38] ocfs2: improve write IO performance when fragmentation is high
config: i386-randconfig-061-20240322 (https://download.01.org/0day-ci/archive/20240323/202403231258.mU2k0fih-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231258.mU2k0fih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231258.mU2k0fih-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ocfs2/resize.c:127:46: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] total_bits @@     got restricted __le16 [usertype] bg_bits @@
   fs/ocfs2/resize.c:127:46: sparse:     expected unsigned short [usertype] total_bits
   fs/ocfs2/resize.c:127:46: sparse:     got restricted __le16 [usertype] bg_bits
>> fs/ocfs2/resize.c:128:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] old_bg_contig_free_bits @@     got restricted __le16 [usertype] bg_contig_free_bits @@
   fs/ocfs2/resize.c:128:33: sparse:     expected unsigned short [usertype] old_bg_contig_free_bits
   fs/ocfs2/resize.c:128:33: sparse:     got restricted __le16 [usertype] bg_contig_free_bits
>> fs/ocfs2/resize.c:169:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bg_contig_free_bits @@     got unsigned short [usertype] old_bg_contig_free_bits @@
   fs/ocfs2/resize.c:169:44: sparse:     expected restricted __le16 [usertype] bg_contig_free_bits
   fs/ocfs2/resize.c:169:44: sparse:     got unsigned short [usertype] old_bg_contig_free_bits
   fs/ocfs2/resize.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> fs/ocfs2/suballoc.c:2566:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] old_bg_contig_free_bits @@     got restricted __le16 [usertype] bg_contig_free_bits @@
   fs/ocfs2/suballoc.c:2566:41: sparse:     expected unsigned short [usertype] old_bg_contig_free_bits
   fs/ocfs2/suballoc.c:2566:41: sparse:     got restricted __le16 [usertype] bg_contig_free_bits
   fs/ocfs2/suballoc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/suballoc.c:2493:17: sparse: sparse: context imbalance in 'ocfs2_block_group_clear_bits' - different lock contexts for basic block

vim +127 fs/ocfs2/resize.c

    76	
    77	static int ocfs2_update_last_group_and_inode(handle_t *handle,
    78						     struct inode *bm_inode,
    79						     struct buffer_head *bm_bh,
    80						     struct buffer_head *group_bh,
    81						     u32 first_new_cluster,
    82						     int new_clusters)
    83	{
    84		int ret = 0;
    85		struct ocfs2_super *osb = OCFS2_SB(bm_inode->i_sb);
    86		struct ocfs2_dinode *fe = (struct ocfs2_dinode *) bm_bh->b_data;
    87		struct ocfs2_chain_list *cl = &fe->id2.i_chain;
    88		struct ocfs2_chain_rec *cr;
    89		struct ocfs2_group_desc *group;
    90		u16 chain, num_bits, backups = 0;
    91		u16 cl_bpc = le16_to_cpu(cl->cl_bpc);
    92		u16 cl_cpg = le16_to_cpu(cl->cl_cpg);
    93		u16 old_bg_clusters;
    94		u16 contig_bits, old_bg_contig_free_bits;
    95	
    96		trace_ocfs2_update_last_group_and_inode(new_clusters,
    97							first_new_cluster);
    98	
    99		ret = ocfs2_journal_access_gd(handle, INODE_CACHE(bm_inode),
   100					      group_bh, OCFS2_JOURNAL_ACCESS_WRITE);
   101		if (ret < 0) {
   102			mlog_errno(ret);
   103			goto out;
   104		}
   105	
   106		group = (struct ocfs2_group_desc *)group_bh->b_data;
   107	
   108		old_bg_clusters = le16_to_cpu(group->bg_bits) / cl_bpc;
   109		/* update the group first. */
   110		num_bits = new_clusters * cl_bpc;
   111		le16_add_cpu(&group->bg_bits, num_bits);
   112		le16_add_cpu(&group->bg_free_bits_count, num_bits);
   113	
   114		/*
   115		 * check whether there are some new backup superblocks exist in
   116		 * this group and update the group bitmap accordingly.
   117		 */
   118		if (OCFS2_HAS_COMPAT_FEATURE(osb->sb,
   119					     OCFS2_FEATURE_COMPAT_BACKUP_SB)) {
   120			backups = ocfs2_calc_new_backup_super(bm_inode,
   121							     group,
   122							     cl_cpg, old_bg_clusters, 1);
   123			le16_add_cpu(&group->bg_free_bits_count, -1 * backups);
   124		}
   125	
   126		contig_bits = ocfs2_find_max_contig_free_bits(group->bg_bitmap,
 > 127						group->bg_bits, 0);
 > 128		old_bg_contig_free_bits = group->bg_contig_free_bits;
   129		group->bg_contig_free_bits = cpu_to_le16(contig_bits);
   130	
   131		ocfs2_journal_dirty(handle, group_bh);
   132	
   133		/* update the inode accordingly. */
   134		ret = ocfs2_journal_access_di(handle, INODE_CACHE(bm_inode), bm_bh,
   135					      OCFS2_JOURNAL_ACCESS_WRITE);
   136		if (ret < 0) {
   137			mlog_errno(ret);
   138			goto out_rollback;
   139		}
   140	
   141		chain = le16_to_cpu(group->bg_chain);
   142		cr = (&cl->cl_recs[chain]);
   143		le32_add_cpu(&cr->c_total, num_bits);
   144		le32_add_cpu(&cr->c_free, num_bits);
   145		le32_add_cpu(&fe->id1.bitmap1.i_total, num_bits);
   146		le32_add_cpu(&fe->i_clusters, new_clusters);
   147	
   148		if (backups) {
   149			le32_add_cpu(&cr->c_free, -1 * backups);
   150			le32_add_cpu(&fe->id1.bitmap1.i_used, backups);
   151		}
   152	
   153		spin_lock(&OCFS2_I(bm_inode)->ip_lock);
   154		OCFS2_I(bm_inode)->ip_clusters = le32_to_cpu(fe->i_clusters);
   155		le64_add_cpu(&fe->i_size, (u64)new_clusters << osb->s_clustersize_bits);
   156		spin_unlock(&OCFS2_I(bm_inode)->ip_lock);
   157		i_size_write(bm_inode, le64_to_cpu(fe->i_size));
   158	
   159		ocfs2_journal_dirty(handle, bm_bh);
   160	
   161	out_rollback:
   162		if (ret < 0) {
   163			ocfs2_calc_new_backup_super(bm_inode,
   164						    group,
   165						    cl_cpg, old_bg_clusters, 0);
   166			le16_add_cpu(&group->bg_free_bits_count, backups);
   167			le16_add_cpu(&group->bg_bits, -1 * num_bits);
   168			le16_add_cpu(&group->bg_free_bits_count, -1 * num_bits);
 > 169			group->bg_contig_free_bits = old_bg_contig_free_bits;
   170		}
   171	out:
   172		if (ret)
   173			mlog_errno(ret);
   174		return ret;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
