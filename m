Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B368E2882CD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187797; cv=none; b=gUpoN2S0k8Io6y8IQfNKkLU5pZlDvNPrnP9Js4C0x6dq91uc3+4qn8FjF2/9hAjTP0WHPexheQ1BnrleYacg98GzBuHGGuCEE55/quUctT3Lo7ylNH1HYwur4+445oKbwcSx+GbhQgx23EowAcpo6XVew1bhXJtOSY0RsA7ahG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187797; c=relaxed/simple;
	bh=xrcL18CkQn82elDez/nN/C3GILwFWkZzlLPsfUi6E3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rzd9pc72AvgG47MBE3gfStCpSP4QTgv6O+9VlTaXKa/n/QCzwyBmYwKadFMLYOe1eTQqgLSAzYRehP8K4Y8TjpUyrJXPYMbzVyAPGTo5/fgqkeJK/PIUdhSRC/umrPrE/RMGHSAKN0vdGZZfH5tYeVMpmZDVwLEGGvO+TRCaHVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZWGvOkL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZWGvOkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762187795; x=1793723795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xrcL18CkQn82elDez/nN/C3GILwFWkZzlLPsfUi6E3k=;
  b=kZWGvOkLj22FxrZnpL7czw+kXY7a7ZWgn5osuCL+wTJl++8TMuHa6SZM
   NfxY+4yo5KQErWtrNvSWtW3BsR7RCy+qmkeIcHtn5ymCq/+EO3oqXP7Sj
   cV9mVDZ9KL0Br1NolzG3bU+D4TB60g89WlaVjuX8JbuPE1+/6Q0NWpTGB
   5wBOYoVaHMDL9w/Hkov1Uia2gYAs2FrR7m5M2Icr1XAUBhXpKKH0NljrY
   Lcn5vb7H6g/z8P9mqHK+F1ntjrn7vPsMRKX4tv3T5Ii3Cwpw3O44LKqcQ
   +ukoy72wfI2qvB1htnWzkm5O3JYR5SqZFgnpX5nEn64q4xbAEdJ/ZK/M2
   w==;
X-CSE-ConnectionGUID: Up0OAKV/TailjNfTnrJw5g==
X-CSE-MsgGUID: 9SBbS/4bRt2hEKEnhmOD2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74870936"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="74870936"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:36:34 -0800
X-CSE-ConnectionGUID: ELhQQ19SSROi43TS1uXlZA==
X-CSE-MsgGUID: u5VvWvQvSa2tQXWY8NDKyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="224159232"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2025 08:36:33 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxXY-000QLT-1b;
	Mon, 03 Nov 2025 16:36:24 +0000
Date: Tue, 4 Nov 2025 00:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw/v2-test-unfinished 10/12] sh4-linux-ld:
 rsrc.c:undefined reference to `dma_buf_put'
Message-ID: <202511040005.5Uw99qoF-lkp@intel.com>
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
commit: 854fac37757903a2dfdaf4ef22ff4172ec2b65a0 [10/12] io_uring/rsrc: add dmabuf-backed buffer registeration
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20251104/202511040005.5Uw99qoF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040005.5Uw99qoF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040005.5Uw99qoF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: block/blk-mq.o: in function `blk_mq_submit_bio':
   blk-mq.c:(.text+0x5ad8): undefined reference to `blk_rq_assign_dma_map'
   sh4-linux-ld: io_uring/rsrc.o: in function `io_release_reg_dmabuf':
   rsrc.c:(.text+0x104): undefined reference to `dma_buf_put'
   sh4-linux-ld: io_uring/rsrc.o: in function `io_register_dmabuf':
   rsrc.c:(.text+0x7e8): undefined reference to `dma_buf_get'
>> sh4-linux-ld: rsrc.c:(.text+0x800): undefined reference to `dma_buf_put'
   sh4-linux-ld: block/bdev.o: in function `blkdev_dma_map':
   bdev.c:(.text+0xec4): undefined reference to `blk_mq_dma_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
