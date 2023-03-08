Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B03BA48
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 20:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678305600; x=1709841600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MXYFuwA5rZb2IsNa0fNHQ8OgPedk8Erffs5T0liUS9k=;
  b=fJDbCFNXjISvx5NzUxFiN8VjIf8J892B3KswKaAQMfpJrDrtNIHf6FI+
   x50u9T8XfINxAzCghjqlZCGU1YEqb0nh5ksj0v9mPJL0tizSyFbdm9ouB
   JWSH6z2U2YsB1X3daKBYdBs1G1faJUjGIvS3+dRFWrT+taTB7ApiPhViz
   uYhY5j86yYwTk6zXSdGHSrnppS+gXWqFQyS/DG97t8/cBHpJjuVeNrjoS
   9X90RDZ4up2DRO6q7zj2xEipWUL/WC9DJTFrbkGcqgBpxzQ8gy4BAWqhx
   +i/LTEPn7DFK4aHKNpm40D2zVQkiEXHJJxtdgQbndRev8h+fiDDzrMTYu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337783812"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="337783812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627061027"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="627061027"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 11:59:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzx6-0002No-2j;
	Wed, 08 Mar 2023 19:59:56 +0000
Date: Thu, 9 Mar 2023 03:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 198/198] fs/udf/inode.c:1850:33: error:
 'struct udf_inode_info' has no member named 'i_hidden'
Message-ID: <202303090348.pyCv6vje-lkp@intel.com>
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
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230309/202303090348.pyCv6vje-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=8766782326e9b6fe5a4dacf3083e7f9ed034179b
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 8766782326e9b6fe5a4dacf3083e7f9ed034179b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/udf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090348.pyCv6vje-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/udf/inode.c: In function '__udf_iget':
>> fs/udf/inode.c:1850:33: error: 'struct udf_inode_info' has no member named 'i_hidden'
    1850 |                 if (UDF_I(inode)->i_hidden != hidden_inode) {
         |                                 ^~


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
