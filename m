Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5743C2C9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728142337; cv=none; b=T/+xZSz6tWWYpnhs1pc/bGBjj23nkGAmgJHu2IieB/zHJRYd37sxlp7Fqk48cfnuBBvEq1K6HtXuE+Skugh1YyCFkjE2HC4Sh6QCvbjsNGBrLd5ru8d/worlYdJSU4kfhzXFusheEVo/ApH0U5XlilYlJD3ytu4IaXXIR5CUL08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728142337; c=relaxed/simple;
	bh=N1LPBO9spOjHu/jLi2Y6szJ/Yh8i9oLgQ85y/nb1vDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4bppZMby5hAN+K5sxSllSuWxQh654ZVEsg33z8I5uccUiIODK13ysnpA06HuJw7jc25shf7/qK2/v8ahCtD0dkP/u/17nD2SsILNteQEdyp/O68CB+ri4QE4C041mGSXC32aYq8R75dKiJxLu26+8oDjYuiNU6LSTAbWG8VzJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C260BdDc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C260BdDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728142335; x=1759678335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N1LPBO9spOjHu/jLi2Y6szJ/Yh8i9oLgQ85y/nb1vDs=;
  b=C260BdDc3J2Nmvw4bI7yvLsZTYipHmaCO3V0MlGX6bY23PP953TB7EPj
   6itEx2/IqHd0bT6DT2MEElWtBhRMmsj22ht0S5w85uaNd52Kv7VotkGau
   FfDz1PugpkCsVhjdqWLvHYRJL/qJybrs86zhz6zv3znxr+4ctyRHeCzj9
   GbPqxuKShdGIksmR2nXngme+ImR/KWTkbQwLRJxD7vcV81+R2hbkLvSeS
   JPIo6ERanx6/iV5qHp/gN4AqY7V50/Fnm8SKc3AUdJGlDQSB+VhBWz8y5
   ntR/bBFLqonLAgw4//vXauQkdfiG49H+gbSNY0HJ/fSowrTO5hZwZ4a5a
   g==;
X-CSE-ConnectionGUID: mEBQjfjcSQuat3RPqyVLfg==
X-CSE-MsgGUID: XCGw4dO/TcOPLjL8OB+Z0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27232665"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27232665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 08:32:14 -0700
X-CSE-ConnectionGUID: 4azRbZeqSwe6a6ccfur8Qg==
X-CSE-MsgGUID: ZOawE2/qQiOWm4uD64z0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="79828862"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Oct 2024 08:32:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx6lP-00034K-12;
	Sat, 05 Oct 2024 15:32:11 +0000
Date: Sat, 5 Oct 2024 23:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1081/16788]
 usr/include/linux/videodev2.h:2477:41: error: field 'timestamp' has
 incomplete type
Message-ID: <202410052356.bDnKbpGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 582279b4a0dc616ecace8c88116aa1f394f06741 [1081/16788] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410052356.bDnKbpGM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410052356.bDnKbpGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052356.bDnKbpGM-lkp@intel.com/

Note: the freescale-fslc/6.6-2.0.x-imx HEAD ac32ba5fe66266329914d2020570364afe217bec builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/ipu.h:29,
                    from <command-line>:
>> usr/include/linux/videodev2.h:2477:41: error: field 'timestamp' has incomplete type
    2477 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
