Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26EB667
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606828; cv=none; b=W8ICVxLfDU/HXQh2M25lHiH79b1rZfPP0ebNY06cbId4Fl2Hm/M+L/lQQ0cyy82B5Yk36XmS2ESkkkod+QhFwbwIxDEmSZ/nP+VN7s4AxxqwDLZeewFna7SVJJnV7pOLG+WxWzrjVqyL+GDyxNIZ8UZQqzK7AYo9qiJwghhLxQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606828; c=relaxed/simple;
	bh=ehBfhA+Cq0cX7yorgg1TOhj8LenmAj1bNx48pAikMXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFnj8RcVsH7tYeich7ewhh5RCkNHNjDzfhDRbfZZJtXAt4ijXI65SpPeJ5CuZYex/XunH8BJvi/TVhkMP7HDY2uePDYYhjEdVlbr3Xkiq4TOjIEZdSPVm46ukHAk3ClkAmRCL8K7Tei4J79DGLCpSkr/V4mv0gcWJs2iC4yOKP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YL+rO0Vj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YL+rO0Vj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738606826; x=1770142826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehBfhA+Cq0cX7yorgg1TOhj8LenmAj1bNx48pAikMXw=;
  b=YL+rO0VjD3P6Y8zDBtLznScuCdbgcoYy8EZ0xe8dFoKys1nOpjvAz+KP
   7D7878XyWRukRmYxPOHvVlzo7s7mD4VOCjhB0PGuLxhIA/Yw+sD205nhw
   D/oT5HdBUiUFB0l0xdwrYFGIx6Dh4lASPfmKvyR/E7odjqAgGEg2Ka18l
   xwYieCNSi0s/J9849ByPjhywAg74kdmhk5wVcGvVtsu7w042T8rs/aCTO
   9yHsWY6+KCzkb9bM4qOmXeN4dsI3cqdORVPwldwk7hr+zlCrkF1k4bx3O
   WcBfWBmQmO1VfvXmr1h/0LNghH0Mz1ZsKXjyhzvdIJW/8yZ6ELZGtreDA
   w==;
X-CSE-ConnectionGUID: 1aeffV3xQWCika31hF+xEg==
X-CSE-MsgGUID: inVkik5oTxeh2uLU6LGPJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38991573"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="38991573"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 10:20:06 -0800
X-CSE-ConnectionGUID: UBM32M+/Qwiy7RLze6tTuA==
X-CSE-MsgGUID: raK0wDA5SNGgbwzSgUEhQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115517048"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2025 10:20:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf13B-000rKV-2S;
	Mon, 03 Feb 2025 18:20:01 +0000
Date: Tue, 4 Feb 2025 02:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 35/53] kismet: WARNING: unmet
 direct dependencies detected for ESP32_IPC when selected by ESP32_WIFI_SHMEM
Message-ID: <202502040242.vIMnFDBQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 08b8a525de25b35564cb9ae5f7b5ad1122a84fed [35/53] esp_wifi: add IPC transport
config: alpha-kismet-CONFIG_ESP32_IPC-CONFIG_ESP32_WIFI_SHMEM-0-0 (https://download.01.org/0day-ci/archive/20250204/202502040242.vIMnFDBQ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250204/202502040242.vIMnFDBQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040242.vIMnFDBQ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ESP32_IPC when selected by ESP32_WIFI_SHMEM
   WARNING: unmet direct dependencies detected for ESP32_IPC
     Depends on [n]: OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
