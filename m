Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0BF9D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689675323; x=1721211323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ODFt5W3TzXSR/CVMbyOOJJSV5L6wwW9JvlA/KGwPawA=;
  b=VwAr3+xaQd9mqoIiXBNmTDgZ4OdFAmdIgThCCVnL53r4aAWCDu39YcPn
   /XJt5GS6PaJMZ2yvehFI7vPLgGeOIr4uR7KR0h8YgMQCK1SJVOI0ufVJv
   B2oFTQiQ5XtQqHbupJXGvK25DT9gC7d4Re8VOy+SQV/ySFDIPEQBcYqPw
   nURI5tkTLCm9hY1wD5ip6UWXTwrq9NX1hINNj0lMM5aEobZVsxJNGJXiP
   9eOWPADSBsPVMBial4Bro/rFP4WlvG3LrzkjqDdL+d1B3BjBCVLlupolw
   Lybf7+GjMX9f6MlGFL0/LwPUWcUSL+MNgmTZ9hIZ/DwINlEMmyhvQvw2t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="369719709"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="369719709"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 03:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="789002294"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="789002294"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2023 03:15:21 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLhjJ-0000UV-0f;
	Tue, 18 Jul 2023 10:15:05 +0000
Date: Tue, 18 Jul 2023 18:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 16747/27788] htmldocs:
 ./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.
Message-ID: <202307181819.32058w3X-lkp@intel.com>
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
head:   14e059a4e07a4298d9cb041a9f5dd4b7e19a039b
commit: 7a42ec4d9dae843ce99a9ee771d13c67084f2435 [16747/27788] Revert "Revert "fs: Enable bmap() function to properly return errors""
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181819.32058w3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181819.32058w3X-lkp@intel.com/

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
