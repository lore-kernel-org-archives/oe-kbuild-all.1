Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B06FB8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 02:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722652424; cv=none; b=O0I8raPFl8QDHHmd/B82tzgX6f9YEWyhKsmjE8nABLtyHeYJaZDG9nTTIOBTXf08ONCIFH69WY2D1gjND94YaafEyegmDjgPOK3Y9L0Qbr4Cx0Om/hhw9BkD1XI3WNND+DsIeaBazSFiXkWmw2H9lURC395aya1HFAiuoiMjd3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722652424; c=relaxed/simple;
	bh=LiH6C+A+4jye86Rp0LaXOfnyYJ4yxUxwi3VL7qZ00SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrJGCx6lVYdn0fFqsm+mmrweyY2npN3C8PHcbni5rETZkOvb05M/CznIV4kv5XagYBFl5KF2N5iqp4GoOqCi6s4A/3ALkcGLOF3zAcMx9Ec+F+e2Fq0D6u76y3cLjGwVPpgJba2RguBXCVod4ci02dUhLMLm7FVqI0VUL9+LP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkpcNfLL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkpcNfLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722652421; x=1754188421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LiH6C+A+4jye86Rp0LaXOfnyYJ4yxUxwi3VL7qZ00SM=;
  b=WkpcNfLLDX/B04iWFCycOOBaDn6WgHaBenyzajsWdYHausP/wWBbbJos
   UobfxfwMUlNlchYv8HRck++002GTCvMl/IbSeZUDhBEVI1M1Jyh6QerTn
   skjGDQxcBdZoqRt91QyeoAq0Xj3P0xDSg9b2xUC1ZmM3SCuo6BKPUky6V
   PM9BIIFS7ppxEqF4xrF4rFjDBk+3t6f2B0wgCheNZu6lsU8y942jTtVc/
   qSdl168R4b8DWaMvLhdZ8CMrqz4gs+QivSLJPIAOKN5Kr9Ht1PYPTmuFI
   KNhG28rLgW2PAJTk7Rc4540o7mJPQd4Tz3Q5HX1YIwSe1rGWfTJZSoodm
   g==;
X-CSE-ConnectionGUID: 6lyccavmTnGs3vnEXQwNIQ==
X-CSE-MsgGUID: OkdB70TcT0Kya7M19IWTAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20499776"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="20499776"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 19:33:41 -0700
X-CSE-ConnectionGUID: uSF9c6oKSs6jTC/Hu+vfeA==
X-CSE-MsgGUID: DN18/+g+QnOmDTC7oJIS8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="60441521"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 19:33:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa4aP-000xnU-0r;
	Sat, 03 Aug 2024 02:33:37 +0000
Date: Sat, 3 Aug 2024 10:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.11-rc 18/40]
 drivers/net/pcs/pcs-standalone.c:14:29: warning: unused variable
 'phylink_pcs_phy_ops'
Message-ID: <202408031031.be5wJku4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   d8e30074e1ec80f1c21851b2afe96a14cd4fd151
commit: 8c2d1e597605fee9686607b3b5ebfbb150fc7378 [18/40] net: pcs: add helper module for standalone drivers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031031.be5wJku4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031031.be5wJku4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031031.be5wJku4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-standalone.c:14:29: warning: unused variable 'phylink_pcs_phy_ops' [-Wunused-const-variable]
      14 | static const struct phy_ops phylink_pcs_phy_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/phylink_pcs_phy_ops +14 drivers/net/pcs/pcs-standalone.c

    13	
  > 14	static const struct phy_ops phylink_pcs_phy_ops = {
    15		.owner = THIS_MODULE,
    16	};
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
