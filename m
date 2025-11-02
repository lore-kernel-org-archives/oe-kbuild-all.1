Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609661ACED5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 04:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762056200; cv=none; b=B+w1njHrNatVeWHRmkyDFuNoJIje+njq1oSBi0T+MWumv6xCuVmmhL9PvHMq2ZvctWMUwQ3j+dS3zenfLCeUtiWblszKiyVBDtsUT1Lll4yn1vnUbd70LxrptAMog2hLZcwALVWyJ1960guWFlLuHhqye5wu43Hxjhg3ioXO+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762056200; c=relaxed/simple;
	bh=ltcMKubCQpci6f++s/Q5zdxCjfBXzbZ0iepJyG32Eg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cc6yUa5cwAHaHP9AwEQARdN7leKM5HTr38JR6TeLKHHJ5KsUoiWMCDP9cjQWr8zo2Fq/4EgW3YpCqVLdt2AZ0DQa954Bhg5nuNoiDDL+x3ByKti8tMlVSjcBZnamoCXLSzxqObk2BTelVhEvh9Spd+Ji9y+yl/tFCVxBfKTp9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkYm4Im+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkYm4Im+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762056199; x=1793592199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ltcMKubCQpci6f++s/Q5zdxCjfBXzbZ0iepJyG32Eg4=;
  b=RkYm4Im+anhrNSBODF9x/wj+B2ZF52m+osN3kWCS5ZsURhW5Lv4h3xCK
   KJj/Bk2LamOX/wZsSGBBjoPAtaTACSEZLILoFHbb/4COkQUQgvO2SSqoO
   yujbcj472cCJ+3EKiasRtfkI/S/dKTFTNoKfKMeGtakjJlPoUhqulSS+k
   Oxa9WXy3BGT0QYcpeRzuTv9SFlwc1raBDiEaxPRSbsqEnLrErk5oKo6x7
   rJ5DFiH6JIrQi0yFPFpjQ7Et2c0FjnMeylwkwLTDc6pxa12vY3i0P2s3k
   TRFZ93nR4ywhmoFsdV1yYrVcHDqmoMTmU3IcE0F3/5E8HF27ClnpWIfd9
   A==;
X-CSE-ConnectionGUID: xgxruE2bROuZyGn0I7QuNQ==
X-CSE-MsgGUID: fLViOsXaS1+Kwrd9gOpC5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64320115"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="64320115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 21:03:18 -0700
X-CSE-ConnectionGUID: JllucE/mQGWsOp8YN1baVA==
X-CSE-MsgGUID: icdNP75pSgCacZPfsVpDwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="187300514"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Nov 2025 21:03:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFPJC-000Ozc-13;
	Sun, 02 Nov 2025 04:03:14 +0000
Date: Sun, 2 Nov 2025 12:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 11/11] Warning: fs/ntfsplus/unistr.c:83
 function parameter 'name1_len' not described in 'ntfs_collate_names'
