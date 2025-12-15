Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9642B32862C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765828615; cv=none; b=nY5AXjZArDtq4q8ldKYIVorzr24CD975TYnmLryKI5lsUkb2tM1IAs4O6ZWixxy4U0n/02+y2wDrnOq/OfRgrXclq/iElQWqKI+qDxyCIZRXKYGpfnF+034Ig4Zj2j+vjTNjUhgK8mSzMhxXF7GBiVYRER/YlR0UCVmmvygSsvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765828615; c=relaxed/simple;
	bh=Pj+wvStRHnaKsEeJdZwnufGVwNLOF+845YGndo+hRUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sp/nORQ8YXDnmDa7Is8wbp1zlFtHhcBkZqQgskC0/pzxPmMdXMmaNHZ/aA3eCdIS6ydOWOX9epc2/NuYprkEuayd+88sWHF9EhCuzulaWI1h7Keku22mzjdGV36AUPrWZWMBtMHuDAN961+5BwuPzLz6pxz0K6NrgKKuMhWXUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNrOXkLI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNrOXkLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765828614; x=1797364614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pj+wvStRHnaKsEeJdZwnufGVwNLOF+845YGndo+hRUw=;
  b=HNrOXkLIMy2yI87oWVx+IWz8h/RVhb+uQwsXnZ6cLehpddkeOCKlwn6D
   6jZT1U6VXb5+3y4KANAVh2y2NJH9A+9EhIHoSD3av6aByymjGHpG9W3u0
   qAHY1S3mNpOK9sZ0kiR6HqHTet/sbBRs+3UmQh6YNQVe5CS6QEl4lxTEt
   ETC63vDg+53Fkd0Xgb6dPjsMxfcZzia930gG1oOrv8SpUQ0qAy5sULYTA
   JOlPCkgvV6/Uo42hCvm5vyYfTYtcFPB39q68lRHRd5Ot+MX7f7QWHXCxv
   NVqqD0MFfgGozSFTyuzUGdwlXAxX0anW3AvkdZJLlSIBv24uy7Abz1FsI
   A==;
X-CSE-ConnectionGUID: iNpkt7vWTKKmPtZV+CqSBQ==
X-CSE-MsgGUID: MsUSeGGGQbukek6mmMGUqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71594651"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="71594651"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:56:53 -0800
X-CSE-ConnectionGUID: 61HB3DMvSj+22Y5goiDxZg==
X-CSE-MsgGUID: Kr4cihToQ9uYMZGWZIIxTw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Dec 2025 11:56:52 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVEgc-000000000hs-11AV;
	Mon, 15 Dec 2025 19:56:50 +0000
Date: Tue, 16 Dec 2025 03:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-xarray:xarray 3/3] ERROR: modpost: "xa_dump_node"
 [fs/netfs/netfs.ko] undefined!
Message-ID: <202512160340.QDV6nXh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/xarray.git xarray
head:   aaf7f456296680f7d1d9c04154a92050cdf5316f
commit: aaf7f456296680f7d1d9c04154a92050cdf5316f [3/3] XArray: Add CONFIG_DEBUG_XARRAY
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512160340.QDV6nXh5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160340.QDV6nXh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160340.QDV6nXh5-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> lib/xarray.c:2426:6: warning: no previous prototype for 'xa_dump_index' [-Wmissing-prototypes]
2426 | void xa_dump_index(unsigned long index, unsigned int shift)
|      ^~~~~~~~~~~~~
>> lib/xarray.c:2436:6: warning: no previous prototype for 'xa_dump_entry' [-Wmissing-prototypes]
2436 | void xa_dump_entry(const void *entry, unsigned long index, unsigned long shift)
|      ^~~~~~~~~~~~~
--
>> ERROR: modpost: "xa_dump_node" [fs/netfs/netfs.ko] undefined!
>> ERROR: modpost: "xa_dump_node" [fs/squashfs/squashfs.ko] undefined!
>> ERROR: modpost: "xa_dump_node" [fs/smb/client/cifs.ko] undefined!
>> ERROR: modpost: "xa_dump_node" [fs/cachefiles/cachefiles.ko] undefined!
>> ERROR: modpost: "xa_dump_node" [fs/btrfs/btrfs.ko] undefined!
>> ERROR: modpost: "xa_dump_node" [fs/erofs/erofs.ko] undefined!
>> ERROR: modpost: "xa_dump" [lib/test_xarray.ko] undefined!
>> ERROR: modpost: "xa_dump_node" [lib/test_xarray.ko] undefined!
>> ERROR: modpost: "xa_dump_node" [drivers/iommu/iommufd/iommufd.ko] undefined!
>> ERROR: modpost: "xa_dump_node" [drivers/block/brd.ko] undefined!
WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
