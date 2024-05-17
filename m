Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4287E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 00:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715906692; cv=none; b=UgLrCbLWB0Enq9xM/c8tEmbuuKIftpch6lDz3O+y2TN+Zwf2Qp9ANDdaDhmCPX0Q2tRMjDFfbVJixDRNozVH+ZpVXlPvBL/4sKEbS/mNBABbbfoVo4iC9ywLipGW+Uz6Sb2GwDt8Z61ps/C64HkUexfJuP0uudH3yJoyZZkWWqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715906692; c=relaxed/simple;
	bh=yilxwVLQ1PCKM/QdaBdSQdQsyLXjqTbXpoSGN+kdcPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4/vUpDR6XW8JrGDVEWzM4pNQrggAV77BuaLhZ32losooYPko87ChFosjBQ9dF4VkdmmuYsdu2105L/pyMiLWLTt+K4GcpNV9bVKG52qY6TV6BfMS/HKnTiCHuGTZ9MMVIjB0jPpqJjElY4FDynTFr0tM0bj3VxMoETc8CcIUUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvSPBVbh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvSPBVbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715906691; x=1747442691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yilxwVLQ1PCKM/QdaBdSQdQsyLXjqTbXpoSGN+kdcPs=;
  b=UvSPBVbhVJjgUUcqFpDsgojZVm+oSu2BHW3USmaq5RX019QxeS241dec
   tK/sGwQbxAri4l7tQzygI70aamKXrCXLMU9+2r6IA/tILQ9zm3z4f1WLm
   uLGwEocozibmG4s8RxaioD/XGQFD0kXa9KJpgBWJgMLjhHsDZ8Dw/UQeW
   gGow8Z+eacZxjTuXh/ZN2xyrHhJBjBwRQb8IEsMpRMo4Bqk7EExtwTZif
   ND7nYIh9o2ZuZtsBeLcX9bg+q+RicP5VcJwonP5z11sCksdoziIWUzrpq
   lCAkQUYyahxeTuKaXyLoRi7e6mISrocutzyS7BIFA6FZnPglpnuKGqqAv
   Q==;
X-CSE-ConnectionGUID: NbScr0/1R/+l98Z7+ShrEg==
X-CSE-MsgGUID: K4HWFrUuTMWBv+5hg5ZJVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11869267"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="11869267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 17:44:50 -0700
X-CSE-ConnectionGUID: RPAgd7PeQwa7OvWzyoT6UA==
X-CSE-MsgGUID: bEhDG1cATEygxcJ68OHC4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="62442391"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 May 2024 17:44:49 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7liI-000F33-22;
	Fri, 17 May 2024 00:44:46 +0000
Date: Fri, 17 May 2024 08:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/1] fs/incfs/verity.c:306:13-15:
 WARNING: casting value returned by memory allocation function to (u8 *) is
 useless.
Message-ID: <202405170820.fopEl5XN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   2dca19b0a7e69d92441f241b8597bee11dd0d094
commit: 2dca19b0a7e69d92441f241b8597bee11dd0d094 [1/1] ANDROID: incremental-fs: Make work with 16k pages
config: i386-randconfig-052-20240517 (https://download.01.org/0day-ci/archive/20240517/202405170820.fopEl5XN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170820.fopEl5XN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/incfs/verity.c:306:13-15: WARNING: casting value returned by memory allocation function to (u8 *) is useless.
   fs/incfs/verity.c:307:13-15: WARNING: casting value returned by memory allocation function to (u8 *) is useless.

vim +306 fs/incfs/verity.c

   295	
   296	static int incfs_build_merkle_tree(struct file *f, struct data_file *df,
   297				     struct backing_file_context *bfc,
   298				     struct mtree *hash_tree, loff_t hash_offset,
   299				     struct incfs_hash_alg *alg, struct mem_range hash)
   300	{
   301		int error = 0;
   302		int limit, lvl, i, result;
   303		struct mem_range buf = {.len = INCFS_DATA_FILE_BLOCK_SIZE};
   304		struct mem_range tmp = {.len = 2 * INCFS_DATA_FILE_BLOCK_SIZE};
   305	
 > 306		buf.data = (u8 *)kzalloc(buf.len, GFP_NOFS);
   307		tmp.data = (u8 *)kzalloc(tmp.len, GFP_NOFS);
   308		if (!buf.data || !tmp.data) {
   309			error = -ENOMEM;
   310			goto out;
   311		}
   312	
   313		/*
   314		 * lvl - 1 is the level we are reading, lvl the level we are writing
   315		 * lvl == -1 means actual blocks
   316		 * lvl == hash_tree->depth means root hash
   317		 */
   318		limit = df->df_data_block_count;
   319		for (lvl = 0; lvl <= hash_tree->depth; lvl++) {
   320			for (i = 0; i < limit; ++i) {
   321				loff_t hash_level_offset;
   322				struct mem_range partial_buf = buf;
   323	
   324				if (lvl == 0)
   325					result = incfs_read_data_file_block(partial_buf,
   326							f, i, tmp, NULL, NULL);
   327				else {
   328					hash_level_offset = hash_offset +
   329					       hash_tree->hash_level_suboffset[lvl - 1];
   330	
   331					result = incfs_kread(bfc, partial_buf.data,
   332							partial_buf.len,
   333							hash_level_offset + i *
   334							INCFS_DATA_FILE_BLOCK_SIZE);
   335				}
   336	
   337				if (result < 0) {
   338					error = result;
   339					goto out;
   340				}
   341	
   342				partial_buf.len = result;
   343				error = incfs_calc_digest(alg, partial_buf, hash);
   344				if (error)
   345					goto out;
   346	
   347				/*
   348				 * last level - only one hash to take and it is stored
   349				 * in the incfs signature record
   350				 */
   351				if (lvl == hash_tree->depth)
   352					break;
   353	
   354				hash_level_offset = hash_offset +
   355					hash_tree->hash_level_suboffset[lvl];
   356	
   357				result = incfs_kwrite(bfc, hash.data, hash.len,
   358						hash_level_offset + hash.len * i);
   359	
   360				if (result < 0) {
   361					error = result;
   362					goto out;
   363				}
   364	
   365				if (result != hash.len) {
   366					error = -EIO;
   367					goto out;
   368				}
   369			}
   370			limit = DIV_ROUND_UP(limit,
   371					     INCFS_DATA_FILE_BLOCK_SIZE / hash.len);
   372		}
   373	
   374	out:
   375		kfree(tmp.data);
   376		kfree(buf.data);
   377		return error;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
