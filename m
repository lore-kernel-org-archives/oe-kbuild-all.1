Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED1155A4D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735168000; cv=none; b=Fp7Uvd2XjOzZ+N01qD2YttXOX+Tb6O9KhwaOkPotJMmPEKRu8bJlFzX2JKhOoUTwq9jlKafr2O2KcS0lswfXYmAjnvBM6iH6EVRX2mv+nQa+I0INGZlsVSGSiuA3KtgdCpF7lUh4qe8u3sVANy0iI0WPgDkwl8ZVhBwSLlhXtX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735168000; c=relaxed/simple;
	bh=hIqVLZbq0VIjJ5BfREovNgTXL0xXjHwWWX4l0YpswBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kay0AWBbHubnvDCodHlxowhWg2txv1W+iKhcfu2k8YjRal+UgHp1dnXKVlf+wt8wv8NQY4z3B7KYsdeWLS++ALUrMP3itCBD6G7mSuLFQCxNAy3h2v20iEKEx2qYX5DBAonwdy0ru3OlVaeaZo9QWB7dzYsepxtFN8cPnRDVaSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcsHkLJs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcsHkLJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735167999; x=1766703999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIqVLZbq0VIjJ5BfREovNgTXL0xXjHwWWX4l0YpswBw=;
  b=AcsHkLJsFc3nnNmKo9LzDudYfS8qZU2qHCGdXqPl4PVu/XvuAJBK6VEp
   laDfN0HodXqOAOD+RY7+lPuVUI4uhbh6TRWHjFnNxBrVfRmEDZGOby//2
   Faz7NIB/PONbXfd2Mv1GAunLIKZ0AAQDQQMIhQhxRcGKCBvU8EV6K0SUW
   iPKHfBQJdMovsMd+sd+4IOjXFAmLIe7Yzu3mmkp3UqHPXp4aAX+F+IIoP
   HxcP7wTyD/juy6qj0pXcNIGB2p16XM/EaTCw4OfnKTaAcraw2Pwy6YiRL
   8FctdZPz67qaREUKw5yeyMta5VWaWWV1QXt5AECc6dkVdrf8LqWvESO68
   A==;
X-CSE-ConnectionGUID: RUgUQfPNR5GcYif+w8Ci4A==
X-CSE-MsgGUID: LDCdby4UQYWso5u83PQ6ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35306336"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35306336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 15:06:38 -0800
X-CSE-ConnectionGUID: rvVMm7kUQuiguSBKOs+PQg==
X-CSE-MsgGUID: s0bjbF4ESGqXo/8O6SZxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="104760508"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Dec 2024 15:06:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQaSY-0002Ck-26;
	Wed, 25 Dec 2024 23:06:34 +0000
Date: Thu, 26 Dec 2024 07:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: fs/xfs/xfs_exchmaps_item.c:57:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 58.
Message-ID: <202412260634.uSDUNyYS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
commit: 6c08f434bd33f88cf169e9e43c7a5e42fb3f2118 xfs: introduce a file mapping exchange log intent item
date:   8 months ago
config: hexagon-randconfig-r064-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260634.uSDUNyYS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260634.uSDUNyYS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_exchmaps_item.c:57:5-24: WARNING: atomic_dec_and_test variation before object free at line 58.

vim +57 fs/xfs/xfs_exchmaps_item.c

    44	
    45	/*
    46	 * Freeing the XMI requires that we remove it from the AIL if it has already
    47	 * been placed there. However, the XMI may not yet have been placed in the AIL
    48	 * when called by xfs_xmi_release() from XMD processing due to the ordering of
    49	 * committed vs unpin operations in bulk insert operations. Hence the reference
    50	 * count to ensure only the last caller frees the XMI.
    51	 */
    52	STATIC void
    53	xfs_xmi_release(
    54		struct xfs_xmi_log_item	*xmi_lip)
    55	{
    56		ASSERT(atomic_read(&xmi_lip->xmi_refcount) > 0);
  > 57		if (atomic_dec_and_test(&xmi_lip->xmi_refcount)) {
  > 58			xfs_trans_ail_delete(&xmi_lip->xmi_item, 0);
    59			xfs_xmi_item_free(xmi_lip);
    60		}
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
