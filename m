Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FF17F46A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712584688; cv=none; b=lhEi7fq4M+Dr0/rjQRhF3IRpHMju0XxGNG7QVUEvu06FuXRVUpQMCiSPnSLip10wQSDwCote95XruB7/M9FzU0bxPWg81op+GZrbe0Mwp5+jPgk3oiv+SqY+hlD10aW06PaxE6oUzaseVA+CU2dPTKCaUJq1haWGZrJU9E1lUpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712584688; c=relaxed/simple;
	bh=SoaHuArY6gx7LlD6juX0SnYOlt70IiILoARrZ321xS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H4Q9JnHJ4P80gf5AZaizrIPiCS/7tbQJJy1XhlvrLNoQ+dZHrIsrI5Ntj6EgfM9drUR2uwA72Uf8N4y8MG5ylR7kY2JgZ7UFZhCvttmdZZmIrSqQQxcK0EDVkBLqNrvuHQtFLGI5tpsh4MTOoH4Uvao68gJV6gzC8jlQHmhrhuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOfSXHKC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOfSXHKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712584686; x=1744120686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SoaHuArY6gx7LlD6juX0SnYOlt70IiILoARrZ321xS8=;
  b=cOfSXHKCP+fagJ4zrK0r2LKKWplexFiUDFzABSHEbemtEYWZylLHVvvL
   waqqxNaAHY4IT3fFEbW4dFuuZNF8tG6S7C5l0ns4lQelYJzX3X96IlI+U
   +XCOSNNMGcyXqB4+fF7GbqZDUiPTzhVMsqFCxKkqjYzukhRac+rC3ufBj
   uEbDFbgHYGENYS0b7yM/QmojlGp7EjbaZeTptPK/p+QypygDrXUX6q/jy
   4s2Ytf8os2VrSW6G7t4Iy6rextXF6/lwiNeHpl96ZIx+Nw3YXJgrmKy3c
   f7HjMutZrvnkJ/87v9zFUE/cODJ8pWx9vy9p1aYg/Kyk4uoiIfXLS5F59
   g==;
X-CSE-ConnectionGUID: hN6bIAqCTc6Kw7WcYQSdkA==
X-CSE-MsgGUID: Jr6XerblR7uUWcaQJCoj1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19233219"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19233219"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 06:58:05 -0700
X-CSE-ConnectionGUID: L9XKCJkTQdm2acjUjdnwvQ==
X-CSE-MsgGUID: HgZuJE1iRlyXcX/6v7kfJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="51073491"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Apr 2024 06:58:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtpVa-0005FM-2S;
	Mon, 08 Apr 2024 13:58:02 +0000
Date: Mon, 8 Apr 2024 21:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 56/74] include/net/xdp_sock_drv.h:413:16:
 warning: 'return' with a value, in function returning void
Message-ID: <202404082112.OQZc2Y5d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   7ffc46cff5837ead6684e7960ca6d511ab2fdf26
commit: 1688bdb026668aac13f19cc613b42bfe575ca569 [56/74] xsk: add helper to get &xdp_desc's DMA and meta pointer in one go
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240408/202404082112.OQZc2Y5d-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404082112.OQZc2Y5d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404082112.OQZc2Y5d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/filter.c:86:
   include/net/xdp_sock_drv.h:411:1: error: return type is an incomplete type
     411 | xsk_buff_raw_get_info(const struct xsk_buff_pool *pool, u64 addr)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/net/xdp_sock_drv.h: In function 'xsk_buff_raw_get_info':
   include/net/xdp_sock_drv.h:413:38: error: invalid use of undefined type 'struct xdp_desc_info'
     413 |         return (struct xdp_desc_info){ };
         |                                      ^
>> include/net/xdp_sock_drv.h:413:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
     413 |         return (struct xdp_desc_info){ };
         |                ^
   include/net/xdp_sock_drv.h:411:1: note: declared here
     411 | xsk_buff_raw_get_info(const struct xsk_buff_pool *pool, u64 addr)
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/return +413 include/net/xdp_sock_drv.h

   409	
   410	static inline struct xdp_desc_info
   411	xsk_buff_raw_get_info(const struct xsk_buff_pool *pool, u64 addr)
   412	{
 > 413		return (struct xdp_desc_info){ };
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
