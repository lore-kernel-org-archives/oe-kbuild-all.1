Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B984E3F8ECC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755041; cv=none; b=dqLC20PnskWAumRZyT5L72RhoaJYiDWHVCBC7HZh19gN+LbSRETIL2p237a8slXuUv89qZnwj8y08MaqKg5Hpifr7W7Tm0CP1NzcWDskPXdV9mJC4nWo8QlElf4ENPtJhofr3nYSZWr2nqHxPix4iKFmqpmpVjis4sDp/wi9TjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755041; c=relaxed/simple;
	bh=ax+6mFBnfhfB5DfctvpsxCvIDjHkN5hOCX0j+l/nsqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UqPW/fU7b9uVQFgwS3W4xRK0/6BFw+JfGurcnPxtEa8opomS0cLEX3GLX+R12EI0uTqItkFbssRBD4MhA7cnQtb7xs6LuZsV5Q85RteG+A9xKcajUktm/0paQXhfnaTyWrvDxfOi5JcnNFrQh6iVuDlZJqPGKaEj8F3lwCz6Pgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mh6jfmL9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mh6jfmL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787755039; x=1819291039;
  h=date:from:to:cc:subject:message-id;
  bh=ax+6mFBnfhfB5DfctvpsxCvIDjHkN5hOCX0j+l/nsqE=;
  b=mh6jfmL9nNP5PIlrDiOskxdgWcTJQTIfcAVqguNbg1srNxGvWwynFYGx
   /fDj5YTBpx/Y0UkzMG2M+jLTNc/oMY7/M/BT0Y3E7QNgkBoeOTlUzJpJQ
   XPEnfC4y1F27TalawYnVQxtRSfyQCWnbssYQZMZe9PlEl6pIEEuevX0s7
   52BRz947oYC4UHRQV1Lzy8T/WsGa2dNVhlj53i6mFgVlpdGa7qTd7fZj4
   5fGDLODO1ZOBTb3+DqZ7fp/5yorJ5LwOkUlhIVP1I7gNQIkRy+Fas/zN9
   QcTrPV3vaQ5QysU90xE01EwSXXgkveZ2eKRRDAbp1rmXUZjEceQ4+gLJr
   w==;
X-CSE-ConnectionGUID: FR30LJHRR32bvXehUb05DA==
X-CSE-MsgGUID: uNinf/SbSHyp5LkWHaXiTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99398562"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="99398562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:37:18 -0700
X-CSE-ConnectionGUID: rhtvGqI/QfSCeZh8u52mWg==
X-CSE-MsgGUID: gu1Ty3VNSiCWh8M2RiBGEg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="292454478"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Aug 2026 07:37:17 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzEkc-000000000Kb-3VAy;
	Wed, 26 Aug 2026 14:37:14 +0000
Date: Wed, 26 Aug 2026 16:36:59 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for DEBUG_OBJECTS when selected by
 DRM_I915_SW_FENCE_DEBUG_OBJECTS
Message-ID: <202608261600.a5YchTrw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   624994dfdb395b0071c731f6940cd7f26df5979c
commit: a473c09666f0c03de02158876fa6241fa866c9dd [6/6] debugobject: Make it work with deferred page initialization - again
config: x86_64-kismet-CONFIG_DEBUG_OBJECTS-CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261600.a5YchTrw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261600.a5YchTrw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261600.a5YchTrw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_OBJECTS when selected by DRM_I915_SW_FENCE_DEBUG_OBJECTS
   WARNING: unmet direct dependencies detected for DEBUG_OBJECTS
     Depends on [n]: (PREEMPT_COUNT [=n] || !DEFERRED_STRUCT_PAGE_INIT [=y]) && DEBUG_KERNEL [=y]
     Selected by [y]:
     - DRM_I915_SW_FENCE_DEBUG_OBJECTS [=y] && HAS_IOMEM [=y] && DRM [=y] && EXPERT [=y] && DRM_I915 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
