Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D148364022
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484416; cv=none; b=UofobvFNF9O5qEz+MZe9COyN8tFsvxvxGE4bCOFTZhrIsY3zUZk+/XNYi9x7hlmYdEq/Y6tHcY33b9NAdaWEoyGUaEYUc0KnnHRG5uCajJFttwkoA4jhJcjOnLMvJxzSWZNNuRfDEcMJhmjdXr4L3S7b0IEgmJyNGERyLsFfs+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484416; c=relaxed/simple;
	bh=3GnfgTYWC+DWFKvMOa878LLlzcsvgeCbCSiOIC94vnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kH3+TSF+bb6M/9sbInUmqgE9unt3WFCsgHL0mckrDCyFtT2mff7askwVIuznIdtHUMJBXUquhCxFK8oyTPIz+qzJ8WyFo8bL/69U1abHHBF5Ynh5ee1Wuoz2MkaouEWOpoaBsuNQcDKgrcqIGMGMmVpWTu5mrAVoHmlt/0RIKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0xd0m/O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0xd0m/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484415; x=1795020415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3GnfgTYWC+DWFKvMOa878LLlzcsvgeCbCSiOIC94vnE=;
  b=d0xd0m/OK3UC46dcEztKnC0jTEF2xAIcjZJIWoEiQ1XmHOBNWpHmO2Cs
   UCYbAiSYCqTeBzdwNLza4nJJdOHNNsw6MoV9xQCbiCea+sTVPIxnkynPJ
   mrRmsgFD0eEbhszzalEA6emeW6CoCWeKEBEQFozQgvIQoAwD9HBJhA69w
   rF0hCJJQ0ZlD+rpaZrVYKaEdSyYVakDjYKhKgvP667Yak1t5XIae7VWoO
   2GwdSMANYiue+qFCsCGL+XjHJ9ydm64lzO9hZEn+VGyRSfCFYa9GoygX+
   5B8rUM8HK41kXmo5s8vcujFRA6zXAZQAlXG8XP6XBmFRJa+yIhWRqXOAx
   w==;
X-CSE-ConnectionGUID: 33Wl8vXuSTa2aSZZ/AG0Ag==
X-CSE-MsgGUID: IvpmagKwS7Gpfz68/mCqVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65451298"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65451298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:46:52 -0800
X-CSE-ConnectionGUID: CzbJzQyaQdmGTy34hua0zw==
X-CSE-MsgGUID: 6qZy8Bp4R4iCoAkppnoRvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191585162"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2025 08:46:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLOqu-0001xb-2f;
	Tue, 18 Nov 2025 16:46:48 +0000
Date: Wed, 19 Nov 2025 00:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fs: Add uoff_t
Message-ID: <202511190058.bebeyFBx-lkp@intel.com>
References: <20251118152935.3735484-1-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118152935.3735484-1-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arnd-asm-generic/master linus/master v6.18-rc6 next-20251118]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/fs-Add-uoff_t/20251118-233038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251118152935.3735484-1-willy%40infradead.org
patch subject: [PATCH] fs: Add uoff_t
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511190058.bebeyFBx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190058.bebeyFBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190058.bebeyFBx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/shmem.c:5810:6: error: conflicting types for 'shmem_truncate_range'; have 'void(struct inode *, loff_t,  loff_t)' {aka 'void(struct inode *, long long int,  long long int)'}
    5810 | void shmem_truncate_range(struct inode *inode, loff_t lstart, loff_t lend)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from mm/shmem.c:36:
   include/linux/shmem_fs.h:129:6: note: previous declaration of 'shmem_truncate_range' with type 'void(struct inode *, loff_t,  uoff_t)' {aka 'void(struct inode *, long long int,  long long unsigned int)'}
     129 | void shmem_truncate_range(struct inode *inode, loff_t start, uoff_t end);
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/sh/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from mm/shmem.c:24:
   mm/shmem.c:5814:19: error: conflicting types for 'shmem_truncate_range'; have 'void(struct inode *, loff_t,  loff_t)' {aka 'void(struct inode *, long long int,  long long int)'}
    5814 | EXPORT_SYMBOL_GPL(shmem_truncate_range);
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   mm/shmem.c:5814:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    5814 | EXPORT_SYMBOL_GPL(shmem_truncate_range);
         | ^~~~~~~~~~~~~~~~~
   include/linux/shmem_fs.h:129:6: note: previous declaration of 'shmem_truncate_range' with type 'void(struct inode *, loff_t,  uoff_t)' {aka 'void(struct inode *, long long int,  long long unsigned int)'}
     129 | void shmem_truncate_range(struct inode *inode, loff_t start, uoff_t end);
         |      ^~~~~~~~~~~~~~~~~~~~
   mm/shmem.c: In function '__shmem_file_setup':
   mm/shmem.c:5838:23: warning: unused variable 'flags' [-Wunused-variable]
    5838 |         unsigned long flags = (vm_flags & VM_NORESERVE) ? SHMEM_F_NORESERVE : 0;
         |                       ^~~~~


vim +5810 mm/shmem.c

c01d5b300774d1 Hugh Dickins 2016-07-26  5809  
41ffe5d5ceef7f Hugh Dickins 2011-08-03 @5810  void shmem_truncate_range(struct inode *inode, loff_t lstart, loff_t lend)
94c1e62df4494b Hugh Dickins 2011-06-27  5811  {
41ffe5d5ceef7f Hugh Dickins 2011-08-03  5812  	truncate_inode_pages_range(inode->i_mapping, lstart, lend);
94c1e62df4494b Hugh Dickins 2011-06-27  5813  }
94c1e62df4494b Hugh Dickins 2011-06-27  5814  EXPORT_SYMBOL_GPL(shmem_truncate_range);
94c1e62df4494b Hugh Dickins 2011-06-27  5815  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
