Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDD030B51F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766403800; cv=none; b=q1J/8csiXWPm4THU4Jfyvsf0BMp98munkdvE8jAhKO14kqsPgJWFc0Uib8sG3g48U7v5SMb4Y0yeyTaDB6ROqooxD6dJtdTx4Lh1ZUFqueYlHIwuP5bJvpTC5/C5AKiHi3NTJAJeIeIqHN/dWwAgB/x9EaPvJlxDIxUQpev8z0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766403800; c=relaxed/simple;
	bh=21j+Vnk/uQoRgwBj0QXsXwVbrO1poTDIUrN4o9DgNQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SN1kgiOAs9Z+Q70XPND4bzUauKwMP8gW3HjB7is9ca1jGQZ6tKIqUk7pzpQY3PB8jkWO4nAgOpicste/8ZvAIv7WAqmvm5kRO47a1I/TvKvoMUyWlswOUMRk8t1fFTOxT5iziWqyBnRiSoJHpvGU/Wq4tNETyLPjg1UJAKeGsaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQLojD0e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQLojD0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766403799; x=1797939799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21j+Vnk/uQoRgwBj0QXsXwVbrO1poTDIUrN4o9DgNQI=;
  b=aQLojD0e++rYKztaaxg4Q+cBzfIJZwBYFhMA3ZmmTdODG/1xCDdkCdBy
   T4gsAS/NLqlJHHBEqGcceQcFa7VaX5nZWOPL80vMja5Ws1nC622BZZynI
   72QRMn1eClQxEtutyQFwvcrt3cJhwEIjYEFEtB0/Tu9/2W2t2hqbVAoXq
   3+eERfn/2zL5M357MmxebEdpGZI2tDTGWYK3JN70dQS6sopyFnnrtjqyq
   PMYLTO5DRdwowFkkuIHfMz70WtCDXrfEL4hksBJ2KaLoutJKp+e95x8Hu
   247Qg1V18jsK7Id+FHv+VojWawsHHqu2skGGEl0z/p56nJVqpnh6qXzNy
   A==;
X-CSE-ConnectionGUID: R7jdFh6FQQyXwkLhaLctSg==
X-CSE-MsgGUID: rL20SDrhRE+uloKD6eH39g==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67250266"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="67250266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 03:43:18 -0800
X-CSE-ConnectionGUID: m6IjEdxBTLSiS9XwAzHuiw==
X-CSE-MsgGUID: xXq4gCq6TJ+znaEsxB43aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199421151"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 03:43:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXeJn-000000005Rk-1q09;
	Mon, 22 Dec 2025 11:43:15 +0000
Date: Mon, 22 Dec 2025 12:42:53 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for PHYLINK when selected by
 GKI_HIDDEN_ETHERNET_CONFIGS
Message-ID: <202512221254.hrvHZHHs-lkp@intel.com>
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
commit: 9c2efcb127bb2168f3f523892a41b969ee3070ce [12/12] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: x86_64-kismet-CONFIG_PHYLINK-CONFIG_GKI_HIDDEN_ETHERNET_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221254.hrvHZHHs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221254.hrvHZHHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221254.hrvHZHHs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHYLINK when selected by GKI_HIDDEN_ETHERNET_CONFIGS
   WARNING: unmet direct dependencies detected for PHYLINK
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_ETHERNET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
