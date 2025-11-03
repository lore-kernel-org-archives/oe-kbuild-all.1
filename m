Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694B02DCF44
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762188426; cv=none; b=HiOstQdTetbf1EqANiZ+//ypgbI0Z9rWmgYXU6otmE6kllZrS9K1PgCqHiBZGOTFubN9wgOznloTGf0UL9nxPA2qq8gwU3lrN/rke106Xg3eWS0EptwPaFXSmua9BOYocxt0AfZzhczWyfmH2/nMAtIkCLZ2FEpbbbzve1Nj/N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762188426; c=relaxed/simple;
	bh=dDY4eZODry/YtOJmckzyfXbmdx1ra9MIfrNMai9+Swo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bo94PJ7uviGVvMlSzGJxX4tAP4OU0W3CaZADxjDgcZmDZFeigBfPm1ZdoJQyfo1O7K+RFwe5N8osnAP/HinafaKyxSZvAMToHTSKAnBbxM/w9hKUP6jBkszRWEZ71O6Ei5msH/mysGmrgTpmAwaO/EJdJQ82ptJ6nmdW6i43/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrOKrTMZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrOKrTMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762188425; x=1793724425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDY4eZODry/YtOJmckzyfXbmdx1ra9MIfrNMai9+Swo=;
  b=QrOKrTMZGYsfaohASTajRHh3Cb+jkOU1cpeHuHMLhnkcmvzNPcB4RxZd
   zytXVeAdrCmC18BpLtFW2Z88RwPlp/5n2e4GOjYru/nDxAxBtj+/Al8Db
   Vu9alO+cWmuWHmbzmpfXGEUGslqpuk+b2e7w/afEwzkHR0bcD2hrioRCG
   uMzJ/qH+Q5dUS2BXxNa+JXJwT+AC+THEaVkOGG/CgHfq0ZB3ObBgq3Jx0
   kDVwnksStr251C4dnKbGRrnGExXVwd13JkZ6YnIGU9lML/2i8b2FZOEND
   Uhp/Wj/QegBowstQcCs76kqFJtzAQvcNx4pvR1UyB5YClKwwYS9PeevP4
   A==;
X-CSE-ConnectionGUID: pQzMEhx6SjavVyCMp98Qdg==
X-CSE-MsgGUID: rBPRN6b8Qh6YY3CrRxII4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64155767"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="64155767"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:47:04 -0800
X-CSE-ConnectionGUID: I7td+hWdQsWjnqdnxhlmUQ==
X-CSE-MsgGUID: LeTu/o/fQJm9rA56RkIHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="187366119"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Nov 2025 08:47:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxht-000QMJ-1T;
	Mon, 03 Nov 2025 16:47:01 +0000
Date: Tue, 4 Nov 2025 00:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw/v2-test-unfinished 5/12] arc-linux-ld:
 bdev.c:undefined reference to `blk_mq_dma_map'
Message-ID: <202511040029.FjxWK8VK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux dmabuf-rw/v2-test-unfinished
head:   e693ed6721c39c7abddc6cfa222e7a443a2da12d
commit: fc6369495a6ef8337df6a7dd322aeec059e0b377 [5/12] block: add infra to handle dmabuf tokens
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20251104/202511040029.FjxWK8VK-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040029.FjxWK8VK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040029.FjxWK8VK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: block/bdev.o: in function `blkdev_dma_map':
   bdev.c:(.text+0xcbe): undefined reference to `blk_mq_dma_map'
>> arc-linux-ld: bdev.c:(.text+0xcbe): undefined reference to `blk_mq_dma_map'
   arc-linux-ld: block/blk-mq.o: in function `blk_mq_submit_bio':
   blk-mq.c:(.text+0x4e22): undefined reference to `blk_rq_assign_dma_map'
>> arc-linux-ld: blk-mq.c:(.text+0x4e22): undefined reference to `blk_rq_assign_dma_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
