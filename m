Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40A017E4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746651440; cv=none; b=J2aXCXme5ptk1/7SdvkjNTEv2GmaQHfgfzd97k7LIhhKh1GhD4bu80BJ2z0YOX3Gz/0RDxj+f/2SzlYACOc+9aCbG4Nhwxda0CI3oeILUaskdVRzjWboXziH3dsxubO/DmAVcVsieEdcDbwEoBFiJdGw+SzLw0DCCe3+JBPaHmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746651440; c=relaxed/simple;
	bh=8IW392Kjhaijah9WBUgZZRYibUMBXOVg6eQlzliPzkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQjkImSHBQpNSbCvVdDBkEkq5ZyUtLQgLZ3LRbrQDj3z+xzeZHrpLUgmRk397AsJi7ruQbRbEqDaulPPVwdVPFkbLmFSaNJahPAx/1LPtffL83Gvn25obicArr8SWH86GyOAveTPvKNZ7hvSlXmB4n/qTlnjUcQzPKcdsd2g3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUAbwtrr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUAbwtrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746651439; x=1778187439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8IW392Kjhaijah9WBUgZZRYibUMBXOVg6eQlzliPzkg=;
  b=YUAbwtrrkgUEwElzzcDTcQesI5y0honAlKea7RuvMUAw6m4GOr8cTmFd
   5ukhlX+z2b+SAKvTmAnWEXZ5l5fGQk3ez84SBdRuYtmewDdjQ92wBzH0B
   vd9X/QpHjSTYrM0Oc9eLVdybBn/i8zheOgf8kG/CYz60IVYsBiOLIwzFA
   dHM5WtLqaP2nM0LylJB6WYP2ia1vE9YGxucLST4GcL6+m/SPTqhSHuMWE
   0BpDpO1WIXa+XDE7UTR6dPNAOifVfD3IyAnSeOraubiC8DOS7L9s0bNl2
   kTaNgw5TBQiJhTLAxu3oVa3t1AhrxJbENGjah42qJBqKHmREUdDjCkMFp
   g==;
X-CSE-ConnectionGUID: wKL1s1cES12U13wm+WwPrA==
X-CSE-MsgGUID: YwH8bkUvR3iBB87f6Nd72A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="36038685"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="36038685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 13:57:17 -0700
X-CSE-ConnectionGUID: as4DzzrVRMCtZ6J/Gtyzww==
X-CSE-MsgGUID: XGNRC3EPR/GnVEjtYElcCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="136467904"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2025 13:57:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uClpK-000931-0t;
	Wed, 07 May 2025 20:57:14 +0000
Date: Thu, 8 May 2025 04:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for SND_JACK when selected by GKI_HIDDEN_SND_CONFIGS
Message-ID: <202505080409.FGbPETQd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   f4fe09c3ea58e0ea446946a3bc71e768430341f2
commit: 1e702f432d551041753c46ec0d6d49484e776441 [2/2] ANDROID: GKI: Added missing SND configs
config: i386-kismet-CONFIG_SND_JACK-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250508/202505080409.FGbPETQd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250508/202505080409.FGbPETQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080409.FGbPETQd-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_JACK when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
