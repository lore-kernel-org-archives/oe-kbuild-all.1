Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32601CF9B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 23:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976869; cv=none; b=NH61sB8HZFKEHlQ/IAy22zho1yFCMi6NuEeJKy+eQ48J/lmsn/bjOETi6puOiKCIwk5lFHfctNlMRglGNHWzAQ2QfEXok298kKJPWUS1N1im7OkH+E0YTTABcP9hLwi0MfJ9KqcXS05uBT/y6hVqoivDN1bF5tC/rOTrNSnriU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976869; c=relaxed/simple;
	bh=n3HTTCoUY5hp8ix0O2bleDpyxxKNh2vNrLwTaDLhfys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMmOWDM8Owq0D6yIo/O0zGTg6Xi3nojZkwYMuf1u5mIjl1B0k8SmSOlbwXQW/YOO/uFtENY0D2MThhG8qPznzE3G+UcxdPC7LI5p0EKns3BgHhSpSmu0w/UiPjNy/+2DevZUF6Pr5ieqtt5lzkSNAuHqs7wB19Ptk54wMfnDNzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+xaHuXf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+xaHuXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717976868; x=1749512868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3HTTCoUY5hp8ix0O2bleDpyxxKNh2vNrLwTaDLhfys=;
  b=Y+xaHuXfBwzrD6mQs6R74qceALCqI9+b0e4kRFAp2rmIjaLcDKaks8vN
   Vvq3Vuh139mpCXkEbTJX0To3eldPYKVAmNzh0OTFdfBc397xWwbghGlib
   rRNTN7h/AjfkkMAlNyT2i/5Qswt5cb3C3QEfMuHRr6Jh8yisOGcq3+mrE
   U9SGvcV0Td/qjHVb8gyQF1cOLNdVM8eTW9QCqBpLYekY0FYstl/PevWSR
   7bTjiuL7Mk34ACCnq2Ysy+hUcp77MAdgLcBBR4xROgCN0dRt/ZOxhZyDt
   FV7p3hMz/dEPm5Y6Mf+c9dvqXSR7P5E7R0alWkdsgpFHAMp214FLEOGoU
   g==;
X-CSE-ConnectionGUID: R8bE0vnnRkm2qxtK290lFA==
X-CSE-MsgGUID: 5rIV6G/QT3aAO5pe7csc9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25249389"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="25249389"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 16:47:47 -0700
X-CSE-ConnectionGUID: xBc8kUEoQfinoeJijGBirw==
X-CSE-MsgGUID: eGTEtli/QUy3IfhGgpvl6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="39440440"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2024 16:47:46 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGSGD-0001gO-0k;
	Sun, 09 Jun 2024 23:47:41 +0000
Date: Mon, 10 Jun 2024 07:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-msg-ring.1 8/8] io_uring/msg_ring.c:84:2-7:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202406101028.CIzcjTXJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-msg-ring.1
head:   dd519400e18663b1defa230bb9649458fe2412ae
commit: dd519400e18663b1defa230bb9649458fe2412ae [8/8] io_uring/msg_ring: add an alloc cache for io_kiocb entries
config: x86_64-randconfig-103-20240610 (https://download.01.org/0day-ci/archive/20240610/202406101028.CIzcjTXJ-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101028.CIzcjTXJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/msg_ring.c:84:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +84 io_uring/msg_ring.c

    72	
    73	static void io_msg_tw_complete(struct io_kiocb *req, struct io_tw_state *ts)
    74	{
    75		struct io_ring_ctx *ctx = req->ctx;
    76	
    77		io_add_aux_cqe(ctx, req->cqe.user_data, req->cqe.res, req->cqe.flags);
    78		if (spin_trylock(&ctx->msg_lock)) {
    79			if (io_alloc_cache_put(&ctx->msg_cache, req))
    80				req = NULL;
    81			spin_unlock(&ctx->msg_lock);
    82		}
    83		if (req)
  > 84			kfree(req);
    85		percpu_ref_put(&ctx->refs);
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
