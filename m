Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEFF4766B3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 19:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772952; cv=none; b=QLNDc0maGrgPYbjGdWde/FeVW4eR3agOA9r1ysvOa0UHfy2aeNeEeH1Z+S7Hy4UR6C7vFI0JDDTZ0MFXj8j/xDKHR58AVnaEg/CWStN9SeJrMjK1WFRefjFq1BGTMsRt3uMfuUSqazBTy/Lak7C6jYJjgyyKCHbkcShi3bODzFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772952; c=relaxed/simple;
	bh=oCL7/81DZUiP/wwoKDrGbQRcOg2Lf/xcy37qIwdktTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kLYCRtqf2lU135MCYziYule6FR9hG79Rl2ysqeGFGV4j1YI70zvopyv/OwLImQ5mTSyK7CCPSh5LWiaOIrHh3WuVySyf0ErJKZMCeJyhQNWLSjsZW0eZwyOGIjd6BZo2/Wuq8LIOp+s3TfyxGNzReB7Y7Z6RE66OquL2vzqjj7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0esKcW1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0esKcW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787772937; x=1819308937;
  h=date:from:to:cc:subject:message-id;
  bh=oCL7/81DZUiP/wwoKDrGbQRcOg2Lf/xcy37qIwdktTM=;
  b=b0esKcW1OuCGJzmYogyls1qCYccvOmzXF8WJxfSH6y3UyHDpu0EmtTFy
   w6wGuX6g8RzLjScrgT1+J9uJaePSIFHloZaUDPzPDCUKLmPz63EwKKE9T
   IQYMtqjFJQR/GxfhPMae1Ei/R3FHpXQPqpTZq68S3P3Txxf3CZhBqR6VO
   LEJN8Ni3fGTZawqa0rHuZp7HrhitxG2xR0If2xoTpgX5UacvmuVJR/ISK
   W0YFemhK5dBEfYoGU5M8fM2pSrl2hV98TGDH/pWyzmsAYouk2WQx+nyaT
   807hkjzAZO+mohSxzO3wp5Yc1k1TbNbpbfNUXTxJkhWnRTDg3R3KJx/Bz
   g==;
X-CSE-ConnectionGUID: rzyZ+5RaQo2r+0reW44Zyw==
X-CSE-MsgGUID: Vr/i8oFsSRmScRKW9dDagw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="90772595"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="90772595"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 12:35:28 -0700
X-CSE-ConnectionGUID: P68CY5TUSsKC72qbeL46NA==
X-CSE-MsgGUID: HOvnm0dtS/OeJFtAX22E9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="269604119"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 26 Aug 2026 12:35:27 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzJPB-000000000ZF-1e6R;
	Wed, 26 Aug 2026 19:35:25 +0000
Date: Wed, 26 Aug 2026 21:35:00 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for DEBUG_OBJECTS when selected by
 DRM_I915_SW_FENCE_DEBUG_OBJECTS
Message-ID: <202608262123.A3G78k77-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   979736fd0bf896fd1fcc721a54522fbe9e8da958
commit: a473c09666f0c03de02158876fa6241fa866c9dd [6/6] debugobject: Make it work with deferred page initialization - again
config: x86_64-kismet-CONFIG_DEBUG_OBJECTS-CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262123.A3G78k77-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262123.A3G78k77-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262123.A3G78k77-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_OBJECTS when selected by DRM_I915_SW_FENCE_DEBUG_OBJECTS
   WARNING: unmet direct dependencies detected for DEBUG_OBJECTS
     Depends on [n]: (PREEMPT_COUNT [=n] || !DEFERRED_STRUCT_PAGE_INIT [=y]) && DEBUG_KERNEL [=y]
     Selected by [y]:
     - DRM_I915_SW_FENCE_DEBUG_OBJECTS [=y] && HAS_IOMEM [=y] && DRM [=y] && EXPERT [=y] && DRM_I915 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
