Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5F24A047
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 15:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765294692; cv=none; b=pSKYJ2dBWEcHPg28jvT8kDDNPPX9D0Qz2YYPF2hQH8sGtre4pYlx1Mir0im5MP7XmSc4sFiY4xUBZpwC2187npa8LNL7moRgJUsJvyUTCHk+4rZeTVQT6Str+EGSrkE4cXxtuSwPzEwEIJWNmSfMP+sNjyDsrMjZP3gdbklOOzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765294692; c=relaxed/simple;
	bh=+pEm9ytiU8G6yYlk1tQxXeGRopBRZhc6iBjWarUuEdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XXZDWW+dMaxRA3AGlXLXoeUEW4s91Rsv+k6ZtSO41Y4kw8VniaZaercp9RslSktWP1/gnHwSSTLMBlR1ngBUqnr0T59H6XL8c/xIsxVMOikc/9LZSfgAvRJAo5RrOcWi6VKMRPR2zzq+SamtuAwQkZOiH6geyInvLUAkITdg2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QW2xbPNN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QW2xbPNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765294690; x=1796830690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+pEm9ytiU8G6yYlk1tQxXeGRopBRZhc6iBjWarUuEdk=;
  b=QW2xbPNNkX4g55Mlb9uZvhcSQQBWc1KOORiwSiTZopFy/ce88DV7QsB0
   fyXIEZCifWvItvnIUPTVmz8ij/DyOxcTaakTtaWcdeiG0GFXq6pbQA6Wf
   7G0AQwaHCvrqrOoZIajVaKD8CS6stGDB97GBfUG2nheq/UbZy+IOmHFK0
   bzAIAy8Y/I8uYxN7nqXFdvr3FwE1sALNgDa82AU6lLsJFse8VmAakxglQ
   3HsCnVTuduFCljyTdnbtciGM1Wcp2lBLJdja/gn7oOXuQPa5TfF06u7ay
   81E89rRxVETOj8Dtf2UKL0U6c+q8xgUlTKuWCfZbsXAeEpo64IszetC/C
   g==;
X-CSE-ConnectionGUID: F8V08IUTQcSZnuwW0o38zg==
X-CSE-MsgGUID: Hnv5luATTPG6Xhla2r/2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66433978"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="66433978"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 07:38:10 -0800
X-CSE-ConnectionGUID: afRTq5LXSp+vEhJYCyl28A==
X-CSE-MsgGUID: lnOXEaYFR9u2dlzrNJD/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="201175163"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 09 Dec 2025 07:38:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSzmv-000000000IT-403T;
	Tue, 09 Dec 2025 15:38:05 +0000
Date: Tue, 9 Dec 2025 16:37:23 +0100
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [linux-next:master 5663/13990] kismet: WARNING: unmet direct
 dependencies detected for NET_SELFTESTS when selected by AMD_XGBE
Message-ID: <202512091653.4h90hsVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c75caf76ed86bbc15a72808f48f8df1608a0886c
commit: 862a64c83faf7708e7e79498193ff5270543a68d [5663/13990] amd-xgbe: introduce support ethtool selftest
config: loongarch-kismet-CONFIG_NET_SELFTESTS-CONFIG_AMD_XGBE-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091653.4h90hsVS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091653.4h90hsVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091653.4h90hsVS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_SELFTESTS when selected by AMD_XGBE
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
     Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
     Selected by [y]:
     - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI [=y] || PCI [=y]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
