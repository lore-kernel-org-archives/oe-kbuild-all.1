Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120A3F9A12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758176; cv=none; b=K6zH5zoTIO+55W8swISyfo0dYmFEDLTb7ngEnemQmMJRzzOV6ZWEsxAx87zKosArYsMfTAm1qWtlAKs4YAmP2obKIV2J2pJksSpNksoP1PZSQ5ym8H3Szcoa5At8AkowTj1Qq0ed4TAursTtpvq9VAFKXR4L9X5UBFRqMwLbdMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758176; c=relaxed/simple;
	bh=FYGOgKZz37QetNIUWTuy2O42l5tFqb7CKHEkV7Dq+lU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DAXcSOslCY0bC1Un3Qt5lj/AwrtwyvSMhHX0WMRWhpYtBilTlx66gDDSZG0cLFREeDjWo7F4CeUTkdvCliRIHSdRRCitVGpDf16bSNVO04kJgaDnLlb4/GyhLzr9um6yu2Er5gzE4QmKpxKJKZXe435AZcaFMCw4MgnkCoXpbgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ux1rqwIN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ux1rqwIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787758163; x=1819294163;
  h=date:from:to:cc:subject:message-id;
  bh=FYGOgKZz37QetNIUWTuy2O42l5tFqb7CKHEkV7Dq+lU=;
  b=Ux1rqwINMYuistXHpF4Qp/UWZ2heR+RKd4OTkI8YHBzexuvkWpYBwcSb
   znM+enktPhnwKXZ5TPhnbC4Wf19inqB5Qn4E0/7jvtDyQxRE8/kLRT06v
   2VNJc4CjeTb2DElDCS9PusGAca35FuAvDmCAZ9U9GMQ5PxoczavAAKNUD
   Qtxwr1LK4HnBd+uuGO4qZxd7xeiB5XNibpUFiWht7VrgnPfWLR7qzmklU
   E8INpXegFN4wTkNsJWGzU8uWUaVlCPp8JP5jA9vJnJpKFjpIYpXzIPiTm
   saHcJb0R+R8a1z8eobSTu3WMXLrgmkIhc2tnGRIwSy6UENepTduY1lDL2
   A==;
X-CSE-ConnectionGUID: 9QS5ums7TIOTG5IfyV5hqA==
X-CSE-MsgGUID: Z05FmbG/SlyYIcpom/e1Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88271581"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88271581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 08:29:20 -0700
X-CSE-ConnectionGUID: BRkhhoIfQB2FnDkpJkOQKw==
X-CSE-MsgGUID: 2S+MY3DvSWmTcT95VpRNSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271408750"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Aug 2026 08:29:19 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzFYy-000000000Mr-25vV;
	Wed, 26 Aug 2026 15:29:16 +0000
Date: Wed, 26 Aug 2026 17:28:24 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for DIMLIB when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202608261707.NF189Uzx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   624994dfdb395b0071c731f6940cd7f26df5979c
commit: 1dfbe413d21f18f714cca818435299947bf5649a [6/6] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: x86_64-kismet-CONFIG_DIMLIB-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261707.NF189Uzx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261707.NF189Uzx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261707.NF189Uzx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
