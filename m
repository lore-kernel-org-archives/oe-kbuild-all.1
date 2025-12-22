Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D26275B15
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395880; cv=none; b=AzCGJmk9RBn+AGf+UkJtZgBHb7UW2XPw/BDuWipUQcReb61PW5Rw3aVpDMm6K+SVGJ7+gFhKYwg12e2m74BpZxsZgmnk9cgQ8f8aKpfsbSMeLAAGPiMNShqUidcs0xEInTKitOHh51YwIwRaGS5OB4t8g4dhzDRqGWytcxaXmok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395880; c=relaxed/simple;
	bh=cx2LKoI7YyMycu4dJhELpV8d7C2WGVXI7sxa0fd5qZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTkN4RR7JWCXcpZcMhgFmCe14fmqR46hI9+OjUNXMm1g3liimbmu6403rZOYTaxpIag3qxx+/Nr3V2BODKi9XOIBCbH0LYvI3MOvLIEUwgIzraR7pPV4davRi4YjfI2rX1+UH1AYS/FW6gw84PP6b7Q0eDXdKcElxB42kIld8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoKCKiSq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoKCKiSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766395879; x=1797931879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cx2LKoI7YyMycu4dJhELpV8d7C2WGVXI7sxa0fd5qZg=;
  b=FoKCKiSqbIRa446lWLXR+rs+S3TNHgf0ke2hA0s4vi2JGM1Qknan38Mq
   tFMfZcetUEeo6BteMtwWppaEg6u2odx7hFTZBhsqUu8Oo8XcfvLn65UzI
   6SsU1pvNRyCnqXZ+E+UTuiLxFcRdp/VkaoZHQ5pBQWNcyNefSfPSCaEI9
   7wrb4pi+SLMnldxebTjvy4O3d1NMbiSLudPEnE7xgHuscaHdeTC6sFB3h
   YDilJB2tgNL/QauDnFoxTOOoGDWpQACRs5u63NTDtgbVCK/fEPFprdYLr
   dTqSFfE+7wu5VhipItfDgylKOe+zuh1xH6SBcOSHd0B8vGovau/wgW5vH
   Q==;
X-CSE-ConnectionGUID: dK6M9ywwTR2SsSrv98/ELA==
X-CSE-MsgGUID: ISBnnTJSQsaxqNJjk0Ckwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68131133"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68131133"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:31:17 -0800
X-CSE-ConnectionGUID: E8zoHMARRQOR5XcY9uFrVw==
X-CSE-MsgGUID: 1tggwSQpQSmaIduWJzswhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="222973272"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 01:31:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXcG2-000000005QO-1r3g;
	Mon, 22 Dec 2025 09:31:14 +0000
Date: Mon, 22 Dec 2025 10:30:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for P2SB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202512221047.g1jxZPf2-lkp@intel.com>
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
commit: caa257dd021ccdd7e854d3607429734d752a17dc [12/12] ANDROID: GKI: x86: Enable P2SB device as x86 hidden
config: x86_64-kismet-CONFIG_P2SB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221047.g1jxZPf2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221047.g1jxZPf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221047.g1jxZPf2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for P2SB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for P2SB
     Depends on [n]: PCI [=n] && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
