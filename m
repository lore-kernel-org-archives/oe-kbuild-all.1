Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB44137C52
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 05:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766380877; cv=none; b=rDpv0/Wd0GB4HSCevYAFYWk4wlxKWiCqCjLO4+TTogrr+6nx/+N1ByMYPmbKs+xEx+egi/SM2YBqi8bQJnjYXcXJ5IsxukO3Bsl5CdwlpUnF8NgRjdTAKKvBL9rw6qPss8AEMf15kusl1gjzefxrKqtJtRB8pX3pkLLi63Lifxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766380877; c=relaxed/simple;
	bh=p6KipLXKmtIELuezSAxior5HpJS0ccXXJcwtGSCg570=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xo0yWW3eptzbpIHcRlRHGQA4YKOAEn9KyTcw2+2D2Cl517w0wdlSSyf6sAl467Fjz/gtKJECIckb/xduBd42C/zkiyVfQllCVAVUjAWegjUWDrlo6XSpkpqPbHzdbmKTo/tCKDr/x+QsDn/e0ebTZeABS5iLRyHH41ruUzuo2Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evqTw6ok; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evqTw6ok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766380876; x=1797916876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6KipLXKmtIELuezSAxior5HpJS0ccXXJcwtGSCg570=;
  b=evqTw6okKRm/4lDD3ewk2mV/ru0jGqEd89pqZamurlupiBIdBkV60+Gz
   0wKwFMSpgxFLtGu/QbrI9j/Rff0xtRgZt7CvWpfV0M5l38KljQu95GYuh
   kstgYFW9aKlz51mCTz1bHGoYW7v9mk0Wwa4EOenLPM3gNpdn5yobtB1pP
   S9Lr7huI80EfdemyRt8p3FgK8O+KfT84MdxQ37dLEvSp+deyXBdIElTEi
   AZBvNJ5aVg7Xq3y9dHP0nhSpSZN6Z5r8ulNdcvZ4vNKfjMmKTeJYtyEfF
   81NPivldyi4f8ofVvwScInzDatfLzCicbyJWvlGgd6iXYbANIhTkjiZBn
   A==;
X-CSE-ConnectionGUID: 2rqbxqfCRVutgVQ+M5oLPg==
X-CSE-MsgGUID: jBh65vAsTciWddspupyiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72083929"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72083929"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 21:21:15 -0800
X-CSE-ConnectionGUID: uUEwz7DsRUSmswuP4pgE+Q==
X-CSE-MsgGUID: Xsm7sYHhRaajq+iGUGIRhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200319301"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 21:21:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXYM3-000000005Mq-3MAk;
	Mon, 22 Dec 2025 05:21:11 +0000
Date: Mon, 22 Dec 2025 06:21:06 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for INTEL_SCU when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202512220637.PeSv1sKu-lkp@intel.com>
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
commit: 80646a059eb38a5cd606e549940844bef477d3da [12/12] ANDROID: GKI: x86: Enable Intel SCU IPC as x86 hidden
config: x86_64-kismet-CONFIG_INTEL_SCU-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220637.PeSv1sKu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220637.PeSv1sKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220637.PeSv1sKu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_SCU when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
