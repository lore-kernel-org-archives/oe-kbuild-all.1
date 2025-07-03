Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C91E288C8E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 17:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751563557; cv=none; b=E98B5uqOyG57dj2hVCO7QNIH/dKn3nL4iXv43S1qPGl/TCaPLOC6zXef3ucdrudSQ23SG4NNLhCuDytO5gtBto7b41TL/vvY1YrgSyjVR44PCcr60MOOGGrtJ3TeYdBsnd/QkhQpJoYv4m1dpljLg1lRdWM003MtUsCbtybH7Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751563557; c=relaxed/simple;
	bh=k32CtKSjw1lWybQ1M8mvYMgFwEdmhO/lav+TPlnDRDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HB/7uf7VD5bzLbP0hZcecarZ7WYgx5+hSMjosAGhyeAn3Bkz4CqF27WiO4RJ33wTacqfmkx2YJi4v45flkhd+wZOp/IjM9re/Vh+I8sA06wzEh6usAxR4eox/LRt5OBrX2+HTQz0eK82PycRwdJNp9jmaE9pIHYCFzbAuhcOCdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2wBdxFf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2wBdxFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751563556; x=1783099556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k32CtKSjw1lWybQ1M8mvYMgFwEdmhO/lav+TPlnDRDk=;
  b=e2wBdxFfRnbAOstPFi3GOncSxTqCtU2l/2P7uLCCGpeb2tYejPSAAM7S
   ZiLOXXvo7qCdkJH4uPbTIOnkIFF+oH1HdpdylmIRgu1QBHcvNbUM4sFcB
   xy/XwCVKxr6BLuzFwLtuh4syrAd7JnDx2CfH/neWNRsgOdMTHRlYJByJ0
   Cmy/cXVQnuPkSyAi1xYV4as9e3uDdABMoDvOUpuuWzI6kv5n3wrwjyIzH
   S6g/KlFCORLN8n3uI/H5PWxg1cprMuvjPzBAqmYqvoKj5ArcMiqmV9Lmr
   y4Cx9hH2YzllJtNIRPAwVKKfbwi23tFL9ICtC37Bw6SPHmG134Kc0YRyP
   g==;
X-CSE-ConnectionGUID: Xj+LC3JgSv6S9L39Ham0tg==
X-CSE-MsgGUID: enTRpYEVSICkD20OndsYEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54014507"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="54014507"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 10:25:55 -0700
X-CSE-ConnectionGUID: 4DcNUBVbQM6A4OsFurvadQ==
X-CSE-MsgGUID: VSdTH4uISHyaO2p0+iaZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154069012"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2025 10:25:54 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXNh2-0002q3-05;
	Thu, 03 Jul 2025 17:25:52 +0000
Date: Fri, 4 Jul 2025 01:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 4/4] kismet: WARNING: unmet
 direct dependencies detected for INTEL_SCU when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202507040117.pOCZfIVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   7b423b7f82f1447ab090e96318cc6ecb6121b23a
commit: cb2eff1500d4d5b48b1f2955d5b5490f0398088d [4/4] ANDROID: GKI: x86: Enable Intel SCU IPC as x86 hidden
config: x86_64-kismet-CONFIG_INTEL_SCU-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250704/202507040117.pOCZfIVF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250704/202507040117.pOCZfIVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040117.pOCZfIVF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_SCU when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
     Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=n] && GPIOLIB [=n]
     Selected by [y]:
     - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
