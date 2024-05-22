Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3CD141987
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397157; cv=none; b=i68HlwYDxnpWj3VJ/WS58gqch7uTrPvqf2yOtgwKBqrHvlARJHfTKdKBkkLjGGQv4AP4gozP4vFosNdgNgDXLIqefEFzfm8fjAFGBoA0ifht3QnsXhdPP6De1ry4sfmGqylx8uiEb4w0lSYtdfFsSISg9YbZAreoMXLI/Cy0PaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397157; c=relaxed/simple;
	bh=KRm5+4e5wzaH8LfCLeScY78rA9FhB+FWLgWmd7oPIKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoJv935VJ18ow1Lvu+EwW5nPtXYW5qW5De9u0TZEiIrQuHkTA0s2Mt5kdggwdId6473CwVuw44IZ9OOx+Ob5YEHHY+x4Tg2zI84+iSdpzTQ5DFZ+A+F3F6fwDIcfZHZ1ZDCX69mvxCp2avMSTzzlfp+ZuKni3nuV+nYkSBqUjmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caomarV2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caomarV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716397156; x=1747933156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KRm5+4e5wzaH8LfCLeScY78rA9FhB+FWLgWmd7oPIKw=;
  b=caomarV2AAY1259RRo77m8pbgDscTSsKArLFUiS+4JpEULGdlHjMhtGZ
   V7f+SbRLizsO9fIVfC/P9KVP4SsCKBQr9cWTPM36NvRIBaQb3h1zR//eo
   qnA53dVfP2Twsfgkrqqza3TRCftTddYOATDGtuAQySc/M5TsA1XIC8qLb
   vC66Gw3VjFcg7deXvLTWzrV1fkTY1wYuDTLHJNbevZcRG5qihPadRh5Iq
   ggQO3fWXdAFtOoYlTK2qh7ad1dbOzqJxF667hLnHVp58yGVNDQv+MuZLZ
   AW3NYwXSuyTBcN+4g2NA7/dGo5nfiOQQmWUSGvTHBXnGgRy+PsHsaV5h4
   g==;
X-CSE-ConnectionGUID: Sx3gg9hoSTawkyTQu6jC7w==
X-CSE-MsgGUID: seLE0RQuRM6rw8Ngtw6Zxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="35178574"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="35178574"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 09:59:15 -0700
X-CSE-ConnectionGUID: YCfXfE2vT6WSC7l0rAw3Yg==
X-CSE-MsgGUID: 3sXJ93gyQ3+Wk78AjPQ3bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="56596039"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 May 2024 09:59:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9pJ2-0001m5-0s;
	Wed, 22 May 2024 16:59:12 +0000
Date: Thu, 23 May 2024 00:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 26/39] kismet: WARNING: unmet
 direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
Message-ID: <202405230037.KBr1UqTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   32e99e3b83582712a0318e4fbd7e3f553ac4f078
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [26/39] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_PXP-0-0 (https://download.01.org/0day-ci/archive/20240523/202405230037.KBr1UqTq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240523/202405230037.KBr1UqTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405230037.KBr1UqTq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [y]:
     - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