Message-ID: <202511021158.c7IPUPI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   823d97fda02f76457c2e14196ebe718b9601f40c
commit: 823d97fda02f76457c2e14196ebe718b9601f40c [11/11] ntfsplus: add Kconfig and Makefile
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20251102/202511021158.c7IPUPI8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021158.c7IPUPI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021158.c7IPUPI8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/ntfsplus/unistr.c:83 function parameter 'name1_len' not described in 'ntfs_collate_names'
>> Warning: fs/ntfsplus/unistr.c:83 function parameter 'name2_len' not described in 'ntfs_collate_names'
>> Warning: fs/ntfsplus/unistr.c:223 function parameter 'vol' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfsplus/unistr.c:223 function parameter 'ins' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfsplus/unistr.c:223 function parameter 'ins_len' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfsplus/unistr.c:223 function parameter 'outs' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfsplus/unistr.c:223 function parameter 'max_name_len' not described in 'ntfs_nlstoucs'
--
>> Warning: fs/ntfsplus/index.c:1283 function parameter 'icx' not described in 'ntfs_ir_truncate'
>> Warning: fs/ntfsplus/index.c:1283 function parameter 'data_size' not described in 'ntfs_ir_truncate'
>> Warning: fs/ntfsplus/index.c:1310 function parameter 'icx' not described in 'ntfs_ir_make_space'
>> Warning: fs/ntfsplus/index.c:1310 function parameter 'data_size' not described in 'ntfs_ir_make_space'
>> Warning: fs/ntfsplus/index.c:1464 function parameter 'icx' not described in 'ntfs_ib_split'
>> Warning: fs/ntfsplus/index.c:1464 function parameter 'ib' not described in 'ntfs_ib_split'
>> Warning: fs/ntfsplus/index.c:2006 function parameter 'ie' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfsplus/index.c:2006 function parameter 'ictx' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfsplus/index.c:2072 function parameter 'ie' not described in 'ntfs_index_next'
>> Warning: fs/ntfsplus/index.c:2072 function parameter 'ictx' not described in 'ntfs_index_next'
--
>> Warning: fs/ntfsplus/lcnalloc.c:177 function parameter 'vol' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfsplus/lcnalloc.c:177 function parameter 'start_vcn' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfsplus/lcnalloc.c:177 function parameter 'count' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfsplus/lcnalloc.c:177 function parameter 'start_lcn' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfsplus/lcnalloc.c:177 function parameter 'zone' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfsplus/lcnalloc.c:177 function parameter 'is_extension' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfsplus/lcnalloc.c:177 function parameter 'is_contig' not described in 'ntfs_cluster_alloc'
>> Warning: fs/ntfsplus/lcnalloc.c:177 function parameter 'is_dealloc' not described in 'ntfs_cluster_alloc'
--
>> Warning: fs/ntfsplus/collate.c:66 function parameter 'vol' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfsplus/collate.c:66 function parameter 'data1' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfsplus/collate.c:66 function parameter 'data1_len' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfsplus/collate.c:66 function parameter 'data2' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfsplus/collate.c:66 function parameter 'data2_len' not described in 'ntfs_collate_ntofs_ulongs'
>> Warning: fs/ntfsplus/collate.c:105 function parameter 'vol' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfsplus/collate.c:105 function parameter 'data1' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfsplus/collate.c:105 function parameter 'data1_len' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfsplus/collate.c:105 function parameter 'data2' not described in 'ntfs_collate_file_name'
>> Warning: fs/ntfsplus/collate.c:105 function parameter 'data2_len' not described in 'ntfs_collate_file_name'
--
>> Warning: fs/ntfsplus/runlist.c:28 function parameter 'base' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfsplus/runlist.c:28 function parameter 'dst' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfsplus/runlist.c:28 function parameter 'src' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfsplus/runlist.c:28 function parameter 'size' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfsplus/runlist.c:41 function parameter 'dstbase' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfsplus/runlist.c:41 function parameter 'dst' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfsplus/runlist.c:41 function parameter 'srcbase' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfsplus/runlist.c:41 function parameter 'src' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfsplus/runlist.c:41 function parameter 'size' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfsplus/runlist.c:196 function parameter 'dst' not described in 'ntfs_rl_append'
>> Warning: fs/ntfsplus/runlist.c:196 function parameter 'dsize' not described in 'ntfs_rl_append'
>> Warning: fs/ntfsplus/runlist.c:196 function parameter 'src' not described in 'ntfs_rl_append'
>> Warning: fs/ntfsplus/runlist.c:196 function parameter 'ssize' not described in 'ntfs_rl_append'
>> Warning: fs/ntfsplus/runlist.c:196 function parameter 'loc' not described in 'ntfs_rl_append'
>> Warning: fs/ntfsplus/runlist.c:196 function parameter 'new_size' not described in 'ntfs_rl_append'
>> Warning: fs/ntfsplus/runlist.c:256 function parameter 'dst' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfsplus/runlist.c:256 function parameter 'dsize' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfsplus/runlist.c:256 function parameter 'src' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfsplus/runlist.c:256 function parameter 'ssize' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfsplus/runlist.c:256 function parameter 'loc' not described in 'ntfs_rl_insert'
   Warning: fs/ntfsplus/runlist.c:256 function parameter 'new_size' not described in 'ntfs_rl_insert'
   Warning: fs/ntfsplus/runlist.c:346 function parameter 'dst' not described in 'ntfs_rl_replace'
   Warning: fs/ntfsplus/runlist.c:346 function parameter 'dsize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfsplus/runlist.c:346 function parameter 'src' not described in 'ntfs_rl_replace'
   Warning: fs/ntfsplus/runlist.c:346 function parameter 'ssize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfsplus/runlist.c:346 function parameter 'loc' not described in 'ntfs_rl_replace'
   Warning: fs/ntfsplus/runlist.c:346 function parameter 'new_size' not described in 'ntfs_rl_replace'
   Warning: fs/ntfsplus/runlist.c:428 function parameter 'dst' not described in 'ntfs_rl_split'
   Warning: fs/ntfsplus/runlist.c:428 function parameter 'dsize' not described in 'ntfs_rl_split'
   Warning: fs/ntfsplus/runlist.c:428 function parameter 'src' not described in 'ntfs_rl_split'
   Warning: fs/ntfsplus/runlist.c:428 function parameter 'ssize' not described in 'ntfs_rl_split'
   Warning: fs/ntfsplus/runlist.c:428 function parameter 'loc' not described in 'ntfs_rl_split'
   Warning: fs/ntfsplus/runlist.c:428 function parameter 'new_size' not described in 'ntfs_rl_split'
   Warning: fs/ntfsplus/runlist.c:484 function parameter 'd_runlist' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfsplus/runlist.c:484 function parameter 'srl' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfsplus/runlist.c:484 function parameter 's_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfsplus/runlist.c:484 function parameter 'new_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfsplus/runlist.c:693 function parameter 'vol' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfsplus/runlist.c:693 function parameter 'attr' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfsplus/runlist.c:693 function parameter 'old_runlist' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfsplus/runlist.c:693 function parameter 'new_rl_count' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfsplus/runlist.c:1058 function parameter 'vol' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfsplus/runlist.c:1058 function parameter 'rl' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfsplus/runlist.c:1058 function parameter 'first_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfsplus/runlist.c:1058 function parameter 'last_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfsplus/runlist.c:1058 function parameter 'max_mp_size' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'vol' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'dst' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'dst_len' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'first_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'last_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'stop_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'stop_rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfsplus/runlist.c:1241 function parameter 'de_cluster_count' not described in 'ntfs_mapping_pairs_build'
