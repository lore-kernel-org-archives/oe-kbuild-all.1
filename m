Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE694FDE7B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864703; cv=none; b=tVlfDIrTEIfgZvRdSyrrC48e7z7sakEh9uxXe5uGwX8j7M+NRmcUxufR/+lDfelMdchLvzdm8KNe06oq5kTGi2rAzN3uUWEjUYmagHaclDyTmBQBYdhvvpkpkPCxug2JY7jw8izAHMGMFEJHz6q7lUP/tM6HOmEXIZLpmcAq8II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864703; c=relaxed/simple;
	bh=sHpZeYcRVzhSqj+u5mtOjNdGHRJ7Cf6FccSDF3BOnTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UiPmmkEL7vMjG3AexjfmWvJFImq8zFpdnH/dl70ZgKrIQUHSZ9Dd+P/ST01cUizK4bOZpY5esSGrdRLg5xa/qEXx7nJxEQ7MzTt0X4ld5yc+1N6OqZQk4SgwrKRMGeRjDt+Ykzz9rJz6UWE52P1Yq0E0mrR5ojS6uzvYSMgmKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJScFO0v; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJScFO0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788864700; x=1820400700;
  h=date:from:to:cc:subject:message-id;
  bh=sHpZeYcRVzhSqj+u5mtOjNdGHRJ7Cf6FccSDF3BOnTA=;
  b=JJScFO0vWdhLJPZ9zrLL89gEHfnsov9Az7VoP1VKt/d96n3eeg6FNP56
   O9D9ZfapEcC9VpuMGiqyC4jxcKjiLdZnno6Ih025ebasUg/mN3VOM5WIx
   J0qy/r+SZ0uX8m2Vzg6SOT1PoIknU5zRfNlASy5ZlV+vFVL/+XIbmnWHP
   SPf+mFS49ZgEQvaddPp8R/o8cqqIAUa/eEaYiixSlYQF/Xgn/XDeVPd6r
   BKcrqKcvB8B75dFTGuf7zoBDkM6BKnukJ0tVAj7veHqBAQ7vWZ9b8Jri/
   ahcCfWqZceb8jZfl4LTwFxNjGy8T/D3vdswkYJxGJ2qrxdeOokfnRP6sN
   w==;
X-CSE-ConnectionGUID: tNa2/kcMR8ClX1+m1RQb0A==
X-CSE-MsgGUID: hxI3vEJpTwWFJmx/27n+KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114802392"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="114802392"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:51:36 -0700
X-CSE-ConnectionGUID: 2mbJ76rQT0miRWqdGC5WAA==
X-CSE-MsgGUID: KKCifmybTAuwrstEpI17dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270923673"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Sep 2026 03:51:34 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3tQJ-000000000f8-3YRy;
	Tue, 08 Sep 2026 10:51:31 +0000
Date: Tue, 08 Sep 2026 12:51:02 +0200
From: kernel test robot <lkp@intel.com>
To: Honglei Huang <honghuan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 3/6] htmldocs:
 Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:70: WARNING:
 Lexing literal_block 'struct driver_range {\n        struct drm_gpusvm_range
 base;\n        unsigned int num_pages; // 1: inline_pages, >1: pages[]\n
        union {\n  ...
Message-ID: <202609081240.TB3UjW0m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   18299151caddd61adc977a56ef54c3043f5ed85e
commit: cc2a6cbd6823678fe70ba76f88623827a6e06a87 [3/6] drm/gpusvm: let drm_gpusvm_get_pages() map an array of pages
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260908/202609081240.TB3UjW0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081240.TB3UjW0m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:630: ./include/uapi/linux/landlock.h:241: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:630: ./include/uapi/linux/landlock.h:264: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:70: WARNING: Lexing literal_block 'struct driver_range {\n        struct drm_gpusvm_range base;\n        unsigned int num_pages; // 1: inline_pages, >1: pages[]\n        union {\n                struct drm_gpusvm_pages inline_pages;\n                struct drm_gpusvm_pages *pages;\n        };\n};\n\nstatic struct drm_gpusvm_pages *\ndriver_pages(struct driver_range *drange)\n{\n        return drange->num_pages == 1 ? :c:type:`drange->inline_pages <drange>` :\n                                        drange->pages;\n}' as "c" resulted in an error at token: '`'. Retrying in relaxed mode. [misc.highlighting_failure]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:102: WARNING: Lexing literal_block '// GPU fault handler: one fault, one DMA mapping per device\nerr = drm_gpusvm_get_pages(gpusvm, driver_pages(drange),\n                           drange->num_pages, gpusvm->mm,\n                           :c:type:`range->notifier <range>`->notifier,\n                           drm_gpusvm_range_start(range),\n                           drm_gpusvm_range_end(range), :c:type:`ctx`);\n\n// Notifier callback: mark every instance unmapped in one call\ndrm_gpusvm_range_set_unmapped(range, driver_pages(drange),\n                              drange->num_pages, mmu_range);' as "c" resulted in an error at token: '`'. Retrying in relaxed mode. [misc.highlighting_failure]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
