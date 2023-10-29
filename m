Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B3D39E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 02:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2Bu6fU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698546109; x=1730082109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gbFNv3B/BVUPla2nW+wWXDsp3nnrnYK6S9CLlwssXM=;
  b=D2Bu6fU//mQUMr7O66QuTLNl4glVPuMH6ohSV6cBU7ninOw6iCMqIf/F
   uab5aQBe3pEwgZiFjpJKRwSXXwEHI1dnlOZnnwMjfNFwgffXJ4tuJwhp4
   7jMhhIwY+Q2akCNvgZ0jljsZ65fRBhSnqeA809E71Jn89GwG3l1oqxKa5
   L1areGwrtpt5ilYDaQgDa09Yjz+X0OyNfXMN0JHncNid24oK55R4+K+oO
   Uihc/cCj/eKQqeIUJS6egWCcjQ4aB4gKQPgSznXmOlF6+xesq0uyFjOqF
   mZUnYed32WLvxMjYadRzSweV5KCHM5lu18p5g5aswtPo+zaVsXhmAeZjN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="9466889"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="9466889"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 19:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="789147160"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="789147160"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Oct 2023 19:21:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwvQu-000CGr-1p;
	Sun, 29 Oct 2023 02:21:44 +0000
Date: Sun, 29 Oct 2023 10:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 16747/29903] htmldocs:
 ./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.
Message-ID: <202310291024.lEvg3jPL-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   fcdc8d9a71cdda01c736bb52ad5d494e5b0937a3
commit: 7a42ec4d9dae843ce99a9ee771d13c67084f2435 [16747/29903] Revert "Revert "fs: Enable bmap() function to properly return errors""
reproduce: (https://download.01.org/0day-ci/archive/20231029/202310291024.lEvg3jPL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310291024.lEvg3jPL-lkp@intel.com/

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
