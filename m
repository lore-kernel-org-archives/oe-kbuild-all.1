Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF2137C0FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785057751; cv=none; b=pgdaStZIVzRKD9mKGwyIswTQ5eHJTPAeBVdlMlDaba43B7rpGNPR/pWGOnrFITV4hZLT3CyAMtewGeO66+XM+45OZCAzg2c/u2Wqb/ZDmC405OlT3Z0VMgQA8gM2OvT6slE0zbuez7JU3+PqcSnX85tcqeOgOUu7skPwd18Ny94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785057751; c=relaxed/simple;
	bh=Bh6EmNGkb73yLteiR0bO1fU8Mi5Qdg3i1yhdS6PYLi0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HdAlAsgOQ3K1eRTtrfLJ2wo3U1UnDP+xQZBRNsNTX1TtVToCvn4tVHhVtSXwLsQPohI9NzwnF32drY31WXTlqdCq8oyJ7QAjr95si5L6D0pRgXH2X8NCZWqbWAA+/3folcFgaPQJa6P7ZviRLx1jpsPoOh/UcXsPtROurNn7Whg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7G2TQIy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7G2TQIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785057750; x=1816593750;
  h=date:from:to:cc:subject:message-id;
  bh=Bh6EmNGkb73yLteiR0bO1fU8Mi5Qdg3i1yhdS6PYLi0=;
  b=h7G2TQIyQwJHBIcs0TeBqP3g1929BzRqeAmJSGP2CBCgs4BSM2lueJRl
   jDDMSO4QMF4AJLNW3kaSbNgWekd4geiJgXYv+h3mNx8mgWDAffJt8XjF6
   /oNrUiDCf7m/VTcpRuj1FSrDH4LexRSCKiJRMSOSIxCjcvp5NVhLsj/fp
   zIpVXX+v4Ag3NRlV30L9+o8Rrr5C7Bnk/nsL2ZDaiWZG7EXK4eOYFiajw
   W10qH42G5KPblU6nMeMiI2H0KiZoZX+TM1IssiQApgsmkahYcA0CCHoN0
   pcMpI8OaLKBR01fJejBW0asvxERECmF3IlaQQetDDLKKKVwLogLVldLcg
   Q==;
X-CSE-ConnectionGUID: 2phmb+U1R6WmJmLAAGxrNA==
X-CSE-MsgGUID: OVAWKiBORy6ZHZz4oRSW+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="111198862"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="111198862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 02:22:29 -0700
X-CSE-ConnectionGUID: cj5YqoWkS9+yKXUHZPVSKw==
X-CSE-MsgGUID: mzcBaUMkRjK0c5MKqHSCjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="263427799"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Jul 2026 02:22:28 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnv3x-000000001PC-2iMb;
	Sun, 26 Jul 2026 09:22:25 +0000
Date: Sun, 26 Jul 2026 11:22:09 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/110-smc 8/8] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607261118.K5jnIUWH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   26b17382ce6435b7219bf29dac09322bcf1798f1
commit: 26b17382ce6435b7219bf29dac09322bcf1798f1 [8/8] power: supply: macsmc_power: Add CHWA / CHLS charge thresholds
reproduce: (https://download.01.org/0day-ci/archive/20260726/202607261118.K5jnIUWH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#60: FILE: drivers/power/supply/macsmc-power.c:602:
+		/*
+			* Ignore, we allow writes so userspace isn't confused but this is

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
