Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313E1DE889
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743369014; cv=none; b=POVanOyhz7rmWOHPgb8ygh+SfNemK8X2p0iFtB58o+FzRwUybU6F4Ilo36dPmLorUm1BfpCh9qBkymPoP8mjPpt/qoXqP3XUIn9Mw6kaSKweGS+Eqpj4w40lCn3Toel21s8JNAFPzpTP/SRILCDW0LhAoHDkZKiPu0KUY7R9Qr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743369014; c=relaxed/simple;
	bh=IKOgng5XiTr8I5B2O2TgQl6sFWhK2bNap2uRNkRXaZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pGmbg4ILSjh0x0O6Tn5IyCEYPxp16aYC3V/iR998F8u3QDYqmODC0gduRM7MTNp8iBU5LXSnFBDmhywvTERHCnElNyzg5X0KoC8VotveUXx4qBINc77+MZHbFS4xhj+q3lHaA6BVq37nI7g38J8EzJakHx4O0E5ybozr5pZz5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgpjuOGV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgpjuOGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743369012; x=1774905012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IKOgng5XiTr8I5B2O2TgQl6sFWhK2bNap2uRNkRXaZY=;
  b=fgpjuOGV3je6lgthnryyXmN3s7S2tqTdr3ys/s2zvi+aqHr4K7WKltnN
   sENC0e+pmUhGcNtRvCxZ+9FgufPU0pJL6bw+YnEEMV053NazavsMxkdwW
   otXHN60rmBGPmTOXxwLw2ClujI/SshS8nBUK2AzsWovJnqpNYMCHfaS5x
   Rx2iyspxJP7+w27miN4SHMs5c5KT40+6+gV+YveVi4QEzc4PUD3Ccfm6d
   tQdsxNV/i77NgBBhbw+/VRXOlLKo0DSZrBIHIGbghOjGGJoYPp4Qc3YU+
   7aWq8ezxW6cUmINQ85R11FZeA+Bt9+r45o2aUGZGH8TNC/k8bbXmnDxxr
   Q==;
X-CSE-ConnectionGUID: 3InWTHtwRwujxa+KqPUFaQ==
X-CSE-MsgGUID: uUpvDxTuRACZOYpaPJbsNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="43904774"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="43904774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 14:10:10 -0700
X-CSE-ConnectionGUID: 3SQ9sNubQFKHCXKpOqxkQg==
X-CSE-MsgGUID: 3NeiaQfOSleroSgYnEKu1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="125681166"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Mar 2025 14:10:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyzuS-0008t8-0g;
	Sun, 30 Mar 2025 21:09:55 +0000
Date: Mon, 31 Mar 2025 05:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 140/140] fs/erofs/zmap.c:580:70:
 warning: implicit conversion from 'enum <anonymous>' to 'enum
 erofs_kmap_type'
Message-ID: <202503310431.f9aLkQ3H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   cead3662bf284665fff11a4f7e429b457d2608ca
commit: 7457d0fb6724ca23822f217b5562df16040c04bd [140/140] erofs: implement encoded extent metadata
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250331/202503310431.f9aLkQ3H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503310431.f9aLkQ3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503310431.f9aLkQ3H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/zmap.c: In function 'z_erofs_map_blocks_ext':
>> fs/erofs/zmap.c:580:70: warning: implicit conversion from 'enum <anonymous>' to 'enum erofs_kmap_type' [-Wenum-conversion]
     580 |                         ext = erofs_read_metabuf(&map->buf, sb, pos, true);
         |                                                                      ^~~~
   fs/erofs/zmap.c:592:70: warning: implicit conversion from 'enum <anonymous>' to 'enum erofs_kmap_type' [-Wenum-conversion]
     592 |                         ext = erofs_read_metabuf(&map->buf, sb, pos, true);
         |                                                                      ^~~~
   fs/erofs/zmap.c:612:69: warning: implicit conversion from 'enum <anonymous>' to 'enum erofs_kmap_type' [-Wenum-conversion]
     612 |                                                  pos + mid * recsz, true);
         |                                                                     ^~~~


