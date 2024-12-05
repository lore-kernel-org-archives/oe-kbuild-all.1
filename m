Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4A20ADD2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733398955; cv=none; b=qeggOf9n6DFIzs2AsC3blMb+0JFc7bJdK0EKypy81y7PHUwPV/k4G8qfvbjvv7rcaMhCOHNfdzs44QLzjyVtNtuQMetWxDesLfMgd9eZMVxc7GJmTJzRwCrQ4a9eDuVCcK/gL8ZM+5l0AkwcmNRaukJQ0CNaVVlUWvh58byCd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733398955; c=relaxed/simple;
	bh=+XJsszRgkZtE0wIFEuVj2eYeuXuXCOk6n89B2/Y7co0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FjdlfiDYpvyg9W+ZGLcsAg4VO797pvHb1qVkt7euVTIMkSkr7ZbAbHt/jrbxASW296e7iPueqPvqgWbO2QdJ94Yia3C0HGgPNr71lQ1mUjcWFMkm9Gll8HEusRFtniERuvZQAzclIr8O6iR3fsF9UTQDoGoxgF1SROKeH7+pMM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkfIt2V+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkfIt2V+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733398953; x=1764934953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XJsszRgkZtE0wIFEuVj2eYeuXuXCOk6n89B2/Y7co0=;
  b=nkfIt2V+lSbugdAYa/ir+7m0pb5BewnVlq9U+SSjxrcxbUf8yCU70DAn
   y4oF63hhsAPHbRsPMix7wZb3c//6zmEUZBbHFM2ZYn1XgR1KX2pa6kuie
   Ew1LvISpXcttdWVwXWvVoHG5wscafFaOV/m2sbibiYKxhQ7yw0rQQC2p1
   2ca1F/LgsSKf/UHukgjIePcPq+P0pORVHdzG9WNHerWe53955mhKah5he
   4W/Khtfqdg74vFiKGue/JcEqRblH2Iq8+ze1Hm95jbpLyKXJTMCoyXEm8
   hI6YRalSU4574jec8BALRs1rTrhYTIsXrkvTH7tEwKDoMInqwBWGNkTdd
   A==;
X-CSE-ConnectionGUID: fVkuU+XvQ+++QFphmfyNnw==
X-CSE-MsgGUID: C1kTEIHYTpm+ew8MFEORjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33059833"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33059833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 03:42:32 -0800
X-CSE-ConnectionGUID: FwlySkZgQJuLsFSkE99B9A==
X-CSE-MsgGUID: 8z7KTRPnRtm4WcClANHRYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="94906048"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Dec 2024 03:42:31 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJAFY-000485-20;
	Thu, 05 Dec 2024 11:42:28 +0000
Date: Thu, 5 Dec 2024 19:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:8250-cleanup 13/13] kismet: WARNING: unmet direct
 dependencies detected for SERIAL_8250_LEGACY_ISA when selected by
 SERIAL_8250_HP300
Message-ID: <202412051912.Un56zNLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git 8250-cleanup
head:   babed7b34c5946d07f915c7e4aab26fa2470ff86
commit: babed7b34c5946d07f915c7e4aab26fa2470ff86 [13/13] serial: 8250: split out legacy isa driver
config: m68k-kismet-CONFIG_SERIAL_8250_LEGACY_ISA-CONFIG_SERIAL_8250_HP300-0-0 (https://download.01.org/0day-ci/archive/20241205/202412051912.Un56zNLv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241205/202412051912.Un56zNLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051912.Un56zNLv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_8250_LEGACY_ISA when selected by SERIAL_8250_HP300
   WARNING: unmet direct dependencies detected for SERIAL_8250_LEGACY_ISA
     Depends on [n]: TTY [=y] && HAS_IOMEM [=y] && SERIAL_8250_CONSOLE [=n]
     Selected by [y]:
     - SERIAL_8250_HP300 [=y] && TTY [=y] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && HP300 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
