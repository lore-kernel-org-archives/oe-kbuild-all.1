Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E93FCB2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504365; cv=none; b=buzg6hpHb67vnv6Ve4p5duCCFVf+wfd14lQJVDmVb6DP9uxL6MRhcHIHz0GqrO0FQOwj2UEZP9PqqtsejIsFCH9hk8LErQIL4t2JRFZEnwpAKv8/Yau3UzpvBmT1oYnizy29OPMTUJDezbTdlSt5RN4JZDI4JqEpR/FqTELu4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504365; c=relaxed/simple;
	bh=BjCdaZuVMkVK5vfU1ujC7C6uCmV6zs0qXobgKysmL3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dp+wrR+kTKgkRGs+rkVwY4LhQ6XYxKBZkgcDrA30QpeOGB19fLmm2iXHAMJ6buskD902qjk+UCteL1boO1b7w4kii9HVvsGojGSLSQHOwNeTNO3lqLMjXFi1itFrsoRRvXQeF/qa5E9rBuUpvr5+miIRwtyIjELu14L08/pgjJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNtxKo9E; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNtxKo9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785504363; x=1817040363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BjCdaZuVMkVK5vfU1ujC7C6uCmV6zs0qXobgKysmL3k=;
  b=dNtxKo9E0a2XzvVKusNpFOBP3RZfsLD06ZPcU7CXYlDl0jFjmXAuvHnr
   wDVNsgHNCIf5DmD7JyKhOzwLASMcwwq/TIBeBGydrVmA8YyTyi6Z0IRG9
   hu4UGHRMvp9SF6Os2Pk8+uKIAKwLvYCx4BTDXyvPLN63Lc5LFEY1qgacg
   Iyu805R+llSXh0LjWdPAp8mObv/FJiBCLVIGgbsEwwlc978MMh3vUABsI
   pP4EgYL11bTDe49KtreFIpkNTmPFcpAsTTsXoRnxJxX9AGSQh2BxrHQRo
   RhW7a5kaBdvTUJ0Az4FgR+Wn3QNy7YYRtRH3Pah57RNfz1DTUVVB805wR
   w==;
X-CSE-ConnectionGUID: envH087bQqOp2URtHnTBOQ==
X-CSE-MsgGUID: Ftve607nSCWFkltTXCWTaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="111675804"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="111675804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 06:26:03 -0700
X-CSE-ConnectionGUID: 5VWVTkDPSDygGfPC6dwydg==
X-CSE-MsgGUID: +0w0GLSvRJKSOiVHos64og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="258793421"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2026 06:26:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpnFP-000000000yp-1hIC;
	Fri, 31 Jul 2026 13:25:59 +0000
Date: Fri, 31 Jul 2026 21:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] fs/ntfs3: Add basic support for alternative data
 streams
Message-ID: <202607312142.aahnA9Zj-lkp@intel.com>
References: <20260724111601.14804-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724111601.14804-1-almaz.alexandrovich@paragon-software.com>

