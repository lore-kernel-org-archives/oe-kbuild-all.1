Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FC13FE648
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538618; cv=none; b=HyAMRKhJ0Tjl12YOZao5pdhObOyUH/W71OJHxrkhTAfKj+G5V5p8c90gqobOWos+wWHn2929lcBaX2yYCGgAdrKbeGdks7d2r9lqtTyEDuTOgEizCabOAS5xLz+I//0aWXOiy2E7LA0E0La+87JbbCXSseAVUpNoU35D57aMBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538618; c=relaxed/simple;
	bh=9UhO3cyThgA3BG2aPbLNVosrpigGoo9M5W1FpWX5DAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hbj8pexJwTX39mohGRB09//YOMnf1Ifpi+hD1x9IfCKeom9rBHAVK1C69UFFaE10IaDhNfAMxnNj/QSOWJs19wa1kaAwmuGiC6uctwuhbtwAybOhpb+seCu4gdaEpbcjVHMh4q+tncA2B+QDFoCkvdSvi8hds+XHKIYkkYkFVuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATfr//8r; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATfr//8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777538617; x=1809074617;
  h=date:from:to:cc:subject:message-id;
  bh=9UhO3cyThgA3BG2aPbLNVosrpigGoo9M5W1FpWX5DAc=;
  b=ATfr//8rILRXII1JjAQuC/Pu6jSz9eSBTbQr037/DCjc7TOnFtxBfRdo
   yqml4KmWpTlWjApBrU4BE3vuyaPJEsSCMcT727ThGEL2GPo/fM0yXcD97
   iU+CcpxYE9tEwTNPHT0uakhH2vaPY9LsLpM4Z4uNIcBrJ7N1vPlfPKCd8
   ONQDcyUU4zCRFNf5vSD8qrBuVWJI43lP7siVRp82hEb/zjz8VS9irUe26
   v7cN/xkZtBCf1SdoqBNOkuULxk1RuP6NtRPWOKmdujIzylgI/6f7Z+4JG
   tyGEafumlUGi6ETwfQPxE0dOfmVKbszh+wOs7/L1QhG6QqWHzQW8xO8Cp
   Q==;
X-CSE-ConnectionGUID: 3LdYgoqWSWKEe+6OfjnLDQ==
X-CSE-MsgGUID: IOoBFYD0RXKh/kUAz5GoDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="95903800"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="95903800"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 01:43:35 -0700
X-CSE-ConnectionGUID: MHbOe4ZzQOyG5XlZunRtDg==
X-CSE-MsgGUID: t8Z1NWHaQK2sSf9FH1hxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="236298068"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2026 01:43:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIMzb-000000004mj-3vjQ;
	Thu, 30 Apr 2026 08:43:31 +0000
Date: Thu, 30 Apr 2026 10:43:16 +0200
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Subject: Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:174
 expecting prototype for __drm_gem_shmem_release_sgt_locked(). Prototype was
 for __drm_gem_shmem_free_sgt_locked() instead
Message-ID: <202604301051.5XrzqTFE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/rust-drm-gem-s-device-Device-Device-for-shmem-rs/20260430-000313
head:   6ae661a89da8afde50bb7294328206588b9e045d
commit: f9f57065e84681c15806c8042ebbea059d29bb44 drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
date:   17 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260430/202604301051.5XrzqTFE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301051.5XrzqTFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301051.5XrzqTFE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting prototype for __drm_gem_shmem_release_sgt_locked(). Prototype was for __drm_gem_shmem_free_sgt_locked() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
