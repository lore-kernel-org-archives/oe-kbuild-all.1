Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2BF3A1E63
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jan 2026 03:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767325688; cv=none; b=qSLHqlP2rjJ0SuSvLUMU6LaoN4PnjzvmgHRlrFEfWNJpDgHs9EAuAPQMlQAqz/potIkxvZ/9QEWVa5yTsJMymeVWhcAbJo/jD2e0v8uXDQ80eVGRPzRH86AdIGsNx9YTRgkJhwHCA1o4+349ONxCxH5/43FVWwb2oWHjR/BsLu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767325688; c=relaxed/simple;
	bh=8tf+xgh5gLoRLfnqYGZjW5G6fu/OyV+c35Az9R9ZFd8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qaS3fo8xKhhHbKFkn3pTOiYTnm/3cZeNdwmkjrGcXGNUORObWJDLcdgS05gzKpLW8DjYZ6Z4Q8ioftFqLoOcyCaXA+QS0YikQlXaMbFaIkHmkK6VgY0QFGmjwxkFhy6kQefRBV2GkSUC+72SniXA1BZjPWRDx9w0Y8OEwBiu7Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zklgccxp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zklgccxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767325686; x=1798861686;
  h=date:from:to:cc:subject:message-id;
  bh=8tf+xgh5gLoRLfnqYGZjW5G6fu/OyV+c35Az9R9ZFd8=;
  b=ZklgccxpFr3+9d01xyxU8XA/utT2ytjPS4Ce/ucCNUEB8RyO/gGqmSYn
   5HXy1Ru/NjThB3EIVgSGtjhMZiOx4dd0q/02NgOu6/oV9qbL6XEfKmNQN
   3XomcV1Z7i3DZXsC2V/qy/Hc/ZEgpsCik8ivcbA3PicowJbxjsstk73z8
   gPB7RzEtWNwhjYEJ0pbfyKVrMRBdpXrC3evlDigWPrhSgJy48q1AaT3Xr
   FC8/Nb5tv1KIA5VVwOF6Sq/kG6YsD7qhvJoomqRGTlKD8wcvIAgx5vJ3V
   x3IpDG2ujL4lm5Xjb39B6kUJQK6od67zEat2/WNgp984Rf30Zpt9x55GC
   A==;
X-CSE-ConnectionGUID: n97GoZrEQ0CwWg4lj1gG0Q==
X-CSE-MsgGUID: 0Gh1xS9ZQsuXvaDm+byQTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79461486"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="79461486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 19:48:05 -0800
X-CSE-ConnectionGUID: pgdDyRGDS62XnkLIv94s/Q==
X-CSE-MsgGUID: xh2b9qnxRJSaeP2HZG3u0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="201737721"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 01 Jan 2026 19:48:04 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbW8v-000000000N7-0l1V;
	Fri, 02 Jan 2026 03:48:01 +0000
Date: Fri, 02 Jan 2026 04:47:04 +0100
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 13/14] Warning:
 fs/ntfs/unistr.c:225 function parameter 'ins' not described in
 'ntfs_nlstoucs'
Message-ID: <202601020435.OVrKxHqW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   8d80646ca301cf38045a4b3e64f5cd2e9f81ba85
commit: 48dfd6c60be6089e6349b7124222b12d2607691d [13/14] ntfs: add Kconfig and Makefile
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20260102/202601020435.OVrKxHqW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601020435.OVrKxHqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601020435.OVrKxHqW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/ntfs/unistr.c:225 function parameter 'vol' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'ins' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'ins_len' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'outs' not described in 'ntfs_nlstoucs'
   Warning: fs/ntfs/unistr.c:225 function parameter 'max_name_len' not described in 'ntfs_nlstoucs'
   Warning: fs/ntfs/unistr.c:225 function parameter 'vol' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'ins' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'ins_len' not described in 'ntfs_nlstoucs'
>> Warning: fs/ntfs/unistr.c:225 function parameter 'outs' not described in 'ntfs_nlstoucs'
   Warning: fs/ntfs/unistr.c:225 function parameter 'max_name_len' not described in 'ntfs_nlstoucs'
