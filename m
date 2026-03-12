Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37563537C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324488; cv=none; b=I5sfk/SaaR89mdciYq+/hC78oQ0PUWxcycPZZFp74IFu/X0tsytobk8Oyr4eyIMSb6IMej1S3Ss8I2ndwuJUL4I3DED3FXQbihnA75buSlSE4zjBsSHb4XRqBlkAtOSnlSRhLNzkkR2c0r+zsQXf6YDIBxlyncm/iidEBIopZQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324488; c=relaxed/simple;
	bh=RIGa/FL/b75Tjkroq35KLoXoDMNPe/WTQ+qaLEjQZ/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sFnmgIkoHFyOadmdDnMixzCQ/OxmQnatob1sVMzWOZeirRjungvKV8wZGgWEsHEICxWESH2XJ4f0/5XXAY2PRxiwSvyggQmdcbwI34O1aw0L74JBA/0XQ+C+LrmbkI/o2FbfXmDV7uHikuoFRRWi0HPfVD267ZnXD1OBo3pdEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noruTpu3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noruTpu3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773324487; x=1804860487;
  h=date:from:to:cc:subject:message-id;
  bh=RIGa/FL/b75Tjkroq35KLoXoDMNPe/WTQ+qaLEjQZ/4=;
  b=noruTpu3CTeL9tyszNQ3Dro6Z3rJHlZA7hXzlwrigU0G3cnjqYBrUDB3
   n3hsqJHVQdEvLepKkSRpb8JU6ryCPeGKlHDno3Vj16ktt5l1IGWJepPUC
   HHpP7RbCctVgIvW6L2TuP8nORvM3pPQpGu719jxtqa6Zeh+TZ5rO3RLB+
   V6b3l5sO6YSlhXbQojuYgURCqKOR0052u+hgweDkE6HawgTjnDIcWjCic
   sKbWSMbtPC7pehCrLdRRWntQJOuW9acHc5jmUlmaHXmai/Eh3mLntOAOw
   lYcOmrJttF5wX805+WrNUoF02Sot72wccnFtMkJRwuRycX3j4CdhkyUk+
   g==;
X-CSE-ConnectionGUID: OhBTEgddTki5UkoxuDae6A==
X-CSE-MsgGUID: X456KR+RSZuIV0BGCZ8log==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74307380"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74307380"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 07:08:07 -0700
X-CSE-ConnectionGUID: r/DuYnbiToO6aWfVXMqQtg==
X-CSE-MsgGUID: AP46iZxNSSCd9HqmDTPuUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="225529092"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2026 07:08:04 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0ghm-000000003Vx-18AA;
	Thu, 12 Mar 2026 14:08:02 +0000
Date: Thu, 12 Mar 2026 15:07:31 +0100
From: kernel test robot <lkp@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1/3] htmldocs:
 Documentation/gpu/driver-uapi:29: ./include/uapi/drm/xe_drm.h:1060: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202603121515.gEMrFlTL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   2b484419700a0f563c695312374eb8cd5264b82c
commit: 2270bd7124f4d25497d58c293cd40ea014ddaf01 [1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260312/202603121515.gEMrFlTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121515.gEMrFlTL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./fs/namei.c:2853 function parameter 'state' not described in '__start_dirop'
   WARNING: ./fs/namei.c:2853 expecting prototype for start_dirop(). Prototype was for __start_dirop() instead
   WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:2796 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   * Software state variables used to program register fields across the display pipeline
   WARNING: ./drivers/gpu/drm/amd/include/amd_shared.h:113 Enum value 'AMD_IP_BLOCK_TYPE_RAS' not described in enum 'amd_ip_block_type'
>> Documentation/gpu/driver-uapi:29: ./include/uapi/drm/xe_drm.h:1060: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/driver-uapi:29: ./include/uapi/drm/xe_drm.h:2380: ERROR: A level 2 section cannot be used here.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
