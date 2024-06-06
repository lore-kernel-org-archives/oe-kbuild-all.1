Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459CB8821
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 04:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717648541; cv=none; b=A8x9QbTxM/CRbqpN4NOQSiC5dp6BDRNKOBiHqe5Og6vdYLAFQOIeypjiBYBf49JGep7NCGIDfbtXNjHYNwKVQYT/DCRI3TLE1ADoAixmcqSBJo1cAUoQlQWGBtORuRmUmUae9cjEudFZy5YIx+9d07iUZE2JXRdmZxDz5EOQOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717648541; c=relaxed/simple;
	bh=7dpBMQIBgZq7U1dqIccFqawOYlmcXmhiSmtisBjYnwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCTTYNbqQPvcUsc5gcvM49QG7MUANrA1XyxEwMXW1SB5foFUCOkN/MP2CunDsXVRN/ZYG3Hwf5ceaRim3FB/ABTqHPmH9HGSglsksoPhdE9ReRtZpnirzA6ujAlwo76FoiQGeyluutNCLFx+WKpSOewJvgCSnmhD8HplpDy+6ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlc7/i1S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlc7/i1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717648539; x=1749184539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7dpBMQIBgZq7U1dqIccFqawOYlmcXmhiSmtisBjYnwc=;
  b=hlc7/i1SmjeZCeDdJ9grTqE9FtxyJuh925Ygcu5v0L6wm3gHKi102BsU
   CegWdue8yJM6xcqGLd3V5V/CjDGZ6I3Ll+DeUeeCXOnTAnV6KdUePdUZT
   Q/KlUe3UECLaW+LJv738yEvKoykYKw4T8AabdmS+1X4WndB1PjIPu+h1i
   17HRqE6evKVUioB5nJROjFAPoqZKcHdaZ/JdhznPxkrQm6wkwb0l6ABXE
   /lZ3E2S8gS7w88PUE5hAmRZxjwlNQcHqqxkSEfx6uSAVi1j+saJIHXyE/
   9n45KTwnF/99Tk2MkBJSl6OmvlLoQhc5JphShpTqlwfRltd+Xo5oPNUvU
   Q==;
X-CSE-ConnectionGUID: icG0xd+wQA2213+vudPyOg==
X-CSE-MsgGUID: C1VdiphtQfyz0fRDCCy6Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18140417"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="18140417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 21:35:39 -0700
X-CSE-ConnectionGUID: 45OzUZ6vR7GW/mvp80FonQ==
X-CSE-MsgGUID: x5fJQIcuRpuNgu9bR44jpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="38385193"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Jun 2024 21:35:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF4qc-0002fQ-0l;
	Thu, 06 Jun 2024 04:35:34 +0000
Date: Thu, 6 Jun 2024 12:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-msg-ring.1 7/7] io_uring/io_uring.c:585:6:
 warning: no previous prototype for 'io_cq_unlock_post'
Message-ID: <202406061256.nf2lYKvv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-msg-ring.1
head:   9c799821c57ae3670fef01abd6746b33685c07d6
commit: 7de82d2e1d5af1210e8f631b7d994957c602a8d4 [7/7] hack
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240606/202406061256.nf2lYKvv-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061256.nf2lYKvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061256.nf2lYKvv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.c:585:6: warning: no previous prototype for 'io_cq_unlock_post' [-Wmissing-prototypes]
     585 | void io_cq_unlock_post(struct io_ring_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~


vim +/io_cq_unlock_post +585 io_uring/io_uring.c

   584	
 > 585	void io_cq_unlock_post(struct io_ring_ctx *ctx)
   586		__releases(ctx->completion_lock)
   587	{
   588		io_commit_cqring(ctx);
   589		spin_unlock(&ctx->completion_lock);
   590		io_cqring_wake(ctx);
   591		io_commit_cqring_flush(ctx);
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
