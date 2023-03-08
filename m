Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386A8BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 19:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678305598; x=1709841598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlXhxjvdnru+c2ulBGuXcfwTsMBYDjgJ+iI/nk/TX1k=;
  b=hZsgfIypI2iW3zOqlG5bTm8TaMmkNx66g3Y5ocWH8BlWRbsRbAsaYJbj
   +9VON3tVIacCJIwrNbZYdRLBrhkAfrOgBimB/bQvU+DrUX++rhWrEqd/t
   nrt+IL696DC5NeyYoHIAq+8tUOXw7y46rkOhZ7VhMdLZOEfMEPNzjNhGw
   wcII1/LN49ywjx2UiZhm5wuXQTfxcmLkkqx2NltYpnm/tXjtxaGLm2pX3
   QUxlDNDXlWnTKOFzAZlCaDKW9Mqw4hxZ7NNVWavoI3T/oqVHKITjOFYAs
   6yndPHaEYQmBJkG4AKAoEiM688VD9Jv2yacNlGFCeBLllMKhVoNZ4ymKw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337783810"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="337783810"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627061024"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="627061024"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 11:59:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzx6-0002Nh-2W;
	Wed, 08 Mar 2023 19:59:56 +0000
Date: Thu, 9 Mar 2023 03:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 198/198] fs/udf/inode.c:1850:21: error:
 no member named 'i_hidden' in 'struct udf_inode_info'
Message-ID: <202303090327.LHXh7avV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   8766782326e9b6fe5a4dacf3083e7f9ed034179b
commit: 8766782326e9b6fe5a4dacf3083e7f9ed034179b [198/198] udf: Detect system inodes linked into directory hierarchy
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230309/202303090327.LHXh7avV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=8766782326e9b6fe5a4dacf3083e7f9ed034179b
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 8766782326e9b6fe5a4dacf3083e7f9ed034179b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/udf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090327.LHXh7avV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/udf/inode.c:1850:21: error: no member named 'i_hidden' in 'struct udf_inode_info'
                   if (UDF_I(inode)->i_hidden != hidden_inode) {
                       ~~~~~~~~~~~~  ^
   1 error generated.


vim +1850 fs/udf/inode.c

  1838	
  1839	struct inode *__udf_iget(struct super_block *sb, struct kernel_lb_addr *ino,
  1840				 bool hidden_inode)
  1841	{
  1842		unsigned long block = udf_get_lb_pblock(sb, ino, 0);
  1843		struct inode *inode = iget_locked(sb, block);
  1844		int err;
  1845	
  1846		if (!inode)
  1847			return ERR_PTR(-ENOMEM);
  1848	
  1849		if (!(inode->i_state & I_NEW)) {
> 1850			if (UDF_I(inode)->i_hidden != hidden_inode) {
  1851				iput(inode);
  1852				return ERR_PTR(-EFSCORRUPTED);
  1853			}
  1854			return inode;
  1855		}
  1856	
  1857		memcpy(&UDF_I(inode)->i_location, ino, sizeof(struct kernel_lb_addr));
  1858		err = udf_read_inode(inode, hidden_inode);
  1859		if (err < 0) {
  1860			iget_failed(inode);
  1861			return ERR_PTR(err);
  1862		}
  1863		unlock_new_inode(inode);
  1864	
  1865		return inode;
  1866	}
  1867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
