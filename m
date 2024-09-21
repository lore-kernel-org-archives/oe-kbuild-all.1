Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5829156F34
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726918135; cv=none; b=jxvQcmZdxCiT83zTROtYqfTrVMb6wjp8IouxnaqhtqjOrgzAXur8X8R5SCEBQ9GWdZ3kQJvVopVRK9VFxs23YRZMDWmKL/RPoyb/kBvr+Iy4yMnZ8Zft51qjzZ1cJdiaSLX4spjEnOZKW8oOi++cvVoPgrUgVDQvBOHalu3HA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726918135; c=relaxed/simple;
	bh=2xh9kLkDLd8CoPfcmdOtpvH1gUzWbnwLm49azLPO4uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6F2r91rYb07qltMtpfYoYFz/mRN63sGIbZJSYk3nU0hK9JazgihBEi6AxJ+x/Lfqip6Hjzl9VvWEWkaVSJITEDzCeKnQvURxXTDtxXm5p7pSeKsoi5RDGT4X9w8ZLo7575EvcdlMJUP6PFA2w0U5lgi0CzOagJKdgMFXnvJsqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyCiwDyK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyCiwDyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726918130; x=1758454130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xh9kLkDLd8CoPfcmdOtpvH1gUzWbnwLm49azLPO4uQ=;
  b=gyCiwDyKXh+0OZwqjWy+Ind31fyAvL8g9VohcldWGCciEaFx4QeGiPtC
   XwV27pwkRxkwIjbbwzZoag5SN98od3ksPRK/hIJBN11ulz23z3iotuAzG
   QjMQUCeBY5hVdVMRh7zO//n0Y/Oqz/mpHhWv+sH6nhcdIPrhe0beB70vl
   Gm74VWvAOaNZ2HAeuiPXWZHePG38cFh6pEGHLYfECdueIN1Zrg0fNKJLX
   55NedJpZ38ulANbMUOk0n8+c73RLehMI7LbWY56JIoGdn7JDthtMT1lBg
   0yU92zcgdQCUgTsJG6Y19rsxlLgzRL09/b1pye76W+QabCMyxlWWOY5WT
   w==;
X-CSE-ConnectionGUID: +VSY1e1XTNaRS/y31fEwHg==
X-CSE-MsgGUID: ybB3Jdo8THilIQ1mYz8Q7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26015667"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="26015667"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 04:28:47 -0700
X-CSE-ConnectionGUID: tNtGwcE7R1SxOribvq/XyQ==
X-CSE-MsgGUID: /4TjBhbSSs+T/HGBiWHIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70456262"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Sep 2024 04:28:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sryI7-000FOH-06;
	Sat, 21 Sep 2024 11:28:43 +0000
Date: Sat, 21 Sep 2024 19:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7438/23724] drivers/net/phy/ax88796b.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202409211917.FUngwi3h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3bbb0f885bf0f93bee0bb99c623877588ae005ee
commit: 56e625aa545a24e8d3fa44b5fbcdedd88e443dcc [7438/23724] net: phy: rename Asix Electronics PHY driver
config: x86_64-buildonly-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240921/202409211917.FUngwi3h-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211917.FUngwi3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211917.FUngwi3h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/ax88796b.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
