Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46572141CE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729103811; cv=none; b=uje9E7LgrSaw/uU+au/4bQDs/Dup6xRf030bZ2q6tS9Z8CvnvNPSn0n7Pd6gagfk6qxsdezTw9vYTerfbu/r1gv0Dvk6aBU10Tx3s0HyIDEzLOc01mBpyLPb1zdzzgkhwkvuyr2GjctoHqM9pYj1nu/btfrSBPzjuqnDdftdbS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729103811; c=relaxed/simple;
	bh=zIuBilYs8ANdSQ8HQ8Cyw4SAr/WNIK4uiURwHELwTjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7vYa9f4Bz6P5DVdupGxE9GN7jzjKJGCnpIe0aRSDJz3o44u78U5Erz1kfGc/f9HsJhTmtlh9nIgM+ZVWJEyOw7CleOcauIaaR+xxJ7EQb73nsQsC4BQ5DbBrV9bfMh3PRyNnaZ54RKXcJiirQyGYrh0NfYBRcvsG1YH8Y2yyeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdOMsOOk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdOMsOOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729103809; x=1760639809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zIuBilYs8ANdSQ8HQ8Cyw4SAr/WNIK4uiURwHELwTjw=;
  b=fdOMsOOkdRcnTd7jISGKSPbaLosxeEdQJC0244HkXDl2Qq7lW670VjOl
   E0IoMm4Sgp4KVfssGB0AcRHCxg0pQ9od8msG98T1BywQ2UxrGArOL3QcE
   HCoRAt1GSxUi8RnIcNlca96HtsyANHwRxOQrZLt+aTCrQyaRO/AP+p91L
   jcxpYMpFOc7hP1K92+Yy8NWUiO+o+6e5umCRLAjJGa4rI9V3dCTIsAIps
   joOon9SNRRAdwWmgApJCsETGh+jbUi/POdJxIE8whpRNUDLAytQFL1gqW
   hmnn8PnKwyRPKyOXOFyDEYdDUnqJOoyKRimNZ+bvTx854NCGMRRELN7cF
   g==;
X-CSE-ConnectionGUID: 3FitNl0kRTuybkvFNe9cOA==
X-CSE-MsgGUID: T2rK0lJbQk2LSie52XDyoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28455244"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28455244"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 11:36:39 -0700
X-CSE-ConnectionGUID: bbyMjcyAR6Sq6gPP6P40rQ==
X-CSE-MsgGUID: XEBfzfjHTVSMHn+4tzkTCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="77967663"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2024 11:36:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t18su-000LH8-1Y;
	Wed, 16 Oct 2024 18:36:36 +0000
Date: Thu, 17 Oct 2024 02:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-sendzc-provided 5/7]
 io_uring/io_uring.h:478:16: warning: cast to pointer from integer of
 different size
Message-ID: <202410170250.WIwBreaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-sendzc-provided
head:   7bc33ee65a67c3434c7b4c75de90444bede2fd26
commit: f7f8888ac3a68a5c0a10b596b62757780149a0ce [5/7] io_uring/cancel: use LSB bit of req->imu for cancel_seq_set
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241017/202410170250.WIwBreaN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410170250.WIwBreaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410170250.WIwBreaN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:82:
   io_uring/io_uring.h: In function 'req_imu':
>> io_uring/io_uring.h:478:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     478 |         return (struct io_mapped_ubuf *) ((unsigned long) req->imu & ~1ULL);
         |                ^


vim +478 io_uring/io_uring.h

   473	
   474	static inline struct io_mapped_ubuf *req_imu(struct io_kiocb *req)
   475	{
   476		BUILD_BUG_ON(offsetof(struct io_kiocb, imu) !=
   477			     offsetof(struct io_kiocb, cancel_ptr));
 > 478		return (struct io_mapped_ubuf *) ((unsigned long) req->imu & ~1ULL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
