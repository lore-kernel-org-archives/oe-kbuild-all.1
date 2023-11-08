Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E618C24
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKXGzCFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699448881; x=1730984881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGAIoT+opaTuqeFoZuU0l4Ke+CZalbjIQJNDFxqzQK4=;
  b=IKXGzCFpv1p55A8JR29FGlWM3fqdfEsKgQAB7twFQCqy1RqNOkJiRQQl
   qYVH/iA0H0OZB9dN0/QD2VTWpg/Kyu+Mg0/CNgFm/ijSddKOiZzNFUt13
   /DKkV3Mvym2mAtA4iu5i2sX504SJLWaQsizSRYvqaTtqCCogoS42Q3IC7
   XHhErHf3CpfLGpvvG2oJHwndaDyEiEKX2kIq/URmsJb4U3UzH8G3wvfD5
   5cnizrTCHvnieP29lulYM/U9dJLWgCDijWU9GQxOqo+MODsXfVrk51xz4
   mmzSo6MorQ6taJyuo+47LW59eUPPOepRzvnJ5zThb8snPwADy3kLEoAuh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="380153905"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="380153905"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 05:08:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="756550448"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="756550448"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Nov 2023 05:07:57 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0iHh-0007wq-0p;
	Wed, 08 Nov 2023 13:07:53 +0000
Date: Wed, 8 Nov 2023 21:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.dcache2 2/22] fs/coda/cache.c:98:53: error: passing
 argument 1 of 'd_inode_rcu' from incompatible pointer type
Message-ID: <202311082157.0gY3N2wh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.dcache2
head:   d6e9e3fbf9baed56f046760296fffe6f9dea1bcb
commit: 17ac2dcad930b2f53cb01177421ec1b3a7521082 [2/22] coda_flag_children(): cope with dentries turning negative
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231108/202311082157.0gY3N2wh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311082157.0gY3N2wh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311082157.0gY3N2wh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/coda/cache.c: In function 'coda_flag_children':
>> fs/coda/cache.c:98:53: error: passing argument 1 of 'd_inode_rcu' from incompatible pointer type [-Werror=incompatible-pointer-types]
      98 |                 struct inode *inode = d_inode_rcu(de->d_inode);
         |                                                   ~~^~~~~~~~~
         |                                                     |
         |                                                     struct inode *
   In file included from include/linux/fs.h:8,
                    from fs/coda/cache.c:14:
   include/linux/dcache.h:526:62: note: expected 'const struct dentry *' but argument is of type 'struct inode *'
     526 | static inline struct inode *d_inode_rcu(const struct dentry *dentry)
         |                                         ~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/d_inode_rcu +98 fs/coda/cache.c

    89	
    90	/* this won't do any harm: just flag all children */
    91	static void coda_flag_children(struct dentry *parent, int flag)
    92	{
    93		struct dentry *de;
    94	
    95		rcu_read_lock();
    96		spin_lock(&parent->d_lock);
    97		list_for_each_entry(de, &parent->d_subdirs, d_child) {
  > 98			struct inode *inode = d_inode_rcu(de->d_inode);
    99			/* don't know what to do with negative dentries */
   100			if (inode)
   101				coda_flag_inode(inode, flag);
   102		}
   103		spin_unlock(&parent->d_lock);
   104		rcu_read_unlock();
   105		return; 
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
