Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35341E27
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8RcyzOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696537468; x=1728073468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AN9E/0+rfa0/XkPZa06dm1W6oM0OVgw9sl8/SmHeh2o=;
  b=W8RcyzOMqwvoYxQPEXEinUDGooHHnY0O8U3GpQd+DWm+2pswMNkQxW5y
   KZ3GE2GBqOReS3ksGIMLjnKRih5P7mCUudnbe6DRhIn6Po6T7dNFmeJY9
   VfakXwGneo0tmUlQv1xKE/wfRyMGaQpFzmaTkOneCLkf9NFpPWqmENVwI
   QXNzV8i8LNDWU7cKOzCqHWEBDtrRSbqNsLHBiEpbOo25fin2BspuVWtm6
   VGdPQxIH5Vjr1sNonuVMO/N+DqjgylsDkiv6qm+3CUTnLF8gorpxrbOZv
   lnmGP7rFqya+VmBwf9nKHhUdHxhLP5ltJOSUr4ZOzBB3Xu31SImarqatz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387483774"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="387483774"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 13:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="751908551"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="751908551"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Oct 2023 13:24:25 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoUtS-000LsI-2g;
	Thu, 05 Oct 2023 20:24:22 +0000
Date: Fri, 6 Oct 2023 04:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 27/44] fs/netfs/buffered_write.c:108:54:
 error: 'len_remaining' undeclared
Message-ID: <202310060408.Ha7jHLJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   c535f8e2b3fd3f2da2d9e75c71e216c4c9ff72db
commit: cf18f89dcc39e897aa1d184440ece98e0bcee0ae [27/44] netfs: Allocate multipage folios in the writepath
config: i386-randconfig-004-20231005 (https://download.01.org/0day-ci/archive/20231006/202310060408.Ha7jHLJl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060408.Ha7jHLJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060408.Ha7jHLJl-lkp@intel.com/

Note: the dhowells-fs/cifs-netfs HEAD c535f8e2b3fd3f2da2d9e75c71e216c4c9ff72db builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/netfs/buffered_write.c: In function 'netfs_grab_folio_for_write':
>> fs/netfs/buffered_write.c:108:54: error: 'len_remaining' undeclared (first use in this function)
     108 |         fgp_flags |= fgf_set_order(pos % PAGE_SIZE + len_remaining);
         |                                                      ^~~~~~~~~~~~~
   fs/netfs/buffered_write.c:108:54: note: each undeclared identifier is reported only once for each function it appears in


vim +/len_remaining +108 fs/netfs/buffered_write.c

    97	
    98	/*
    99	 * Grab a folio for writing and lock it.  Attempt to allocate as large a folio
   100	 * as possible to hold as much of the remaining length as possible in one go.
   101	 */
   102	static struct folio *netfs_grab_folio_for_write(struct address_space *mapping,
   103							loff_t pos, size_t part)
   104	{
   105		pgoff_t index = pos / PAGE_SIZE;
   106		fgf_t fgp_flags = FGP_WRITEBEGIN;
   107	
 > 108		fgp_flags |= fgf_set_order(pos % PAGE_SIZE + len_remaining);
   109	
   110		return __filemap_get_folio(mapping, index, fgp_flags,
   111					   mapping_gfp_mask(mapping));
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
