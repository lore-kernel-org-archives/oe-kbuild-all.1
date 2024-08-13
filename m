Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950B219AD86
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546464; cv=none; b=OAnCXVx9ljWJvmKaYNr7X5Az4FxUSHLM/azzEqmHSHuaSYQXRVdh8G/v5lF1eOG3oGKyIX/T4djBw+EJgKDk8B8lkYQ6vtJMgIJKnpUkoKlIoVDQpwMYx5fjCABRcPAr0tmBW4zgtf0zcb5UYA5+I0TjtAJJnkWbW8iglVQwIC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546464; c=relaxed/simple;
	bh=Y0LoVaJcmQ8a+FOvptdTs/fn5d0fBHb607zaGamA3os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GJ78QzKiupj7Wx2IifstkkAotdGPnze2ZHbViVXiWnPQvHCz0ZBJ7C6CyA3wNjf8NF8rY8Vu++7ROARIR7vEg7ToROLoDyIZTmOsqAc/doUbFTSK9ByZzHuMpXR5VqBMo5VD5Yrjc6FpnbFcTI8LYGeE0Uhv2k1hXDMrxJmh9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MViNKDAF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MViNKDAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723546462; x=1755082462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y0LoVaJcmQ8a+FOvptdTs/fn5d0fBHb607zaGamA3os=;
  b=MViNKDAF5//Ju7J/ulDtJfImmwdvBJOtDwQWXDzmAdjsJnLZrgqCKU4F
   uomgZ1zCaAoaiBLlNlk3+R3vJmSVsDeZkrNj8uWzFQQW9Q5lmcZ52btGh
   ye9mGRxA8J5VTrgTm9j2hBt/Ia/ze5A7cxXqyIc8vFcjO97DVTuCs4SCR
   NKaMasziHkrrFa5gv20ksSTq0xNhPNPr6KCBTwql/v2mAHXkWHf1zpeTU
   DNw7Cyf5RhOy8ayolQ1k3pMAVrjGSJEjOFt3rrmiDRkc05FTA2S+dqFZU
   cJDyEDBZOhCKkEhx+ONIb9q2D9d+x+koug4pdhHKMtrrXKFJsGpJneHZY
   g==;
X-CSE-ConnectionGUID: A8gtUc9ZREmB0bnh/9iRNw==
X-CSE-MsgGUID: ALqb0MBMTr2v6ZCEeJ6QAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21674455"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21674455"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 03:54:21 -0700
X-CSE-ConnectionGUID: WskrlzbnS4OXGWpMehT6xw==
X-CSE-MsgGUID: rey2ZMUOSxCagXUEh9YFOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58505512"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2024 03:54:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdpAP-0000Mc-0W;
	Tue, 13 Aug 2024 10:54:17 +0000
Date: Tue, 13 Aug 2024 18:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jens-wiklander-tee:testing/tuxbuild 3/4]
 drivers/mmc/core/block.c:3225:26: sparse: sparse: cast to restricted __be32
Message-ID: <202408131857.Ls6Jmf6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

