Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C0C209F5A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766324524; cv=none; b=QUIYjuUVk5jqUDjM+1g3EBWi76cbx8wqRvA/NSwFcK4K3P0AwLnWOSayvAaKAboD7l+syju98TtvQySI0pA2rOD80lxXb5kc62Mq79uKD6IQk1uly22Azvxo3+f+23gxnKBa+73pgyHFWK30b9TiANDnnHUQRlhZ5YcQfbPr6Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766324524; c=relaxed/simple;
	bh=aeNTS9uvRGciE8jn2hMnBgEHZNE24zh7IKi4T/HeYhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VaXQ4cXfOKDbuGQWzLVJaS2Me0a8pwzJAex+q8wSInq5FAlxKk2gO2ajMu540scTuzrxfcUpW/iCsJ855D6aZG03GUGtbKmH+7tNZBJmGhejv5EF6D8nK2Fal7Eo62nUOcpYyWCXrEQX5kMbV9uD7C20cFcLeHfASBVsqOwU/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIO4WZqF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIO4WZqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766324522; x=1797860522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aeNTS9uvRGciE8jn2hMnBgEHZNE24zh7IKi4T/HeYhY=;
  b=cIO4WZqFNlJ1Bte3sVgoo/PdxsdAYoi2hVklpHwifQloX+7+QkuTKCML
   qv8AXGDGBtFPcdNp2OPMqYMBvZ8CNYi9zHIzrsdyQTXoA/qhkxHRkBDN2
   K9MPFViAAgAAwL5YHJzbMgsLfKyIG27x1Kr/Q5m97fYcopKG2sfrROiJC
   HeANzE6UhqRNZ223a0S+6ncVh8/NsAVBjMtuqAUI0OywtIieEv8PWb5It
   3the+dRzMWYAqTw6k6pbui76zTIt7KfbUUkHv52MWGxT6UnPWjQ//Lam/
   FxcuZeIcIdZbVMVXPRa0ZO8tv9eITbjdoVJIKrHJ0dWMrRg1a6pdtIlUS
   A==;
X-CSE-ConnectionGUID: jPaWqMiTR4mJvB2vzmtiaA==
X-CSE-MsgGUID: 6bF7YciOQrqQLv2kryFqTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67201030"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67201030"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 05:42:01 -0800
X-CSE-ConnectionGUID: c/eLGF5qSz6dkmFRdBKaBg==
X-CSE-MsgGUID: RZWPDezCQ0eb+quBXm0jPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203776345"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Dec 2025 05:42:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXJh8-0000000054e-2ZOB;
	Sun, 21 Dec 2025 13:41:58 +0000
Date: Sun, 21 Dec 2025 14:41:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for INTEL_TCC when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202512211423.lQR2Hvao-lkp@intel.com>
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
commit: 206061b5b2f4bae5e87a6510fb2ea23acd238f20 [12/12] ANDROID: GKI: x86: Enable Intel TCC lib as x86 hidden
config: x86_64-kismet-CONFIG_INTEL_TCC-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211423.lQR2Hvao-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211423.lQR2Hvao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211423.lQR2Hvao-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_TCC when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
