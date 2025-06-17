Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC59E2E7F29
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172816; cv=none; b=jTyNMYOmjtvHjWaYE1OIK5bnguKN5rtEDawllYGLnDgZFBHJeO3we5ROkPzxteayvJO4dtfcNkdPAi0SbFRK+SpQksxOvftrlBx+zuFpUi52XrkRN+VCoNu1PEiHfLyJNbHEVDgYiuGj8xQtiVbx9/337N/nFMNG1oJ8lAV6kQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172816; c=relaxed/simple;
	bh=oS7Nq0lrptFWq99rB8UN90H7yOwGvrKFbv7Cwq+IUA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVyspxHlAjMsfHD/gJl5MYuiiwo3IkP3uCechhS1O3M82uUaakguoLXFitWeDu1gRS1rV4OJNxBzkUb8lH9aM9qucr+fQKslNspDeHLYKZmEo7JzixCIr8/lzJ7y2rVD4UCuuZBTMEe6OVWVkRZX5V3IpkURodOBhjJxlgWIpXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4ghHpa2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4ghHpa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750172815; x=1781708815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oS7Nq0lrptFWq99rB8UN90H7yOwGvrKFbv7Cwq+IUA0=;
  b=b4ghHpa2RBQbgYCOiA4m0YiuSXn8x+6COF8JntH1Klr8ULTEq0PHao4T
   +cGIqrAoguj6TxiaF7rJQa90+XdlSujzudpXO3rfqS5eKCPVzcW9pt1cW
   Hu1Xt5nlxyv+psCoO0AND/9mMHjTIxGizBQ8vnNiZ2pfb932rBQU8YsQ3
   We92nGw1xvQ5p6uU9vn9jMqj178C2uvPh/e6MgYzTAJwjgD0X9SoPY1uX
   cM4bkYYNbLvBdHEQzu66VuJqWZG/3pwE0XwDn1b3IkK1eeZHmsxEPUU/V
   7RGKrVs2sOBrSFMszMGtLelkXPGw3Pc0gRLlmWj1KAu8SAhxEZwDq1bTx
   g==;
X-CSE-ConnectionGUID: YdKhLhMeQv+xdTpA5BD+UA==
X-CSE-MsgGUID: CKetJq1nQ2uixm/IFtf9Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63389462"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="63389462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:06:45 -0700
X-CSE-ConnectionGUID: JNg7aIoaQx+JQTGLh2RZ1A==
X-CSE-MsgGUID: QPZr0fopSwWhJ/tMSEUrNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148717668"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jun 2025 08:06:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRXtY-000G6g-31;
	Tue, 17 Jun 2025 15:06:40 +0000
Date: Tue, 17 Jun 2025 23:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [linux-next:master 369/3035] kismet: WARNING: unmet direct
 dependencies detected for STACKTRACE when selected by STACKDEPOT
Message-ID: <202506172312.ujaGUTpC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4325743c7e209ae7845293679a4de94b969f2bef
commit: 16b7e65d299d56442879405ac85800877fa51355 [369/3035] drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from
config: m68k-kismet-CONFIG_STACKTRACE-CONFIG_STACKDEPOT-0-0 (https://download.01.org/0day-ci/archive/20250617/202506172312.ujaGUTpC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506172312.ujaGUTpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506172312.ujaGUTpC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for STACKTRACE when selected by STACKDEPOT
   WARNING: unmet direct dependencies detected for STACKTRACE
     Depends on [n]: STACKTRACE_SUPPORT
     Selected by [y]:
     - STACKDEPOT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