Hi Konstantin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260721]
[also build test ERROR on linus/master v7.2-rc5]
[cannot apply to brauner-vfs/vfs.all v7.2-rc4 v7.2-rc3 v7.2-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Komarov/fs-ntfs3-Add-basic-support-for-alternative-data-streams/20260724-193931
base:   next-20260721
patch link:    https://lore.kernel.org/r/20260724111601.14804-1-almaz.alexandrovich%40paragon-software.com
patch subject: [RFC PATCH] fs/ntfs3: Add basic support for alternative data streams
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607312142.aahnA9Zj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312142.aahnA9Zj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312142.aahnA9Zj-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ntfs3/file.c: In function 'ntfs_file_read_iter':
>> fs/ntfs3/file.c:845:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     845 |                 ret = ni_query_ads(ni, &iocb->ki_pos, iter);
         |                 ^~~
         |                 net
   fs/ntfs3/file.c:845:17: note: each undeclared identifier is reported only once for each function it appears in


vim +845 fs/ntfs3/file.c

   813	
   814	/*
   815	 * ntfs_file_read_iter - file_operations::read_iter
   816	 */
   817	static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
   818	{
   819		struct file *file = iocb->ki_filp;
   820		struct inode *inode = file_inode(file);
   821		struct ntfs_inode *ni = ntfs_i(inode);
   822		size_t bytes = iov_iter_count(iter);
   823		loff_t valid, i_size, vbo, end;
   824		unsigned int dio_flags;
   825		ssize_t err;
   826	
   827		err = check_read_restriction(inode);
   828		if (err)
   829			return err;
   830	
   831		if (!bytes)
   832			return 0; /* skip atime */
   833	
   834		if (ni->file.ads.len == ARRAY_SIZE(QUERY_STREAMS) &&
   835		    !memcmp(ni->file.ads.name, QUERY_STREAMS, sizeof(QUERY_STREAMS))) {
   836			/* Query ADS. */
   837			if (unlikely(iocb->ki_flags & IOCB_DIRECT)) {
   838				ntfs_inode_warn(
   839					inode,
   840					"direct I/O for streams is not supported");
   841				return -EOPNOTSUPP;
   842			}
   843	
   844			inode_lock_shared(inode);
 > 845			ret = ni_query_ads(ni, &iocb->ki_pos, iter);
   846			inode_unlock_shared(inode);
   847			return ret;
   848		}
   849	
   850		if (is_compressed(ni)) {
   851			if (iocb->ki_flags & IOCB_DIRECT) {
   852				ntfs_inode_warn(
   853					inode, "direct i/o + compressed not supported");
   854				return -EOPNOTSUPP;
   855			}
   856			/* Turn off readahead for compressed files. */
   857			file->f_ra.ra_pages = 0;
   858		}
   859	
   860		/* Fallback to buffered I/O if the inode does not support direct I/O. */
   861		if (!(iocb->ki_flags & IOCB_DIRECT) ||
   862		    !ntfs_should_use_dio(iocb, iter)) {
   863			iocb->ki_flags &= ~IOCB_DIRECT;
   864			return generic_file_read_iter(iocb, iter);
   865		}
   866	
   867		if (iocb->ki_flags & IOCB_NOWAIT) {
   868			if (!inode_trylock_shared(inode))
   869				return -EAGAIN;
   870		} else {
   871			inode_lock_shared(inode);
   872		}
   873	
   874		vbo = iocb->ki_pos;
   875		end = vbo + bytes;
   876		dio_flags = 0;
   877		valid = ni->i_valid;
   878		i_size = inode->i_size;
   879	
   880		if (vbo < valid) {
   881			if (valid < end) {
   882				/* read cross 'valid' size. */
   883				dio_flags |= IOMAP_DIO_FORCE_WAIT;
   884			}
   885	
   886			if (ni->file.run_da.count) {
   887				/* Direct I/O is not compatible with delalloc. */
   888				err = ni_allocate_da_blocks(ni);
   889				if (err)
   890					goto out;
   891			}
   892	
   893			err = iomap_dio_rw(iocb, iter, &ntfs_iomap_ops, NULL, dio_flags,
   894					   NULL, 0);
   895	
   896			if (err <= 0)
   897				goto out;
   898			end = vbo + err;
   899			if (valid < end) {
   900				size_t to_zero = end - valid;
   901				/* Fix iter. */
   902				iov_iter_revert(iter, to_zero);
   903				iov_iter_zero(to_zero, iter);
   904			}
   905		} else if (vbo < i_size) {
   906			if (end > i_size)
   907				bytes = i_size - vbo;
   908			iov_iter_zero(bytes, iter);
   909			iocb->ki_pos += bytes;
   910			err = bytes;
   911		}
   912	
   913	out:
   914		inode_unlock_shared(inode);
   915		file_accessed(file);
   916		return err;
   917	}
   918	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
