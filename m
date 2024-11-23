Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77571632DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 04:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732335306; cv=none; b=ly1eVZe3026EkzvI17ViXv3jnOAfw8s2fXQMH56cGftygPQRt4DlmhCUagN17ji1U0VpuEEf9gcRuTBn+tSW3lRXWmiWxjwuxFKg9Q1eP5KSQpzJ/hIRWrZ5Zr7FCoZ2Yi9oRa15Hfuo/Ju2/2ZzboziyoTGPU2g9gVb3olPc0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732335306; c=relaxed/simple;
	bh=5JZ3vc7PbIjkDFyTjWWsiU5G8sRdBA2Z80Pm8c8IX4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYahUVxp1yD9JfgxI4KMjUQ+bl0ZyvMYvmMGhGcsf/qCPH+IIopzg4uZ+rwprK0JhdmQko4oNP7pAwOeK/SOoWvNdyRuDgfPKWjMR04yJAtjSVF76DJZ87Ir5HR5G7KBGyrf+sWs94k6vLevCaEdfi8OXWJgxgOi+yh9TY2zJsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTBjCXTS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTBjCXTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732335305; x=1763871305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5JZ3vc7PbIjkDFyTjWWsiU5G8sRdBA2Z80Pm8c8IX4k=;
  b=GTBjCXTSl/EzpjgecDG+DuWkvU88KSx3LkGnqeoI2R2YujXcltE6QoGv
   Kxp/y4T9YdaNTNxqtMsfT9IIftV0vLgt8u5Ru+Ul/DZjYcZRZVdpaLsHp
   jVND1bPHNgkxDi0jeoiodkbU0MYJD7U0JCx7rtaqp3VDMptlWZMOvFqhN
   u7aHtREemcFZrqaY9nYYD7aS0tgsQXhCv5xpoH/l+Wrjdw9m0hPmqBykG
   id6dROkDXAOV4GzaKS5Q8yQsFFCcpqFN+9jYEiZrZ9OAX93+kTNLqcs0O
   H9qAX9O1jcnOpxGcQWNuDRETccGmNOWBiUhZBYkzKPnUbwb2LrUvMTucv
   A==;
X-CSE-ConnectionGUID: fYq9wDXpQrGs614eH7jaIQ==
X-CSE-MsgGUID: +j/s45nJTVqfiKYdvLSKFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20089171"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="20089171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 20:15:04 -0800
X-CSE-ConnectionGUID: R7vcxK1MRqeiyf1iDYTWVg==
X-CSE-MsgGUID: dI42IAU2QYm11JVsLqmCaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="91116046"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2024 20:15:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEhXx-0004Q9-0A;
	Sat, 23 Nov 2024 04:15:01 +0000
Date: Sat, 23 Nov 2024 12:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:inode_hash_find_debug 123/123]
 fs/bcachefs/fs.c:398:2: warning: label followed by a declaration is a C23
 extension
Message-ID: <202411231230.fs71t2Lt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs inode_hash_find_debug
head:   7f0ae9ab2f5f2ea12951f1d5ff04ff35bbee8d3f
commit: 7f0ae9ab2f5f2ea12951f1d5ff04ff35bbee8d3f [123/123] bcachefs: Debug counters for bch2_inode_hash_find()
config: i386-randconfig-141-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231230.fs71t2Lt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231230.fs71t2Lt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231230.fs71t2Lt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/bcachefs/fs.c:398:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     398 |         int ret = rhashtable_lookup_insert_key(&c->vfs_inodes_table,
         |         ^
   2 warnings generated.


vim +398 fs/bcachefs/fs.c

   387	
   388	static struct bch_inode_info *bch2_inode_hash_insert(struct bch_fs *c,
   389							     struct btree_trans *trans,
   390							     struct bch_inode_info *inode)
   391	{
   392		struct bch_inode_info *old = inode;
   393		struct inode_hash_find_counters s = {};
   394	
   395		set_bit(EI_INODE_HASHED, &inode->ei_flags);
   396		smp_mb__after_atomic();
   397	retry:
 > 398		int ret = rhashtable_lookup_insert_key(&c->vfs_inodes_table,
   399						&inode->ei_inum,
   400						&inode->hash,
   401						bch2_vfs_inodes_params);
   402		if (unlikely(ret)) {
   403			pr_info("%s", bch2_err_str(ret));
   404			old = bch2_inode_hash_find(c, trans, inode->ei_inum, &s);
   405			if (!old)
   406				goto retry;
   407	
   408			clear_bit(EI_INODE_HASHED, &inode->ei_flags);
   409	
   410			/*
   411			 * bcachefs doesn't use I_NEW; we have no use for it since we
   412			 * only insert fully created inodes in the inode hash table. But
   413			 * discard_new_inode() expects it to be set...
   414			 */
   415			inode->v.i_state |= I_NEW;
   416			/*
   417			 * We don't want bch2_evict_inode() to delete the inode on disk,
   418			 * we just raced and had another inode in cache. Normally new
   419			 * inodes don't have nlink == 0 - except tmpfiles do...
   420			 */
   421			set_nlink(&inode->v, 1);
   422			discard_new_inode(&inode->v);
   423			return old;
   424		}
   425	
   426		inode_fake_hash(&inode->v);
   427	
   428		inode_sb_list_add(&inode->v);
   429	
   430		mutex_lock(&c->vfs_inodes_lock);
   431		list_add(&inode->ei_vfs_inode_list, &c->vfs_inodes_list);
   432		mutex_unlock(&c->vfs_inodes_lock);
   433		return inode;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
