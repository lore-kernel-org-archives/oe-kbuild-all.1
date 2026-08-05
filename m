Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EFB3E49EA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934081; cv=none; b=rv9VP3Ia1PQVTFzHX2S06YfE/5GqZIB830pgY4WOCdWWO7xuRpo1m9Grjf6BxwSj5OjH5RkBPRgqxLIQIuXRrbcJ8m24MfKHQP/8NRvJ3BCyNi+vR+YT+kKkJJIUjpM44QpSphcR/7Ah7nOC4tea75s91Q0JPyyu0gTSiYsqytk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934081; c=relaxed/simple;
	bh=BleEvRZ6KgONmf56pkN4iemlj5ZJLRzE3/L+Ac4D/YA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sjWqvEB4/0ab3od91W1xbcP2GmBlvGArbYj0fvshlaNNPHPc5YIfdTbgoHwIOF6GYX1fVVtRqnK3JMw+mCKFtCUHxckfDCF9ZECYLBjCQZzrXIqdxr9haC3iTtXuWnIDrFGQCugN51ACVQKIxfEnDVjOUMk8jkvNYg46NvQBIhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObWl9Qjt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObWl9Qjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785934080; x=1817470080;
  h=date:from:to:cc:subject:message-id;
  bh=BleEvRZ6KgONmf56pkN4iemlj5ZJLRzE3/L+Ac4D/YA=;
  b=ObWl9QjtEEfhP2myoUMxHg2D1Vo21YkT0iC+RJaebXJNmYCD57C+fXGn
   RdQrXjDlgtl5hmPwgCqKhF8mQZmV/S3B6IXHgWF1RwHz7kSjAB50sVVI6
   C3tXxR1hD0fPZE1Xh4XYb/S+66zDLetoCin5XOoSoaof8rYKA/5cwc/5O
   GL8rAQYMhLlSwzkGEYU+wgZVLbwIzSGORh/kNqLbyF+4foEUs8hmtqdKd
   B4pEEt6TZOb7II11Sc3LBz+Z8VTI6aPJv0BcmDwJMaP8tPXdw0vUrVdQG
   cSpm1jYccu/83/pkWNBGvdz6l/Vh6LXVkMQhEhjKhx4v6729RKZCtMA0Z
   A==;
X-CSE-ConnectionGUID: EmmU/ymrS4u2ZEZvTOg8Eg==
X-CSE-MsgGUID: RvSKri+xR2ujcx6akRhFtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97100809"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="97100809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:47:59 -0700
X-CSE-ConnectionGUID: 927Mmbt6ROeFu5C9TMS0/Q==
X-CSE-MsgGUID: V6qHwFCGRNK2LZdexKQ5ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257936262"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2026 05:47:58 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrb2J-000000004Oc-1AYz;
	Wed, 05 Aug 2026 12:47:55 +0000
Date: Wed, 05 Aug 2026 14:47:16 +0200
From: kernel test robot <lkp@intel.com>
To: Natalie Vock <natalie.vock@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: Warning: drivers/gpu/drm/ttm/ttm_bo.c:516 Excess function
 parameter 'ctx' description in 'ttm_bo_alloc_at_place'
Message-ID: <202608051432.7IfYvDxz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Natalie,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Natalie-Vock/cgroup-dmem-Add-queries-for-protection-values/20260805-081306
head:   a16fda2a6dc866a03255c79dc38d5b43dd82e134
commit: 7836cb30544a8abee6b1266bf1e9697c0cd189e3 drm/ttm: Extract code for attempting allocation in a place
date:   13 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260805/202608051432.7IfYvDxz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051432.7IfYvDxz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051432.7IfYvDxz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/ttm/ttm_bo.c:516 Excess function parameter 'ctx' description in 'ttm_bo_alloc_at_place'
>> Warning: drivers/gpu/drm/ttm/ttm_bo.c:516 Excess function parameter 'ctx' description in 'ttm_bo_alloc_at_place'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
