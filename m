Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446A42E3715
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 04:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752640883; cv=none; b=mQcAPghYRFIwZBtmDq5YhRJuv7aEJQG6LCmXrcHCk/FZXnJW3maOCpIUgPEzOF9QKdp9zvVc2WvFP90lhJkZjXgFgnghIeJH2pf/2X90EyfvNb5hFioMm0BR23eB6KuaSZm72P3uQ5gu/5ICB8CCF7qwwVPMuRt5C42QJLoxiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752640883; c=relaxed/simple;
	bh=c4/BZ7HBe1vNifFmTVz1FQd8pMVcmUJZIMceojU7uWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U26/VGQRD5wAcqk3qBiZaFwCZNU2GAbse+A8yTUwlJHqAYzAXP0n8ib2puBSflWLT4Suu18ZH0FqxIAQ8nS5A+5GBZ/XgANM/OuFjI7YSuznw7KWxL5jny9ifKGtxH1HSRnKyYZDihD0KpD9zK4fJwU+Ku7/L7jT7MB5SnK7ssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjOKb3Th; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjOKb3Th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752640881; x=1784176881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4/BZ7HBe1vNifFmTVz1FQd8pMVcmUJZIMceojU7uWI=;
  b=EjOKb3ThA/AnEUaKor2PBOXfvNXojZFYbP1BCI+UigHJNqt4JMmc7FbP
   cx2Q6zcV28ViB/EiQz2HkCFmArTHs5UbiQ50SPzN/quNFnqw2Wkq3SWlM
   l0Nc/8P7XgE2HD8cuilPlLqRaAoxJPnDP8LmSnEeM0XkHEdCXc2DUTJIA
   bxiZ7eaG1pDA2iuC/B+3BzN9/eGf6hdhLR4I/JOIplJYRkmEYTHpLQ/mp
   BA+p2kGMuTt4jmXXB5Ww/xhGBejeydWLlaDlh/5xVtHuuRvpQcvxaKh/1
   W0jXe+2fRUYl59jjrPGw0919IJNStdqdTp02EeD2/7JC2BjB61xDnEPmZ
   w==;
X-CSE-ConnectionGUID: JV0GJQ2zQtGO88TloLqfrQ==
X-CSE-MsgGUID: GNNIlogTTkOGoNSSDPQYNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65939260"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="65939260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 21:41:21 -0700
X-CSE-ConnectionGUID: Y3gJvl19RKaT4thNbVTvMw==
X-CSE-MsgGUID: 1BPvWuMRTEmOs6uFxS/wLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="161942539"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2025 21:41:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubtxF-000BtH-2W;
	Wed, 16 Jul 2025 04:41:17 +0000
Date: Wed, 16 Jul 2025 12:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:thinkpad-t14s-oled-6.16-rc6 53/58] qcom_battmgr.c:undefined
 reference to `__aeabi_uldivmod'
Message-ID: <202507161209.qlWAl0nW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux thinkpad-t14s-oled-6.16-rc6
head:   433e4bec8b77d1fb190ad35b5f898d88885eeeab
commit: c650ea2ac5a72bbd92e49a78c0519909cbb75ce5 [53/58] power: supply: qcom_battmgr: Report battery capacity
config: arm-randconfig-002-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161209.qlWAl0nW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161209.qlWAl0nW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161209.qlWAl0nW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/power/supply/qcom_battmgr.o: in function `qcom_battmgr_sc8280xp_callback':
>> qcom_battmgr.c:(.text+0x184): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
