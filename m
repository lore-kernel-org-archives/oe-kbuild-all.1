Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68D21FBC91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 06:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758002764; cv=none; b=i8mnEn7CnAET6WA/fY2V1qBWy32xW54pNvmxU7a4TB97keYdYUWvZPJkvXYjWxgMR927fX37r4S7tTx14Zf0Q+QYSqpvBsHYDUhehGiB2ZnpKs4C+b1ES/U8OK4nZ/UaXVPhOhdeVGiBwygTG1ggS3bDqPi4bjl0yTtdBKze1dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758002764; c=relaxed/simple;
	bh=sTZqNym/IRS/yQCrI+eT+ZGZcfJxO3l6wZpbXafmCE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhdh2doDmHP3HWIqN4W2Itki8plLMKTXm4jPeLMaa9EJffk+qE134NyJHywQCzANl7ZwGr76FpND7qX/3a8tkiQlir/iIfpA9LmT6ZNyMBdXUWoQMDQRucV/QVTM3TsROvohGONL7mrnDqCu35GeqW+gvAR0YFjT9nGM/Pjh6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAdcc/Xp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAdcc/Xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758002762; x=1789538762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sTZqNym/IRS/yQCrI+eT+ZGZcfJxO3l6wZpbXafmCE4=;
  b=eAdcc/XpATTOkPTWw9lLzyG96+2uDTqNgngYlbmPqVMI3wq9xYXMy8Ph
   rXlxsN4hms1LGbWZ+R/HCPeUudWVLuE+9kbEaE225p+illXkg8y17DsH3
   klG7OYbd3k4Vv5wj7AFpENpFDsOYKtBe6Fok/N8gTHLp5AD69O3TYh32X
   r3PaSZ0s8ZXIm3zpYcaufpAfY/+Dbu9meeyaVy2SJ+VN6AqZHZQL7mJ3w
   nT5ZSHCtvxeDt9aHAAF7Skq0uGdRAibd3rNkRBi7/tgL7kELW+1SS7qNI
   z3yUAtR9yn5aNUk1GUGopPD4sUqm74noOTT5Y8Cta/k9E8ATtOuyZzcsQ
   w==;
X-CSE-ConnectionGUID: v4eLYxRZSoya5ZQZuqU2KA==
X-CSE-MsgGUID: 9j8IJmmATaScgZ8uDKn3Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="77882001"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="77882001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 23:06:00 -0700
X-CSE-ConnectionGUID: ir3R2LESRkCMSTH41nqkSg==
X-CSE-MsgGUID: /dFNCBBZQTeOBsNkJkC3pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="174456348"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2025 23:05:58 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyOp8-00012h-2D;
	Tue, 16 Sep 2025 06:05:54 +0000
Date: Tue, 16 Sep 2025 14:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: fdmanana@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 22/33] btrfs: add current log leaf, key and slot to
 struct walk_control
Message-ID: <202509161356.JTeWVygY-lkp@intel.com>
References: <247e1013735943cecfe4942a4a163376552cc562.1757271913.git.fdmanana@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <247e1013735943cecfe4942a4a163376552cc562.1757271913.git.fdmanana@suse.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[cannot apply to linus/master v6.17-rc6 next-20250915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-org/btrfs-fix-invalid-extref-key-setup-when-replaying-dentry/20250908-180010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/247e1013735943cecfe4942a4a163376552cc562.1757271913.git.fdmanana%40suse.com
patch subject: [PATCH v2 22/33] btrfs: add current log leaf, key and slot to struct walk_control
config: s390-randconfig-r122-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161356.JTeWVygY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161356.JTeWVygY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161356.JTeWVygY-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/ctree.h:21,
                    from fs/btrfs/tree-log.c:12:
   In function 'btrfs_inode_mode',
       inlined from 'replay_one_buffer' at fs/btrfs/tree-log.c:2649:11:
>> fs/btrfs/accessors.h:66:16: warning: 'inode_item' may be used uninitialized [-Wmaybe-uninitialized]
      66 |         return btrfs_get_##bits(eb, s, offsetof(type, member));         \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/accessors.h:270:1: note: in expansion of macro 'BTRFS_SETGET_FUNCS'
     270 | BTRFS_SETGET_FUNCS(inode_mode, struct btrfs_inode_item, mode, 32);
         | ^~~~~~~~~~~~~~~~~~
   fs/btrfs/tree-log.c: In function 'replay_one_buffer':
   fs/btrfs/tree-log.c:2607:42: note: 'inode_item' was declared here
    2607 |                 struct btrfs_inode_item *inode_item;
         |                                          ^~~~~~~~~~


vim +/inode_item +66 fs/btrfs/accessors.h

07e81dc94474eb Josef Bacik  2022-10-19  60  
07e81dc94474eb Josef Bacik  2022-10-19  61  #define BTRFS_SETGET_FUNCS(name, type, member, bits)			\
07e81dc94474eb Josef Bacik  2022-10-19  62  static inline u##bits btrfs_##name(const struct extent_buffer *eb,	\
07e81dc94474eb Josef Bacik  2022-10-19  63  				   const type *s)			\
07e81dc94474eb Josef Bacik  2022-10-19  64  {									\
98efb4eb310d0d David Sterba 2023-07-13  65  	static_assert(sizeof(u##bits) == sizeof_field(type, member));	\
07e81dc94474eb Josef Bacik  2022-10-19 @66  	return btrfs_get_##bits(eb, s, offsetof(type, member));		\
07e81dc94474eb Josef Bacik  2022-10-19  67  }									\
07e81dc94474eb Josef Bacik  2022-10-19  68  static inline void btrfs_set_##name(const struct extent_buffer *eb, type *s, \
07e81dc94474eb Josef Bacik  2022-10-19  69  				    u##bits val)			\
07e81dc94474eb Josef Bacik  2022-10-19  70  {									\
98efb4eb310d0d David Sterba 2023-07-13  71  	static_assert(sizeof(u##bits) == sizeof_field(type, member));	\
07e81dc94474eb Josef Bacik  2022-10-19  72  	btrfs_set_##bits(eb, s, offsetof(type, member), val);		\
07e81dc94474eb Josef Bacik  2022-10-19  73  }
07e81dc94474eb Josef Bacik  2022-10-19  74  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
