Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB8413AF2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768671493; cv=none; b=TtOO4f75CKpue59ESigedoFPXN2ADIg1BgIKnp6YAfaoMi7z0lf9j00sYhasG1RQ2ZpmwCSZeMzHTrNaNfWGMO+rpKQnkAsS29j2Mi9moVLvaawRMSjMUTFok1uUm9ffaDdpqZOxYGLAChYeZghiSId/7oR07lxxVO3mDW3+MoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768671493; c=relaxed/simple;
	bh=zT8HAfGszp5zvdEJp+OgHwk3VsA0kzMrQvoLPTmuOvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=foQ9ar4fsi7pxTFIp/foW36i7X/tLsyS8XGpXzBhzGBXk1ymaNw7fo8AjhdpfmodEoMX5RVTBS0fV2NfAltngVpwXV3wehPIJanrD1Xh+n4vr/HVA52W+u8bIT52JaHxr4QyQuuWDO1Y7t3OiD3zQslHJLbDXOjzl3u/MgUwRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHLPccip; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHLPccip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768671493; x=1800207493;
  h=date:from:to:cc:subject:message-id;
  bh=zT8HAfGszp5zvdEJp+OgHwk3VsA0kzMrQvoLPTmuOvo=;
  b=WHLPccipi54t0XXeH8iIPvFjmbXuXO4o3qqftgA4itu3WMAp2XD73iN/
   +51Hj/qgkUCMZxorka2sXF7sghGuMTlZuxJZFoESnjR1Vz8gn6lxL5x3q
   yvo5S58dUsLJ0+qySuL67Merq8cLjqtHqwo6MeNhh8mUpzV3rK/zQwqR1
   SsLt3VVe5MwYWiU5DchE74jmXhaVhbUCC9F4I9fRGCOecxzLJsTXVeg0C
   Tu4aKLbfiP4avGz0ZSXjB58+xlPHt6Dn9Aykp4T0K8upk2MlsckDsbnf4
   JCqofcSN19LPFYM5tDTyN+Db/KsUTUfPFBJUGHUuExgDNytG7eOx1PzDZ
   Q==;
X-CSE-ConnectionGUID: 5TlLUpwLS9+t/Q9cPdpPRQ==
X-CSE-MsgGUID: FzXKLdrHR4OLcoKI569Usw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69926961"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69926961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 09:38:12 -0800
X-CSE-ConnectionGUID: PgdbLBGwRzmJTHDWKpIcaw==
X-CSE-MsgGUID: kIpOhFLTSTWCghMMPEVIyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205403732"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2026 09:38:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhAFT-00000000M5W-2GEc;
	Sat, 17 Jan 2026 17:38:07 +0000
Date: Sun, 18 Jan 2026 01:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>,
 Petlozu Pravareshwar <petlozup@nvidia.com>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: [thierryreding:for-gvs 27/41] Warning:
 drivers/soc/tegra/pmc.c:475 struct member 'wake_work' not described in
 'tegra_pmc'
Message-ID: <202601180227.qAL8ZNgf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thierryreding/linux for-gvs
head:   5930cde6776aed263db558a17b202120e9a7ab3b
commit: dc8bfc7dedd5b4c978c5a6f8e71886622f75c20c [27/41] soc/tegra: pmc: Fix unsafe generic_handle_irq() call
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260118/202601180227.qAL8ZNgf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180227.qAL8ZNgf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180227.qAL8ZNgf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/soc/tegra/pmc.c:475 struct member 'wake_work' not described in 'tegra_pmc'
>> Warning: drivers/soc/tegra/pmc.c:475 struct member 'wake_status' not described in 'tegra_pmc'
>> Warning: drivers/soc/tegra/pmc.c:475 struct member 'wake_work' not described in 'tegra_pmc'
>> Warning: drivers/soc/tegra/pmc.c:475 struct member 'wake_status' not described in 'tegra_pmc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
