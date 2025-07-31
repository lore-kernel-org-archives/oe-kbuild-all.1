Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4F72BE7D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753964448; cv=none; b=fcH/GyClF22yLeYzTAckYF5G6zArgo/ZMOLvmWz2FwzXJxFNQppX5YXlCgaKuIVXn1IaO5KTiQ6D+fRv6Q8IjrqcuiCIDn/fFmqmiEQHKknleKV0wN63s4mzbjCLtfrmr7D2V/L5oIx743Y43dnsUjrWVAqeXDcWiWvHuEn+PmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753964448; c=relaxed/simple;
	bh=t6m14gkn7UlD8kUZt0pxogYHsJd4Hs2APm0dodY48p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gVpHDCeg8f1OHB71N3txSD5WWifnbVD+T4avKcsuf53u8WLD6etPVoz8VGXTYbj/f9KQ4jS4e6OVP1EpHRPWm/ICW++cyVo4vX9lvLqZ3dYIYfCjUEpyA7A8odZBkCrhhnjOme01jkR5v4lyL3hmvl5q6lmg2CbVOm48Ts+cysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RY6bzPYL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RY6bzPYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753964447; x=1785500447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6m14gkn7UlD8kUZt0pxogYHsJd4Hs2APm0dodY48p0=;
  b=RY6bzPYLIbfyKVejOkgk4tli017OWFCMo9JMvQMj2r1i2P2vIjm1qrNR
   8Gm5+mLiyO5barG8uIFBu//Mr+KDSfGn/TgNJv7BS/VKvZFNxNEhCzgyI
   P/aoxWKAUBJcVQsn+SxieK7HJD1ib9I0xFyWJh94uoWpOUyH8z2CoSZEp
   Gfh0pChqt2WcI6/laPPm6TS1qPMOCjhiUbCqK5as2eCGwdfxqNyOodNo5
   J7dN1m0cNTFpMDUJJ8edHlpwIix9FtI/YidcrCdmEYGy853P5ah1itLch
   2jQHVEFM1/F2KBnoiHvZzNO4XDdBPEZDEUN3QXWeos+ihK8YmF8ZtkyqZ
   A==;
X-CSE-ConnectionGUID: a2an1kNaSE2xwfKLADH6HA==
X-CSE-MsgGUID: VlsdoBibQPWIbRqiFlAXgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55984026"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="55984026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 05:20:45 -0700
X-CSE-ConnectionGUID: Ok3pR4sORUC9EKuYyGxuCg==
X-CSE-MsgGUID: X57fGixYQbCOnCobIHoxhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="163693383"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2025 05:20:44 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhSH4-0003kq-0b;
	Thu, 31 Jul 2025 12:20:42 +0000
Date: Thu, 31 Jul 2025 20:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 31/61] kismet: WARNING: unmet direct
 dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
Message-ID: <202507312038.1eS7AEJL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   91e226e3ba3199526769b10b2f2eccd21872c876
commit: f0ce78d2e4b38db43728486f89ba62749d9488c8 [31/61] net: pcs: airoha: add PCS driver for Airoha SoC
config: alpha-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_AIROHA-0-0 (https://download.01.org/0day-ci/archive/20250731/202507312038.1eS7AEJL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250731/202507312038.1eS7AEJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507312038.1eS7AEJL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=y]) && PHYLINK [=n]
     Selected by [y]:
     - PCS_AIROHA [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
