Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA678C80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 05:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717132625; cv=none; b=OvPWwh6JjwLSwNMoeun+tzrGKDDU0BfypVxAev60mhhCOs022rH4IqKhykFYlzGeDZOZjjhPbDv9HdAlc9qaSsXf3ThKtLQ9XUMNCFmekDkPiewoEEe1M83O99T5dSKFnN8snbUuAI+zb9RnhcDKKdUsAZh1Kn/U7Yh6tDUjA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717132625; c=relaxed/simple;
	bh=/FGCSGVKtPB/AivcbsaNPYGZnTWLBOQR/8lC4yKukEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHLTSgup5yvhLviHmcIYxJUh+YUO+lBuGShJrRBtsN4iAsb2IQDYCmh9IOqJDfFeB5RCpmmpKeJKs/WaPVvhRfF4cU1RVVbpD8AEvGTOuuBQALYBDTkcd0zW/dLrLKxlMWfuHgWuaf7vWAow9l+NeDubDZ76JFx4A8s7SYC49OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPOP2VfJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPOP2VfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717132623; x=1748668623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/FGCSGVKtPB/AivcbsaNPYGZnTWLBOQR/8lC4yKukEI=;
  b=XPOP2VfJhxKb462c5T8upFSFfELAZYUTVHSQ4UtopPQy/xkqQpB/u3eB
   bvX1tsP84S1+b3dZ5bd+1W2WxfgehhMtijKp418+DKeyVjulPjz2x4MXg
   pa2yNOme6pag08KeBuiP88KmUVQ6DcG/ARhGPLNwkV16OZMfQXg4FBXQu
   lQH3/3D6jnxi/l+fSRIJ7gqXy9I+dbKM6wmRgn0Se4QtYCNevIJay9JbA
   cYmENx8o8RfT8GQULRaAm1vLbhImVsIQMUdBi45jSD0gHGWawUUQ6zPD6
   mL4E+EM6xq+3C0+u8QMrXwjplACJdvJTW7E/ASbxQYuM1+dg8lC6TZ6OV
   g==;
X-CSE-ConnectionGUID: HZLYDRgaRP2kQ2wQtLv3Kw==
X-CSE-MsgGUID: ZEi8imDvTsCX0aliO1F7vQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13787307"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="13787307"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 22:15:52 -0700
X-CSE-ConnectionGUID: 0ukOtWK+Qp2TkLOdlTHXIw==
X-CSE-MsgGUID: KbYZTyIyQBeidTYlhme3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36140898"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 May 2024 22:15:51 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCucG-000GYj-2D;
	Fri, 31 May 2024 05:15:48 +0000
Date: Fri, 31 May 2024 13:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9622/9794]
 arch/x86/kernel/zhaoxin_kh40000.c:35:15: sparse: sparse: symbol
 'zhaoxin_patch_code' was not declared. Should it be static?
Message-ID: <202405311319.BzJDMWBG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a4c1bb6d259c5f07d1cf526fcb8c10d67c43a825
commit: 4332dbb07181359cccca3ba757ef54e434fb1296 [9622/9794] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-randconfig-123-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311319.BzJDMWBG-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311319.BzJDMWBG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311319.BzJDMWBG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/zhaoxin_kh40000.c:35:15: sparse: sparse: symbol 'zhaoxin_patch_code' was not declared. Should it be static?

vim +/zhaoxin_patch_code +35 arch/x86/kernel/zhaoxin_kh40000.c

    34	
  > 35	unsigned long zhaoxin_patch_code = ZHAOXIN_PATCH_CODE_DEFAULT;
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