--
>> Warning: fs/ntfs/aops.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel address space operations and page cache handling.
--
>> Warning: fs/ntfs/dir.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel directory operations. Part of the Linux-NTFS project.
   Warning: fs/ntfs/dir.c:18 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * The little endian Unicode string $I30 as a global constant.
--
   Warning: fs/ntfs/index.c:279 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Get the subnode vcn to which the index entry refers.
   Warning: fs/ntfs/index.c:307 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Find the last entry in the index block
   Warning: fs/ntfs/index.c:393 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Insert @ie index entry at @pos entry. Used @ih values should be ok already.
   Warning: fs/ntfs/index.c:558 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Find a key in the index block.
   Warning: fs/ntfs/index.c:883 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Find the median by going through all the entries
>> Warning: fs/ntfs/index.c:1286 function parameter 'icx' not described in 'ntfs_ir_truncate'
   Warning: fs/ntfs/index.c:1286 function parameter 'data_size' not described in 'ntfs_ir_truncate'
   Warning: fs/ntfs/index.c:1313 function parameter 'icx' not described in 'ntfs_ir_make_space'
>> Warning: fs/ntfs/index.c:1313 function parameter 'data_size' not described in 'ntfs_ir_make_space'
   Warning: fs/ntfs/index.c:1467 function parameter 'icx' not described in 'ntfs_ib_split'
   Warning: fs/ntfs/index.c:1467 function parameter 'ib' not described in 'ntfs_ib_split'
   Warning: fs/ntfs/index.c:1680 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Used if an empty index block to be deleted has END entry as the parent
   Warning: fs/ntfs/index.c:1702 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  Used if an empty index block to be deleted has END entry as the parent
   Warning: fs/ntfs/index.c:2009 function parameter 'ie' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfs/index.c:2009 function parameter 'ictx' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfs/index.c:2075 function parameter 'ie' not described in 'ntfs_index_next'
>> Warning: fs/ntfs/index.c:2075 function parameter 'ictx' not described in 'ntfs_index_next'
>> Warning: fs/ntfs/index.c:1286 function parameter 'icx' not described in 'ntfs_ir_truncate'
   Warning: fs/ntfs/index.c:1286 function parameter 'data_size' not described in 'ntfs_ir_truncate'
   Warning: fs/ntfs/index.c:1313 function parameter 'icx' not described in 'ntfs_ir_make_space'
>> Warning: fs/ntfs/index.c:1313 function parameter 'data_size' not described in 'ntfs_ir_make_space'
   Warning: fs/ntfs/index.c:1467 function parameter 'icx' not described in 'ntfs_ib_split'
   Warning: fs/ntfs/index.c:1467 function parameter 'ib' not described in 'ntfs_ib_split'
   Warning: fs/ntfs/index.c:2009 function parameter 'ie' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfs/index.c:2009 function parameter 'ictx' not described in 'ntfs_index_walk_up'
>> Warning: fs/ntfs/index.c:2075 function parameter 'ie' not described in 'ntfs_index_next'
>> Warning: fs/ntfs/index.c:2075 function parameter 'ictx' not described in 'ntfs_index_next'
--
>> Warning: fs/ntfs/namei.c:1555 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Inode operations for directories.
--
>> Warning: fs/ntfs/mft.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel mft record operations. Part of the Linux-NTFS project.
   Warning: fs/ntfs/mft.c:93 expecting prototype for map_mft_record_page(). Prototype was for map_mft_record_folio() instead
   Warning: fs/ntfs/mft.c:2116 function parameter 'ni' not described in 'ntfs_mft_record_alloc'
   Warning: fs/ntfs/mft.c:2116 function parameter 'ni' not described in 'ntfs_mft_record_alloc'
--
>> Warning: fs/ntfs/runlist.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS runlist handling code.
   Warning: fs/ntfs/runlist.c:28 function parameter 'base' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfs/runlist.c:28 function parameter 'dst' not described in 'ntfs_rl_mm'
   Warning: fs/ntfs/runlist.c:28 function parameter 'src' not described in 'ntfs_rl_mm'
   Warning: fs/ntfs/runlist.c:28 function parameter 'size' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'dstbase' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'dst' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'srcbase' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'src' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'size' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:192 function parameter 'dst' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'dsize' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'src' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'ssize' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'loc' not described in 'ntfs_rl_append'
