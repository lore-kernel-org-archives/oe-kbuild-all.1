Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24B936E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 03:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678159310; x=1709695310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+5zD5DdlvaxQw5ErGvBWzE55pPXvPGEj62Z+yzLnDkk=;
  b=Ihy5yztvotT6rC4527ilxHon+9PrWg0YfZxCamAjzCR9ESUS0o4axsEA
   HlVlPIoE57WzUMUDkeB4lwgFn8+XwIiBRs07382lNTK7vTCEL9OaqHwzD
   LpcS1pSQig0n5bL9hJ7pwAsDj7SozHKq4qir/Zz61+asAOoshf8aHscX3
   b//tzKg2JrW0UpyhXdGOqbWoyca8Fv0zcZyTSftYleXXIFF/cysAhi2yJ
   75rHjm6mRM15FUlhkWHJ9PypV97omAIBzJXy6HlhM9gbBeQWM17+xmk0X
   UWihbB4hQjc1GFylD0w8nojrB8YqUMWS52LGCrdI80kNYhFLV7ibrGQsh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319581801"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="319581801"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 19:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669712104"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="669712104"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Mar 2023 19:21:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZNtb-0000uR-35;
	Tue, 07 Mar 2023 03:21:47 +0000
Date: Tue, 7 Mar 2023 11:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 149/149] fs/udf/inode.c:1860:33: error:
 'struct udf_inode_info' has no member named 'i_hidden'
Message-ID: <202303071113.dTPrFZlU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   9b93952d97665a5adff917bfe839fa0a4269b8e0
commit: 9b93952d97665a5adff917bfe839fa0a4269b8e0 [149/149] udf: Detect system inodes linked into directory hierarchy
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230307/202303071113.dTPrFZlU-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=9b93952d97665a5adff917bfe839fa0a4269b8e0
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 9b93952d97665a5adff917bfe839fa0a4269b8e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071113.dTPrFZlU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/udf/inode.c: In function '__udf_iget':
>> fs/udf/inode.c:1860:33: error: 'struct udf_inode_info' has no member named 'i_hidden'
    1860 |                 if (UDF_I(inode)->i_hidden != hidden_inode) {
         |                                 ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FRAME_POINTER
   Depends on [n]: DEBUG_KERNEL [=y] && (M68K || UML || SUPERH) || ARCH_WANT_FRAME_POINTERS [=n]
   Selected by [y]:
   - FAULT_INJECTION_STACKTRACE_FILTER [=y] && FAULT_INJECTION_DEBUG_FS [=y] && STACKTRACE_SUPPORT [=y] && !X86_64 && !MIPS && !PPC && !S390 && !MICROBLAZE && !ARM && !ARC && !X86


vim +1860 fs/udf/inode.c

  1848	
  1849	struct inode *__udf_iget(struct super_block *sb, struct kernel_lb_addr *ino,
  1850				 bool hidden_inode)
  1851	{
  1852		unsigned long block = udf_get_lb_pblock(sb, ino, 0);
  1853		struct inode *inode = iget_locked(sb, block);
  1854		int err;
  1855	
  1856		if (!inode)
  1857			return ERR_PTR(-ENOMEM);
  1858	
  1859		if (!(inode->i_state & I_NEW)) {
> 1860			if (UDF_I(inode)->i_hidden != hidden_inode) {
  1861				iput(inode);
  1862				return ERR_PTR(-EFSCORRUPTED);
  1863			}
  1864			return inode;
  1865		}
  1866	
  1867		memcpy(&UDF_I(inode)->i_location, ino, sizeof(struct kernel_lb_addr));
  1868		err = udf_read_inode(inode, hidden_inode);
  1869		if (err < 0) {
  1870			iget_failed(inode);
  1871			return ERR_PTR(err);
  1872		}
  1873		unlock_new_inode(inode);
  1874	
  1875		return inode;
  1876	}
  1877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
