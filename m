Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA4212560
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765113946; cv=none; b=I2fSKeycWVRQMIC6/BRj0tdyl/9aFGD7WF5m6XFVlMQWQQ9bE52obJdcz/h+UhCubHOF2Ms9naRxuOCu6ZlnWWdITxA7r2+NfDa/j5FpwP6kcur7v6+L/Zv12z4KdliBtKzq/tLh2kZNfINRoVndem2uq9TdgOs/wufa9Yhn/cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765113946; c=relaxed/simple;
	bh=iG5qmpTjh68QKYBnrkWMpD+fQQ9Lrdxw1IP8eaYsy/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXNTIU6xS3SYhOSGpS8pgIHgj+zL4zsIv0kbk7lATNuD7ZA9VBRMLY4m3+RECdfmI8JG8Yhn2miYFR0jGzdhtTbhyIuAYXH0kPz0s/Etymn0Z3ts6wlGKT+GqGgMTyKApIJoXejrdNkaD9KL9gtmejwMhT0veVCiF6mt94SNQYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQuTegIv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQuTegIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765113945; x=1796649945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iG5qmpTjh68QKYBnrkWMpD+fQQ9Lrdxw1IP8eaYsy/I=;
  b=mQuTegIvWEsPcA8c2cq+tpFbDQvUgcygYm0ZG6TeRK9rWoC+v6pSWsxQ
   Sta+nByYZGTqPRXRFgKMJghy0VPsfq8Y+6EIbMEkF4SizX2GrCD9SU2uX
   quofTn2vYP3OZ1jt0Zb3r7+Dnur3fD8Q3JAOwrSkKV/T6fSmOXItM1H4t
   /NlHtEMFOwDPyghFwWNpkHhqvORaKCUhyaovU7hv2PDwuUHXOy429a8V8
   QhBjneANaKhQhYDk4UdKXGKd7G7qMdCvSUH4LerFkaK/3ASDCphXNPhnt
   EEhEAsK2W2GhuDy3VlCdXlt0+cphYD2KmuconukfJq8h/sa0mqIpXfNvC
   g==;
X-CSE-ConnectionGUID: mGv3setxSSuNa00rHI6Bvw==
X-CSE-MsgGUID: 6IBatvTaTk6PXbAJwM6o6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66970683"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="66970683"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 05:25:44 -0800
X-CSE-ConnectionGUID: zLhzyAC6S06oYKCJNZ5z/g==
X-CSE-MsgGUID: L7WfaHvUT7a5eGbwb9bAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="200150051"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Dec 2025 05:25:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSElg-00000000JFF-3p98;
	Sun, 07 Dec 2025 13:25:40 +0000
Date: Sun, 7 Dec 2025 21:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-nostdinc 4/4]
 ./usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has
 incomplete type
Message-ID: <202512072149.wq8huKjp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-nostdinc
head:   e2e62098929b652605656a82869ed467c2b96568
commit: e2e62098929b652605656a82869ed467c2b96568 [4/4] no libc
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251207/202512072149.wq8huKjp-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512072149.wq8huKjp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512072149.wq8huKjp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incomplete type
      14 |         bpf_user_pt_regs_t regs;
         |                            ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
