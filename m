Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824761494D9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009424; cv=none; b=mNZb8zH+S90dMwBdGOPiyOAPjh4+DJZkYuBNnK4Y8brlcLtn1SGGm47Byhfl182+SFrZz46k/QB/JRxbN+y05tgc+Ve1FWCivy9WgKQz0SUPkCVIV9pZ77yF5VmFA0EITncS2Glg9D4MBqx5C6uAQ2PyzZmGosQrnnK5vLQ8etg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009424; c=relaxed/simple;
	bh=mQu4dE6djGg/wHfDW6rpcdS3dzEksJnM9NX5ksrG9uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeRCGfB42hPTUB1IcN0buVQ8oIANhymwxBq0fKUPFjKWv3m91FWf6zR0KSB5BCX4D/wKHdHYJxC6TqfXGRpma0dSfoADbg5XfpPXtwltxcseGOgaKNjRNPYPuH5aloA0MMd8asCYuLsd/04OfpokzCKSlF0e7DX/WD1D5n/YHdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjVNUb8D; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjVNUb8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009423; x=1794545423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mQu4dE6djGg/wHfDW6rpcdS3dzEksJnM9NX5ksrG9uM=;
  b=mjVNUb8DJRN0Y2hCz3GVEUlHb8RI1C+AiyK1qGH6wz9BYquYULaIzhsG
   wUIEm+ueDtWU/uaLSOojUePLKVaoL24JTxXOQGxMaOG/fw8OOoRoGsI/z
   5aqnXcNVvMzJ7Cjziq1SiQ8A1tRhBW7SRCzVrv4g1r1JssKPR5+MmJ+zf
   MhHMRknnkAy4UD5GGeJ/9wXtRgSLZca6Rtz8jgKR/FqMEdexWFOAhhVN/
   ZtBq6Q92VfeIh1lpUR/UdDL4Wc+BcYCpw+I/JQGRAKPlzT+WQIdbtWKYd
   BpkYh0JpSMYUmvAWXexsCrNEL55CImsOEz7IVKQFOVwho4YRJKg+gHd+q
   g==;
X-CSE-ConnectionGUID: EHwjTKkEStKDL4YpvVfPxg==
X-CSE-MsgGUID: Vlf/cqurTQaH+Swg7COfSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68947820"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="68947820"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:50:22 -0800
X-CSE-ConnectionGUID: RvXBGahJTK2yJpONGBKFJg==
X-CSE-MsgGUID: G3RPgSZsRJaqqGO5nfhUBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="212789107"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2025 20:50:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPHm-0004st-2b;
	Thu, 13 Nov 2025 04:50:18 +0000
Date: Thu, 13 Nov 2025 12:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/8] iomap: Add bs<ps buffered atomic writes support
Message-ID: <202511122005.2agCLN4v-lkp@intel.com>
References: <8a836debf47e9bcbf42aeaaa93fd67be18f1768a.1762945505.git.ojaswin@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a836debf47e9bcbf42aeaaa93fd67be18f1768a.1762945505.git.ojaswin@linux.ibm.com>

Hi Ojaswin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on next-20251112]
[cannot apply to xfs-linux/for-next tytso-ext4/dev trace/for-next linus/master v6.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ojaswin-Mujoo/fs-Rename-STATX-_ATTR-_WRITE_ATOMIC-STATX-_ATTR-_WRITE_ATOMIC_DIO/20251112-191001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/8a836debf47e9bcbf42aeaaa93fd67be18f1768a.1762945505.git.ojaswin%40linux.ibm.com
patch subject: [RFC PATCH 7/8] iomap: Add bs<ps buffered atomic writes support
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511122005.2agCLN4v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511122005.2agCLN4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511122005.2agCLN4v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/iomap/buffered-io.c: In function '__iomap_write_end':
>> fs/iomap/buffered-io.c:1106:23: warning: unused variable 'inode' [-Wunused-variable]
    1106 |         struct inode *inode = iter->inode;
         |                       ^~~~~


vim +/inode +1106 fs/iomap/buffered-io.c

  1102	
  1103	static bool __iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
  1104			size_t copied, struct folio *folio)
  1105	{
> 1106		struct inode *inode = iter->inode;
  1107	
  1108		flush_dcache_folio(folio);
  1109	
  1110		/*
  1111		 * The blocks that were entirely written will now be uptodate, so we
  1112		 * don't have to worry about a read_folio reading them and overwriting a
  1113		 * partial write.  However, if we've encountered a short write and only
  1114		 * partially written into a block, it will not be marked uptodate, so a
  1115		 * read_folio might come in and destroy our partial write.
  1116		 *
  1117		 * Do the simplest thing and just treat any short write to a
  1118		 * non-uptodate page as a zero-length write, and force the caller to
  1119		 * redo the whole thing.
  1120		 */
  1121		if (unlikely(copied < len && !folio_test_uptodate(folio)))
  1122			return false;
  1123		iomap_set_range_uptodate(folio, offset_in_folio(folio, pos), len);
  1124		iomap_set_range_dirty(folio, offset_in_folio(folio, pos), copied);
  1125		filemap_dirty_folio(iter->inode->i_mapping, folio);
  1126	
  1127		/*
  1128		 * Policy: non atomic write over a previously atomic range makes the
  1129		 * range non-atomic. Handle this here.
  1130		 */
  1131		if (iter->flags & IOMAP_ATOMIC) {
  1132			if (copied < len) {
  1133				/*
  1134				 * A short atomic write is only okay as long as nothing
  1135				 * is written at all. If we have a partial write, there
  1136				 * is a bug in our code.
  1137				 */
  1138				WARN_ON_ONCE(copied != 0);
  1139	
  1140				return false;
  1141			}
  1142			iomap_set_range_atomic(folio, offset_in_folio(folio, pos), len);
  1143		} else {
  1144			if (folio_test_atomic(folio))
  1145				iomap_clear_range_atomic(
  1146					folio, offset_in_folio(folio, pos), len);
  1147		}
  1148	
  1149		return true;
  1150	}
  1151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
