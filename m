Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1B2AD21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742646720; cv=none; b=R1k09HPDlv8xO6xp3h0dMpZ+HPGP8ykMP6GtpdYiytvviY8aWxfTjiJHVWgbEkUGoCj91K37lvtQlika8CfTLVP47Dlmi8eZTF3fe0Rg3Q1C4506K/lZRK92EDGYvNb4FrZaIrelo8XOBtClZxYc/2yYLdkocqb5wovRjZTZerU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742646720; c=relaxed/simple;
	bh=zZZpCIK2PKn8COEceifu/XDzNsFFKyQ7KYiIAQzoqjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2GH4N//HIUAyTLlTUbLRwjpLvKnDgJvHK9/vHBq2tarQ8zh4aYU/LxxM/s4FdQwD+hTXyd29884oRXJ4zAvzsvJgsF+zBKvI7Jxa+XnJC0Xwx0gchRE/zKRbyfwXiwmHbpwHo//+0tOnDVUvFnV5MI0+REJDR/jEr3my+vcoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKu1vSKT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKu1vSKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742646718; x=1774182718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zZZpCIK2PKn8COEceifu/XDzNsFFKyQ7KYiIAQzoqjI=;
  b=OKu1vSKT2HcllulUyK1cTGGTlRK+4QugXoJjNmZHYfUrDfDjrqU2Kqto
   6LNwevnZfSJzq3WvxPgAS3lbI/+qCtPuOuBjTbVKOGSpJwMCiNWB0r+k+
   DOlmB4aPKlNoSfdScwVTm66d/wf76FM1nyPWZWC+Ilyinc2MyXnmmSOMb
   1m/2OA2T4E+v8nknfM8I8X7JnkSZdo+waY2u8mq82okrn39oH2QU/LNKj
   +wZ//WuTgS8KRqlANP7hGL3PXfaB7E7aCInHvLU32JSqZSZXCX0cMnfqX
   IwJCrDyY6f/bPPsUv63LoeJQTA6gy+MZYqAfr6XHSbCPzKfgFgpHYqFaK
   g==;
X-CSE-ConnectionGUID: 5uHfqJFwRtGyHgj9V1dD3Q==
X-CSE-MsgGUID: 9mb2kE+IQ5CINR1pIzAdxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="69254415"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="69254415"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 05:31:57 -0700
X-CSE-ConnectionGUID: xh76oOfGRpGDmrZeRZ0HWA==
X-CSE-MsgGUID: RaAHtRvzRVq2NVR+Y7X3Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="123437044"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Mar 2025 05:31:56 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvy13-00028t-34;
	Sat, 22 Mar 2025 12:31:53 +0000
Date: Sat, 22 Mar 2025 20:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 23/23] kismet: WARNING: unmet direct
 dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
Message-ID: <202503222032.SzlPqbZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9d36b4378df3cc927440d10047334d1fc9d4ff69
commit: 6a8fe61cbbefb4383f34fafac84ff6b6faec30a4 [23/23] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_CRYPTO_DEV_HCT-0-0 (https://download.01.org/0day-ci/archive/20250322/202503222032.SzlPqbZl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250322/202503222032.SzlPqbZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503222032.SzlPqbZl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - CRYPTO_DEV_HCT [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