vim +580 fs/erofs/zmap.c

   561	
   562	static int z_erofs_map_blocks_ext(struct inode *inode,
   563					  struct erofs_map_blocks *map, int flags)
   564	{
   565		struct erofs_inode *vi = EROFS_I(inode);
   566		struct super_block *sb = inode->i_sb;
   567		bool interlaced = vi->z_advise & Z_EROFS_ADVISE_INTERLACED_PCLUSTER;
   568		unsigned int recsz = z_erofs_extent_recsize(vi->z_advise);
   569		erofs_off_t pos = round_up(Z_EROFS_MAP_HEADER_END(erofs_iloc(inode) +
   570					   vi->inode_isize + vi->xattr_isize), recsz);
   571		erofs_off_t lend = inode->i_size;
   572		erofs_off_t l, r, mid, pa, la, lstart;
   573		struct z_erofs_extent *ext;
   574		unsigned int fmt;
   575		bool last;
   576	
   577		map->m_flags = 0;
   578		if (recsz <= offsetof(struct z_erofs_extent, pstart_hi)) {
   579			if (recsz <= offsetof(struct z_erofs_extent, pstart_lo)) {
 > 580				ext = erofs_read_metabuf(&map->buf, sb, pos, true);
   581				if (IS_ERR(ext))
   582					return PTR_ERR(ext);
   583				pa = le64_to_cpu(*(__le64 *)ext);
   584				pos += sizeof(__le64);
   585				lstart = 0;
   586			} else {
   587				lstart = map->m_la >> vi->z_lclusterbits;
   588				pa = EROFS_NULL_ADDR;
   589			}
   590	
   591			for (; lstart <= map->m_la; lstart += 1 << vi->z_lclusterbits) {
   592				ext = erofs_read_metabuf(&map->buf, sb, pos, true);
   593				if (IS_ERR(ext))
   594					return PTR_ERR(ext);
   595				map->m_plen = le32_to_cpu(ext->plen);
   596				if (pa != EROFS_NULL_ADDR) {
   597					map->m_pa = pa;
   598					pa += map->m_plen & Z_EROFS_EXTENT_PLEN_MASK;
   599				} else {
   600					map->m_pa = le32_to_cpu(ext->pstart_lo);
   601				}
   602				pos += recsz;
   603			}
   604			last = (lstart >= round_up(lend, 1 << vi->z_lclusterbits));
   605			lend = min(lstart, lend);
   606			lstart -= 1 << vi->z_lclusterbits;
   607		} else {
   608			lstart = lend;
   609			for (l = 0, r = vi->z_extents; l < r; ) {
   610				mid = l + (r - l) / 2;
   611				ext = erofs_read_metabuf(&map->buf, sb,
   612							 pos + mid * recsz, true);
   613				if (IS_ERR(ext))
   614					return PTR_ERR(ext);
   615	
   616				la = le32_to_cpu(ext->lstart_lo);
   617				pa = le32_to_cpu(ext->pstart_lo) |
   618					(u64)le32_to_cpu(ext->pstart_hi) << 32;
   619				if (recsz > offsetof(struct z_erofs_extent, lstart_hi))
   620					la |= (u64)le32_to_cpu(ext->lstart_hi) << 32;
   621	
   622				if (la > map->m_la) {
   623					r = mid;
   624					lend = la;
   625				} else {
   626					l = mid + 1;
   627					if (map->m_la == la)
   628						r = min(l + 1, r);
   629					lstart = la;
   630					map->m_plen = le32_to_cpu(ext->plen);
   631					map->m_pa = pa;
   632				}
   633			}
   634			last = (l >= vi->z_extents);
   635		}
   636	
   637		if (lstart < lend) {
   638			map->m_la = lstart;
   639			if (last && (vi->z_advise & Z_EROFS_ADVISE_FRAGMENT_PCLUSTER)) {
   640				map->m_flags |= EROFS_MAP_MAPPED | EROFS_MAP_FRAGMENT;
   641				vi->z_fragmentoff = map->m_plen;
   642				if (recsz >= offsetof(struct z_erofs_extent, pstart_lo))
   643					vi->z_fragmentoff |= map->m_pa << 32;
   644			} else if (map->m_plen) {
   645				map->m_flags |= EROFS_MAP_MAPPED |
   646					EROFS_MAP_FULL_MAPPED | EROFS_MAP_ENCODED;
   647				fmt = map->m_plen >> Z_EROFS_EXTENT_PLEN_FMT_BIT;
   648				if (fmt)
   649					map->m_algorithmformat = fmt - 1;
   650				else if (interlaced && !erofs_blkoff(sb, map->m_pa))
   651					map->m_algorithmformat =
   652						Z_EROFS_COMPRESSION_INTERLACED;
   653				else
   654					map->m_algorithmformat =
   655						Z_EROFS_COMPRESSION_SHIFTED;
   656				if (map->m_plen & Z_EROFS_EXTENT_PLEN_PARTIAL)
   657					map->m_flags |= EROFS_MAP_PARTIAL_REF;
   658				map->m_plen &= Z_EROFS_EXTENT_PLEN_MASK;
   659			}
   660		}
   661		map->m_llen = lend - map->m_la;
   662		if (!last && map->m_llen < sb->s_blocksize) {
   663			erofs_err(sb, "extent too small %llu @ offset %llu of nid %llu",
   664				  map->m_llen, map->m_la, vi->nid);
   665			DBG_BUGON(1);
   666			return -EFSCORRUPTED;
   667		}
   668		return 0;
   669	}
   670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
