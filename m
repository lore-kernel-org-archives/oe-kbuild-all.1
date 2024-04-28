Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F52D627
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 11:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714303294; cv=none; b=Z4Yq5VcvizlfZ3jUARYOh3hK7Jul7mOt208DuRsDHte7m6vHnv9MdU8bXCxa6tsmBXkITtTJ7GTVUPqAJp6eVTl1m2e3JBvZm+jQ+U66SwhTxnGIOFDIE+rQBTH0qej5BJopyfd4xFc8UeW3yjraaRtJT5uWTeaIT+qcr+o7qc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714303294; c=relaxed/simple;
	bh=ubo7R7oWVlmqjRT/AG1O1hGFAqjGyHfURyZGUi+6TBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkDYf7Ko9MaCpfuIW2fw9M0CYgYRWFg4iG6r4Ar7SAM5pbpfGng751FjCl/X6Y/Nu0KcTtE1X+q5/EYfxs3Fl0OOhgw08CpStWPVqddRj2rO7mP31xmsRfHbfuoTiPQr67vT9EkUqtvE1y7OX/r9PeOXRge6K3oWBsIMoVuNc38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2ggToW8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2ggToW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714303292; x=1745839292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubo7R7oWVlmqjRT/AG1O1hGFAqjGyHfURyZGUi+6TBQ=;
  b=Z2ggToW8AXcRcG2ZW1jC2Hbr4njVRFoHT17x6RmD4Aht59+1H21Vbi3x
   6oLQeCGYyTZzitfu+JoaES1YcMGg20pb9vzPGZN6Id9JGPyZCXYymHslc
   wAI4pOxbLz5fJkrfVBUzlb8q9ZjNbxYwC7R11hJGt0qF7Xgimxta1ld05
   +hNZJ9598OTH4Rct7RL9KYHjzZrzfRvFEJ8o2PndMFgSMJomhgD81andf
   P6LHVlDfjqrrnZw1guPdWkmg6l7lzYOjfhJN0rC4hxcx7/Qnqbqp3JZmj
   bb43b50rvYkEJEZmnTXZ3wqESgpu/e3JRbxzh+GgifCjM8CNWN7GyXpPT
   w==;
X-CSE-ConnectionGUID: bs48C2MXQeCtGlfrOh827Q==
X-CSE-MsgGUID: k5T+s88zQMiJ2uVIUuVhlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="12917576"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="12917576"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 04:21:31 -0700
X-CSE-ConnectionGUID: 4yi8AfmGQcO6Qhmy38s6oQ==
X-CSE-MsgGUID: OlVBxW4QT1i7Ma1yTYSdog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25953399"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2024 04:21:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s12b2-0006Kc-2L;
	Sun, 28 Apr 2024 11:21:28 +0000
Date: Sun, 28 Apr 2024 19:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 591/11728]
 drivers/clk/imx/clk-imx8mp-audiomix.c:361:12: warning:
 'imx_blk_ctrl_runtime_resume' defined but not used
Message-ID: <202404281904.9P2KmMKu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: e29d7b605da801c22d1690ec319b2a61f3e8c364 [591/11728] LF-10009-7 clk: imx: clk-audiomix: enable runtime pm
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404281904.9P2KmMKu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281904.9P2KmMKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281904.9P2KmMKu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx8mp-audiomix.c:361:12: warning: 'imx_blk_ctrl_runtime_resume' defined but not used [-Wunused-function]
     361 | static int imx_blk_ctrl_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/imx/clk-imx8mp-audiomix.c:354:12: warning: 'imx_blk_ctrl_runtime_suspend' defined but not used [-Wunused-function]
     354 | static int imx_blk_ctrl_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx_blk_ctrl_runtime_resume +361 drivers/clk/imx/clk-imx8mp-audiomix.c

   353	
 > 354	static int imx_blk_ctrl_runtime_suspend(struct device *dev)
   355	{
   356		imx_blk_ctrl_read_write(dev, false);
   357	
   358		return 0;
   359	}
   360	
 > 361	static int imx_blk_ctrl_runtime_resume(struct device *dev)
   362	{
   363		imx_blk_ctrl_read_write(dev, true);
   364	
   365		return 0;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
