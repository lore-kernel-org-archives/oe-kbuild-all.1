Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D94DDC7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7037Yqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699536414; x=1731072414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g9oal6rbTL525Js9hP0J6TyZ4lfw4gXWCDHdKcrIlxc=;
  b=H7037YqvuH6upob3MMmnQ1bAtdObW+K4jR6I/LUODLXP3p/sBVNT9nrn
   Pdad9rAbVksQJ5OhO22dxAuuCTxUiVNyfJhmp0BZy8csKK7BqKxwzwVka
   4/DqwU6c3sb4H77bZtDvk+/S7aQZI+ib3TsBeKsX0CNgYp35jN9FXYtzn
   m+P/Qi1HdfztVronHmFN4EUjDlkgBuu1WjjL+rP81QEGMj0yJQLOAmLEf
   ivBTjT3aOKgECNTmDP2LoJAumBu5ULugvEo8R4OHYQP9qdkuxW12Q+IDY
   wEYDNAK1Nu2kDqN6htwQL4dAMR4z3tjpjLGvPVC4O/+sJs1YhVG0qmkdn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="8633369"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="8633369"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:26:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1094859179"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="1094859179"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2023 05:26:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r153Y-0008kA-08;
	Thu, 09 Nov 2023 13:26:48 +0000
Date: Thu, 9 Nov 2023 21:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Omkar Wagle <ov.wagle@gmail.com>, hughd@google.com
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Omkar Wagle <ov.wagle@gmail.com>
Subject: Re: [PATCH] MM: shmem: Remove code sytle warnings
Message-ID: <202311092136.KQoibaVV-lkp@intel.com>
References: <20231109062228.10227-1-ov.wagle@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109062228.10227-1-ov.wagle@gmail.com>

Hi Omkar,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master next-20231109]
[cannot apply to v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Omkar-Wagle/MM-shmem-Remove-code-sytle-warnings/20231109-163742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231109062228.10227-1-ov.wagle%40gmail.com
patch subject: [PATCH] MM: shmem: Remove code sytle warnings
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20231109/202311092136.KQoibaVV-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092136.KQoibaVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092136.KQoibaVV-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_fill_super':
>> mm/shmem.c:4310:47: error: macro "max_t" requires 3 arguments, but only 2 given
    4310 |                                 L1_CACHE_BYTES), GFP_KERNEL);
         |                                               ^
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:10,
                    from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from mm/shmem.c:24:
   include/linux/minmax.h:169: note: macro "max_t" defined here
     169 | #define max_t(type, x, y)       __careful_cmp(max, (type)(x), (type)(y))
         | 
>> mm/shmem.c:4309:26: error: 'max_t' undeclared (first use in this function); did you mean 'rmap_t'?
    4309 |         sbinfo = kzalloc(max_t((int)sizeof(struct shmem_sb_info),
         |                          ^~~~~
         |                          rmap_t
   mm/shmem.c:4309:26: note: each undeclared identifier is reported only once for each function it appears in


vim +/max_t +4310 mm/shmem.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  4300  
f32356261d44d5 David Howells   2019-03-25  4301  static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds  2005-04-16  4302  {
f32356261d44d5 David Howells   2019-03-25  4303  	struct shmem_options *ctx = fc->fs_private;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4304  	struct inode *inode;
0edd73b33426df Hugh Dickins    2005-06-21  4305  	struct shmem_sb_info *sbinfo;
71480663b751de Carlos Maiolino 2023-07-25  4306  	int error = -ENOMEM;
680d794babebc7 Andrew Morton   2008-02-08  4307  
680d794babebc7 Andrew Morton   2008-02-08  4308  	/* Round up to L1_CACHE_BYTES to resist false sharing */
1c6e8dc111cb86 Omkar Wagle     2023-11-08 @4309  	sbinfo = kzalloc(max_t((int)sizeof(struct shmem_sb_info),
680d794babebc7 Andrew Morton   2008-02-08 @4310  				L1_CACHE_BYTES), GFP_KERNEL);
680d794babebc7 Andrew Morton   2008-02-08  4311  	if (!sbinfo)
71480663b751de Carlos Maiolino 2023-07-25  4312  		return error;
680d794babebc7 Andrew Morton   2008-02-08  4313  
680d794babebc7 Andrew Morton   2008-02-08  4314  	sb->s_fs_info = sbinfo;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
