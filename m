Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FCE18AFE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 01:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856633; cv=none; b=OgtBLIpUG8t68YHpAEuyiyVa15+465B912Dib7YCSYP3ZcU0yT5MK81mEJvdNgDcRY6RXuXxk+UaDGWqsj24HugCJW8YYZH6SQqbSfqdOAAn/+lg7RPoftbDyMXLNugqof1fwjPiX5ytvA5cZvqwEw8UJpDs7BcczebvwD3/I3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856633; c=relaxed/simple;
	bh=lNq4u9Jp8WOWkY+VGragqwYDeHbLgP3A1JJl+pVhG1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NXumcX4GpcQs4nuR5zYGUgYi74jpGREF9F5H15mMw7ovIW9sp28tymYjm/T/zZlH88YglQngdAeozWIgfUsXsdCt/p8xHFP1guzYmhWpmyBh3pEMMntMTMk3/EHbw2NzRorf6o2YS1OftzVVOv1EQXb73mgPRo5DLZ4jkRzzyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTziFmZj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTziFmZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777856632; x=1809392632;
  h=date:from:to:cc:subject:message-id;
  bh=lNq4u9Jp8WOWkY+VGragqwYDeHbLgP3A1JJl+pVhG1A=;
  b=kTziFmZjupdgA2Blvg8DwL9OXtW0O8SF2m4FU/NB0OaKGlQghEGpcd+6
   laJxuXeWxFtZhKR4F/yR7cg3yhXAziacyk0/3wIgPMBRnLdMG7j8tCX0y
   v1Q5vn2RLa8fvqHjSwBx1i1QL6DTNl22Reyy3aZhssm27hf0cZeH/YN53
   j12uN01KpK9mMkSdT9GrmQTTRAaBZrHwin2PwcD4/+7Z5n8QYgDibVhlD
   GizMJAOwZQRILpPKw1zf/ecPUJlG6lcHIPzzVZhjkcRadL1Yj4vaAiVsz
   6TVpcYJCuZfsxJUbkN6vRgJbqcqsMHD4GXPyEYcXQvGP4E0Q6hqPMB/ND
   w==;
X-CSE-ConnectionGUID: l0HvXsLuSpGGm6ohHHJxnQ==
X-CSE-MsgGUID: qoQ5dsefTAuMi6lX/kkv8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96142211"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="96142211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 18:03:51 -0700
X-CSE-ConnectionGUID: p5/EYpYcRfmRRH6T6WgGoQ==
X-CSE-MsgGUID: dCjaY/28RUax+tnlDRRN3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="258734606"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 18:03:49 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJhii-000000003IJ-3uBp;
	Mon, 04 May 2026 01:03:40 +0000
Date: Mon, 04 May 2026 09:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/infiniband/core/uverbs_ioctl.c:82:16: sparse:
 sparse: incorrect type in return expression (different modifiers)
Message-ID: <202605040836.G7MlryMo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 1de9287ece44022bd694e669153fb7644804e10d RDMA: Add ib_copy_validate_udata_in()
date:   8 weeks ago
config: i386-randconfig-r122-20260503 (https://download.01.org/0day-ci/archive/20260504/202605040836.G7MlryMo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040836.G7MlryMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1de9287ece44 ("RDMA: Add ib_copy_validate_udata_in()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040836.G7MlryMo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/uverbs_ioctl.c:82:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected int ( * )( ... ) @@     got int ( [noderef] *__v )( ... ) @@
   drivers/infiniband/core/uverbs_ioctl.c:82:16: sparse:     expected int ( * )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:82:16: sparse:     got int ( [noderef] *__v )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:453:17: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *handler )( ... ) @@     got int ( [noderef] *__v )( ... ) @@
   drivers/infiniband/core/uverbs_ioctl.c:453:17: sparse:     expected int ( *handler )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:453:17: sparse:     got int ( [noderef] *__v )( ... )

vim +82 drivers/infiniband/core/uverbs_ioctl.c

    72	
    73	uverbs_api_ioctl_handler_fn uverbs_get_handler_fn(struct ib_udata *udata)
    74	{
    75		struct uverbs_attr_bundle *bundle =
    76			rdma_udata_to_uverbs_attr_bundle(udata);
    77		struct bundle_priv *pbundle =
    78			container_of(&bundle->hdr, struct bundle_priv, bundle);
    79	
    80		lockdep_assert_held(&bundle->ufile->device->disassociate_srcu);
    81	
  > 82		return srcu_dereference(pbundle->method_elm->handler,
    83					&bundle->ufile->device->disassociate_srcu);
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