>> Warning: fs/ntfs/runlist.c:192 function parameter 'new_size' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:249 function parameter 'dst' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'dsize' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'src' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'ssize' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfs/runlist.c:249 function parameter 'loc' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'new_size' not described in 'ntfs_rl_insert'
>> Warning: fs/ntfs/runlist.c:336 function parameter 'dst' not described in 'ntfs_rl_replace'
>> Warning: fs/ntfs/runlist.c:336 function parameter 'dsize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'src' not described in 'ntfs_rl_replace'
>> Warning: fs/ntfs/runlist.c:336 function parameter 'ssize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'loc' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'new_size' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:415 function parameter 'dst' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'dsize' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'src' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'ssize' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'loc' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'new_size' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:468 function parameter 'd_runlist' not described in 'ntfs_runlists_merge'
>> Warning: fs/ntfs/runlist.c:468 function parameter 'srl' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 's_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 'new_rl_count' not described in 'ntfs_runlists_merge'
>> Warning: fs/ntfs/runlist.c:677 function parameter 'vol' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'attr' not described in 'ntfs_mapping_pairs_decompress'
>> Warning: fs/ntfs/runlist.c:677 function parameter 'old_runlist' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'new_rl_count' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'vol' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'rl' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'first_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
>> Warning: fs/ntfs/runlist.c:1040 function parameter 'last_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'max_mp_size' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'vol' not described in 'ntfs_mapping_pairs_build'
>> Warning: fs/ntfs/runlist.c:1226 function parameter 'dst' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'dst_len' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'first_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'last_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'stop_vcn' not described in 'ntfs_mapping_pairs_build'
>> Warning: fs/ntfs/runlist.c:1226 function parameter 'stop_rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'de_cluster_count' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:28 function parameter 'base' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfs/runlist.c:28 function parameter 'dst' not described in 'ntfs_rl_mm'
   Warning: fs/ntfs/runlist.c:28 function parameter 'src' not described in 'ntfs_rl_mm'
   Warning: fs/ntfs/runlist.c:28 function parameter 'size' not described in 'ntfs_rl_mm'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'dstbase' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'dst' not described in 'ntfs_rl_mc'
>> Warning: fs/ntfs/runlist.c:41 function parameter 'srcbase' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'src' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:41 function parameter 'size' not described in 'ntfs_rl_mc'
   Warning: fs/ntfs/runlist.c:192 function parameter 'dst' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'dsize' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'src' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'ssize' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'loc' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:192 function parameter 'new_size' not described in 'ntfs_rl_append'
   Warning: fs/ntfs/runlist.c:249 function parameter 'dst' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'dsize' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'src' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'ssize' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'loc' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:249 function parameter 'new_size' not described in 'ntfs_rl_insert'
   Warning: fs/ntfs/runlist.c:336 function parameter 'dst' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'dsize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'src' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'ssize' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'loc' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:336 function parameter 'new_size' not described in 'ntfs_rl_replace'
   Warning: fs/ntfs/runlist.c:415 function parameter 'dst' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'dsize' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'src' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'ssize' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'loc' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:415 function parameter 'new_size' not described in 'ntfs_rl_split'
   Warning: fs/ntfs/runlist.c:468 function parameter 'd_runlist' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 'srl' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 's_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:468 function parameter 'new_rl_count' not described in 'ntfs_runlists_merge'
   Warning: fs/ntfs/runlist.c:677 function parameter 'vol' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'attr' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'old_runlist' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:677 function parameter 'new_rl_count' not described in 'ntfs_mapping_pairs_decompress'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'vol' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'rl' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'first_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'last_vcn' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1040 function parameter 'max_mp_size' not described in 'ntfs_get_size_for_mapping_pairs'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'vol' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'dst' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'dst_len' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'first_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'last_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'stop_vcn' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'stop_rl' not described in 'ntfs_mapping_pairs_build'
   Warning: fs/ntfs/runlist.c:1226 function parameter 'de_cluster_count' not described in 'ntfs_mapping_pairs_build'
