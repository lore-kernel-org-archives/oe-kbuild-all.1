Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC81FAD35
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 17:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686850964; x=1718386964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qnvsq2TgC8aO8wIAXVEUHd1zKalhVSeeXwB28FRkfOc=;
  b=JZrqVpBO70bpg08AgZjTf79Ir48TBqoomwRhNLlnPS92Q1XOITAxFICP
   ceYshZxuOCfik/fYtJHmYzBTkSSrEjSchB7uiRmVGryKfyFnrjiVbdoaQ
   mCjFmQa0WeiyKv/423br7riXeZHxIIDJZWJGGk9S0sPMow577Ike4K/R5
   47uNs3AEl0fsG8m6MBFNt0UsELRb3x/9VNrUkjzBsx3xC2RHbKVS1BOuW
   mzqBLRk/pT9luchEqlginwg+22dh9zDaXjUno0BF8cf7oJ8SQ20GKQ3Hz
   Ad4gRfsXfYFQJvBaIVoymOmt/45m18Pb59reRjufJhMuY4jTl+jLnRnWG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343729470"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="343729470"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 10:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959298954"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="959298954"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2023 10:42:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9qzZ-0000EH-2g;
	Thu, 15 Jun 2023 17:42:41 +0000
Date: Fri, 16 Jun 2023 01:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 16747/27777] htmldocs:
 ./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.
Message-ID: <202306160118.rGE9hp01-lkp@intel.com>
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
head:   39a9b92e9828f28d3c1bfae81b3121d973b76ad3
commit: 7a42ec4d9dae843ce99a9ee771d13c67084f2435 [16747/27777] Revert "Revert "fs: Enable bmap() function to properly return errors""
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 7a42ec4d9dae843ce99a9ee771d13c67084f2435
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160118.rGE9hp01-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
