Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551D3199934
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740235555; cv=none; b=jTKVJeIsyHlVH+WzzlCf6TVnybI2pbaZZ6+s5vpBOL30Ymh5YWs50W8NCKHCKer0V8eET4UA6T5En7HcP7J0DdLrbR600ry/iNlgFic1rhSJpM//bFcEh+kPisbz929A4PA6VltkMi9Ed0y2XoKZJ+1pf3Jhh6Jvd/mH8h6MMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740235555; c=relaxed/simple;
	bh=ISUrEULW1ySYWgzZoGtHREQxXuoFStgLJB/GTg5DhAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7d/XREnfkLLkYAmcsHbs8EIZJYIqtEK5bz2gkdKpw7WjvgK8PvmnyaKE2uF6kMrD+vrvLrNmtgVtOAqLSL5svJhQ6myZyeRyLGTcqx34uAcH1Wk2vwcffSTIhKXO8og9UKeWCkFxF96ZJO7IfiA4qxqgGjfXg2ry4iMLVzyQ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7gqGrCd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7gqGrCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740235555; x=1771771555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ISUrEULW1ySYWgzZoGtHREQxXuoFStgLJB/GTg5DhAQ=;
  b=W7gqGrCdsKKpumnu93r3PLANXXpZkQdaz4O56y7DyvLea+ugRH5cNd9J
   7aViReyzDnJsDCnz42j/E9pG1f2S5UJp6HuWR5zw4M04W4DXe0z9XAKcq
   tVbjz7Dd/7o6L7JrJHGOUFn8hH6oxngK55YmEK9rfDouw0yytWGyErnG4
   Zg/QmqDT4YB9F97J8MJOTsEpQaHdp69RIbAh9TfPfYwHkCqP4cRXDk37U
   N3Ot23DoZzfUqrL/VGFctilYNqA2h98TXOVdWh2fDl2BCQ8zsntq9Cyll
   d9tCOylxMemVXocqo3SPwnoS1NeeHDtwtSS5S7vPSHeB2rD8SwgJR5jTq
   Q==;
X-CSE-ConnectionGUID: c3F/WtMdRE2wtE//aNd1hw==
X-CSE-MsgGUID: xgzMx3KhS9Glzn7mf40llQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="44819853"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="44819853"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 06:45:53 -0800
X-CSE-ConnectionGUID: 5fPlwlb1T/WoFv2x5twvOQ==
X-CSE-MsgGUID: Twx7luH4RCqcvJ04sConZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="138855994"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2025 06:45:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlqlI-0006ep-30;
	Sat, 22 Feb 2025 14:45:48 +0000
Date: Sat, 22 Feb 2025 22:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for THERMAL_ACPI when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202502222216.MKJUwYKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   ac10b548ee1c8e7f4a31ee66a5bebd891a172a4e
commit: 029165643e81d28849fd9c690ab6d479966cce6c [1/1] ANDROID: GKI: x86: Add hidden thermal configs
config: x86_64-kismet-CONFIG_THERMAL_ACPI-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250222/202502222216.MKJUwYKe-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502222216.MKJUwYKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502222216.MKJUwYKe-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for THERMAL_ACPI when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for THERMAL_ACPI
     Depends on [n]: THERMAL [=n] && ACPI [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
