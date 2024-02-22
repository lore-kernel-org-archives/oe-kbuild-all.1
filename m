Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2D6199C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708589698; cv=none; b=sp3thamiiWP9kcoLcgiovoD/hJLDOcITkLDDDlYatCvVckglxTajJEafXUY4ABsaqF2Zx0wfOh30u5agt4ACqVbTgYb78ozYTITrPm2L63vr72wtQfoaI5GGWkGVfyFZOmHtfFHWlFPdqkcDrXPwpoBANZqij8fzCb5VavEwZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708589698; c=relaxed/simple;
	bh=p7lKEvEKp0ZVEACtiuJiZkkhxNxkLYADygBm8bYdi4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CHS7XUAw1ujXGJWZdui75hfQjDH9WcBSPo+Vs6DNzUbD9QNhhH/e1BHD2cVMpa/CbIVehNmcsuzzioJ3ZFIvTIYiGDIAkKBWz1hMKi0iSOaf/hGQp7R63TVPMybLI4gO4eaaJR45mX9eUASAAqe9UoKhC4mxIdKAg5zhn6TxXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAdxpyUb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAdxpyUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708589696; x=1740125696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p7lKEvEKp0ZVEACtiuJiZkkhxNxkLYADygBm8bYdi4g=;
  b=lAdxpyUbaucY2TSSrw57K8k9IUt23EKK3Ct3GQJahh9R1b/MuV03RHig
   +NDdGqwFY3gC8qCKqW2gE1Jxcmcvhdh/9Cn8G8d9+428rbXwPUmsLmY9Z
   xGJK31yrkbncUcS2Td1GE+QWcLBfruF8RkbkpuOfrA4Rw/R0DIahtAgK3
   4pHW4uJ87QvAm+WTLsl2OFGwnVSDqcMg8S2XJ8LTXB8HAikewHgiAPvzM
   l2a35gcb5wsHizvb2iYZls2pp0q7OSqDicgzHHls+q1z5uaW4g60flHHM
   SjUxrxvsYVwpdzSKiErMiDF4nf3YMXhr3nF54h3wAeM791qe6HN1hdyJU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13496474"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13496474"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 00:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="36435151"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Feb 2024 00:14:54 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd4EF-00066t-2v;
	Thu, 22 Feb 2024 08:14:51 +0000
Date: Thu, 22 Feb 2024 16:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20240209_theo_lebrun_spi_cadence_qspi_fix_runtime_pm_and_system_wide_suspend
 22/22] drivers/spi/spi-cadence-quadspi.c:1959:12: warning: 'cqspi_resume'
 defined but not used
Message-ID: <202402221505.712Q7MSU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20240209_theo_lebrun_spi_cadence_qspi_fix_runtime_pm_and_system_wide_suspend
head:   e3fe8a31f21eda14322be3d4a16c9f3293ffd6ad
commit: e3fe8a31f21eda14322be3d4a16c9f3293ffd6ad [22/22] spi: cadence-qspi: add system-wide suspend and resume callbacks
config: arc-randconfig-002-20240222 (https://download.01.org/0day-ci/archive/20240222/202402221505.712Q7MSU-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221505.712Q7MSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221505.712Q7MSU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-cadence-quadspi.c:1959:12: warning: 'cqspi_resume' defined but not used [-Wunused-function]
    1959 | static int cqspi_resume(struct device *dev)
         |            ^~~~~~~~~~~~
>> drivers/spi/spi-cadence-quadspi.c:1952:12: warning: 'cqspi_suspend' defined but not used [-Wunused-function]
    1952 | static int cqspi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~


vim +/cqspi_resume +1959 drivers/spi/spi-cadence-quadspi.c

  1951	
> 1952	static int cqspi_suspend(struct device *dev)
  1953	{
  1954		struct cqspi_st *cqspi = dev_get_drvdata(dev);
  1955	
  1956		return spi_controller_suspend(cqspi->host);
  1957	}
  1958	
> 1959	static int cqspi_resume(struct device *dev)
  1960	{
  1961		struct cqspi_st *cqspi = dev_get_drvdata(dev);
  1962	
  1963		return spi_controller_resume(cqspi->host);
  1964	}
  1965	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
