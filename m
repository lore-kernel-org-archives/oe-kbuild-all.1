Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBC3200AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7jqvQDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698103349; x=1729639349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ymGqE0jRaTu9CuVzq2bikXpWdRfk1RObfyZ1F/X6dc=;
  b=c7jqvQDx3bCF3oBU6OrgFoBKzb7mX1HC7N4qEnZiswbJktLomc64EfOw
   Hp8q7lQ2xvg5PDB9qH37rFn8SYnIRm5qH5jIpo8SU1avk/sy0OG+5D4Sk
   efcHN5BpzzHdk9D4lI6yia5WfZCKsnWxiGh6gg94KRtYz5ZqtXdyST9yI
   c0XaOLAnCDjFpM5xuRj023ezW2mfYtVkDqAMAI2HOn6z/v2bNgxTHhHN5
   zFaPW+xRnARDnemQE4QYE02A/lP6LDp4Mp0W8r2q286tR+fnOHXnFu2Cb
   B6+lFA0lLHW1c9XRE0lIoJblEjnTB0J96e47+pU4trw23AvxzrvL+lkZE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="367176557"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="367176557"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 16:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="734835716"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="734835716"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Oct 2023 16:22:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv4FZ-0007Mj-1h;
	Mon, 23 Oct 2023 23:22:21 +0000
Date: Tue, 24 Oct 2023 07:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bernd Schubert <bschubert@ddn.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 4/8] [RFC] Allow atomic_open() on positive dentry
 (w/o O_CREAT)
Message-ID: <202310240755.yrNEPXQD-lkp@intel.com>
References: <20231023183035.11035-5-bschubert@ddn.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023183035.11035-5-bschubert@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mszeredi-fuse/for-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-fuse_create_open/20231024-034655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/20231023183035.11035-5-bschubert%40ddn.com
patch subject: [PATCH v10 4/8] [RFC] Allow atomic_open() on positive dentry (w/o O_CREAT)
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310240755.yrNEPXQD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240755.yrNEPXQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240755.yrNEPXQD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/namei.c: In function 'atomic_revalidate_open':
>> fs/namei.c:3401:27: warning: unused variable 'idmap' [-Wunused-variable]
    3401 |         struct mnt_idmap *idmap;
         |                           ^~~~~


vim +/idmap +3401 fs/namei.c

  3394	
  3395	static struct dentry *atomic_revalidate_open(struct dentry *dentry,
  3396						     struct nameidata *nd,
  3397						     struct file *file,
  3398						     const struct open_flags *op,
  3399						     bool *got_write)
  3400	{
> 3401		struct mnt_idmap *idmap;
  3402		struct dentry *dir = nd->path.dentry;
  3403		struct inode *dir_inode = dir->d_inode;
  3404		int open_flag = op->open_flag;
  3405		umode_t mode = op->mode;
  3406	
  3407		if (unlikely(IS_DEADDIR(dir_inode)))
  3408			return ERR_PTR(-ENOENT);
  3409	
  3410		file->f_mode &= ~FMODE_CREATED;
  3411	
  3412		if (WARN_ON_ONCE(open_flag & O_CREAT))
  3413			return ERR_PTR(-EINVAL);
  3414	
  3415		if (open_flag & (O_TRUNC | O_WRONLY | O_RDWR))
  3416			*got_write = !mnt_want_write(nd->path.mnt);
  3417		else
  3418			*got_write = false;
  3419	
  3420		if (!*got_write)
  3421			open_flag &= ~O_TRUNC;
  3422	
  3423		inode_lock_shared(dir->d_inode);
  3424		dentry = atomic_open(nd, dentry, file, open_flag, mode);
  3425		inode_unlock_shared(dir->d_inode);
  3426	
  3427		return dentry;
  3428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
