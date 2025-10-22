Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC8219E8C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 02:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100201; cv=none; b=OZZklTML3jaGVy1YocFaSkAGlhErC1YsiArz9dRErMCPWzBoalupPTeynjmBG942wF+FPlLQ6JO08X8XwTdVFPSlesAd/37nPyd9lmXAWZShn8vuw6xF8ici9GZh3stCnvrtkH8eVnex3VPPQ0Xrz39YA3mTZth7KZTmxsP0dv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100201; c=relaxed/simple;
	bh=yeS0wzeV5GEso3G/hjBCRK5IOKErIexTutTtm7Om6cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVv16Yeli6kM1Ec1T0EG+VvkRJPBZbm1XxW9Pn/nt1a+05Al5Ta28j8SUpXQa0QJDF19UVhYEZETTZnXoCMPAzIm1zrzLil6AuUA8SO0WTdruZrAWdrFRbthAkSpUCfhQyLwXTKVumt4fkJfODbaL/CLJf6pXFCFSat44KkFpDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7Rqy05G; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7Rqy05G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761100199; x=1792636199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yeS0wzeV5GEso3G/hjBCRK5IOKErIexTutTtm7Om6cM=;
  b=Q7Rqy05GEzd1BU5nCW2CZ0U+u32r+AQSSExVPOdo5PRLwdSxDefLkRyw
   0XTUm8YLx3LSpY08aHTF0n/QSbDtoP2WR9KCLEeFjZcmKSPrfKcesZNcr
   8w3I+0OwHI3K27D5V5AKGx2XsujobVlZQVVej1nwlc6UPTbjPe3ZtWlp/
   X7nKb9O9yLWPzl271KoXhk/ykE5qt/6YWgyAtsBjkn4LROYp2t8jtCo2C
   5NN2E7mGpP71Na4fAAnEwED9g2Jxh2m9Kawg9i3AyXZjoIjGf3MEud5qV
   AdF0AwuiWdUQmOV3Y2Fes/Cnx4Gh/5E21l8y9Yc0Zs3RBdZOCLqiejgIy
   g==;
X-CSE-ConnectionGUID: FpVz8zqjTlmVU/YuaavBhA==
X-CSE-MsgGUID: VT4kHrlrRVGwDLYBJKsltg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50812415"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="50812415"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 19:29:58 -0700
X-CSE-ConnectionGUID: rLnmUmsmSbah5mUarYg3YA==
X-CSE-MsgGUID: KgUqO1xgSaahSsMj4Fzvjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="182953847"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2025 19:29:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBObp-000Bvx-38;
	Wed, 22 Oct 2025 02:29:53 +0000
Date: Wed, 22 Oct 2025 10:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Foster <bfoster@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [brauner-github:vfs-6.19.iomap 20/25] fs/iomap/buffered-io.c:870:52:
 sparse: sparse: non size-preserving pointer to integer cast
Message-ID: <202510221056.CurII0gb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.19.iomap
head:   d61f6a3dc4f623b16ed43dd6113f594403b35211
commit: b50d39532fdab9126c794139babaec5798e79567 [20/25] iomap: optional zero range dirty folio processing
config: microblaze-randconfig-r131-20251021 (https://download.01.org/0day-ci/archive/20251022/202510221056.CurII0gb-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221056.CurII0gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221056.CurII0gb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/iomap/buffered-io.c:870:52: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long long [usertype] count @@     got unsigned long long * @@
   fs/iomap/buffered-io.c:870:52: sparse:     expected unsigned long long [usertype] count
   fs/iomap/buffered-io.c:870:52: sparse:     got unsigned long long *
>> fs/iomap/buffered-io.c:870:52: sparse: sparse: non size-preserving pointer to integer cast

vim +870 fs/iomap/buffered-io.c

   804	
   805	/*
   806	 * Grab and prepare a folio for write based on iter state. Returns the folio,
   807	 * offset, and length. Callers can optionally pass a max length *plen,
   808	 * otherwise init to zero.
   809	 */
   810	static int iomap_write_begin(struct iomap_iter *iter,
   811			const struct iomap_write_ops *write_ops, struct folio **foliop,
   812			size_t *poffset, u64 *plen)
   813	{
   814		const struct iomap *srcmap = iomap_iter_srcmap(iter);
   815		loff_t pos;
   816		u64 len = min_t(u64, SIZE_MAX, iomap_length(iter));
   817		struct folio *folio;
   818		int status = 0;
   819	
   820		len = min_not_zero(len, *plen);
   821		*foliop = NULL;
   822		*plen = 0;
   823	
   824		if (fatal_signal_pending(current))
   825			return -EINTR;
   826	
   827		folio = __iomap_get_folio(iter, write_ops, len);
   828		if (IS_ERR(folio))
   829			return PTR_ERR(folio);
   830	
   831		/*
   832		 * No folio means we're done with a batch. We still have range to
   833		 * process so return and let the caller iterate and refill the batch.
   834		 */
   835		if (!folio) {
   836			WARN_ON_ONCE(!iter->fbatch);
   837			return 0;
   838		}
   839	
   840		/*
   841		 * Now we have a locked folio, before we do anything with it we need to
   842		 * check that the iomap we have cached is not stale. The inode extent
   843		 * mapping can change due to concurrent IO in flight (e.g.
   844		 * IOMAP_UNWRITTEN state can change and memory reclaim could have
   845		 * reclaimed a previously partially written page at this index after IO
   846		 * completion before this write reaches this file offset) and hence we
   847		 * could do the wrong thing here (zero a page range incorrectly or fail
   848		 * to zero) and corrupt data.
   849		 */
   850		if (write_ops && write_ops->iomap_valid) {
   851			bool iomap_valid = write_ops->iomap_valid(iter->inode,
   852								 &iter->iomap);
   853			if (!iomap_valid) {
   854				iter->iomap.flags |= IOMAP_F_STALE;
   855				status = 0;
   856				goto out_unlock;
   857			}
   858		}
   859	
   860		/*
   861		 * The folios in a batch may not be contiguous. If we've skipped
   862		 * forward, advance the iter to the pos of the current folio. If the
   863		 * folio starts beyond the end of the mapping, it may have been trimmed
   864		 * since the lookup for whatever reason. Return a NULL folio to
   865		 * terminate the op.
   866		 */
   867		if (folio_pos(folio) > iter->pos) {
   868			len = min_t(u64, folio_pos(folio) - iter->pos,
   869					 iomap_length(iter));
 > 870			status = iomap_iter_advance(iter, &len);
   871			if (status || !len)
   872				goto out_unlock;
   873		}
   874	
   875		pos = iomap_trim_folio_range(iter, folio, poffset, &len);
   876	
   877		if (srcmap->type == IOMAP_INLINE)
   878			status = iomap_write_begin_inline(iter, folio);
   879		else if (srcmap->flags & IOMAP_F_BUFFER_HEAD)
   880			status = __block_write_begin_int(folio, pos, len, NULL, srcmap);
   881		else
   882			status = __iomap_write_begin(iter, write_ops, len, folio);
   883	
   884		if (unlikely(status))
   885			goto out_unlock;
   886	
   887		*foliop = folio;
   888		*plen = len;
   889		return 0;
   890	
   891	out_unlock:
   892		__iomap_put_folio(iter, write_ops, 0, folio);
   893		return status;
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
