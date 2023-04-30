Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB3B20F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682848345; x=1714384345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sK0LPEl8kl87D1SNclmPqQbOkkE2a2H5BT+AN+HE+u4=;
  b=VrLKBO/XX5EAxjiJgC4kb2Zlpv79cuRXuPqz4Ak8zNXoOMXvFpOyETvK
   9Agr2EsDjbUPuqMvkDpuodTm66rGBSsXd9YzCDILOpA5/k+mauan3s8Pr
   3/W4X0xxDYvvhMjT/xo8mvhyqoTnu6AZHqMjlDMoq1ZkfcCX4Ckim2LMC
   G3IVM7PBJnzIRf1nNIZ5GWNb9AIihnFOsTO7+d/L28VQqFfHRm7PouySt
   AA1LIIDAFm0C4RSlz7t+nk+fC3v/RBbo73g5+GBE7uC3qLhQUXlBgKKEf
   EGJXaZZKUPPl31agBhyyMaPG++ubNiX7HG7mG7WLj+4VqXPFvM6UuwkHC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="332353364"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="332353364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 02:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="689537874"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="689537874"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Apr 2023 02:52:24 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt3jD-0001cL-1o;
	Sun, 30 Apr 2023 09:52:23 +0000
Date: Sun, 30 Apr 2023 17:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 16747/27008] htmldocs:
 ./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.
Message-ID: <202304301746.zfVkPR9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaegeuk,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   d5ed2ca98e482beb70819315665172025f8a3bc6
commit: 7a42ec4d9dae843ce99a9ee771d13c67084f2435 [16747/27008] Revert "Revert "fs: Enable bmap() function to properly return errors""
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 7a42ec4d9dae843ce99a9ee771d13c67084f2435
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304301746.zfVkPR9g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.

vim +1609 ./fs/inode.c

  1602	
  1603	#ifdef CONFIG_BLOCK
  1604	/**
  1605	 *	bmap	- find a block number in a file
  1606	 *	@inode:  inode owning the block number being requested
  1607	 *	@block: pointer containing the block to find
  1608	 *
> 1609	 *	Replaces the value in *block with the block number on the device holding
  1610	 *	corresponding to the requested block number in the file.
  1611	 *	That is, asked for block 4 of inode 1 the function will replace the
  1612	 *	4 in *block, with disk block relative to the disk start that holds that
  1613	 *	block of the file.
  1614	 *
  1615	 *	Returns -EINVAL in case of error, 0 otherwise. If mapping falls into a
  1616	 *	hole, returns 0 and *block is also set to 0.
  1617	 */
  1618	int bmap(struct inode *inode, sector_t *block)
  1619	{
  1620		if (!inode->i_mapping->a_ops->bmap)
  1621			return -EINVAL;
  1622	
  1623		*block = inode->i_mapping->a_ops->bmap(inode->i_mapping, *block);
  1624		return 0;
  1625	}
  1626	EXPORT_SYMBOL(bmap);
  1627	#endif
  1628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
