Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D77603F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147469; cv=none; b=WHOYswrdkyWHOB2HPLGHXYbVt4HOuONPlnLFEqiVKHV40Vk6B9+Iy9gk6ez5k0a4pvKkUazUYrxCDOwdKgnO5L7OtSVOzA8CjUzaP8wyM83CqM7XjXnIsM1nysxxFg+1WjAqwOCeS9rLVZSGCBbgP33tC9fHEB3Zso4gRFqalLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147469; c=relaxed/simple;
	bh=LoDflA8b69nA9P/cIXXwzPN461ZuXYsg1s3w9XilcEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0rbsQtK7IdGD5iwT8FP8XWxZMFdnnJplA9oDl6d45BJxhJnkaTuvgVUs59L7eo5K4Dbp2KzcbM0UVTxlWQo6Liav9IrkMiHFaO9lOmy32AjOQXXl6rpCEpxnwHSX56HJ3NOodBgcJ0PD/I8Z9dABru47raPypiV3kVlTTuLWVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkFcSBmp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkFcSBmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736147467; x=1767683467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LoDflA8b69nA9P/cIXXwzPN461ZuXYsg1s3w9XilcEI=;
  b=lkFcSBmptByO5GC3NkPgqgTETMvJRIbhzCM058UKzxc4dMOsqT5RLSFY
   aGF+6NHy0cQmpkU+sfmYVmFcBNZAuHluIR5vQeGjR5WmwwJC+KiZB4/CY
   h4NAg7tpmYvt5oU/3E7ETLmC3t8X8ItW0iKyHoTu7EyVdejFbHopS9Pue
   eXE/1TMqWv5qoixf2Gn25/lwMZ0bQvBhieEoEXgsrpZsPi86QSU4q4OcE
   ABOI8MdFMmmm9ATA8O/RbvZyOhmTzvoNzCVigHt42f2eqVAbJ7d4ZksmV
   bOWsHCmXDRxrvyFw95lbg53H3+zYaWuCacP33GMBcY9UGFkQwmuQ+dr0b
   Q==;
X-CSE-ConnectionGUID: i4hB1WotS5OI2OXNuUP2EQ==
X-CSE-MsgGUID: XArXvcTsRRKJMusOW1h3fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="47706866"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="47706866"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 23:11:07 -0800
X-CSE-ConnectionGUID: ZcCgArRXTISEW2JTRlCDmA==
X-CSE-MsgGUID: jIaVFSGlTPi8CRTzzSpP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107003421"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jan 2025 23:11:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUhGQ-000CLP-2k;
	Mon, 06 Jan 2025 07:11:02 +0000
Date: Mon, 6 Jan 2025 15:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andres Beltran <lkmlabelt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	"Andrea Parri (Microsoft)" <parri.andrea@gmail.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: drivers/hv/channel.c:514: warning: Function parameter or struct
 member 'size' not described in 'request_arr_init'
Message-ID: <202501061551.i3MYP1v7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d89551994a430b50c4fffcb1e617a057fa76e20
commit: e8b7db38449ac5b950a3f00519171c4be3e226ff Drivers: hv: vmbus: Add vmbus_requestor data structure for VMBus hardening
date:   4 years, 2 months ago
config: x86_64-randconfig-002-20241001 (https://download.01.org/0day-ci/archive/20250106/202501061551.i3MYP1v7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061551.i3MYP1v7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061551.i3MYP1v7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/channel.c:514: warning: Function parameter or struct member 'size' not described in 'request_arr_init'


vim +514 drivers/hv/channel.c

   505	
   506	/**
   507	 * request_arr_init - Allocates memory for the requestor array. Each slot
   508	 * keeps track of the next available slot in the array. Initially, each
   509	 * slot points to the next one (as in a Linked List). The last slot
   510	 * does not point to anything, so its value is U64_MAX by default.
   511	 * @size The size of the array
   512	 */
   513	static u64 *request_arr_init(u32 size)
 > 514	{
   515		int i;
   516		u64 *req_arr;
   517	
   518		req_arr = kcalloc(size, sizeof(u64), GFP_KERNEL);
   519		if (!req_arr)
   520			return NULL;
   521	
   522		for (i = 0; i < size - 1; i++)
   523			req_arr[i] = i + 1;
   524	
   525		/* Last slot (no more available slots) */
   526		req_arr[i] = U64_MAX;
   527	
   528		return req_arr;
   529	}
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
