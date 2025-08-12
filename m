Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9DCA921
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012649; cv=none; b=OlacCmLtjbk20CGNxb8llLkFOPsUEnsssvc7PPQQ4ShKqN5KLPZ3HQ8voQsqUC1p+yZk5a/ONnHhrAByIWxknbx5z7o6FqYgpZF5TuNZrFjM6GTw/FUq14bBOU5Ev9aWbUTGnn8rS+qC/dlEeD8lwnosJ9p4mNXSp9ay26nIvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012649; c=relaxed/simple;
	bh=5x5UyBV356X+DEqU8iepKynRspmTeqyUlDfR15+K4tI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXpKoTmgoN5/EhHqIsi8lj1a+AubAS4GX5nS4FfWgiTvF6Kn+pZPtYND5OCNcowPjLZj97RQ2e2ZusdHhGtUDCt+pszvuoE6gr8T9pAVxzsMdo4iqRUhDn2pZOZyXZhdoFyeGmv69Hhzs9wGzpzVRmlomrVa3y56cD0Dt8b5Pqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwLiAqKg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwLiAqKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755012648; x=1786548648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5x5UyBV356X+DEqU8iepKynRspmTeqyUlDfR15+K4tI=;
  b=GwLiAqKggmn9ksSXETp6iNCA0f23tqA18Ed/Jz92Ux2gesctvS5nl4es
   ZII8fd5olypBPkNNcQkHJAgbSsHbJ/wfD0etEiVcYE6RmTSFtNLG3seGg
   zlRkieqXDmCF6yUG93eDvQIQl5HPUUPj3O6atJuyoifguO10bLWbkHPXj
   W5tNMifCIcGquGy32JhoYNw/EU9I9aLnq68AdnwmP3dowhfxmiDo2qvWG
   BmKPxMglCMVW2+ojavdsA2Rz+sJX2Dq/8GlrhzZAqfwrvLfcTkhmKrW61
   aenKziVqzhK7k6v9l0JjVEOvF5Uw1YCECmReCY+dKuFMUePh4d+v8uUYv
   Q==;
X-CSE-ConnectionGUID: I5P3HEViQtaRhk7pxBSUJA==
X-CSE-MsgGUID: +i0ZnsE0TNyWdKb/GYDRoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57247855"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57247855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 08:30:48 -0700
X-CSE-ConnectionGUID: zdrw8wj6QkWbztnhS0zbWw==
X-CSE-MsgGUID: frORuNK9QUCdogB/R+/w1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166587011"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Aug 2025 08:30:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulqxY-0006vt-1Q;
	Tue, 12 Aug 2025 15:30:44 +0000
Date: Tue, 12 Aug 2025 23:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page 12/16] fs/hugetlbfs/inode.c:201:21:
 error: expected identifier or '(' before '=' token
Message-ID: <202508122337.vVNDTpuV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   cfd698ddd683b459ebc1c50b410b6486ebd7abd8
commit: 5d84c8f1c5e4f7c63f1e9726ebb5859554f97f58 [12/16] fs: hugetlbfs: cleanup adjust_range_hwpoison()
config: x86_64-randconfig-004-20250812 (https://download.01.org/0day-ci/archive/20250812/202508122337.vVNDTpuV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508122337.vVNDTpuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508122337.vVNDTpuV-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/hugetlbfs/inode.c: In function 'adjust_range_hwpoison':
>> fs/hugetlbfs/inode.c:201:21: error: expected identifier or '(' before '=' token
     201 |         struct page = folio_page(folio, offset / PAGE_SIZE);
         |                     ^
>> fs/hugetlbfs/inode.c:208:54: error: 'page' undeclared (first use in this function)
     208 |                 if (is_raw_hwpoison_page_in_hugepage(page))
         |                                                      ^~~~
   fs/hugetlbfs/inode.c:208:54: note: each undeclared identifier is reported only once for each function it appears in


vim +201 fs/hugetlbfs/inode.c

   190	
   191	/*
   192	 * Someone wants to read @bytes from a HWPOISON hugetlb @folio from @offset.
   193	 * Returns the maximum number of bytes one can read without touching the 1st raw
   194	 * HWPOISON page.
   195	 *
   196	 * The implementation borrows the iteration logic from copy_page_to_iter*.
   197	 */
   198	static size_t adjust_range_hwpoison(struct folio *folio, size_t offset,
   199			size_t bytes)
   200	{
 > 201		struct page = folio_page(folio, offset / PAGE_SIZE);
   202		const size_t orig_bytes = bytes;
   203	
   204		offset %= PAGE_SIZE;
   205		while (bytes) {
   206			size_t n;
   207	
 > 208			if (is_raw_hwpoison_page_in_hugepage(page))
   209				break;
   210	
   211			/* Safe to read n bytes without touching HWPOISON subpage. */
   212			n = min(bytes, (size_t)PAGE_SIZE - offset);
   213			offset = 0;
   214			bytes -= n;
   215			page++;
   216		}
   217	
   218		return orig_bytes - bytes;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
