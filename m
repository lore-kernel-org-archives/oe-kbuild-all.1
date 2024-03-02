Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B2C2BB02
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709399639; cv=none; b=leZ3aYaxd+EDdBnA/DpjbNi3VhuSm+0bO/5C+VIcl5kseScl3eP5aT9qOjKr2E+CmMKQ79w7ub8nsf4jTtDzy5QIphH8fvt2dWza69oYeeG4uB35T6Fg2QG8wIb1QU7q6tIYlziX/WMGfGVwlAZ6Se0+qf0rMY9T3sjTYHLfoLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709399639; c=relaxed/simple;
	bh=IP+YHN4T/FdfgDOJfkimd88G3Q4TiUgQOpfQIUwqmqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q1a447PTfV5VYAvvLpVIq2a1met3kIWfwwLZZr4FMZ3NYyZkIdGH/v5lq6LVubRo5oS8JfK7YrXK1cqTVpE3klnwHTJs64T++TCff+hSXPGRISKfxu/mHhXVzDUVFfKPg8nsXNikQFmz4CqS+9NDOCs6oz2lziPJZA6TwLwpVv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R111J19J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R111J19J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709399637; x=1740935637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IP+YHN4T/FdfgDOJfkimd88G3Q4TiUgQOpfQIUwqmqg=;
  b=R111J19JVcfLctpyaWj2AoewKBKnP0iVDbttg3T8X6V/wagtlNPZmF/1
   Yklgj/EDYiUdjtmS6zKSLLLDfnCUJ/y6B5LxkWgLkOAi9G+HLrL2HvFpl
   z2+ysR7GZ1gugpT6vKfu0dkzCErL+sOCNf30rbwHmpDixLog2lGGnZ9vg
   m8QvV2MWrMz4hOwidgL0yjH2wQyROWlQeMuRlmBtLq1bMkXpmn4RKbeDv
   S8Dj6RQwIyzDQnrlpR23/GhCMFfhUgeQswwCkmNBL48+C0ppBCTLVnmrV
   R+QFao2pJay1/PtYN3BVs3RlGrmtij2CBq46CxmpNQj7+NVuIrvapGTCe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3820125"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="3820125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 09:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8906512"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Mar 2024 09:13:55 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgSvo-0000Ai-2O;
	Sat, 02 Mar 2024 17:13:52 +0000
Date: Sun, 3 Mar 2024 01:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 11/27938]
 drivers/iio/adc/imx8qxp_adc.c:669:12: warning: 'imx8qxp_adc_runtime_resume'
 defined but not used
Message-ID: <202403030106.GIk7tG6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haibo,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: ccbb6aa6401a61cdb5f3741b9eb66d2d0656ecdf [11/27938] iio: adc: Add imx8qxp adc driver support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403030106.GIk7tG6p-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030106.GIk7tG6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030106.GIk7tG6p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/imx8qxp_adc.c:669:12: warning: 'imx8qxp_adc_runtime_resume' defined but not used [-Wunused-function]
     669 | static int imx8qxp_adc_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/imx8qxp_adc.c:655:12: warning: 'imx8qxp_adc_runtime_suspend' defined but not used [-Wunused-function]
     655 | static int imx8qxp_adc_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx8qxp_adc_runtime_resume +669 drivers/iio/adc/imx8qxp_adc.c

   654	
 > 655	static int imx8qxp_adc_runtime_suspend(struct device *dev)
   656	{
   657		struct iio_dev *indio_dev = dev_get_drvdata(dev);
   658		struct imx8qxp_adc *adc = iio_priv(indio_dev);
   659	
   660		imx8qxp_adc_disable(adc);
   661	
   662		clk_disable_unprepare(adc->clk);
   663		clk_disable_unprepare(adc->ipg_clk);
   664		regulator_disable(adc->vref);
   665	
   666		return 0;
   667	}
   668	
 > 669	static int imx8qxp_adc_runtime_resume(struct device *dev)
   670	{
   671		struct iio_dev *indio_dev = dev_get_drvdata(dev);
   672		struct imx8qxp_adc *adc = iio_priv(indio_dev);
   673		int ret;
   674	
   675		ret = regulator_enable(adc->vref);
   676		if (ret) {
   677			dev_err(adc->dev,
   678				"Can't enable adc reference top voltage, err = %d\n",
   679				ret);
   680			return ret;
   681		}
   682	
   683		ret = clk_prepare_enable(adc->clk);
   684		if (ret) {
   685			dev_err(adc->dev,
   686				"Could not prepare or enable clock.\n");
   687			regulator_disable(adc->vref);
   688			return ret;
   689		}
   690	
   691		ret = clk_prepare_enable(adc->ipg_clk);
   692		if (ret) {
   693			dev_err(adc->dev,
   694				"Could not prepare or enable clock.\n");
   695			clk_disable_unprepare(adc->clk);
   696			regulator_disable(adc->vref);
   697			return ret;
   698		}
   699		imx8qxp_adc_reset(adc);
   700	
   701		return 0;
   702	}
   703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
