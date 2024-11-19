Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315114B94B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732000236; cv=none; b=OnOtQRwurMeTtxh44NGR4ypcrYFaJPLTPEUMvgEPCWWGSR12joAME040eJ+wHzgJKR76SqyOl+taNXG7O+5inhvS+WbrSDPfJYETwlQsiyj5DcOEZfQ/UYjB+YKDbb90sqxQ5cy/vHkiudr/hk4ZBd7mqSvT9I5VK2+7hW0ESns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732000236; c=relaxed/simple;
	bh=ufKlWn8ev5dFboxTWkMN/bJx56aLb00c+sOO67Nh/9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDh1eTPdV1MciadHjIG8L5/rqAWAtHLEYeepPR9nZLly96oz/ciJbcplcHMGra7Q08pVFoMl/8hxpn0TwLCSgzglxZ4V7K8gBiNygmRXZrcz9jegYmIZ4WPwBLDx6LWh1CwyncEQexBMklRRQxw1h+ywyz9kj7w+yiHVWrJ4uTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/CFWOU1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/CFWOU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732000235; x=1763536235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufKlWn8ev5dFboxTWkMN/bJx56aLb00c+sOO67Nh/9c=;
  b=m/CFWOU1vouHbuI8GWf6YKTWXa4IyOEF9DCqTZh3c9IDs68o+8qVyyXy
   nXxKbYqOl2jq9Z/xQNXVAygCBlFPYJqJxkNGWPMh6EfWeCOjx+vqSOQ3h
   pAPMWABwO3Drpi3rN6OOtHB/gHrNpXFVsk32RGxPxN9ol8tXjKwb57N81
   CuW08q2Dgwpdx3XPHMjaZVQO1Bp0WqrLHE8Vtl3nnZhu9h6Ku6wi0/1/9
   jWBOpbmT28evv9l+WWub9mStqN9VqQxVG6gdJeUjZE2ANcQinOTA21SSH
   nMSAQHD0XrNCijHwQLFs6gRTPKeZdvusLE/1qjd5DBIZGFj8i977zB0L2
   A==;
X-CSE-ConnectionGUID: Xv/qLUycRE6ueaYGnWa3tg==
X-CSE-MsgGUID: 1aL8G7zXT82d7T7NhQAAjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42500257"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="42500257"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 23:10:35 -0800
X-CSE-ConnectionGUID: G0bUz2vXRaKyPvMM01M+Wg==
X-CSE-MsgGUID: LKRqcJEaTpavmopR21xK9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="93924249"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2024 23:10:34 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDILC-00009j-2y;
	Tue, 19 Nov 2024 07:09:00 +0000
Date: Tue, 19 Nov 2024 14:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_content 19/21] xfs_file.c:undefined reference to
 `filemap_fsnotify_fault'
Message-ID: <202411191410.EIXjeTxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_content
head:   a2b4aa2a63d555f7b7d22f6f54583dff35a1f608
commit: d3e0f4f0a419a7012bcdc60530619ba2cdf96e85 [19/21] xfs: add pre-content fsnotify hook for write faults
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241119/202411191410.EIXjeTxu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191410.EIXjeTxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191410.EIXjeTxu-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/xfs/xfs_file.o: in function `xfs_write_fault.constprop.0':
>> xfs_file.c:(.text+0xd14): undefined reference to `filemap_fsnotify_fault'
   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x1b90): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x1b98): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x1b9c): undefined reference to `of_clk_hw_simple_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
