Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CD92D8372
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756576119; cv=none; b=g3cC5wRrpRmpMVgLII6iWyCkJoGlpaCcDblqGjja/34zHrcXGrUz2j/yHTC6lR+jNT3qxv0KNxWf8aKvSkC4EpOv0KnXeSJnS3cXqTqNokXPkQjUMovEzU/+Ri/oTRDXty5haPeo4U+lHRak5xg0MV8piz+v88D003FfcbR8ess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756576119; c=relaxed/simple;
	bh=JRNrQroTGPeXcBS0uFOulKFPcWa3oN/Iz/bNAJEJCSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gLyiHsIlBz4uI55tpaGngR+7BwCE6MF5PINRb9T5hNIKEAEfMHiSFZGxsNwi4J4qe7f5n1EyAR4Lbt9e6WbFNuU4djizkNzySP78AtcjZ5P/9WsgrmpzKVybZqlkgkRMrMKJE5Sj5hXqzRekWYvu+JJcujra4RFaogtwjAexiL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlLXSZ2k; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlLXSZ2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756576117; x=1788112117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JRNrQroTGPeXcBS0uFOulKFPcWa3oN/Iz/bNAJEJCSU=;
  b=SlLXSZ2k4oYWHd9QX9bJh0rQVkYF4xYALXDm1u7zOyYuKwRj9h6Nlixm
   WTE3ax3iAVr/vSef52i7luEef9dUJWsd9SjlxMDZRLA0WqjQqTDu+h30q
   QdudT90oED5W+rAzqgVFN/9O+22EL9warMAn8wDWq/F2Up+5NTg/SNObc
   9eDrSlWrjceoNrzBJa8gYJvvUYJH8sfHKpJ4L78MSzcmhjV8lldYg5Guu
   kiF6zH/u6AZZLG9p4L7nUCBlM5a3fkhI1jTnYy/xhxsWnCub0aG6gZNOv
   Jk9INNzfx1QHYB1ZbxedWH4gUxcHhh1J6rZf6TcLeH15hS1SH6lxrWoUL
   w==;
X-CSE-ConnectionGUID: ah5UDUW2TBS2ohlCe2SKVQ==
X-CSE-MsgGUID: UuX4ScIhSbOcH6jmedIv+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70201465"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="70201465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 10:48:36 -0700
X-CSE-ConnectionGUID: RoteFy5TStO3aOIo8dEU1A==
X-CSE-MsgGUID: Euka2un/SUyz/LBOVRJW1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170188485"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Aug 2025 10:48:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usPga-000Vav-2d;
	Sat, 30 Aug 2025 17:48:24 +0000
Date: Sun, 31 Aug 2025 01:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 19/19] kismet: WARNING: unmet direct
 dependencies detected for LEDS_GPIO when selected by MERAKI_MX100
Message-ID: <202508310128.HuwtcBky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 0e21f1dbce44bad4bb05c2541344ff3fb9643230 [19/19] arm64: dts: qcom: x1e80100-t14s: add EC
config: i386-kismet-CONFIG_LEDS_GPIO-CONFIG_MERAKI_MX100-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310128.HuwtcBky-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310128.HuwtcBky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310128.HuwtcBky-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_GPIO when selected by MERAKI_MX100
   WARNING: unmet direct dependencies detected for SND_CTL_LED
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_GPIO
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
     Selected by [y]:
     - MERAKI_MX100 [=y] && X86_PLATFORM_DEVICES [=y] && GPIOLIB [=y] && GPIO_ICH [=y] && LEDS_CLASS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
