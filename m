Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55AC218EA1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739794175; cv=none; b=n+oWU0MN39kyBYP6+4quXClSDoQBTfzbwyOLFL8gxGqnMeKjKYayJ1t78AbrmWRtqX866IjnrSnupKInxlyWOtS775ryU4wecAM0pf3SlpemIUbm2LKBBXjqOpqHloJ5MkJsI65k8QD52hhDIQIhgptUlksVx2q/t+PxLGzkvHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739794175; c=relaxed/simple;
	bh=nZ78pVUDpBXP/hy6+Uy03OenHewfugAV6luDAVh6rFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XWmRCEedMdTS5216oJ/Z6TRvwpBxW7GgU5Az2G514molpevBOOnNxJxK3WWYkXtgYLdYCV4tL/aOHLV4k55Ci/cVfUTtaZTMfneys3xWaPYJzicjgUSBqIOURb4zxua7wCFBs7Ixag3q1h/d4kCCYeUCRV14cBvZHpBxnVi9/EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaCE2y6n; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaCE2y6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739794174; x=1771330174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZ78pVUDpBXP/hy6+Uy03OenHewfugAV6luDAVh6rFw=;
  b=DaCE2y6n/ff4TvIE9mnY09x/3+IjtzipnpJj81TC3slkOwBSzy/Eco5m
   ddTk33r240oideXXzyVfqDJg837k4EcEFBVqFfVi5deM8cu1xIgQh1iu1
   YFKd9qUpdTo1T04PSIAgLoQ1fkA4xr9qB4JrDX0KPhnfsDs0fHTxNvrQc
   IJeV5o6fK4keCUlBZeJ28aQaR1XdMkZnyUGtcvkpamR/KCh7Sco1B6hlC
   yvoBs5kSeUVV5tVFXmsE/COvasI319Nap7Z7lBg6Wxz0wRX+2wPEaTEVK
   L/SqTA3zyj8YTKgaEdg58oYddurYF4ywiQZXzWQ3XbUEMlOarqgAyuxbg
   g==;
X-CSE-ConnectionGUID: IejN5vYHSxunMD/+bmqcfg==
X-CSE-MsgGUID: iMgmX5MyQ6+qg57FoOL1Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51881989"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="51881989"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 04:09:32 -0800
X-CSE-ConnectionGUID: uCfri3wlT3K2EugxRpcJaw==
X-CSE-MsgGUID: +FMzoTNaQn6h8FBzISRsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119321924"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Feb 2025 04:09:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjzwG-001D4t-0z;
	Mon, 17 Feb 2025 12:09:28 +0000
Date: Mon, 17 Feb 2025 20:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: kumarama-i <aman.kumar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>,
	"Tan, Raymond" <raymond.tan@intel.com>
Subject: [intel-lts:pr/56 1/1] drivers/tty/serial/8250/8250_lpss.c:473:13:
 warning: variable 'cgsr_reg' set but not used
Message-ID: <202502172027.uehX4m7S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi kumarama-i,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: 81b1fda7fa3592721f7b810b818b89a6e13daac5 [1/1] Serial: 8250_lpss: Temporary enable D0i3 flow
config: arm-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172027.uehX4m7S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172027.uehX4m7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172027.uehX4m7S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_lpss.c: In function 'lpss8250_runtime_suspend':
>> drivers/tty/serial/8250/8250_lpss.c:473:13: warning: variable 'cgsr_reg' set but not used [-Wunused-but-set-variable]
     473 |         u32 cgsr_reg;
         |             ^~~~~~~~


vim +/cgsr_reg +473 drivers/tty/serial/8250/8250_lpss.c

   467	
   468	#ifdef CONFIG_PM
   469	static int lpss8250_runtime_suspend(struct device *dev)
   470	{
   471		struct lpss8250 *lpss = dev_get_drvdata(dev);
   472		u32 d0i3c_reg;
 > 473		u32 cgsr_reg;
   474		unsigned long j0, j1, delay;
   475	
   476		delay = msecs_to_jiffies(100);
   477		j0 = jiffies;
   478		j1 = j0 + delay;
   479	
   480		cgsr_reg = lpss8250_readl(lpss->base, LPSS8250_CGSR);
   481		lpss8250_writel(lpss->base, LPSS8250_CGSR, LPSS8250_CGSR_CG);
   482	
   483		d0i3c_reg = lpss8250_readl(lpss->base, LPSS8250_D0I3C);
   484	
   485		if (d0i3c_reg & LPSS8250_D0I3_CIP) {
   486			dev_info(dev, "%s d0i3c CIP detected", __func__);
   487		} else {
   488			lpss8250_writel(lpss->base, LPSS8250_D0I3C, LPSS8250_D0I3_EN);
   489			d0i3c_reg = lpss8250_readl(lpss->base, LPSS8250_D0I3C);
   490		}
   491	
   492		while (time_before(jiffies, j1)) {
   493			d0i3c_reg = lpss8250_readl(lpss->base, LPSS8250_D0I3C);
   494			if (!(d0i3c_reg & LPSS8250_D0I3_CIP)) {
   495				break;
   496			}
   497		}
   498	
   499		if (d0i3c_reg & LPSS8250_D0I3_CIP) {
   500			dev_info(dev, "%s: timeout waiting CIP to be cleared", __func__);
   501		}
   502	
   503		return 0;
   504	}
   505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
