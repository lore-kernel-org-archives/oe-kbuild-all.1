Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22601E1A33
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755991041; cv=none; b=mT5/dZikNFS6ZkXL71LJtbJNOH6kjjFmJmn2eLLXnbqFLlDaHzzw0r93FaK/blkKnL8mU84d21SmZxLZFbAZfRxepOryrpVLJT+JzlvYzx0SjxEKZnBDMSU6CWpEEaJnoiyxO8f59B1Dgzv2wfZRHhA/5HTWtmOtRTWoSOalC/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755991041; c=relaxed/simple;
	bh=aVo+N3MT3yI0uXlpls68pHS1Iq61b1WUD2OfkUxHYBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfn5whPCITIlJoTI2CwEJ5ijL4Iohd3mqhPjmuljlEkHydmsOeIaJocxyVTNu9RQSEeV/HhORmICPYUFqRr5Yc4xIifi3tHdgW6VGSl6eeneP60gBwG46L363K3P5+RptGbtfHib6DFHytBWFRjn3Yva9kANvKsWwVSZmiFi6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFB+QJ+O; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFB+QJ+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755991040; x=1787527040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVo+N3MT3yI0uXlpls68pHS1Iq61b1WUD2OfkUxHYBU=;
  b=kFB+QJ+O+bxKCCyeALjz7TPFadG33OL13qn++gHJaQeUzDHJuC87AKwM
   9QN+OzyWVYyiV1DuQ0XLVox+rmKhVAppZTN0OQlBJzCn79aJvpPy7vQio
   P7TdlGQtqKrxuLpZbHa7cQ4M8GnqzQ5g7r/q8jtSJ0KExFZdgqeMWFLlM
   KeoMdEtVpyT8yUr759/M9r7K2aXK5IRfnLRThXBwGq1iw8ccbYjAS5e5O
   UXB0ZcQUpMLVgIoi4Fj6/ACixfMbAimS1Sp2kty4gZ7a491mfVlMLclyS
   pZWgPAVgmNARKPVGKGvGYHhqL8c1npnufHg5QWNlC9+vbm4NOMvWkTnbH
   g==;
X-CSE-ConnectionGUID: PTgShj+OQTadhViu1br+bQ==
X-CSE-MsgGUID: vKkEl7G4Rmq/mmI6S9LQ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58115514"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58115514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 16:17:19 -0700
X-CSE-ConnectionGUID: UUzw0fzAQRODBun0fwdofw==
X-CSE-MsgGUID: YvjZz9JOSr6AFg4h7zkn2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168887193"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2025 16:17:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upxU3-000MeI-2V;
	Sat, 23 Aug 2025 23:17:15 +0000
Date: Sun, 24 Aug 2025 07:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>,
	Fengnan Chang <changfengnan@vivo.com>
Subject: [chao:bugfix/syzbot 1/2] fs/f2fs/node.c:2896:28: sparse: sparse:
 restricted __le16 degrades to integer
Message-ID: <202508240703.VnSHcOii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   dfdf1cb6e75d7cde486172f882051acc3de2c543
commit: 70d0669519537c35b7bf11d156f585bc983e38e5 [1/2] f2fs: compress: support recovery
config: arc-randconfig-r131-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240703.VnSHcOii-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250824/202508240703.VnSHcOii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240703.VnSHcOii-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/node.c:2895:56: sparse: sparse: restricted __le32 degrades to integer
>> fs/f2fs/node.c:2896:28: sparse: sparse: restricted __le16 degrades to integer

vim +2896 fs/f2fs/node.c

  2837	
  2838	int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio)
  2839	{
  2840		struct f2fs_inode *src, *dst;
  2841		nid_t ino = ino_of_node(folio);
  2842		struct node_info old_ni, new_ni;
  2843		struct folio *ifolio;
  2844		int err;
  2845	
  2846		err = f2fs_get_node_info(sbi, ino, &old_ni, false);
  2847		if (err)
  2848			return err;
  2849	
  2850		if (unlikely(old_ni.blk_addr != NULL_ADDR))
  2851			return -EINVAL;
  2852	retry:
  2853		ifolio = f2fs_grab_cache_folio(NODE_MAPPING(sbi), ino, false);
  2854		if (IS_ERR(ifolio)) {
  2855			memalloc_retry_wait(GFP_NOFS);
  2856			goto retry;
  2857		}
  2858	
  2859		/* Should not use this inode from free nid list */
  2860		remove_free_nid(sbi, ino);
  2861	
  2862		if (!folio_test_uptodate(ifolio))
  2863			folio_mark_uptodate(ifolio);
  2864		fill_node_footer(ifolio, ino, ino, 0, true);
  2865		set_cold_node(ifolio, false);
  2866	
  2867		src = F2FS_INODE(folio);
  2868		dst = F2FS_INODE(ifolio);
  2869	
  2870		memcpy(dst, src, offsetof(struct f2fs_inode, i_ext));
  2871		dst->i_size = 0;
  2872		dst->i_blocks = cpu_to_le64(1);
  2873		dst->i_links = cpu_to_le32(1);
  2874		dst->i_xattr_nid = 0;
  2875		dst->i_inline = src->i_inline & (F2FS_INLINE_XATTR | F2FS_EXTRA_ATTR);
  2876		if (dst->i_inline & F2FS_EXTRA_ATTR) {
  2877			dst->i_extra_isize = src->i_extra_isize;
  2878	
  2879			if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
  2880				F2FS_FITS_IN_INODE(src, le16_to_cpu(src->i_extra_isize),
  2881								i_inline_xattr_size))
  2882				dst->i_inline_xattr_size = src->i_inline_xattr_size;
  2883	
  2884			if (f2fs_sb_has_project_quota(sbi) &&
  2885				F2FS_FITS_IN_INODE(src, le16_to_cpu(src->i_extra_isize),
  2886									i_projid))
  2887				dst->i_projid = src->i_projid;
  2888	
  2889			if (f2fs_sb_has_inode_crtime(sbi) &&
  2890				F2FS_FITS_IN_INODE(src, le16_to_cpu(src->i_extra_isize),
  2891								i_crtime_nsec)) {
  2892				dst->i_crtime = src->i_crtime;
  2893				dst->i_crtime_nsec = src->i_crtime_nsec;
  2894			}
  2895			if (f2fs_sb_has_compression(sbi) && src->i_flags & F2FS_COMPR_FL
> 2896				&& F2FS_FITS_IN_INODE(src, src->i_extra_isize, i_log_cluster_size)) {
  2897				dst->i_blocks = src->i_blocks;
  2898				dst->i_compress_algorithm = src->i_compress_algorithm;
  2899				dst->i_compr_blocks = src->i_compr_blocks;
  2900				dst->i_log_cluster_size = src->i_log_cluster_size;
  2901			}
  2902		}
  2903	
  2904		new_ni = old_ni;
  2905		new_ni.ino = ino;
  2906	
  2907		if (unlikely(inc_valid_node_count(sbi, NULL, true)))
  2908			WARN_ON(1);
  2909		set_node_addr(sbi, &new_ni, NEW_ADDR, false);
  2910		inc_valid_inode_count(sbi);
  2911		folio_mark_dirty(ifolio);
  2912		f2fs_folio_put(ifolio, true);
  2913		return 0;
  2914	}
  2915	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
