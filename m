Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD902346AE8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154376; cv=none; b=ec9mM4oHdU5A0r3Hfa8VOnVlrU3lhhZjVV1tu0oxDbu1fy3MboCDo/ptoVac1fPZXTL2xoNH5pAbxZkLaYFrN/CwKxJOKulk/KScqdW34NxuFUTGo7J/0oUCbBagykRi7g1/VUQfEeZRJC37ahOPoHe81z0DX4pbTlmM5v46F30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154376; c=relaxed/simple;
	bh=PV5v2i8QU0rD0+sVR9rHd9cLz58mIvr8Gylr6geQpDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWHVaHlW2ZIDBchQdJycfl66BB5RwPoTUBzdaIGSBkTI0hmdBAYNQoetqvfJWKj6jOD7kdEz3KSLDNjDl+xF4q4WJkbuRJtXe6O27l92K1k0tPWDdI9wPr9pk7t6OMYSdRRJY77aNK9sC7s/UjDltuuWUYs0CPv+Y5G/F18Izz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSZu9YlT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSZu9YlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782154375; x=1813690375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PV5v2i8QU0rD0+sVR9rHd9cLz58mIvr8Gylr6geQpDA=;
  b=KSZu9YlT/m8iwoFXC+9+5JydRLVh0lyQErfYOXqGMwrCdKqYZ4Efg3Qf
   +YVGsSEfYGUqh3elg+4KX079FulX7GaZ5+SBqnOCzO7t74KVtPCo0lBmx
   2FyQGgpIzVhbXhAEpjtCny3JKd3frgn7jVGHFWs0X62xgqBn0dqiUTD0B
   uJd4ZCqsQxgsnJayF4LZuWLAa/pHpHoVeGz0P5ZS8IXH5zPU4MtXQ1758
   aR08t7HihzXTbpbjAoDIEBW2R4WJE1PEDET7R0aBW62fYR7kr7uNGua8L
   WrD0Zs9ftI79TIvTunnrBRkLngwAOCztwhOQuK0SYF7+CwvMKYAx/39Hx
   w==;
X-CSE-ConnectionGUID: 6Q+LnLNCS2qHz5Z3lJMv9g==
X-CSE-MsgGUID: O9cBC6kdRzKmEbg3Cererg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83004438"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="83004438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 11:52:54 -0700
X-CSE-ConnectionGUID: Y2AjokrpR8e20j5BlHS9hg==
X-CSE-MsgGUID: f1qVuGwpR8yxtiZ/CW3BOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="245167338"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2026 11:52:53 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbjlL-0000000064P-1T8O;
	Mon, 22 Jun 2026 18:52:51 +0000
Date: Mon, 22 Jun 2026 20:52:00 +0200
From: kernel test robot <lkp@intel.com>
To: Alberto Ruiz via B4 Relay <devnull+aruiz.redhat.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] erofs: add KUnit test for memory-backed
 compressed mount
Message-ID: <202606222038.4MTbEObD-lkp@intel.com>
References: <20260618-erofs-memback-v1-2-5aa7006a241a@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-erofs-memback-v1-2-5aa7006a241a@redhat.com>

Hi Alberto,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6b5a2b7d9bc156e505f09e698d85d6a1547c1206]

url:    https://github.com/intel-lab-lkp/linux/commits/Alberto-Ruiz-via-B4-Relay/erofs-add-memory-backed-mode-for-non-page-aligned-mount/20260622-162856
base:   6b5a2b7d9bc156e505f09e698d85d6a1547c1206
patch link:    https://lore.kernel.org/r/20260618-erofs-memback-v1-2-5aa7006a241a%40redhat.com
patch subject: [PATCH RFC 2/2] erofs: add KUnit test for memory-backed compressed mount
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260622/202606222038.4MTbEObD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222038.4MTbEObD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222038.4MTbEObD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/memback.c: In function 'erofs_memback_scan_folio':
>> fs/erofs/memback.c:80:61: warning: variable 'attached' set but not used [-Wunused-but-set-variable]
      80 |         unsigned int cur = 0, end = folio_size(folio), len, attached = 0;
         |                                                             ^~~~~~~~


vim +/attached +80 fs/erofs/memback.c

    74	
    75	static int erofs_memback_scan_folio(struct erofs_memback_io *io,
    76					    struct inode *inode, struct folio *folio)
    77	{
    78		struct erofs_sb_info *sbi = EROFS_SB(inode->i_sb);
    79		struct erofs_map_blocks *map = &io->map;
  > 80		unsigned int cur = 0, end = folio_size(folio), len, attached = 0;
    81		loff_t pos = folio_pos(folio), ofs;
    82		int err = 0;
    83	
    84		erofs_onlinefolio_init(folio);
    85		while (cur < end) {
    86			if (!in_range(pos + cur, map->m_la, map->m_llen)) {
    87				map->m_la = pos + cur;
    88				map->m_llen = end - cur;
    89				err = erofs_map_blocks(inode, map);
    90				if (err)
    91					break;
    92			}
    93	
    94			ofs = pos + cur - map->m_la;
    95			len = min_t(loff_t, map->m_llen - ofs, end - cur);
    96			if (map->m_flags & EROFS_MAP_META) {
    97				struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
    98				void *src;
    99	
   100				src = erofs_read_metabuf(&buf, inode->i_sb,
   101							 map->m_pa + ofs,
   102							 erofs_inode_in_metabox(inode));
   103				if (IS_ERR(src)) {
   104					err = PTR_ERR(src);
   105					break;
   106				}
   107				memcpy_to_folio(folio, cur, src, len);
   108				erofs_put_metabuf(&buf);
   109			} else if (!(map->m_flags & EROFS_MAP_MAPPED)) {
   110				folio_zero_segment(folio, cur, cur + len);
   111				attached = 0;
   112			} else {
   113				loff_t pa = map->m_pa + ofs;
   114	
   115				if (pa + len > sbi->memback_size) {
   116					err = -EFSCORRUPTED;
   117					break;
   118				}
   119				memcpy_to_folio(folio, cur,
   120						(char *)sbi->memback_data + pa, len);
   121				attached = 1;
   122			}
   123			cur += len;
   124		}
   125		erofs_onlinefolio_end(folio, err, false);
   126		return err;
   127	}
   128	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
