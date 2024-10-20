Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F89BB674
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729430988; cv=none; b=pJ1an1RAISP9hdQxRdHRecUcnd+lgTNT3KfS1rl/vIjaZI98xMmNj7Obof9Nsp+h1LUSFy4mxd1NFx3m26wIAMme/6GtR0Uz0iumUmuIxhhVmvm6/EPvAe1WGHyxKSoQ/1h53spS5lNlqxRN66W7Te7wuEwzYNXunFdjHj74FB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729430988; c=relaxed/simple;
	bh=6Kh648fQ5nqZgaR8Hih+zuQzXhpcD6zx+CeiYqeKrZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMMSkUE367C5cOHkNXrDmOyiX/Wsd297yavstVjnDzHfAP/yfcJ+VHGe6btmO1IS9bMPOuSQAalfGl6Ek+n5w5rFhcE3OfoKemYxdPavdM7h1qKsLu36ODccKpeDNRu0rNbEybvvw/fWuomuPqkvGfq0C3+ZzUP62ri/WYOy6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mezlSyom; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mezlSyom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729430985; x=1760966985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Kh648fQ5nqZgaR8Hih+zuQzXhpcD6zx+CeiYqeKrZs=;
  b=mezlSyom0xxpFI8j0CdiRfb7qbGLXigQedYlmtHue85QGNfBDdGT024I
   fb+YbNS7r0JpsKs2WM/WgzENwRIHPyuERjagXw42K4JYdDevp58aLaN5T
   +8G/9Ek8gU5pWQqjsS01uZiGqtQcDkB94J1IBOiIs0cbz480pVYzQK2Hp
   sNO3jT8PU+9KLq1ZDFqkKr/OT6JMryVRb0GYfBscwgiCsC/9+DJ977Tdd
   k15wf03t7EYFpCkA35YX8eCm+UjhW3v6EAO7yZfM3Z+duEGasoiNd8NOG
   0IJ1lcdzjh2iQOzAq6RnUrRtDZTfc24jYUnDRZs8VU3alea/BOMQRxQfp
   A==;
X-CSE-ConnectionGUID: MZIZW2zbR6yN6qSCmftrsg==
X-CSE-MsgGUID: 0YSVUadqQ4+2k2pNXetA+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29083499"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29083499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 06:29:44 -0700
X-CSE-ConnectionGUID: Cvyf0RXhROKtLWcxnqIg0Q==
X-CSE-MsgGUID: CwbtI3CeSRehi+XdzPAKgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="78877785"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Oct 2024 06:29:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2W04-000QJt-2x;
	Sun, 20 Oct 2024 13:29:40 +0000
Date: Sun, 20 Oct 2024 21:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fs: erofs: support PG_mappedtodisk flag for folios
 with zero-filled
Message-ID: <202410202021.wvrWyWWA-lkp@intel.com>
References: <20241017074346.35284-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017074346.35284-1-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/fs-erofs-support-PG_mappedtodisk-flag-for-folios-with-zero-filled/20241017-154545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20241017074346.35284-1-21cnbao%40gmail.com
patch subject: [PATCH RFC] fs: erofs: support PG_mappedtodisk flag for folios with zero-filled
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241020/202410202021.wvrWyWWA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410202021.wvrWyWWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410202021.wvrWyWWA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/fileio.c: In function 'erofs_fileio_scan_folio':
>> fs/erofs/fileio.c:91:14: warning: variable 'fully_mapped' set but not used [-Wunused-but-set-variable]
      91 |         bool fully_mapped = true;
         |              ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/fully_mapped +91 fs/erofs/fileio.c

    84	
    85	static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
    86	{
    87		struct inode *inode = folio_inode(folio);
    88		struct erofs_map_blocks *map = &io->map;
    89		unsigned int cur = 0, end = folio_size(folio), len, attached = 0;
    90		loff_t pos = folio_pos(folio), ofs;
  > 91		bool fully_mapped = true;
    92		struct iov_iter iter;
    93		struct bio_vec bv;
    94		int err = 0;
    95	
    96		erofs_onlinefolio_init(folio);
    97		while (cur < end) {
    98			if (!in_range(pos + cur, map->m_la, map->m_llen)) {
    99				map->m_la = pos + cur;
   100				map->m_llen = end - cur;
   101				err = erofs_map_blocks(inode, map);
   102				if (err)
   103					break;
   104			}
   105	
   106			ofs = folio_pos(folio) + cur - map->m_la;
   107			len = min_t(loff_t, map->m_llen - ofs, end - cur);
   108			if (map->m_flags & EROFS_MAP_META) {
   109				struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
   110				void *src;
   111	
   112				src = erofs_read_metabuf(&buf, inode->i_sb,
   113							 map->m_pa + ofs, EROFS_KMAP);
   114				if (IS_ERR(src)) {
   115					err = PTR_ERR(src);
   116					break;
   117				}
   118				bvec_set_folio(&bv, folio, len, cur);
   119				iov_iter_bvec(&iter, ITER_DEST, &bv, 1, len);
   120				if (copy_to_iter(src, len, &iter) != len) {
   121					erofs_put_metabuf(&buf);
   122					err = -EIO;
   123					break;
   124				}
   125				erofs_put_metabuf(&buf);
   126			} else if (!(map->m_flags & EROFS_MAP_MAPPED)) {
   127				folio_zero_segment(folio, cur, cur + len);
   128				fully_mapped = false;
   129				attached = 0;
   130			} else {
   131				if (io->rq && (map->m_pa + ofs != io->dev.m_pa ||
   132					       map->m_deviceid != io->dev.m_deviceid)) {
   133	io_retry:
   134					erofs_fileio_rq_submit(io->rq);
   135					io->rq = NULL;
   136				}
   137	
   138				if (!io->rq) {
   139					io->dev = (struct erofs_map_dev) {
   140						.m_pa = io->map.m_pa + ofs,
   141						.m_deviceid = io->map.m_deviceid,
   142					};
   143					err = erofs_map_dev(inode->i_sb, &io->dev);
   144					if (err)
   145						break;
   146					io->rq = erofs_fileio_rq_alloc(&io->dev);
   147					io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
   148					attached = 0;
   149				}
   150				if (!attached++)
   151					erofs_onlinefolio_split(folio);
   152				if (!bio_add_folio(&io->rq->bio, folio, len, cur))
   153					goto io_retry;
   154				io->dev.m_pa += len;
   155			}
   156			cur += len;
   157		}
   158		erofs_onlinefolio_end(folio, err);
   159		return err;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