--
   Warning: fs/ntfs/compress.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel compressed attributes handling.
>> Warning: fs/ntfs/compress.c:53 expecting prototype for enum of. Prototype was for enum  instead
   Warning: fs/ntfs/compress.c:58 cannot understand function prototype: 'u8 *ntfs_compression_buffer;'
   Warning: fs/ntfs/compress.c:63 function parameter 'ntfs_cb_lock' not described in 'DEFINE_MUTEX'
   Warning: fs/ntfs/compress.c:63 expecting prototype for ntfs_cb_lock(). Prototype was for DEFINE_MUTEX() instead
   Warning: fs/ntfs/compress.c:106 function parameter 'page' not described in 'zero_partial_compressed_page'
   Warning: fs/ntfs/compress.c:106 function parameter 'initialized_size' not described in 'zero_partial_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'page' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'i_size' not described in 'handle_bounds_compressed_page'
   Warning: fs/ntfs/compress.c:124 function parameter 'initialized_size' not described in 'handle_bounds_compressed_page'
   Warning: fs/ntfs/compress.c:106 function parameter 'page' not described in 'zero_partial_compressed_page'
   Warning: fs/ntfs/compress.c:106 function parameter 'initialized_size' not described in 'zero_partial_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'page' not described in 'handle_bounds_compressed_page'
>> Warning: fs/ntfs/compress.c:124 function parameter 'i_size' not described in 'handle_bounds_compressed_page'
   Warning: fs/ntfs/compress.c:124 function parameter 'initialized_size' not described in 'handle_bounds_compressed_page'
--
>> Warning: fs/ntfs/super.c:1025 function parameter 'vol' not described in 'load_and_check_logfile'
   Warning: fs/ntfs/super.c:1025 function parameter 'rp' not described in 'load_and_check_logfile'
   Warning: fs/ntfs/super.c:2217 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * The complete super operations.
>> Warning: fs/ntfs/super.c:2256 cannot understand function prototype: 'struct lock_class_key ntfs_mft_inval_lock_key;'
>> Warning: fs/ntfs/super.c:1025 function parameter 'vol' not described in 'load_and_check_logfile'
   Warning: fs/ntfs/super.c:1025 function parameter 'rp' not described in 'load_and_check_logfile'
--
>> Warning: fs/ntfs/inode.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS kernel inode handling.
   Warning: fs/ntfs/inode.c:1729 function parameter 'rl' not described in 'load_attribute_list_mount'
   Warning: fs/ntfs/inode.c:1729 function parameter 'rl' not described in 'load_attribute_list_mount'
--
   Warning: fs/ntfs/attrib.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * NTFS attribute operations. Part of the Linux-NTFS project.
>> Warning: fs/ntfs/attrib.c:2725 function parameter 'ni' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'non_resident' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'encrypted' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'sparse' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'allocated_size' not described in 'ntfs_attr_init'
>> Warning: fs/ntfs/attrib.c:2725 function parameter 'data_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'initialized_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compression_unit' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:4030 function parameter 'holes' not described in 'ntfs_non_resident_attr_expand'
>> Warning: fs/ntfs/attrib.c:4286 function parameter 'holes' not described in 'ntfs_resident_attr_resize'
   Warning: fs/ntfs/attrib.c:4601 function parameter 'holes' not described in 'ntfs_attr_truncate_i'
>> Warning: fs/ntfs/attrib.c:2725 function parameter 'ni' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'non_resident' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'encrypted' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'sparse' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'allocated_size' not described in 'ntfs_attr_init'
>> Warning: fs/ntfs/attrib.c:2725 function parameter 'data_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'initialized_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compression_unit' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:4030 function parameter 'holes' not described in 'ntfs_non_resident_attr_expand'
>> Warning: fs/ntfs/attrib.c:4286 function parameter 'holes' not described in 'ntfs_resident_attr_resize'
   Warning: fs/ntfs/attrib.c:4601 function parameter 'holes' not described in 'ntfs_attr_truncate_i'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
