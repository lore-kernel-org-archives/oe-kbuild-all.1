Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589997F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 04:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRd29Csv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698813199; x=1730349199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5xYwTGX1diKixtOkp4MVj6oG3qICIxGFCXVA0Cq6pvE=;
  b=CRd29CsvgVJdylzXbAtHejR6QRnbzmWJgAjCaMiEpi/MZE0qdfgmvm9U
   Kfm/jYIPgYYgGSiu6StJyGZcMIAaMJhwIgbgWfMk14bEYZGIlJIWPed9o
   LBTnAAfcVYnAi6JbdOZpPTthscIdKMAFgqWlPP5sV/gWKrsKAvyFaoX0q
   VDv5d8NP5+0+TfVSGHWUHqDzucnoY0uvBuTeSllB6rQHQ1B81U98NyhgF
   f6erezsHZl8sRUfyUExu+0n58aIA5hQEgxlZpcoIJNvp+9F/5Le1Kd85p
   fqF2eFFI2wI449A8mHakL8SYKzeQoFFccuV3g7UzOq2ChvpncJwYvqYQ2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1332470"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="1332470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 21:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="2066647"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2023 21:33:00 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy2uY-0000bU-2O;
	Wed, 01 Nov 2023 04:32:58 +0000
Date: Wed, 1 Nov 2023 12:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 26/48] fs/iomap/buffered-io.c:95: warning:
 Function parameter or member 'offset' not described in 'ifs_nr_dirty_blocks'
Message-ID: <202311011229.KdworTJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   c4f7071632b671933d29f8b9cdb202a6c1c43dd4
commit: 733f777a6de0db441f20d2977315091b95b1b8f4 [26/48] iomap: add a helper to count dirty blocks
config: um-defconfig (https://download.01.org/0day-ci/archive/20231101/202311011229.KdworTJY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011229.KdworTJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011229.KdworTJY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.c:95: warning: Function parameter or member 'offset' not described in 'ifs_nr_dirty_blocks'
>> fs/iomap/buffered-io.c:95: warning: Excess function parameter 'offet' description in 'ifs_nr_dirty_blocks'


vim +95 fs/iomap/buffered-io.c

    86	
    87	/**
    88	 * ifs_nr_dirty_blocks - return the number of dirty blocks in a folio
    89	 * @folio:	folio to count
    90	 * @offet:	offset into the file where to start counting
    91	 *
    92	 * Returns the number of blocks dirty in @folio stasrting at offset @offset.
    93	 */
    94	unsigned int ifs_nr_dirty_blocks(struct folio *folio, loff_t offset)
  > 95	{
    96		struct inode *inode = folio->mapping->host;
    97		unsigned int blks_per_folio = i_blocks_per_folio(inode, folio);
    98		unsigned int skip = offset_in_folio(folio, offset) >> inode->i_blkbits;
    99		struct iomap_folio_state *ifs = folio->private;
   100	
   101		if (ifs) {
   102			unsigned int dirty_blocks = 0, i;
   103	
   104			for (i = blks_per_folio + skip; i < 2 * blks_per_folio; i++)
   105				if (test_bit(i, ifs->state))
   106					dirty_blocks++;
   107			return dirty_blocks;
   108		}
   109	
   110		return blks_per_folio - skip;
   111	}
   112	EXPORT_SYMBOL_GPL(ifs_nr_dirty_blocks);
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
