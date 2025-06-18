Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26B129B221
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245706; cv=none; b=p0I1AiiJ3Rglfd36POad1es9sbOfsatnBfqZFLssA5YmvVtADI0aZWNd82D7LYMukWw6VmMxWmTDp8pFy9iejRk1xobWVjJxrI+gqJHGzVdFsrFI6y8XuCJT1FLNvWMOMdm40vbHRJWIO//15IdSV4FEytXDhWaPFLPC0ptXLOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245706; c=relaxed/simple;
	bh=Nc331Pv/IxZnv4dUsd3MXAGQYJGWIEv6JlzAg/kxjJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvfPJxr+fGrNxiSnIQNXGVWqX44OMN5PliIxUcyrnMl+vVhl0Dt3n4YZgVHezSoP3qaszktmCsQxukXCh68AHNED6tppX+IxMDbL+JynxMoNV4LyU+2U6S/5ZqmBHQHhDWolwWYPGVOC5o9zHfQJ119J/19pH/bnheL1DWwxb1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROaiAcD9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROaiAcD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750245705; x=1781781705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nc331Pv/IxZnv4dUsd3MXAGQYJGWIEv6JlzAg/kxjJ8=;
  b=ROaiAcD9Jymbj5mFFSt3nuZr3u+M+ITGc8kOY4bjz3gGF4qO5Ps4jjum
   azoRvCNzFmy9PSmlMB8nNVg5rjnaIYjlRvur9OLSxQLIdZ1HFOnYzhmnN
   jGDjrkzqv7WsY1sz8Q/vDRInQ2nh7/rf7zQSjrZXvz0Xd/VDZi3pYyIaX
   GNxw3eNNjgGaI5Gm+i0tIGVriPAjZyBv9gYk/YjYCV/IF12xcIHbojnyW
   JfcNiJSjpxyS9dmgTWTWJGittyRrPxM2uvDrufvGkiQHTQS/KRoIDlnns
   OgeAQJqZrK8Qk+pWVXrXHG/Sn2qqIvu5/dX/s3YUv6MlVSJYZdq4dVUSq
   A==;
X-CSE-ConnectionGUID: 20k5YXErTVykUZbvnhRZGg==
X-CSE-MsgGUID: PU5O62g2TAOobsssxMZ6yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51566870"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="51566870"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 04:20:36 -0700
X-CSE-ConnectionGUID: QdR+yZYBSUGwIiQwCxpzpQ==
X-CSE-MsgGUID: Cu9Tquq8RQSfNjccWPVwmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149871567"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jun 2025 04:20:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRqqH-000Jhw-0U;
	Wed, 18 Jun 2025 11:20:33 +0000
Date: Wed, 18 Jun 2025 19:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2411/2411] drivers/irqchip/irq-gic-v3.c:1541:6:
 warning: no previous prototype for function 'gic_get_ipiv_status'
Message-ID: <202506181950.B2Y9buyH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 4c1b2c9b61b21a0183f345eb7076db7ac054ae6c [2411/2411] KVM: arm64: check if IPIV is enabled in BIOS
config: arm64-randconfig-004-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181950.B2Y9buyH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181950.B2Y9buyH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181950.B2Y9buyH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3.c:1524:6: warning: no previous prototype for function 'gic_dist_enable_ipiv' [-Wmissing-prototypes]
   void gic_dist_enable_ipiv(void)
        ^
   drivers/irqchip/irq-gic-v3.c:1524:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void gic_dist_enable_ipiv(void)
   ^
   static 
>> drivers/irqchip/irq-gic-v3.c:1541:6: warning: no previous prototype for function 'gic_get_ipiv_status' [-Wmissing-prototypes]
   bool gic_get_ipiv_status(void)
        ^
   drivers/irqchip/irq-gic-v3.c:1541:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gic_get_ipiv_status(void)
   ^
   static 
   2 warnings generated.


vim +/gic_get_ipiv_status +1541 drivers/irqchip/irq-gic-v3.c

  1540	
> 1541	bool gic_get_ipiv_status(void)
  1542	{
  1543		u32 val;
  1544	
  1545		val = readl_relaxed(gic_data.dist_base + GICD_MISC_CTRL);
  1546		if (val & GICD_MISC_CTRL_CFG_IPIV_EN)
  1547			return true;
  1548	
  1549		return false;
  1550	}
  1551	EXPORT_SYMBOL(gic_get_ipiv_status);
  1552	#endif /* CONFIG_ARM64_HISI_IPIV */
  1553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
