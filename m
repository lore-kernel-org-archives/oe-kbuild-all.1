Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4157635677D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342662; cv=none; b=aFl3AQowncFZpJ8fjfiNwQBFv20cDCD5H+la3NAsi2C0WyVX92PI1wm6SoAUCHmGP4ygJaQopCUSWiWObEVymggQyghgc2medvPmXHu23AAKeD/bEgD1SUiVWCuqyLrZJ/UUJjxd3A2baow5YhoRGmD9KKzHNsX8TWzrK8rBvoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342662; c=relaxed/simple;
	bh=4MyZPfxbjV3KZc30QcCFiR+Squo0GTfJBOEzL0ZHW38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m7sAaFslTJeilN2cgrzb6B6+h6wxXzBgzMJotDZlgxBN8HOGLj8r4LN81Tw/A0jac5XMoDBVBUDCdJr+nU2cmcmIZ2VkbBJAOn+XGQwzmVj8vheyG0FDirxQOW/ZT3HZ9k1zgnk51w9Ax/QAC4SddOG18qCAPCXSQuU2CH40XqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIdfdakc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIdfdakc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779342660; x=1810878660;
  h=date:from:to:cc:subject:message-id;
  bh=4MyZPfxbjV3KZc30QcCFiR+Squo0GTfJBOEzL0ZHW38=;
  b=LIdfdakcHQPYj8euYagN9+bZLrH3VGWXoXGBuQ+w3d3n14W2ysXi5h8F
   TU4+mCtNm6wz0gjYpb13eoWIBc+TM068xYC9iURFui3FoDBozxD9bNqvR
   h8UhsHZaFaSIR8lIsrk3zjUllLGIzMWswWF3cNhLu3ziQQ2sXyJV3prbm
   RlhvjZor/pYlJZW6xJPVEwfm00UQv1sdpE/CwzRQA6eQYNZno98T2C5pO
   nxFgWXBA4hOdob3uRHuRkocICnojYrc14s0K3+xjQRtOxf57uGRMNIPeC
   9o6kc3TjD/glE0vai8qZdP7cfGkYehFS2j/OC9g4tj7A6A455dxgB5gbz
   w==;
X-CSE-ConnectionGUID: T1uxtA2aQxGzleCceGa3kQ==
X-CSE-MsgGUID: yVFWcfEhTP+6MAGAgvAJHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80236126"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80236126"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:50:59 -0700
X-CSE-ConnectionGUID: UmcFxMKhQOKoVMHt22n5Ow==
X-CSE-MsgGUID: 4ea9cmJGRLKqw1xMgkxJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="236182947"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2026 22:50:58 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPwJ6-000000004UJ-0ChJ;
	Thu, 21 May 2026 05:50:56 +0000
Date: Thu, 21 May 2026 13:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 44/44] arc-linux-ld: timekeeping.c:undefined
 reference to `ntp_get_status'
Message-ID: <202605211337.3aBImQzS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   0351afde272ddc6e1f1312297a5e084c598ff4b0
commit: 0351afde272ddc6e1f1312297a5e084c598ff4b0 [44/44] kernel/time: Add /dev/vmclock_host miscdev
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211337.3aBImQzS-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211337.3aBImQzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211337.3aBImQzS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_adjust.constprop.0':
   timekeeping.c:(.text+0x2576): undefined reference to `ntp_get_status'
>> arc-linux-ld: timekeeping.c:(.text+0x2576): undefined reference to `ntp_get_status'
>> arc-linux-ld: timekeeping.c:(.text+0x2584): undefined reference to `ntp_get_time_state'
>> arc-linux-ld: timekeeping.c:(.text+0x2584): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
