Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBCB27280C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766473481; cv=none; b=lYpczCyJGjU5nIKcWLz5AAmModmOuQ2s+NIP7JEYV/xjZrTdf+g09RHtLg1z6Lxk5Z6FQKelVYgs7NozZ5ZyMWbSVp2D0UQAxeE9wmMA94OYH0CAF/SpgfuHnCg0oPEzhKyGZCwpsbRDJMXF+g9eEGw/5TKpL7hjfZpAjIQWM4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766473481; c=relaxed/simple;
	bh=wboKiTEJMngSZ7TBf/iTdH49/hJM1rnHCNT/pNWQ3hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZ5LaFcCU72DLOsPdho+7F1HX3kp6GhDql5yyLsDEXh3UftpIQAGJntf6/Z/lB+WsD9Mb7q1gmFmfF49jVUHFh6xoay1K4RhtHtaxji9cF17xbTYWBeZwCeEJC38x9WmagOrCFGTOBrVGVnPr36acWgARlhWMkUim5aWEadsYLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/MZokGm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/MZokGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766473480; x=1798009480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wboKiTEJMngSZ7TBf/iTdH49/hJM1rnHCNT/pNWQ3hQ=;
  b=e/MZokGmlDh4StQQfbqeww3AYomOS4ahNB4HG2pHkieaVefkM3tV+aFo
   0wzdb3MjAGzapKeSRy3FQ49xaPXBKlFmRdufscBjvD1z/Rvv+260A6300
   0ok9y/SLFN44fBBvevEorMeA2Zc9p3XtWZNsmyh4UH9T8c2MJx9nFTfEV
   o5IEQAgp6oHkQNd/hoggWtZAKGsOmob9V2SLVmSbNesFCCBSVOR0yeg0U
   eh1khjT5NIgdD+vKJRRIMVmbRWcmRRqdcxHlzDF2q1s1ABCGhOhs9J9ye
   dtI/ZY75olLPZo6cAJxxmgxBp25e5lUL4WkMHnQq0hgHtSBPcLjbDvEqJ
   g==;
X-CSE-ConnectionGUID: wt7ARzGBSV2bNEpuq9kxJg==
X-CSE-MsgGUID: g08/muLXRISAfFZUYyapJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68077307"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68077307"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:04:39 -0800
X-CSE-ConnectionGUID: Teuy9tfzTXurxz0M+hVq2w==
X-CSE-MsgGUID: fqXClFOnSZOMajbZfFj6+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199625545"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 23:04:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXwRf-000000005s0-1gK1;
	Tue, 23 Dec 2025 07:04:35 +0000
Date: Tue, 23 Dec 2025 08:03:54 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] kismet: WARNING: unmet direct
 dependencies detected for NETFILTER_FAMILY_BRIDGE when selected by
 GKI_HIDDEN_NET_CONFIGS
Message-ID: <202512230826.U1l4rWt3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b952cc514e6f0e92951693f5131909bb1264ded3
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: i386-kismet-CONFIG_NETFILTER_FAMILY_BRIDGE-CONFIG_GKI_HIDDEN_NET_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251223/202512230826.U1l4rWt3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230826.U1l4rWt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230826.U1l4rWt3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE when selected by GKI_HIDDEN_NET_CONFIGS
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
     Depends on [n]: NET [=n] && INET [=n] && NETFILTER [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
