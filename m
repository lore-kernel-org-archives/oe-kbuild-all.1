Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6360311C10
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 23:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766446667; cv=none; b=JEvzt16ZPBhwzPo5txmHrTogDoj6YNa8F2P9q+ATzWy2+ru/z3mLDa04hpsN+8OG3H0+pWOxIsIJiKX0R/j38j9MGtsSw1Uxr4PTvWX2pCdTkA9j63OhrR19SeiON6yckoOtuMB03N/I4X+OKyZ1x5o7+PkB+pcLzMbD8O5sDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766446667; c=relaxed/simple;
	bh=ItqNpTnsSvh1Cz1pRZRPMemct9GKBIojHh0hjEMFVVw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fO1RlhX7oADG5v17uOzf93LlVMDUtEsABASbzAlbmTaZ+pz4VqRL1+OP1l8OmrKOVDEcEQp2dVrBcTzodJhmAUv3jcdTuj/m5QvPZiZathJxabUbqiFHlpqzOmnE5R5Lkd8/zRyUXOmPvS+/SWIY4EnmkziPQt/WMojKcKdteeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dx/Wm/Rr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dx/Wm/Rr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766446666; x=1797982666;
  h=date:from:to:cc:subject:message-id;
  bh=ItqNpTnsSvh1Cz1pRZRPMemct9GKBIojHh0hjEMFVVw=;
  b=Dx/Wm/RrrxHveXnsrZsLSaTUVDFKCRs3Jfj/i/FckTLxv0Tusx7kbir2
   wjYeBvh6FXttczBasQizXe0zxYzjY8Hp4OlkE8OV8pwcbUO3c/h3Sw9sT
   2OFFrR1kPxqxrWLvk90N77+MxlQtoQhbvLAxOa33igRA6jGC0pJRmKnaj
   IOOEa7tRAclQZJv9G9nohISwyQzYK7OzImeT2rMbf002OpHDWDyzDWTvV
   bz/8OLoPxrlh/PQklAfGRIoEz5qUpa//u19UCP4nC7E1QrW9bExnO2S4x
   PY0RmS7db9ZFiUYR1c1jo9b7+44pgwzVbAHtJlgNbZXTomIIpxCMqIjGF
   Q==;
X-CSE-ConnectionGUID: QkrAoOULSZOIlqhhLri7sg==
X-CSE-MsgGUID: mh9VUKM6RnyEB47MEiB6/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72163641"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="72163641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:37:45 -0800
X-CSE-ConnectionGUID: CiKMcBJERpOHsjZC3ml4vg==
X-CSE-MsgGUID: 5ir3CFhiRJydhy3miPzu/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199552106"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 15:37:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpTC-000000001E4-0Mjn;
	Mon, 22 Dec 2025 23:37:42 +0000
Date: Tue, 23 Dec 2025 07:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 32/131]
 kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:14:9: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202512230733.AzUDAgmX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 1345bf06c847f478180ccec454d226e273e5c1d4 [32/131] kernel/api: add API specification for sys_inotify_init1
config: x86_64-randconfig-r111-20251221 (https://download.01.org/0day-ci/archive/20251223/202512230733.AzUDAgmX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230733.AzUDAgmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230733.AzUDAgmX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/api/generated_api_specs.c: note: in included file:
>> kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:14:9: sparse: sparse: Initializer entry defined twice
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:16:9: sparse:   also defined here
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:57:9: sparse: sparse: Initializer entry defined twice
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:60:17: sparse:   also defined here
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:63:9: sparse: sparse: Initializer entry defined twice
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:66:17: sparse:   also defined here
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:69:9: sparse: sparse: Initializer entry defined twice
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:72:17: sparse:   also defined here
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:75:9: sparse: sparse: Initializer entry defined twice
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:78:17: sparse:   also defined here
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:81:9: sparse: sparse: Initializer entry defined twice
   kernel/api/../../fs/notify/inotify/inotify_user.apispec.h:84:17: sparse:   also defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