--
>> Warning: fs/ntfsplus/compress.c:106 function parameter 'page' not described in 'zero_partial_compressed_page'
>> Warning: fs/ntfsplus/compress.c:106 function parameter 'initialized_size' not described in 'zero_partial_compressed_page'
>> Warning: fs/ntfsplus/compress.c:124 function parameter 'page' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfsplus/compress.c:124 function parameter 'i_size' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfsplus/compress.c:124 function parameter 'initialized_size' not described in 'handle_bounds_compressed_page'
--
>> Warning: fs/ntfsplus/mft.c:2104 function parameter 'ni' not described in 'ntfs_mft_record_alloc'
--
>> Warning: fs/ntfsplus/super.c:990 function parameter 'vol' not described in 'load_and_check_logfile'
>> Warning: fs/ntfsplus/super.c:990 function parameter 'rp' not described in 'load_and_check_logfile'
--
>> Warning: fs/ntfsplus/inode.c:1739 function parameter 'rl' not described in 'load_attribute_list_mount'
--
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'ni' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'non_resident' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'compressed' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'encrypted' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'sparse' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'allocated_size' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'data_size' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'initialized_size' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'compressed_size' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:2715 function parameter 'compression_unit' not described in 'ntfs_attr_init'
>> Warning: fs/ntfsplus/attrib.c:4022 function parameter 'holes' not described in 'ntfs_non_resident_attr_expand'
>> Warning: fs/ntfsplus/attrib.c:4286 function parameter 'holes' not described in 'ntfs_resident_attr_resize'
>> Warning: fs/ntfsplus/attrib.c:4593 function parameter 'holes' not described in 'ntfs_attr_truncate_i'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