First bad commit (maybe != root cause):

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   1eeef6f8f4da434303136dbb1f5aee3e7fd20703
commit: d5fda642a1c63784e90a28fe4c66017bf6ec1994 [3/4] tee: add tee_device_set_dev_groups()
config: i386-randconfig-061-20240813 (https://download.01.org/0day-ci/archive/20240813/202408131857.Ls6Jmf6o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131857.Ls6Jmf6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408131857.Ls6Jmf6o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mmc/core/block.c:2558:26: sparse: sparse: invalid assignment: |=
   drivers/mmc/core/block.c:2558:26: sparse:    left side has type unsigned int
   drivers/mmc/core/block.c:2558:26: sparse:    right side has type restricted blk_features_t
   drivers/mmc/core/block.c:2560:26: sparse: sparse: invalid assignment: |=
   drivers/mmc/core/block.c:2560:26: sparse:    left side has type unsigned int
   drivers/mmc/core/block.c:2560:26: sparse:    right side has type restricted blk_features_t
>> drivers/mmc/core/block.c:3225:26: sparse: sparse: cast to restricted __be32

vim +3225 drivers/mmc/core/block.c

627c3ccfb46ada Linus Walleij  2017-08-20  3201  
6f4804800b4e1d Jens Wiklander 2024-01-18  3202  static void mmc_blk_rpmb_add(struct mmc_card *card)
6f4804800b4e1d Jens Wiklander 2024-01-18  3203  {
6f4804800b4e1d Jens Wiklander 2024-01-18  3204  	struct mmc_blk_data *md = dev_get_drvdata(&card->dev);
6f4804800b4e1d Jens Wiklander 2024-01-18  3205  	struct mmc_rpmb_data *rpmb;
6f4804800b4e1d Jens Wiklander 2024-01-18  3206  	struct rpmb_dev *rdev;
6f4804800b4e1d Jens Wiklander 2024-01-18  3207  	unsigned int n;
6f4804800b4e1d Jens Wiklander 2024-01-18  3208  	u32 cid[4];
6f4804800b4e1d Jens Wiklander 2024-01-18  3209  	struct rpmb_descr descr = {
6f4804800b4e1d Jens Wiklander 2024-01-18  3210  		.type = RPMB_TYPE_EMMC,
6f4804800b4e1d Jens Wiklander 2024-01-18  3211  		.route_frames = mmc_route_rpmb_frames,
6f4804800b4e1d Jens Wiklander 2024-01-18  3212  		.reliable_wr_count = card->ext_csd.enhanced_rpmb_supported ?
6f4804800b4e1d Jens Wiklander 2024-01-18  3213  				     2 : 32,
6f4804800b4e1d Jens Wiklander 2024-01-18  3214  		.capacity = card->ext_csd.raw_rpmb_size_mult,
6f4804800b4e1d Jens Wiklander 2024-01-18  3215  		.dev_id = (void *)cid,
6f4804800b4e1d Jens Wiklander 2024-01-18  3216  		.dev_id_len = sizeof(cid),
6f4804800b4e1d Jens Wiklander 2024-01-18  3217  	};
6f4804800b4e1d Jens Wiklander 2024-01-18  3218  
6f4804800b4e1d Jens Wiklander 2024-01-18  3219  	/*
6f4804800b4e1d Jens Wiklander 2024-01-18  3220  	 * Provice CID as an octet array. The CID needs to be interpreted
6f4804800b4e1d Jens Wiklander 2024-01-18  3221  	 * when used as input to derive the RPMB key since some fields
6f4804800b4e1d Jens Wiklander 2024-01-18  3222  	 * will change due to firmware updates.
6f4804800b4e1d Jens Wiklander 2024-01-18  3223  	 */
6f4804800b4e1d Jens Wiklander 2024-01-18  3224  	for (n = 0; n < 4; n++)
6f4804800b4e1d Jens Wiklander 2024-01-18 @3225  		cid[n] = be32_to_cpu(card->raw_cid[n]);
6f4804800b4e1d Jens Wiklander 2024-01-18  3226  
6f4804800b4e1d Jens Wiklander 2024-01-18  3227  	list_for_each_entry(rpmb, &md->rpmbs, node) {
6f4804800b4e1d Jens Wiklander 2024-01-18  3228  		rdev = rpmb_dev_register(&rpmb->dev, &descr);
6f4804800b4e1d Jens Wiklander 2024-01-18  3229  		if (IS_ERR(rdev)) {
6f4804800b4e1d Jens Wiklander 2024-01-18  3230  			pr_warn("%s: could not register RPMB device\n",
6f4804800b4e1d Jens Wiklander 2024-01-18  3231  				dev_name(&rpmb->dev));
6f4804800b4e1d Jens Wiklander 2024-01-18  3232  			continue;
6f4804800b4e1d Jens Wiklander 2024-01-18  3233  		}
6f4804800b4e1d Jens Wiklander 2024-01-18  3234  		rpmb->rdev = rdev;
6f4804800b4e1d Jens Wiklander 2024-01-18  3235  	}
6f4804800b4e1d Jens Wiklander 2024-01-18  3236  }
6f4804800b4e1d Jens Wiklander 2024-01-18  3237  

:::::: The code at line 3225 was first introduced by commit
:::::: 6f4804800b4e1d1a9651f70de4dd0c1a9b8f0417 mmc: block: register RPMB partition with the RPMB subsystem

:::::: TO: Jens Wiklander <jens.wiklander@linaro.org>
:::::: CC: Jens Wiklander <jens.wiklander@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
