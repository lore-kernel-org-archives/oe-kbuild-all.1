Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E856C4A06
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725370330; cv=none; b=ZzKhEoicuVp3lIRXPoc/1NJ0hsZn5x6Nghb+pfEAzEA99OHkAokz8oQtJZR3QvqzOhnIx+nyJpdyQDOlwHPsQgTjEUfKuQlBiuZ00ukw6lPHae3OLx+BtmpaUUbxj4z9kglzpWuxtJMPNdX9sEEU08CLAfKXdm3hu4vdZmqiOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725370330; c=relaxed/simple;
	bh=qf4dQfY/Cu4NpM8xlhrX3ePFU/cV9C2EHCdCwQDQsEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNXuzUklLtE3JzYGKvM+FQB/onA9OATMrNRNmMb/h6AxIXCHyVqAbkiL/GXeWKBByHxj3N1X0/XZYEL+nBq5zBiVsGkXOMRTwsf4QTY62sKTDrQqhQadU3aHLpOkYILjXtjS9lRqqPHD4GIrmZhGpapmjCQ/wPZ1DxXcaFGwZZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOtI0hUd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOtI0hUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725370329; x=1756906329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qf4dQfY/Cu4NpM8xlhrX3ePFU/cV9C2EHCdCwQDQsEE=;
  b=AOtI0hUdTHozcEXUe8d5TbWcX4Reu611AgyaHRB7oqW+Hk4Y7whwHd3N
   q2tmzL9Lg8PBmWpfVefd1cYOvjoZkgJKUV6dm5alL4Vfe2rstSXrINcl6
   jEdyKNcZrMAnfkpRpP+uA7nsDYMWmHx+oJdT6Iv8J+l4qE1JfHwkkFVAJ
   9HkQDAcIvKKQ+MprwR8CO8B8JcJG6AaLCvmkG7I5snMHiDkZGLCIG1ZAj
   5Xlby40oTuEhcAcD/tLjiJSaQy8rhPUiAbjxpHlwBKOQwu0CpDSxVEjep
   ZRf2qjXwFO45zaD2MMc+0O2knaE5wPeOFpF0Ye4ofvW4HPt0RkoDbaDFy
   Q==;
X-CSE-ConnectionGUID: z+CCBoNTT7u15HJiB2AJpA==
X-CSE-MsgGUID: yJxMey6GQxmvpbb+yhw32g==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24132771"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="24132771"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 06:32:08 -0700
X-CSE-ConnectionGUID: jiZk7ARFTkKs4AV3FjOTuA==
X-CSE-MsgGUID: GYc4aSFcSfC+hlsQVuvDtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="65270627"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Sep 2024 06:32:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slTdd-0006ip-0e;
	Tue, 03 Sep 2024 13:32:05 +0000
Date: Tue, 3 Sep 2024 21:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 30/37] fs/netfs/misc.c:19:9: error:
 implicit declaration of function 'mempool_free'
Message-ID: <202409032103.baxBZU8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   3962f4beba4e7ffa6cfab018df8a612902a1d2c8
commit: d1be8ca79490c7d6d61fa36a6f05537ecc1f2edb [30/37] netfs: Add bounce buffering support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240903/202409032103.baxBZU8B-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032103.baxBZU8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032103.baxBZU8B-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/netfs/misc.c: In function 'netfs_mempool_folio_put':
>> fs/netfs/misc.c:19:9: error: implicit declaration of function 'mempool_free' [-Werror=implicit-function-declaration]
      19 |         mempool_free(folio, &netfs_folio_pool);
         |         ^~~~~~~~~~~~
   fs/netfs/misc.c: In function 'netfs_add_folio_to_buffer':
>> fs/netfs/misc.c:61:25: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      61 |                 folio = mempool_alloc(&netfs_folio_pool, gfp);
         |                         ^~~~~~~~~~~~~
         |                         mm_alloc
>> fs/netfs/misc.c:61:23: warning: assignment to 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      61 |                 folio = mempool_alloc(&netfs_folio_pool, gfp);
         |                       ^
   cc1: some warnings being treated as errors


vim +/mempool_free +19 fs/netfs/misc.c

    11	
    12	/*
    13	 * Discard our reference on the folio, returning it to the memory pool if we
    14	 * hold the last ref on it.  The filesystem may have used MSG_SPLICE_PAGES on
    15	 * it and so it may have extra refs still.
    16	 */
    17	void netfs_mempool_folio_put(struct folio *folio)
    18	{
  > 19		mempool_free(folio, &netfs_folio_pool);
    20	}
    21	
    22	/*
    23	 * Reset the subrequest iterator to refer just to the region remaining to be
    24	 * read.  The iterator may or may not have been advanced by socket ops or
    25	 * extraction ops to an extent that may or may not match the amount actually
    26	 * read.
    27	 */
    28	void netfs_reset_iter(struct netfs_io_subrequest *subreq)
    29	{
    30		struct iov_iter *io_iter = &subreq->io_iter;
    31		size_t remain = subreq->len - subreq->transferred;
    32	
    33		if (io_iter->count > remain)
    34			iov_iter_advance(io_iter, io_iter->count - remain);
    35		else if (io_iter->count < remain)
    36			iov_iter_revert(io_iter, remain - io_iter->count);
    37		iov_iter_truncate(&subreq->io_iter, remain);
    38	}
    39	
    40	
    41	/*
    42	 * Create the specified folio in the specified buffer attached to the request.
    43	 * The folios are marked with NETFS_BUF_PUT_MARK so that we know that these
    44	 * need freeing later.
    45	 *
    46	 * We set the index on the folio so that we can keep track of gaps in the
    47	 * buffer for when we're cleaning it up.
    48	 */
    49	struct folio *netfs_add_folio_to_buffer(struct rolling_buffer *roll,
    50						pgoff_t index, gfp_t gfp)
    51	{
    52		struct folio *folio;
    53	
    54		for (;;) {
    55			if (rolling_buffer_make_space(roll) == 0)
    56				break;
    57			msleep(10);
    58		}
    59	
    60		for (;;) {
  > 61			folio = mempool_alloc(&netfs_folio_pool, gfp);
    62			if (folio)
    63				break;
    64			msleep(10);
    65		}
    66	
    67		folio->index = index;
    68		rolling_buffer_append(roll, folio, NETFS_FLAG_PUT_MARK);
    69		return folio;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
