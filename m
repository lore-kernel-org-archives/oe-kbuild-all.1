Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3162AD00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976745; cv=none; b=koNxpuS4TYj3mSMqwvd3AY6vYU7H7nnwsGkN7nSs+l1VnUq2E8m3Ixccku715u88ZBi5Tue/nUmKnxDwYl2A7nqTpdJOVAvM8GI/6qWDjtpw+o+JHlAd6VL1FmvVzi1drRjQBoEMGI5vWrfxboLLSR31mf2ut+ZJ7dWrZy0dUuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976745; c=relaxed/simple;
	bh=DqlwjxIOP0rJ87FdgkCcxf84WE4xTA7beB3sT3nJVr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WREE36Xt5ibKegKI/wPPcC2YKM6iLK9ZNMx/sWrTv3dm8LtWVH/Jf2+o5SEJrADtI5MADuSpX81RxgW+ooe2oco0TBUMTwRvg13wT6QvWbRtIv4o8g/0aOQgFg5+Zw2OfZEFI5V3qfMjAsYRhrgSCbLGXPSm/9W8VYyqQ/H4XXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRycDwl9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRycDwl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739976742; x=1771512742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqlwjxIOP0rJ87FdgkCcxf84WE4xTA7beB3sT3nJVr8=;
  b=PRycDwl94IkCctsobFhGVgEH1A/CPnTX1UhyCdT5FVEKdSsVyVhoAUI5
   ulHAsVwqBNFCOy35nik5D7RZUovGKw6VvFclnbeaFXwmwgy3+RE8x6iNB
   PTKel/9C/zqOmYAN79wOzs/nCiKd66VcFGLAnw95PMeIVOWLojndQWWoA
   UcmVTNihpAiWalfK3i6rq0uJKq6wC9Rlxqw+G6VzaZt8hhH0NxIrz7yfY
   8XRyPIGWMzDyzcUShUsXfpN3H2k/prkxusycNPQQ9sq+u6dEoo1pD3b2b
   vkrj06GMEoJnD7awUFHexiezVghpHhtZi1VGJDrQIJFVDwxRi7Cg7U/0/
   g==;
X-CSE-ConnectionGUID: ZqhRKuPNTt6Y6juL0kkPTQ==
X-CSE-MsgGUID: 85SeMRSQTv2iWqyfQCwJuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39903025"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="39903025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 06:52:22 -0800
X-CSE-ConnectionGUID: MCi7+0qgTwCRZqz58WLofA==
X-CSE-MsgGUID: R21bQId9RFymauhiQoMNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115641831"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Feb 2025 06:52:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tklPf-00034N-1T;
	Wed, 19 Feb 2025 14:51:19 +0000
Date: Wed, 19 Feb 2025 22:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Babu <ramesh.babu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
	Guneshwor Singh <guneshwor.o.singh@intel.com>
Subject: [intel-lts:pr/59 1/1] drivers/mfd/arizona-i2c.c:115:40: warning:
 'micd_ctp_ranges' defined but not used
Message-ID: <202502192244.y4ppyfja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 3b656b870544cef6fd26c6d62db24a650495acec [1/1] [FOR CNL FPGA] ASoC: mfd: Intel changes for WM8281 integration on K4.0
config: sh-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192244.y4ppyfja-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192244.y4ppyfja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192244.y4ppyfja-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not used [-Wunused-const-variable=]
    static const struct arizona_micd_range micd_ctp_ranges[] = {
                                           ^~~~~~~~~~~~~~~


vim +/micd_ctp_ranges +115 drivers/mfd/arizona-i2c.c

   113	
   114	/***********WM8280 Codec Driver platform data*************/
 > 115	static const struct arizona_micd_range micd_ctp_ranges[] = {
   116		{ .max =  11, .key = BTN_0 },
   117		{ .max =  28, .key = BTN_1 },
   118		{ .max =  54, .key = BTN_2 },
   119		{ .max = 100, .key = BTN_3 },
   120		{ .max = 186, .key = BTN_4 },
   121		{ .max = 430, .key = BTN_5 },
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
