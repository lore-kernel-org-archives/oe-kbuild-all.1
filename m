Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16015B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 00:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677112780; x=1708648780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d8D/2iTofOoffnbrMCEb0BQ6PKKsJJMj8nZfdWOken4=;
  b=No07/y+gtdLoVwi8aaQg8LSZ94ruVCw+WnoOLSj3ONHQpNzWHk2IMbIk
   fnBoCWL7K+T7Q9lUQMzUvEiMO9t16ReFZqftH4A6+DnMHkwTH8iuy0MMK
   0jXtRLX0w5CvKikJ3toNL3pEr7iyuE2sAxMCqtbXFFRxNW3yrIZLkq0O4
   1nS9g6Ldqd7leYdqX9JTFAXjgdH1eAcjk1L6YcE9eFvMFgHiZSdCrBg+R
   agST4Rr/UPWFmVs8ltT3K3mO1oTWCTImnNN/uL9zyoPaoSEBjaqZHSsZ3
   pMTesA4EVKI6xErBPleS+u6PVFdl0wlEoQeeiqyu244GwDCalQ2UIqOpd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="397768093"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="397768093"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 16:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="917763194"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="917763194"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2023 16:39:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUze4-0000px-1I;
	Thu, 23 Feb 2023 00:39:36 +0000
Date: Thu, 23 Feb 2023 08:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>
Subject: fs/btrfs/send.c:1925:27: warning: 'right_gen' may be used
 uninitialized in this function
