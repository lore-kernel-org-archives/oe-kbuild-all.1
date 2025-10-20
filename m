Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E852E6CA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 21:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760996681; cv=none; b=ZtvhuQ7TcZjMi+Lf+oIngf/3dmc3YaYBMMly2WgpcCwhbEk/v6L8WqCbcmBfOYpnmFMcuHZCVOTZWyKauw8DtPuYEkAFYMRxdS6eCzMgJ4+iAu0c344dT5O9kfQym2wNEJs1r7Q3SEUYu4EBhHkvXS+PZuVXJtu1FQ3KLDBqi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760996681; c=relaxed/simple;
	bh=TdqPhK2oSqzhQWHD2plO/33DziiQxFST67/1Lm1SR90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YROrIGNk9w7EFvVChG/p3wrH4sNSUGM6TedUsaKj7GtJqPkN96NevibFRVW2CVuG2mZ2s2dK64CXB+/rF60TVXlIFWwXULSbCG3zCrnLuhD+Qut8pknb/Sq45BWkQYgS15xWavgf9ueWjRo2QbDKt0c9ZLA8rvVd1VA8MIrOej8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Og83CSAE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Og83CSAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760996680; x=1792532680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TdqPhK2oSqzhQWHD2plO/33DziiQxFST67/1Lm1SR90=;
  b=Og83CSAEp+aR0CxGnQs9Pl8ej5B1fBKLeEx0YMaxsrXIapMbW9O04fX3
   FEU5vbuyFxKQkCs10ZXRpfDtGcpb9n3bYU2UorRRsY2RszaUTiJLBtUQF
   ZfinzXA4N1sCS9BdptjEUqWzIzfLDq8tLQ8q2CjiuFIQ0AWW/h9H65WQg
   8G76Gj0/j//e9YnrzyQdKtVWtaX9cuWZUz/FkNo9yqZGNJXQ41xEB/+LI
   shS4pM6UEQkLHg842TZwnzxTj1wQXQ49J1kq/rV4gk1fGxNL3/TXl8s87
   q4WSPl7FKWU3b+GYbk7PempBlpU4SUt29gnL+jSAJe+ekQjJF+rS4n0ok
   g==;
X-CSE-ConnectionGUID: zruoLwYbSyqI4RZJ4nkjwQ==
X-CSE-MsgGUID: ISHhTVsGS6K7xEF9ltUqXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63039212"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63039212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 14:44:38 -0700
X-CSE-ConnectionGUID: FXOobT3LSSqbkd3fpgkqHQ==
X-CSE-MsgGUID: q5Bmp6XjTdicTRvXmKBNJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187452039"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Oct 2025 14:44:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAxgA-000ABR-2U;
	Mon, 20 Oct 2025 21:44:34 +0000
Date: Tue, 21 Oct 2025 05:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 14/15] fs/f2fs/xattr.c:26:19: sparse: sparse:
 symbol 'inline_xattr_slab' was not declared. Should it be static?
Message-ID: <202510210534.6otvnCrN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   29604ca50fd305d7fb8bea7a031dbb25275c4336
commit: 5792ac38f3d5b1ebb2399e149395d8a622302f9c [14/15] f2fs: use global inline_xattr_slab instead of per-sb slab cache
config: x86_64-randconfig-r111-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210534.6otvnCrN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210534.6otvnCrN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210534.6otvnCrN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/xattr.c:844:1: sparse: sparse: no newline at end of file
>> fs/f2fs/xattr.c:26:19: sparse: sparse: symbol 'inline_xattr_slab' was not declared. Should it be static?

vim +/inline_xattr_slab +26 fs/f2fs/xattr.c

    25	
  > 26	struct kmem_cache *inline_xattr_slab;
    27	static void *xattr_alloc(struct f2fs_sb_info *sbi, int size, bool *is_inline)
    28	{
    29		if (likely(size == DEFAULT_XATTR_SLAB_SIZE)) {
    30			*is_inline = true;
    31			return f2fs_kmem_cache_alloc(inline_xattr_slab,
    32						GFP_F2FS_ZERO, false, sbi);
    33		}
    34		*is_inline = false;
    35		return f2fs_kzalloc(sbi, size, GFP_NOFS);
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
