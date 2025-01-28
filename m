Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A718DF86
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078018; cv=none; b=S88aA5yUKYeCrNW3GsDHmUIfj94zwGyG6ZyUxpS2cCjCqAhRwyPTLh6jM56IYlsntlysYQ9wHWU0QBe3ERfAEc94SJTlHHcgx0xzA9xlMblL/bbFVPA2mVc/QaoiMnYj1722EgOihuVPGbjoD8m8dAhU0U9h9UW3FJ5b0g/YHFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078018; c=relaxed/simple;
	bh=Bw354Wyp0xGKx70CiZMfJNLQzUopJtEMHKL+wQDT6Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iY/JOunFQuZIdm1WqzrwpIH0Rln6DDxRl/Mn/ekfQQyJxU8I3OeGRiHin3ZknOjNVPnLnPs1sZ7aqo4EsDESm/7240HyKzv0zE4sqQESPNOn1qyTvcai2yIG0D3T+YUDjA4RqmoEOv27IIVbY1ldBYJ3utAGRl+aY+x1ZKyQk8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LueNIMyT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LueNIMyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738078015; x=1769614015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bw354Wyp0xGKx70CiZMfJNLQzUopJtEMHKL+wQDT6Ag=;
  b=LueNIMyTg/8F9TZv7EHIOUO8OCUMtut/S7GTfbsVwLnvpkS/It7pbY1V
   vKvRCG/5Pw2V/OY7TCYS3XUvmHrSo6bEHtxITymM6+g3xelBi82/O+2W0
   L2kAYHIFS8MrH46EEixdaC2RPcDFb7D1S9s+KFlFNG04ZaB5NqJoUEZ93
   c1BDft7DGD/VlRkMhhVC2efWIFlFf+mXikSVHn3+JdHKvTRkrHaRvT3A9
   FI86s9pk+iXZrB9W35ovUjSy3ci5HqkszfQTuOCI1V0Lm1/YlX7wuduwA
   6NyfD6yjd4pkj6oVBG1RxVQLci/SYUy3wlpMq/2Fd590/mkinRpautcrm
   g==;
X-CSE-ConnectionGUID: VR493/ZBRRmlSIbg9BDVmA==
X-CSE-MsgGUID: Lan6HmoATdS//NfoGLs+AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38740337"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="38740337"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 07:26:54 -0800
X-CSE-ConnectionGUID: Aply73n5TQWIOl4zugmQhA==
X-CSE-MsgGUID: VJMjvMYMR+GlEtIriuXLWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="108730381"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jan 2025 07:26:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcnUJ-000hux-1t;
	Tue, 28 Jan 2025 15:26:51 +0000
Date: Tue, 28 Jan 2025 23:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2720/2720] kernel/sched/core.o: warning:
 objtool: preempt_count_add()+0xdc: unreachable instruction
Message-ID: <202501282335.hXkI4N24-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   683824f7f33a10565e9afcc9358ed8004d851077
commit: 2fe77d25dac03b271f454e3f0c006616fdce4e55 [2720/2720] sched: Core-wide rq->lock
config: x86_64-buildonly-randconfig-006-20250124 (https://download.01.org/0day-ci/archive/20250128/202501282335.hXkI4N24-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501282335.hXkI4N24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501282335.hXkI4N24-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.o: warning: objtool: preempt_count_add()+0xdc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
