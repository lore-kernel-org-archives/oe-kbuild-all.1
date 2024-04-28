Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6715F1118E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 23:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714346224; cv=none; b=r/gRR4ik254LwJcZQFM47D1wxLOXzj13/u294k3DhvSucCJ70RzMTaxXtqWWANjuPT7Pq4ROXoHMXc0I5ZQTfzyNhg9xy5NUcfAoatukCCq9MvUZvMGZdVr/E7F6qSzrQRxgTeJkByXG8piAnwEj1SsUTFxx/I7U/iqkWi5u+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714346224; c=relaxed/simple;
	bh=+rlWYJR/Pq9LO4PN20b6EtHvMZd1J3yYbpzRgCL09Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7Ln5JXKDxUNPLSfCD52oKN7L/sng71uY5n4kA33/XBI/xej21mEFcLjuQXdisFDwtKSzIbbuMfd3dizy1P6tEzfa3w2c4TNFMVnpn8jcOjvsOFEPHtQlax9Y7E7fSMAbC6QI1yelb1z25eUM0bV6uSpvXdhPy6RQAPqKh9n0GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsW3Z31R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsW3Z31R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714346223; x=1745882223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rlWYJR/Pq9LO4PN20b6EtHvMZd1J3yYbpzRgCL09Uo=;
  b=gsW3Z31RXsKXDDkZZEu5xlsuZn1nBsZcWrzy1lTXaRuXddVHA9VCXC9S
   TVsr7r55bt7C1H5B97mOWhPcc4nLHojXBrvchEtTvuOjca3QQeB9hCZG4
   9PGu6p0f3q4c/mXOIpI9QnkLbtLLdJzZM9WDU4+uhUBAr4ri47pTTxKB8
   lgZTg6QlatJaw5o3NH5siemr9itJR/6Dvc1KC21/wgFXrfIsZATOPZuGa
   xLZ6wNuycQeeFgHRTN34PjOSqlThNNixb46A4UWJgq/pWV53B97YwPPdY
   2UwdUYyIGiVzGmE30FrrQgyRmmU1W4W3hlxqiSVUR94eJ0RTPV/gy3QNR
   A==;
X-CSE-ConnectionGUID: FvGWyeqrTEenIemE3blk5A==
X-CSE-MsgGUID: 8GpDxhL7SLSD6iopKxzGXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9924531"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="9924531"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 16:17:02 -0700
X-CSE-ConnectionGUID: MSaEBmgGTaSEyF0agR0mHg==
X-CSE-MsgGUID: N8j1tJBfQda2NpC4sGcueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26014762"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2024 16:17:01 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1DlS-0006nG-26;
	Sun, 28 Apr 2024 23:16:58 +0000
Date: Mon, 29 Apr 2024 07:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4] kismet: WARNING:
 unmet direct dependencies detected for PARAVIRT_CLOCK when selected by
 VIRTIO_PVCLOCK
Message-ID: <202404290724.ZMIZqVjg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   3b5f3b1b982469128579059bc67aa99a4a14a036
commit: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 [4/4] CHROMIUM: virtio_pvclock: port driver impl from Android
config: i386-kismet-CONFIG_PARAVIRT_CLOCK-CONFIG_VIRTIO_PVCLOCK-0-0 (https://download.01.org/0day-ci/archive/20240429/202404290724.ZMIZqVjg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240429/202404290724.ZMIZqVjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290724.ZMIZqVjg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK when selected by VIRTIO_PVCLOCK
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK
     Depends on [n]: HYPERVISOR_GUEST [=n]
     Selected by [y]:
     - VIRTIO_PVCLOCK [=y] && VIRTIO_MENU [=y] && VIRTIO [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
