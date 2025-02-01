Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A352AF1B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 19:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738436511; cv=none; b=bYG093inJuC8BaiZ8AOCSjiWb/9/03Y7pzQG+bIo+2SI8gPMefgiCzlvZ7Kb/gGo5rsE1fL6Z8baCcybdI/8b45wZeXBl/wM1bFLJNGZ8XrmTtCbHLShmsCu60uM4eO9au+VAjIC7dTfDQeufcNHtFP+wOIc8MlNpeHUqsfRDxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738436511; c=relaxed/simple;
	bh=SvAlla28ZDQjfmEwbmWrAYcjW5jUMTMxbxc6Jdctxuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nO/W2s3zicp+x6GCOdX603bxHZUbzX2FaEMMwFkNb2HjJ+TSCi/UA5JZuFbZtT7CWQRzrcHeAQTG9fyAEnJpoOcufVVSD0CbEjZSu6aUhyQEDamIWaPmH07SpjVcJoOG98P6M2kxi8tBSUOHqOoC4zadN1R59tLB+8Ufbm4eVLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fV8nDmyb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fV8nDmyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738436509; x=1769972509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SvAlla28ZDQjfmEwbmWrAYcjW5jUMTMxbxc6Jdctxuk=;
  b=fV8nDmybL8ccZc/zpsHPWKOd7yuNYWsVQR04lILsadAFLgpZktqxHPgm
   K6EQdHqRrdlu9YepBtSG0CepdAXDR+LTHOE6fHGmdiw7a8QkcGNRTI4hr
   fw4TFGWqHY7SJkySwTsNb+fiZbqNgOuEwJOGjLR5YSMOKJTm+X++gUcSz
   Byb7A6dD0VTw8meSbRRrCGdlcOZ5E9/sN0nbCFDGHLMidFeJ8P4IvFT8I
   9PPGGO/4QXj6SRf4k1nEHUWr35w1cGSRJY4BI1PtJLsOuCfwW23Zkz2wA
   dQ2RPeae1wekv1/50ShML15PyBFd9BxlVjTSelqu+y93UDEwP+nonlxGV
   g==;
X-CSE-ConnectionGUID: 836o7XH8TyWIKeL71w5ejQ==
X-CSE-MsgGUID: 8tVaZS4TRm+5WJwlX4iTTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="49639170"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="49639170"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 11:01:48 -0800
X-CSE-ConnectionGUID: NeYXMAqCQXSsBq2D2Teoyw==
X-CSE-MsgGUID: TMU1i4cyQXeWXRng2qI//A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="109689966"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2025 11:01:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teIkS-000oUB-2R;
	Sat, 01 Feb 2025 19:01:44 +0000
Date: Sun, 2 Feb 2025 03:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-epoll-wait 8/9] cancel.c:undefined reference
 to `io_epoll_wait_cancel'
Message-ID: <202502020219.HBenrRcB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-epoll-wait
head:   edbffb871c292e33a1bb07bc0acfcbf0d36b88ff
commit: 2cdb4c338ac0496b128ef85a21f6967297c9fd17 [8/9] io_uring/epoll: add support for IORING_OP_EPOLL_WAIT
config: arm-collie_defconfig (https://download.01.org/0day-ci/archive/20250202/202502020219.HBenrRcB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020219.HBenrRcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020219.HBenrRcB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: io_uring/io_uring.o: in function `io_uring_try_cancel_requests':
   io_uring.c:(.text.unlikely+0xfd0): undefined reference to `io_epoll_wait_remove_all'
   arm-linux-gnueabi-ld: io_uring/cancel.o: in function `io_try_cancel':
>> cancel.c:(.text+0x248): undefined reference to `io_epoll_wait_cancel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