Message-ID: <202302230825.LwCPauMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8762069330316392331e693befd8a5b632833618
commit: 498581f33c9e60bfdfd28a8565e0ea81a1748aa3 btrfs: send: avoid extra b+tree searches when checking reference overrides
date:   9 days ago
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230223/202302230825.LwCPauMj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=498581f33c9e60bfdfd28a8565e0ea81a1748aa3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 498581f33c9e60bfdfd28a8565e0ea81a1748aa3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230825.LwCPauMj-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/send.c: In function 'get_cur_inode_state':
>> fs/btrfs/send.c:1925:27: warning: 'right_gen' may be used uninitialized in this function [-Wmaybe-uninitialized]
    1925 |                 } else if (right_gen == gen) {
         |                           ^


vim +/right_gen +1925 fs/btrfs/send.c

31db9f7c23fbf7 Alexander Block 2012-07-25  1886  
498581f33c9e60 Filipe Manana   2023-01-11  1887  static int get_cur_inode_state(struct send_ctx *sctx, u64 ino, u64 gen,
498581f33c9e60 Filipe Manana   2023-01-11  1888  			       u64 *send_gen, u64 *parent_gen)
31db9f7c23fbf7 Alexander Block 2012-07-25  1889  {
31db9f7c23fbf7 Alexander Block 2012-07-25  1890  	int ret;
31db9f7c23fbf7 Alexander Block 2012-07-25  1891  	int left_ret;
31db9f7c23fbf7 Alexander Block 2012-07-25  1892  	int right_ret;
31db9f7c23fbf7 Alexander Block 2012-07-25  1893  	u64 left_gen;
31db9f7c23fbf7 Alexander Block 2012-07-25  1894  	u64 right_gen;
9ed0a72e5b355d BingJing Chang  2022-08-12  1895  	struct btrfs_inode_info info;
31db9f7c23fbf7 Alexander Block 2012-07-25  1896  
9ed0a72e5b355d BingJing Chang  2022-08-12  1897  	ret = get_inode_info(sctx->send_root, ino, &info);
31db9f7c23fbf7 Alexander Block 2012-07-25  1898  	if (ret < 0 && ret != -ENOENT)
31db9f7c23fbf7 Alexander Block 2012-07-25  1899  		goto out;
9ed0a72e5b355d BingJing Chang  2022-08-12  1900  	left_ret = (info.nlink == 0) ? -ENOENT : ret;
9ed0a72e5b355d BingJing Chang  2022-08-12  1901  	left_gen = info.gen;
498581f33c9e60 Filipe Manana   2023-01-11  1902  	if (send_gen)
498581f33c9e60 Filipe Manana   2023-01-11  1903  		*send_gen = ((left_ret == -ENOENT) ? 0 : info.gen);
31db9f7c23fbf7 Alexander Block 2012-07-25  1904  
31db9f7c23fbf7 Alexander Block 2012-07-25  1905  	if (!sctx->parent_root) {
31db9f7c23fbf7 Alexander Block 2012-07-25  1906  		right_ret = -ENOENT;
31db9f7c23fbf7 Alexander Block 2012-07-25  1907  	} else {
9ed0a72e5b355d BingJing Chang  2022-08-12  1908  		ret = get_inode_info(sctx->parent_root, ino, &info);
31db9f7c23fbf7 Alexander Block 2012-07-25  1909  		if (ret < 0 && ret != -ENOENT)
31db9f7c23fbf7 Alexander Block 2012-07-25  1910  			goto out;
9ed0a72e5b355d BingJing Chang  2022-08-12  1911  		right_ret = (info.nlink == 0) ? -ENOENT : ret;
9ed0a72e5b355d BingJing Chang  2022-08-12  1912  		right_gen = info.gen;
498581f33c9e60 Filipe Manana   2023-01-11  1913  		if (parent_gen)
498581f33c9e60 Filipe Manana   2023-01-11  1914  			*parent_gen = ((right_ret == -ENOENT) ? 0 : info.gen);
31db9f7c23fbf7 Alexander Block 2012-07-25  1915  	}
31db9f7c23fbf7 Alexander Block 2012-07-25  1916  
31db9f7c23fbf7 Alexander Block 2012-07-25  1917  	if (!left_ret && !right_ret) {
e938c8ad543cd5 Alexander Block 2012-07-28  1918  		if (left_gen == gen && right_gen == gen) {
31db9f7c23fbf7 Alexander Block 2012-07-25  1919  			ret = inode_state_no_change;
e938c8ad543cd5 Alexander Block 2012-07-28  1920  		} else if (left_gen == gen) {
31db9f7c23fbf7 Alexander Block 2012-07-25  1921  			if (ino < sctx->send_progress)
31db9f7c23fbf7 Alexander Block 2012-07-25  1922  				ret = inode_state_did_create;
31db9f7c23fbf7 Alexander Block 2012-07-25  1923  			else
31db9f7c23fbf7 Alexander Block 2012-07-25  1924  				ret = inode_state_will_create;
31db9f7c23fbf7 Alexander Block 2012-07-25 @1925  		} else if (right_gen == gen) {
31db9f7c23fbf7 Alexander Block 2012-07-25  1926  			if (ino < sctx->send_progress)
31db9f7c23fbf7 Alexander Block 2012-07-25  1927  				ret = inode_state_did_delete;
31db9f7c23fbf7 Alexander Block 2012-07-25  1928  			else
31db9f7c23fbf7 Alexander Block 2012-07-25  1929  				ret = inode_state_will_delete;
31db9f7c23fbf7 Alexander Block 2012-07-25  1930  		} else  {
31db9f7c23fbf7 Alexander Block 2012-07-25  1931  			ret = -ENOENT;
31db9f7c23fbf7 Alexander Block 2012-07-25  1932  		}
31db9f7c23fbf7 Alexander Block 2012-07-25  1933  	} else if (!left_ret) {
31db9f7c23fbf7 Alexander Block 2012-07-25  1934  		if (left_gen == gen) {
31db9f7c23fbf7 Alexander Block 2012-07-25  1935  			if (ino < sctx->send_progress)
31db9f7c23fbf7 Alexander Block 2012-07-25  1936  				ret = inode_state_did_create;
31db9f7c23fbf7 Alexander Block 2012-07-25  1937  			else
31db9f7c23fbf7 Alexander Block 2012-07-25  1938  				ret = inode_state_will_create;
31db9f7c23fbf7 Alexander Block 2012-07-25  1939  		} else {
31db9f7c23fbf7 Alexander Block 2012-07-25  1940  			ret = -ENOENT;
31db9f7c23fbf7 Alexander Block 2012-07-25  1941  		}
31db9f7c23fbf7 Alexander Block 2012-07-25  1942  	} else if (!right_ret) {
31db9f7c23fbf7 Alexander Block 2012-07-25  1943  		if (right_gen == gen) {
31db9f7c23fbf7 Alexander Block 2012-07-25  1944  			if (ino < sctx->send_progress)
31db9f7c23fbf7 Alexander Block 2012-07-25  1945  				ret = inode_state_did_delete;
31db9f7c23fbf7 Alexander Block 2012-07-25  1946  			else
31db9f7c23fbf7 Alexander Block 2012-07-25  1947  				ret = inode_state_will_delete;
31db9f7c23fbf7 Alexander Block 2012-07-25  1948  		} else {
31db9f7c23fbf7 Alexander Block 2012-07-25  1949  			ret = -ENOENT;
31db9f7c23fbf7 Alexander Block 2012-07-25  1950  		}
31db9f7c23fbf7 Alexander Block 2012-07-25  1951  	} else {
31db9f7c23fbf7 Alexander Block 2012-07-25  1952  		ret = -ENOENT;
31db9f7c23fbf7 Alexander Block 2012-07-25  1953  	}
31db9f7c23fbf7 Alexander Block 2012-07-25  1954  
31db9f7c23fbf7 Alexander Block 2012-07-25  1955  out:
31db9f7c23fbf7 Alexander Block 2012-07-25  1956  	return ret;
31db9f7c23fbf7 Alexander Block 2012-07-25  1957  }
31db9f7c23fbf7 Alexander Block 2012-07-25  1958  

:::::: The code at line 1925 was first introduced by commit
:::::: 31db9f7c23fbf7e95026143f79645de6507b583b Btrfs: introduce BTRFS_IOC_SEND for btrfs send/receive

:::::: TO: Alexander Block <ablock84@googlemail.com>
:::::: CC: Alexander Block <ablock84@googlemail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
