Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF64272E54
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765750132; cv=none; b=EjHDxqz8nfzOhlEFkmFewawFFTneL7/hDQRRGkmAFSDnew16t/kOQ7DrRxuusTavGJ5jspytqkt8UVn9qLBc8rY9u5gbTYTS0ytcKlLu0f9CTrOUU0EmgQ+IoeQwRWhPKdpi2uQNiYcwSgNbbX6Biv/DpB/w3nXgcb5RVO6imG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765750132; c=relaxed/simple;
	bh=PBnEA56j123OE7I/HAisk6qgvDfQn+L2jVmtSkbAnDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N+AnbH4Hw1fNVC94Ax7eF9UXThARGbayqsNoFh7N9VxA88fXSiQqskevNTAeSiQ/ujRZsRyJ7BTJ1kyq7ACrgLLB0py8l3yMTZj2IEq/1KpzB2NDNIzoTp0qaGBniP0KQ4wJ0m9sQTLfThLq+0ImsQ0FYPx87VhR73XCjCoxMGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+JsNr7P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+JsNr7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765750130; x=1797286130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PBnEA56j123OE7I/HAisk6qgvDfQn+L2jVmtSkbAnDY=;
  b=Z+JsNr7PilOcy0f5lApFHKflQr8jz5TfvQscVZtdl2VfOrc8/zKtVYcy
   AH4UXGFYwFHeipE8MbcqUrLKx9O2syfPDI9WV99wbzQNHQDvkV7bmmoga
   hkoOp6v7NtUFkcmIZ2xl9TN9BGgIrlIphLP4maTzmyoz3Nx/lcB/Ew4O7
   RJUBD5fc43VIjSm2TU9qsP3P/CaLhSNda8CQ2GDbFI+Cudd/RJ3vSxKkc
   URuLItriZZOrrfn56AO8boB31vCi2zDZ50mJlDlcX9W8vEr+OjMi8VFis
   Kr4kqQXIaAJ2m+jfZWAwnt9ddAiSQ1ZYzaMhdmRSX3CY5m1hvo7P1wJpC
   g==;
X-CSE-ConnectionGUID: awnXeJ6CR1C8a3/KoxgBIg==
X-CSE-MsgGUID: 5iJtSM3URuS7m7GKE3jmRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85251140"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85251140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 14:08:50 -0800
X-CSE-ConnectionGUID: mICE0UX1QrieM2tZMnBOZA==
X-CSE-MsgGUID: sWPbzdXSR3KMbJYpPG82rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="201754705"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2025 14:08:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUuGl-000000002To-0oAo;
	Sun, 14 Dec 2025 22:08:47 +0000
Date: Sun, 14 Dec 2025 23:08:42 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-netnext-rss2 14/37] kismet: WARNING: unmet
 direct dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
Message-ID: <202512142327.6xDzCdY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-netnext-rss2
head:   9f65663bfdad717c57c939e8289964fd6739884b
commit: 5d0bf23164c5561201ee744a581e8eb90e4ab9d8 [14/37] net: pcs: airoha: add PCS driver for Airoha SoC
config: arc-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_AIROHA-0-0 (https://download.01.org/0day-ci/archive/20251214/202512142327.6xDzCdY7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251214/202512142327.6xDzCdY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142327.6xDzCdY7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=y]) && PHYLINK [=n]
     Selected by [y]:
     - PCS_AIROHA [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
