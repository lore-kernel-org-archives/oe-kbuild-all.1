Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C664D2BF96A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 03:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746503177; cv=none; b=NhvNxkFcMI4X7xYa1URww+1Co0nEOzl0+0VganIvZODzR0tNLTU3x5I9R/kesxcTZHZCpH2mimcVikUc6wj2KSlF7Pl7b/hpHIlP5dicVSxYuTkYE6ysZ+3strLCGjVXWvAFJ3Cqld90zZLpLolNSD9R5Cyd46vDsJF2ynwV3P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746503177; c=relaxed/simple;
	bh=XuyEvtabrQHeacM5h8Ro24OVnOobSLfXYem6+l42yK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQ+yqo/hy2d9xy+fg9Y1r2v/Q5/WQuazVog8xaNmIaqZ87uukFirvEbRsYgUkZfKd79Qqm+K62YdWw6r/Y/EquVe/eihvekclNXHLv4YMH8UPyvKKIe+rBkF2gkJZFObxyDNX0paZ9UR/cXzX6jUUjs2MZJk22SF1dWnAxHmPHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVVdXETI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVVdXETI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746503176; x=1778039176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XuyEvtabrQHeacM5h8Ro24OVnOobSLfXYem6+l42yK0=;
  b=LVVdXETIcbfv4JR9SrgJRsMUEQEmvhCR1qhJ8TIgnIOqEvn6Ep0IOw2y
   d1nyaDHaqFLrG9YJDi9O56BC8sybEVqjCh/p+SdM8a2xVeqem9iYxteUO
   IxNhJQf+YD5Pk9QQxChBy3svLNZhtIVRy/oXuNAQsL/kZf7O7ynHFQFFd
   MbTrnvAAr2PqEpeV1gSar7S+ojxBRCsTxgEBIImePKJMnCNK08aWS4r5q
   jtqEftWHhVCdkoZ6DYOLlrJatKKpaxehjTspWeQj3JrPznSZVkretmZ16
   otM3iPwD3vuM6m7XkpS3c0bOY/IK/SQMZZ10u7wZPCs1mTraVcewfvlDX
   A==;
X-CSE-ConnectionGUID: q0Gmx+j4QWCeMmzYKsp06A==
X-CSE-MsgGUID: B7qtidJRR9yhBZA70xYzxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47253498"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="47253498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:46:15 -0700
X-CSE-ConnectionGUID: Gn5o94QgSsqLJVPe2R1nUQ==
X-CSE-MsgGUID: gOJbbA07SIqtSB35Syj3dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="136438935"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 May 2025 20:46:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC9G0-0006ED-0a;
	Tue, 06 May 2025 03:46:12 +0000
Date: Tue, 6 May 2025 11:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202505061141.V6PsxvvS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: 194fc9ea8a50fa11e9b03bf04449614fc79be59a [2/2] ANDROID: GKI: enable hidden configs for DMA
config: i386-kismet-CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250506/202505061141.V6PsxvvS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250506/202505061141.V6PsxvvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061141.V6PsxvvS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
