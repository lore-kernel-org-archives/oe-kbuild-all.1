Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613621ABB6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358658; cv=none; b=LOyT1UnwMSo01v6PyTW3ZAtOoDqG0Bs5n9VCPzLrzQfuMxHYycywZDr0A0dfrlWrWb1XYqbAz+J9QxBzjDB6NvZo8pbEBDDJmxTZ6Y4oJD0J0/Ij/UgoDmwAxXb/rN9whnJEqOEY3Qn+KQYkw1oQ3HhET5/0W0eAK8PbbSOX8Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358658; c=relaxed/simple;
	bh=RwOW8NN4ywCbJV1/Rv4x3XGAxp9hZMLMB3T0Jl0cOWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wtg+IYeqUONODeY5CWCjKX0IJKpWDY+Go8QOmIzBO4LbV3um/xoluB6IF3bDwDxyWngG8eGok62m1uGQY9pHNOG9BoapTvVQuPtomLCnnbOzGbL3hKx2qRbIYubIKPdLE4opKaXdTqonqvXOL8mYmR/MnglquPxOs+pRt0O3rAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hL4TkMcb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hL4TkMcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741358656; x=1772894656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RwOW8NN4ywCbJV1/Rv4x3XGAxp9hZMLMB3T0Jl0cOWk=;
  b=hL4TkMcbEqAG/lJKA00Rkhg2Zom+Ym+At53SCj4EzlqcKiaOEPbrdFgR
   OBO0EyXJSsi15rJK950gXLiLhctOsVckROLYqwc3cKIGT2XjzJO0XPT0A
   zJbZIyD0uhciuH3EVBQlqzBJHXQpaxyMo3pSn9+SxCMHJSk2nCuydKo5C
   FgSHw/BOpUzGZwVgwZfO12YUItAz0WmxyKoJOEeQclaXhFcngZGrPO7Zb
   WMYJlCTo5fcWLdChwq/fPLHFpqjVisnoryatKXnF4w1YaAjobCjxvt+fy
   4rglBLILORBiVWTHZ2s69XIFbbfQxa52OoRqyQWf7cDDtcVid0LQ/5VSm
   A==;
X-CSE-ConnectionGUID: W7MAD0OjSeKTuGxlymb2FQ==
X-CSE-MsgGUID: 7GeJg1gRQZ6LsLOq9IVLoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53796815"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53796815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 06:44:15 -0800
X-CSE-ConnectionGUID: p722PUpHRMugUQJhaPNw9A==
X-CSE-MsgGUID: 12FpoZ40QGWEhYWg+ju1mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="150131967"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2025 06:44:14 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqYvh-0000aR-2W;
	Fri, 07 Mar 2025 14:44:05 +0000
Date: Fri, 7 Mar 2025 22:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1]
 drivers/usb/dwc3/dwc3-thead.c:336:32: warning: 'dwc3_thead_dev_pm_ops'
 defined but not used
Message-ID: <202503072255.7bzuRoJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xiangyi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   797aae63f086cf8250bfbb8395ab310c525ac4a6
commit: c67048152e2db8217719886ae4a726bf879b4bf5 [0/1] anolis: riscv: usb: build dwc3 driver as module
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250307/202503072255.7bzuRoJW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072255.7bzuRoJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072255.7bzuRoJW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-thead.c:336:32: warning: 'dwc3_thead_dev_pm_ops' defined but not used [-Wunused-const-variable=]
     336 | static const struct dev_pm_ops dwc3_thead_dev_pm_ops = {
         |                                ^~~~~~~~~~~~~~~~~~~~~


vim +/dwc3_thead_dev_pm_ops +336 drivers/usb/dwc3/dwc3-thead.c

   335	
 > 336	static const struct dev_pm_ops dwc3_thead_dev_pm_ops = {
   337		SET_SYSTEM_SLEEP_PM_OPS(dwc3_thead_pm_suspend, dwc3_thead_pm_resume)
   338		SET_RUNTIME_PM_OPS(dwc3_thead_runtime_suspend, dwc3_thead_runtime_resume,
   339				   NULL)
   340	};
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
