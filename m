Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA952D605
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710769086; cv=none; b=mUDBOBSF6RW8YTcqmd/uaP0RUg1/HQ1BIwjyDtF55+beU/keR+ozJx8a+IaB9ENTzwbVJRADmX8GRyJFcTXaJu9gW0mG7SEzPzw3EUfWwQ1e7Q7gvzTz7pLiDaXz2TTjvCnyWuG0rANJ5MXCx0BxQdPFOJyruSvLk6t5aUh6LIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710769086; c=relaxed/simple;
	bh=k+HYTaBRHT4c/enSs8LprZVtKI3hoX8y8ImBpqZ9yPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbsGbXoyqkwwNd8AhXf+pLtKDi+RCuFvTpdnSqLFWhnfb1DpfgT6eK1CcV7+FMgxmCaOh6A1C7EFNK431Wz7bOvUspDn031Vif0aN1CDEUrIvrT3DIDPODZvupd70wWtfRnlCrQWJ89xxAtIPsO/zG5zOWX2gKIMmiJYGuOHKUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhTlzEq+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhTlzEq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710769086; x=1742305086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+HYTaBRHT4c/enSs8LprZVtKI3hoX8y8ImBpqZ9yPQ=;
  b=bhTlzEq+h03mYQSAb9lcrRdYoFstqgR/mW9YNRvgUeckwAQpdjVwGReA
   DnG/s8aKeAcsZyzIjL3gsnkhXW0eOpSJ5FZaRInIxpvPP1tInBX9i+CGQ
   lEbKa4oCO8K7sahE/UllmFoRgHgbxeHEqZQdNLJt/yXQTCY2gv31zulTx
   daP/mviVAEBEYTzhA6PygKImRg5e/Zz3MiXy+vss9xobi/7i3/ovVVPSH
   TKwfCXqOrU0KKUC+O+8egmzFiKuNe5o9ykr13E0iycqMm/MUcR7gbaf9Z
   uUqWgB9Qt7gUxc6NgPffa8xJuFFdHfXfTY7Aq08QGhxxGUUA6MFLvbYdL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5517650"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5517650"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 06:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13862290"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Mar 2024 06:38:04 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmDBh-000GzX-0m;
	Mon, 18 Mar 2024 13:38:01 +0000
Date: Mon, 18 Mar 2024 21:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v4 3/8] kismet: WARNING: unmet
 direct dependencies detected for LEDS_TRIGGER_NETDEV when selected by
 NETDEV_LEDS
Message-ID: <202403182135.VG0OBeJL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v4
head:   c85ce1c8e3761fc366533410f0318b01314ba819
commit: c4ae49b10529d66ed1aa9bf7c6e10ef95dfe7f75 [3/8] net: Add helpers for netdev LEDs
config: alpha-kismet-CONFIG_LEDS_TRIGGER_NETDEV-CONFIG_NETDEV_LEDS-0-0 (https://download.01.org/0day-ci/archive/20240318/202403182135.VG0OBeJL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240318/202403182135.VG0OBeJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403182135.VG0OBeJL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV when selected by NETDEV_LEDS
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
     Depends on [n]: NEW_LEDS [=y] && LEDS_TRIGGERS [=n] && NET [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y] && LEDS_CLASS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
