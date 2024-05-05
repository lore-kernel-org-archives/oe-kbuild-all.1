Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99521D555
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714918384; cv=none; b=JrhcRe49mP6NDUNticdD1761VxfxPnnHUgx6+CtVq1njtJkRPkRIWq50cezEzr93n8b9Wk6Ia7o+BZCfavBVoUP6o0hX0qOoc+DE1o2upU/EzRnlY1qRyBT14ei+badWrI0gOlkZtL3AJOMbPx8YudweSMpeYDZpxCg3MYeaNU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714918384; c=relaxed/simple;
	bh=OCiQ4MC1oOJ0gTKHcUicua5d8xORw7o+IAg7rI7O9DE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5aN+4WxRxb7DQczaO5Uva4o257zlBletEtpnYTaYkk/zy2cqBHOU01F4fHld0qGFLjk9/PCfaO2YdkLwZaZr5fX6NCTAbwH9CEuFdHBWcZqN8hYuHGZq2PjssgvDeA7NGnj/tHE8Pded1bwCVw5BpYJJ5kG//v0L+2Z7uDaQm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWYHuJB4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWYHuJB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714918382; x=1746454382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OCiQ4MC1oOJ0gTKHcUicua5d8xORw7o+IAg7rI7O9DE=;
  b=bWYHuJB4itDwhZzPJ0aSgV3tPC/0cotaC0IA+kOtIDcrLDdMTfPunI4/
   Nna+A9Dtf0iAbuj7Og/gvStu7KJIbohpMc8kqqjKczeT5vieVQLDTHfzl
   Lfdb5km7VhQpMgiz6DaBE8gkqTq0B9X2/otZKe+yoCLS9/MPybmBy6BFQ
   LwO9ak4ap4cIWquOKuh0pF+WTMOMzZp4nnqfOUpSsb3YvNl8SCVrCYr73
   zeicjrVtNdB7Ja2Aq4wR0dM7QsuEhd5cJ8pie2N70Cm4dnRKno0xZ12ri
   uc8ybMW6UU4NHg8Aqn7o2hwhLnh0zYM5RD+HFoCtVqP4AHV/mjOHll7tW
   A==;
X-CSE-ConnectionGUID: XEiiLaBrQ6W5MF2qwtNYww==
X-CSE-MsgGUID: 679PYDPkSQSN+7LnXyEllw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14474684"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="14474684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 07:13:01 -0700
X-CSE-ConnectionGUID: W1hbk8VFR2eiim3I6zsAyQ==
X-CSE-MsgGUID: po9TncMvR6CQQnCI8qdYiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="58807244"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 May 2024 07:13:00 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3cbp-0000Gu-2e;
	Sun, 05 May 2024 14:12:57 +0000
Date: Sun, 5 May 2024 22:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 13934/30000]
 drivers/clk/imx/clk-imx93.c:324:34: warning: unused variable
 'imx93_clk_of_match'
Message-ID: <202405052202.OxUFBt95-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: 4d99e4233d3a955ae9de56c0d83d778b4ab7e399 [13934/30000] clk: imx: add i.MX93 clk
config: x86_64-buildonly-randconfig-006-20240505 (https://download.01.org/0day-ci/archive/20240505/202405052202.OxUFBt95-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405052202.OxUFBt95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405052202.OxUFBt95-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx93.c:324:34: warning: unused variable 'imx93_clk_of_match' [-Wunused-const-variable]
     324 | static const struct of_device_id imx93_clk_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/imx93_clk_of_match +324 drivers/clk/imx/clk-imx93.c

   323	
 > 324	static const struct of_device_id imx93_clk_of_match[] = {
   325		{ .compatible = "fsl,imx93-ccm" },
   326		{ /* Sentinel */ },
   327	};
   328	MODULE_DEVICE_TABLE(of, imx93_clk_of_match);
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
