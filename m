Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202754C65
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 05:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717826306; cv=none; b=AjTUCmHXj0rVh9qMAFsDE7TOGnH8xCQ+FiljJtvb7YFFUjI9V4t1qObh/QfBk8oCzUAJM70uB79opt9Gtd9mODLNX3mIQ3SFYqKebtsz0857bsA4H0gJPTkT5lIYig90bY+jb8Y5YLBvHRNeh01YJmADgcaL/pUrG4+LLkR82IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717826306; c=relaxed/simple;
	bh=A7LnzWkQCycQGex2wY/IhjPgPsK2GeAWn8SvrT1HHyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQroog0iTfaxGGq6hExb5e0CRKWEyD/5v4tfk1MYUwo3hLlkfyi3vVBGtABzt/PUWFhCAt1WQxd2gxR3U1Vj1rQr1iewVKdhn0b0HYBbcrHJ8Xv4dSggUcr1PZNYjKwpPH4bxLjYSK8TJRTAezx5yVhW38xDurjkwFJbZPwcKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2NtUUpB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2NtUUpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717826299; x=1749362299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A7LnzWkQCycQGex2wY/IhjPgPsK2GeAWn8SvrT1HHyQ=;
  b=k2NtUUpBkj2y2+sdKx8doBaFXeNEexuLPKpbSFSecSIjwgbMsOaIekDn
   qvOM9JbQ/n00qggQg7foPv+XBEWEArET7m5SWgRNlrhV1YZ/YBpd+O4uJ
   coxpINCURAAe2aNn1aiwJ8mefjwBvEOOGbLN4QnBgtNavvV6ZMF+ZBfzR
   Iz7xHKT7T/ar2lOOEhxgptY2zCPQ1AmGsjtzv7rOFXbqvaA1jNbE90TyD
   +HVyR7226WUFEHS/feHyBxT24DObpgo5mDTB+II1Q7Mx4tJzNiE1Nu4Fb
   vaau//Yf/aaWuUxiT9M7cF4uI4v9/q7s9Ae7EcIcbtJtQMXPNGyoNl+Qf
   w==;
X-CSE-ConnectionGUID: Ky+ENIlnRsiBHnTP5Elpzw==
X-CSE-MsgGUID: lFZypIK7QZ6EXWm/SzvkfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14793802"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14793802"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 22:58:18 -0700
X-CSE-ConnectionGUID: dejz1X7KQc29hRwvgdKihA==
X-CSE-MsgGUID: ZYVWHmE+Sp68M3UkDuc0LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38384358"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jun 2024 22:58:17 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFp5j-00018w-17;
	Sat, 08 Jun 2024 05:58:15 +0000
Date: Sat, 8 Jun 2024 13:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Bee <knaerzche@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 1912/4582] dtbs_check:
 arch/arm/boot/dts/rockchip/rk3128-evb.dtb: /dsi@10110000: failed to match
 any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
Message-ID: <202406081302.0CAdvAA9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: 73fc389129dfe22b5706b4b6cbc1a4f86d1fbc1b [1912/4582] ARM: dts: rockchip: Add DSI for RK3128
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240608/202406081302.0CAdvAA9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081302.0CAdvAA9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/rockchip/rk3128-evb.dtb: /dsi@10110000: failed to match any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
--
>> arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dtb: /dsi@10110000: failed to match any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
