Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F630F931
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 21:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765919764; cv=none; b=D81I6W36Mh2Nx5cb6ekMVrYi4TxfPn2F2smu+uZTX3T+nNojq0AXhsl7lXb51Pnn+wNjOhuDKL+GvTGfaqf/n2MuaMALfVGkHyEM0Z5fqX3dJDXHtc4WZmYjNlFycYqxc5QTVEFVQw5e+9o/AvXtvOJuLOxPSrDeSS07t9EvyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765919764; c=relaxed/simple;
	bh=v6kaLix41TH4+ByBODb0cyRel+ZfANctjbjRkWNDLK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SH3MYtbXxS2v0RggMuHq/ZcJ/W7vtLCDb+M6Fxcye9uzv6EvyNRitrefuc/oAW5OYwG8hbXhgTx/5Q/v3JoA9ChqcOrME9RBfL78kcsYAeaj5kAHkClbnX3CvbDw9aoEfyKdC+n8AcrfRuPaP6RfDgD+3pLAX7VPenU/+nQ2AQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLOXokoc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLOXokoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765919762; x=1797455762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6kaLix41TH4+ByBODb0cyRel+ZfANctjbjRkWNDLK8=;
  b=dLOXokocbSJ11XWupxlJ3rPIMh4GdDJ9OVKhZAyEyEU4F73bSznUkR+J
   l/+fy52vHa+XPUf8Ro84qbT+moHohjqKGM6xlhiAuXEMMxKLQQEJNjCA+
   VQAx5WRCiWQOunm6LKS3TEnz9a375RF4Cz0c1xb4F25F+YBdA4H5GUFYL
   Jb32yU19ibaV4lTNlfuXXDmJD0Hjtqq/XZayPihO//d2FFf6P9OgPWWWR
   xkrW3at+M8jr9ZzLNMtFH+aFEsQssTU//3mTH3B5NWnGPXlYuDgKgZ2fP
   SwlMb9t11547mYfnJlHfafy3PtVIl/v8FKlG6CrJ0lLiO+C6wO7K/2ye2
   Q==;
X-CSE-ConnectionGUID: dnkOy2kQQ9Gs5g8C0TVGww==
X-CSE-MsgGUID: DDROIVS4QsGDv+eTxlcGnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78970198"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="78970198"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 13:16:02 -0800
X-CSE-ConnectionGUID: jotNLIZzRHWkKAmJmKezog==
X-CSE-MsgGUID: Qef74fT+RX62zH+LQjzj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="203234629"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Dec 2025 13:16:01 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVcOk-000000003ps-3lG1;
	Tue, 16 Dec 2025 21:15:58 +0000
Date: Wed, 17 Dec 2025 05:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1943/1943] lib/idr.o: warning: objtool:
 missing symbol for section .text
Message-ID: <202512170545.AQrGseNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xia,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   49bc452fdcb1e9ec3f9bb20cd3e15b865a2933fd
commit: eaab6483a9cc9c59427c23d4b45c9990d2888f78 [1943/1943] ida: don't use BUG_ON() for debugging
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251217/202512170545.AQrGseNI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170545.AQrGseNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170545.AQrGseNI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/idr.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
