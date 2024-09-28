Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77331865E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727528418; cv=none; b=POYHwRaw5Oq5mEHLw5K92CRL3eMuUO+yWKSyofBPEJq+7y2NamF2O+z6TcqpS/67qRMwzNI5+M6SB1KjUlmIWYzf1bbx4gDYDGobTM8OjnyTZ8gRI+NvNwawq3IDOmRjZTjGDno2g6tCO1gxvYpRfr50zgRUC1Cz1bu2i46VtJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727528418; c=relaxed/simple;
	bh=78bCcT/Egf23i7MatALM4YqWN97jm0eBwdPBpLzwt60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qCkoqR9ElJwuvU7uq1Ll8BCdQthYjL7G2QguBzFRoZkTwAWSnxo7/4XSbj9bd2z9DAGSwrKlHlAymU4Ad9vUORmfukdbEc5Egvm99+S66Z/fADDZSoiKJSXsEonTAc8WKWLx75A/EkccpwmQSaeF18Ghr3XF8Lj+vY3gVC0t/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1rVJODY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1rVJODY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727528417; x=1759064417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=78bCcT/Egf23i7MatALM4YqWN97jm0eBwdPBpLzwt60=;
  b=M1rVJODYg8o1550e+0P35DOEuQ7Aq4R/gLfXt1FyYRS/pDU6z/IId53f
   CZYYIhYQ1eCnwb1FJCNUkRuZQ5DLfooX0n37JHR+GNBKhtXAt+tpq/GZn
   hoCLn0GgsVFoP9BT34j/MOMLlVAobolzApvV7rzSFM0uwuLg4dopOsGOB
   tQQX7alVQJm1h+GeYitSpHyW5FD3Ls7MZMbhiUmOLUUqgnGIWET2Tg4/N
   CCTOIyQA8R98g1Sf1takVoPGgnYa3Uw2hIldx+/i3A6ANk3v2Bax7gMzI
   UPbnGZwMPD+GzBS0/Z3e2lmWyhpUuVpNjH6WstLrCCQ+1s4Sxake7ej+Q
   g==;
X-CSE-ConnectionGUID: Y98x8cgrTNGl9fJ9YJ+Xrg==
X-CSE-MsgGUID: v14vSatVQSmsKgx1zwpTqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="44130754"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44130754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 06:00:16 -0700
X-CSE-ConnectionGUID: DjVvsM8PTVWMJPtQtxl/jg==
X-CSE-MsgGUID: xovYGDy3RtGM7Cc3t0ueqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73127839"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 06:00:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suX3V-000NH9-0R;
	Sat, 28 Sep 2024 13:00:13 +0000
Date: Sat, 28 Sep 2024 20:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 591/16788]
 drivers/clk/imx/clk-imx8mp-audiomix.c:361:12: warning:
 'imx_blk_ctrl_runtime_resume' defined but not used
Message-ID: <202409282008.jvarwmmK-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: e29d7b605da801c22d1690ec319b2a61f3e8c364 [591/16788] LF-10009-7 clk: imx: clk-audiomix: enable runtime pm
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282008.jvarwmmK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282008.jvarwmmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282008.jvarwmmK-lkp@intel.com/

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
