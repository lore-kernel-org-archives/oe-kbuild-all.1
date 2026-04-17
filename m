Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A038E5E1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431336; cv=none; b=AXhq5+7D9wAmTJ3oW3EzF9LKNUniMnJaybqk26CIJbvoJofEsilpAXuoHVTlCV9oj3a77SJplIxjLpNmXeWjKyB8DdTRmUQyLVbGqPTdubJ95SdUXjNfCxTKqeX568g92sBcDRFVsOHu4uGNfXWW/PBXhRdFzpRHXpzM2GvRbtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431336; c=relaxed/simple;
	bh=6PSYpeiHptreFUSS8SAlG+Y/DSKJODD2AQRo7Rpwdds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D/qKu2/VWJp9lGo8ezfWz77yalr5pwtPGA5whNRMq+7nZiqdx6XTbnyXMJqtPYLgzIQedZov8vHG7gQ3mwKhdEdEwAjQIxOIkbl3L5Zl5gl2JsMWx0HfoSQQ3wIiGv2Q8VGWjtlHoyuu7uM980yqHXbik7AtBZO7NI51AxsAbsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i85xgpf1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i85xgpf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776431335; x=1807967335;
  h=date:from:to:cc:subject:message-id;
  bh=6PSYpeiHptreFUSS8SAlG+Y/DSKJODD2AQRo7Rpwdds=;
  b=i85xgpf1hJzDUrKO8grOwDr3uq/uuNf5+szqhK1xnSbjHiB6X+S8HM+T
   DDb83ZGbv9dxccyr6/nAhxEuZhYkABgTwDILCG3QeZojvs0d6zPYChuwe
   GBq9L0vLQl6szIcmIEcuKRKeHDvj13ddz+ve9qViMOSWOOgngDvxzyb7X
   4W/P47ZK/BwcAQ3xHoVFDn652z8RUIBOdYvTcDpZNvOKgRXjfBMcxphew
   fVIgme8RWNK6qHjuzVL6sww2FiUtmCdAuzIsZu9owuHjWK3h3iKiTfDiy
   AYDIpjAMqHViHAlLvb5ErxzxZ8nu8cGXK9P3keON0ZOrBZ/i77HKk0qc+
   A==;
X-CSE-ConnectionGUID: x6JhtDxHRN2Kez5mF1TP7A==
X-CSE-MsgGUID: bmKoq4fGRs+uwS1/2dtQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="87746808"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="87746808"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 06:08:53 -0700
X-CSE-ConnectionGUID: 7X2MwBsYSJCptEf5BWmOiQ==
X-CSE-MsgGUID: ZkbHolvCQ7enxYtCT8zulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230954002"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2026 06:08:51 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDiwC-000000000NW-2FQp;
	Fri, 17 Apr 2026 13:08:48 +0000
Date: Fri, 17 Apr 2026 21:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-s390@vger.kernel.org,
 Steffen Eiden <seiden@linux.ibm.com>
Subject: [kvms390:sae-part1 1/27] Warning:
 drivers/vfio/vfio_main.c:1516 function parameter 'kvm_module' not described
 in 'vfio_file_set_kvm'
Message-ID: <202604172036.augJ2Yj2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae-part1
head:   c8ef958593be02ec09131a1f5e2744a98b6c01a1
commit: 1846164a1854e4d1b047de7d300e3213eab53e5d [1/27] VFIO: take reference to the KVM module
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260417/202604172036.augJ2Yj2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604172036.augJ2Yj2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604172036.augJ2Yj2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/vfio/vfio_main.c:1516 function parameter 'kvm_module' not described in 'vfio_file_set_kvm'
>> Warning: drivers/vfio/vfio_main.c:1516 function parameter 'kvm_module' not described in 'vfio_file_set_kvm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
