Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423AD15CD78
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822317; cv=none; b=Hynjncs3y+MVw9gJ2LhONA8lVqGqAuooIIhH2WXQxXf6A6oQ0FT3JNtuwiBZqMvJRcTPfgsYli7iqorpE8Sjx0/dnJKocbg6XKukQcNyPJ1wNz+St+qzKxU+WZ+ZTZKB3yTuDIMsdIx7lONyhMOOlhSWsZzGWF2nOKuy2OWVTZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822317; c=relaxed/simple;
	bh=O8DSe9ovTIOgpUFwS5JtxpWZmU9p468HHnSQdi+3F90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooyiPyf8egrldLL5aHVbATG04n08CtqCqMPimLHQrHeJTd4q3htme0AynH7HBsdfQTCBvDZZSdzESyvB0Cz83LVIKBT8T5iUOT4L9pNgeOR6aCOnBBgPvnjWS04PmgiFCijO9vR1ulQt5JnN7v4IHEzIriuJ+FIJ45Psdk3cCN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGbyIHaf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGbyIHaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730822316; x=1762358316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8DSe9ovTIOgpUFwS5JtxpWZmU9p468HHnSQdi+3F90=;
  b=jGbyIHafYgQGaysLPH8V7Jt6Y2zz+wqmO+ClPVL5WKmCVw4h7VQsGdrO
   eE8fOdlcRPbfnvlW5WGYiQXx/YaSbI24tZX9yCMQEjfvPwMWcCFsSa5Ki
   2Nm2dVmxFj5kvwg9QPtcRZVPJ2P6FYLoVdghKZm1+gZtthyrCaRjLU2df
   njnSgGMTyiL2qBi+yR3O5nxiuBlGnfybdzWCahmSNUUemLBTWmmRmhZlG
   oQxZfOCB42UWVWFtsWWng4JIWlgrRA40lqHZvLy7ZiRkgjLjcmzZScPP5
   vFkgizTuW11spwoivA/zHClHTVMr8Fj/bElgvA3GeXh7J2qGG9Bl9dt72
   Q==;
X-CSE-ConnectionGUID: Vm5HkGrOTkOKKlpXeUye6A==
X-CSE-MsgGUID: pdnQe05cRCmH411iSid4bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41976438"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="41976438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 07:58:35 -0800
X-CSE-ConnectionGUID: 8WiZ2QaTR2WrG2bzMIeU0Q==
X-CSE-MsgGUID: XTUu+XvfT2C6uSCsNt8+YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="121550937"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2024 07:58:35 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Lwu-000mCD-1m;
	Tue, 05 Nov 2024 15:58:32 +0000
Date: Tue, 5 Nov 2024 23:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13/16] kismet: WARNING: unmet
 direct dependencies detected for INTEL_TCC when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202411052315.ARl7MlQq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   cefa8bf9f032171eb1be08266aec68726ab8e8e5
commit: 029165643e81d28849fd9c690ab6d479966cce6c [13/16] ANDROID: GKI: x86: Add hidden thermal configs
config: x86_64-kismet-CONFIG_INTEL_TCC-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241105/202411052315.ARl7MlQq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241105/202411052315.ARl7MlQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411052315.ARl7MlQq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_TCC when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for THERMAL_ACPI
     Depends on [n]: THERMAL [=n] && ACPI [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
