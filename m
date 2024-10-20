Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150520E33C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729408526; cv=none; b=h28IFwYM+F0eaZO3xaD1/TISKiydwMlWV6xulOJocVc0QFeLlhAsivSlX33l5eroTF28H2pNMLL7C5a1t5cxLLciiNl/8Wnmq+mbW7HtVE4/dq6SU0hhbTwOO/InOP/hjqP4jKjGe2+ueBaCACmmQ2fMff0ard+j1rqjXp7WOR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729408526; c=relaxed/simple;
	bh=F1cUDxqpJHebTT5zrktDlgHQkS3HYNH+BtpAlU+STJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7vDcGLQaZkgk+W0RZwHc3Y997SOZW8HG6Zl4emDeoDdnGWm6LmutPLqy/UdZBLrBXuoFaC0B5v1IFv2RXGT3vm/s0Pip4Hrn0Is81cBAXUb+oXFeHEUzhghE7eWOmzkTjLhyDRXhSK1+XG++W8/yK0ISa3VxZlpAa0QAgeKbOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlLXD2wN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlLXD2wN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729408524; x=1760944524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1cUDxqpJHebTT5zrktDlgHQkS3HYNH+BtpAlU+STJE=;
  b=dlLXD2wNt0TYnZJSlpBQU0PEcCK4X1LtqGwdl8o8CHRzzAGo6WAKJTrM
   mBmuw/UoSBxbG0o/OKNCIN/ljSDqFtik2UfDVGXVgsxDNJRoOAnV8BOdB
   AyogxHkCD1DYqCDy3zLBKE8QhiYHkfcGOl1hqn/s8hZxlg70cv4MaJHFj
   G5FTO0oZHvWR6HwBgLjN7pfR4GxpRhFDp0PlUO052l+sO0KPizUHSWSwN
   ll+LGF7iJmYkI/2J1x1Isn6wtdOW6hKcaktPjRgcCU1UoZXDLSbboDuYX
   Q91X0TpzKQHWsqByRNop5YHHtHylsQltLa4+j8jXdEmlIS3z0lxHx8aho
   w==;
X-CSE-ConnectionGUID: 416Wv43GTkmOAGgf48nD3w==
X-CSE-MsgGUID: DoA8dsS2Sbak9TUr0vlPnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="29000297"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="29000297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 00:15:24 -0700
X-CSE-ConnectionGUID: SZNLPdCMRdmybCyWyVHW5w==
X-CSE-MsgGUID: vEbWutPOT6ejXTX8M4gT8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79640847"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Oct 2024 00:15:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Q9p-000Q1p-0B;
	Sun, 20 Oct 2024 07:15:21 +0000
Date: Sun, 20 Oct 2024 15:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 2/42]
 ./usr/include/linux/mtk-fd-v4l2-controls.h:2:1: error: C++ style comments
 are not allowed in ISO C90
Message-ID: <202410201554.XLbm41S6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f80404ea0956d01dcbcdfb1e4807883883fb46bb
commit: 0515dc9d2fe28a3991e1f425fe2f48cb657841ee [2/42] BACKPORT: FROMLIST: media: platform: mediatek: isp: Add Mediatek FD driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241020/202410201554.XLbm41S6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201554.XLbm41S6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201554.XLbm41S6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/mtk-fd-v4l2-controls.h:2:1: error: C++ style comments are not allowed in ISO C90
       2 | //
         | ^
   ./usr/include/linux/mtk-fd-v4l2-controls.h:2:1: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
