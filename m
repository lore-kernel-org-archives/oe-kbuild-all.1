Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E90930100
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742373919; cv=none; b=K8IDAUquKSjYxdXHdWCmO2bSXovu0Jb4/wIed7p4AXxR4njcKp+v6BremSgV+/w5Tn50udnzvRDgcw6DfTAFvJUoFdftTkD+Yo38ax+/O2s61vf3iFzEdyHe/3a/w5NV8j6O1XldHwuTeDHhuH6ZpNti3DCLIHiITgSn3JgZqLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742373919; c=relaxed/simple;
	bh=K9OuLUeAUrx1LX1bTiAjhd193U42Mp+wR7ePsD7mZBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDBZfluqmbXK8u2J052Wp2hxeyrGQ9U0Is6tpZIr05YNe9R9FQUh6mAJPAJIhtqg2b9ByNdNqKsXLOR26pcXx8DxEv21BwcK0D72WzwTuG/syEZ81NkQTV1FdOzH7nBSlIfYbZJVla9InyxLisNB099B3fiyWhofV4GsLnmm5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVVBTSN7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVVBTSN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742373917; x=1773909917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9OuLUeAUrx1LX1bTiAjhd193U42Mp+wR7ePsD7mZBQ=;
  b=kVVBTSN7BcXN65jqgqBM9tMja71h8KT7e0o4FFLKWxe6/YZpvxGJ5DK4
   vFnhj/INdXz19km7BVie9e6tRXnvFMVoViYZ8jNaiOsz3qOrTM2STS3jr
   w+2l8jHCXWcOUPv4bmf07MlOx+W5iU0bkbPx2lO33puMbC5dx+ezrlU9D
   Nj2j5EGWPRNgYKNkZxmmerZWSiMi/p5E85ldrBHO81BUxDVQZwfZZtbQY
   u4mDgOKS5EgoZ5seUaS+VJmDDWlWjPNCVwIKSO/oceF3V+j9iAKYu6oGf
   g/iWP9eAV9YA0hXeASwoo9t1vr3B/zK1b/vNRH6+NYJFKKUW/zhwfdUdZ
   Q==;
X-CSE-ConnectionGUID: W2gGl2xpRkKPkWdKvPvQXg==
X-CSE-MsgGUID: LWjp1wK3RSieoazwV3tM5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54220990"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="54220990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 01:45:15 -0700
X-CSE-ConnectionGUID: y12nQOjaSEus+K4bkYyZ1Q==
X-CSE-MsgGUID: i2xEYJB6SDeiDCidLBdWlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122355252"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2025 01:45:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tup32-000EWE-1F;
	Wed, 19 Mar 2025 08:45:12 +0000
Date: Wed, 19 Mar 2025 16:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/plat2faux_dev 4/9] ERROR: modpost:
 "smccc_trng_available" [drivers/char/hw_random/arm_smccc_trng.ko] undefined!
Message-ID: <202503191614.oY5dpX5K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/plat2faux_dev
head:   14159d6574e30c1adeaa3460bd0abfae968987b2
commit: 870bdacafb24f3de9a81a35fc434862313f99ec8 [4/9] hwrng: arm-smccc-trng - transition to the faux device interface
config: arm64-randconfig-004-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191614.oY5dpX5K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191614.oY5dpX5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191614.oY5dpX5K-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "smccc_trng_available" [drivers/char/hw_random/arm_smccc_trng.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
