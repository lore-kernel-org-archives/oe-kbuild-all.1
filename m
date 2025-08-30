Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445412DF3CC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756583585; cv=none; b=Mgwg4uLHmjlevUiPb64+OjBTPbFKH2J2plDU5uC3S7cmt2B2uzPV4vAsCrnEbeOrAwmuWX1bDwDbAe4j/8yw9LaafAushtrxtTt+Doq/5FIGMzjW/exaGHaa89VFTyzvPEBxBESl51nCh8M4k0J9LaL/Hjj5Bc2d7ZG8jp4Yvxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756583585; c=relaxed/simple;
	bh=PHhEBwxlLnPF4ei+GW4sA9hn4Y59f117T76hRoLLpvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KVwE5LjAEeazw2JtAaCe3I0m/hrEW3MHsqPKGoiayTOVzbGGAy9HFEbwTgrYaHQo+58Lohb5LIAlZs2RSmnml07ReyXAyKT/fk1spVdLuBjDrbaRLRIE2JqphsObqwyacomANSujd+cjfZD8l0jtwYAxiAs4m1Yxj6QzXaQSUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOHTqbtx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOHTqbtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756583584; x=1788119584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PHhEBwxlLnPF4ei+GW4sA9hn4Y59f117T76hRoLLpvA=;
  b=QOHTqbtxnaXI9XAHlGlVilHJmIls++Sn1fc9f0262prO8k3POUKBIFV0
   US8Db8TjC29CQDFnhfzeApMyj69jPQiQRB9PHNcbUiLI3keyM18NGBGcd
   5mywAtg1WQNYMquIdQHBBwbZLgzuooVSOndwKTaen8eWCDvSFvtvOpTMH
   4SCHn17kZJpn/kRbiJL/UDyiVMs3QIUgd9dAcQde56DJcSyjQMRxXk8Ib
   61dTz8vZNSkv3sSkFCNhlRfG9xsClt/1Mnu6MfSWr3ROP8/R7rl9Rcn6O
   AtT4jQSSIDAfimBneWkPizLI1tFuZ0uxrCYM6Ct+AKgTlDOgGaGdwGoDE
   A==;
X-CSE-ConnectionGUID: gt8NRm+FRLaVquX35UZ0bA==
X-CSE-MsgGUID: sPEjUCwvRL64fxkCJOfnPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57860765"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="57860765"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 12:53:02 -0700
X-CSE-ConnectionGUID: HlL312DDQby61Zk9kUN9qQ==
X-CSE-MsgGUID: Z/y1rZ/1RvyCcO0uVvdrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170162892"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Aug 2025 12:53:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usRdD-000Veh-0R;
	Sat, 30 Aug 2025 19:52:59 +0000
Date: Sun, 31 Aug 2025 03:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 19/19] kismet: WARNING: unmet direct
 dependencies detected for LEDS_TRIGGERS when selected by CHASSIS_LCD_LED
Message-ID: <202508310343.ghLc3qFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 0e21f1dbce44bad4bb05c2541344ff3fb9643230 [19/19] arm64: dts: qcom: x1e80100-t14s: add EC
config: parisc-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_CHASSIS_LCD_LED-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310343.ghLc3qFf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310343.ghLc3qFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310343.ghLc3qFf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGERS when selected by CHASSIS_LCD_LED
   WARNING: unmet direct dependencies detected for SND_CTL_LED
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - CHASSIS_LCD_LED [=y] && LEDS_CLASS [=y]=y [=y]
     - MAC80211_LEDS [=y] && NET [=y] && WIRELESS [=y] && MAC80211 [=y] && (LEDS_CLASS [=y]=y [=y] || LEDS_CLASS [=y]=MAC80211 [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
