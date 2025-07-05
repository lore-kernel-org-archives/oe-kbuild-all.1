Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CB61DFFD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720639; cv=none; b=URxLWexXAxwrUhr87pUXZZVTxSiuFAw1kkZijfrXLV7US1ZiWWaxMizTmQMvj3+0xDn3KJZ4RxpWyX84sobumGrvR4Gpq1EejP5xCRezdUtlBRVHBRMqy+le+P0fxjfOimPyMAtEc3yVSaiZbgrrfQmHjOUzEn6bpE3am1JACQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720639; c=relaxed/simple;
	bh=7sWjGiM8OKddzp8XEBAdOl2jfXkDRn7ibwcREJHf9ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocPyz7PAtnJXbyCxbU4D/t5c1vyGJcbMyasQu+7DBrNvFujlJM90u5rtPrj1n94tY9JxZEeSLorZYMWCyHTE/3kSUL2bj5m9wIpruULHjtVGO3yB941eBAJxqlVLahoni7z7uuC9yDb989edgdxN6KKLud7BSm+19yuGbqn0TzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJjAhyNz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJjAhyNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751720637; x=1783256637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7sWjGiM8OKddzp8XEBAdOl2jfXkDRn7ibwcREJHf9ik=;
  b=SJjAhyNzPnxGFww17xkF83VOLWeaMgFCYH0OKkHL17VhDYcQb3pVL181
   BNSNMHM2GQvZ4FfjXmCjtUeTojvY+gytOzDxOklYPySWp3N9OYMecYYMa
   kmc3keEylC1C96KsFFtINoWNPPx5siu4cacNXniSmBmeHz6eiAbtZsTqM
   6a0FUlY5d4SW/49HUrnV4Kdy/s/g3hDf6aFJYX1+IrZU5BNNsu/yRKlVh
   8D1v1dp2XiCFmNq07TGDUrGRSAHDRL4cdrFXDbgcT7gpHupyxUYj2R+4d
   VMZAIxA0u3pYFjNR2hhQDdUCje2F5BtBX94lvPb0Mlew0W8xjC8HkTH/C
   g==;
X-CSE-ConnectionGUID: +KzpUDhyRoGI73QIPysKbg==
X-CSE-MsgGUID: WkWmNzZXTPW+XGIB64FUZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="57817340"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="57817340"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 06:03:56 -0700
X-CSE-ConnectionGUID: czToAxUeSNmajQPz782EjQ==
X-CSE-MsgGUID: 5Mg9aI5zTjmBzQ0xsy43AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="155182322"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jul 2025 06:03:55 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY2Yb-0004V3-1m;
	Sat, 05 Jul 2025 13:03:53 +0000
Date: Sat, 5 Jul 2025 21:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kismet: WARNING: unmet direct
 dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202507052018.OqPndl6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   d969457e60e9ea507680a1751a06b04ed0e952fa
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [1/1] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20250705/202507052018.OqPndl6f-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250705/202507052018.OqPndl6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507052018.OqPndl6f-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
