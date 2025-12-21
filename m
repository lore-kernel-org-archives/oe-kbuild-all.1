Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA072F99AE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 18:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766343189; cv=none; b=moxUm/8osWMjrfva730pfyEcppe/FNA/bNolXGokwiaLbVIRmMhWhJx35CNe6jkrv5gdTnO1E2k3WtvbfO/z5bWLoD8umQ6RHmzbeWjh5UAz6pyooJTeI6OG/3sxf9XxpsmuDC5QhmnlRABhp4gjP7DaKIQcUFZgTpDlR654+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766343189; c=relaxed/simple;
	bh=E1W3QFv4xX7svKcdzzMx6cW9kSDBckFnOluDhxa3RNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ht/Dap3+IswceyJMRJkVJd0gI79Et7KktGMrmEb9tlx7LtFLjOzabN+MKhUWrA+fnm+GdmzEECnLdrDYfJaskiPYQAaf2jLX+Kl3b72VLqTsphlsqlJzE2w/cdhm26HMgNZIUciy/aZAd0KOtIfwwp3YgHprkTWxrIluEOpUGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsmZCliB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsmZCliB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766343188; x=1797879188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E1W3QFv4xX7svKcdzzMx6cW9kSDBckFnOluDhxa3RNk=;
  b=HsmZCliB/cqaBbh8odoHbSUqV1yJI4/nLer3A+n7JAHNmGJPO3FK/fmw
   59chM+narXK4VimuAZbrBFpjSS0Xjg+DXNw+6AZT39pWLgrre+ZftQ1gy
   s9bfx9t6ldEusJpni6AYKlFC9seCiTiQRw/itJJMLPqEnu3wNMur2Coz0
   9sC/YrNwPqv9YlNrpuTyYlxGUUmWdxuUQ8EQ0XAZ/wajqyVE5BGAgxYeS
   akIOv9Vxz/a3oo16jC0GaUfLijf+heOsZTgxmhPIPbP8a4ZF+3pthV5lp
   n73U+SV+Iqo0yuy+d0llCga/eUkeol3uJhUjCq6YVuY6UI293OGKIjagm
   g==;
X-CSE-ConnectionGUID: 8+mGSsBBTsWKSc7unTaSkw==
X-CSE-MsgGUID: oXLCTDPDRtSFB9gnvHQ1+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78536894"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78536894"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 10:53:08 -0800
X-CSE-ConnectionGUID: 2RACwnTRTd6oaz1VBusQgQ==
X-CSE-MsgGUID: DKnCJ85CTDGC+aa3JNMLUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199870130"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 10:53:06 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXOYC-000000005CQ-0VVb;
	Sun, 21 Dec 2025 18:53:04 +0000
Date: Sun, 21 Dec 2025 19:52:18 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for CAN_RX_OFFLOAD when selected by
 GKI_HIDDEN_MCP251XFD_CONFIGS
Message-ID: <202512211954.o1JJde3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [12/12] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: x86_64-kismet-CONFIG_CAN_RX_OFFLOAD-CONFIG_GKI_HIDDEN_MCP251XFD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211954.o1JJde3b-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211954.o1JJde3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211954.o1JJde3b-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD when selected by GKI_HIDDEN_MCP251XFD_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
