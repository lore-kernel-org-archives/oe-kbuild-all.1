Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35C204F9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 23:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970152; cv=none; b=en6RoLsilKy9SirUnw0UC3GBAWpC+nhGINS8ecTir3LPDTU1FAEUk/Bu0PfbHDglXhZpsIqxgtR6gHqzgFcRsoxoOm8ITASSm2+KVyCgi+A1mQ22QpPJtjym/DXVwxMCvF0yLVcd5m+6CWR0vUtt/4qCP88MjhxMAUAyUjD52E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970152; c=relaxed/simple;
	bh=QOgibosxGDe1T+DY09n8TAK0W8dcCy94K2x+W3+TMWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJKwiVVUH4Lmz0LluQRL51qPe/RgaPOKPTwzV9hFaw4LtIXtD3MkbUkMwFS5FrPWjrzLUAEBax9SySsSv6387QyD4ZDcZKCcrBDAuqWRLOwXWyvH+FSGwNKDRZtuuVtfF2RU4PMnI0vwnpUV7u7AUyBzMkKp1o7Hrl8tjYq7a3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2gP89S7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2gP89S7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745970150; x=1777506150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QOgibosxGDe1T+DY09n8TAK0W8dcCy94K2x+W3+TMWM=;
  b=O2gP89S7KzsYsLXn43A4tKJBEWJRUntvJJtYsUHW42EzJsJak0TEm7gx
   3Mp4hzMCxScZZYM6zyNOT9UOUA4DL9IDyIXYadrX/0rbGrosYfO5863LA
   Zyut0m8jHumStbLMMZJROsYHPCETrtf/DrpH845sucRqgK023JZAX6n+o
   td8kpIYN4pYZJucYJzaZL0uQA7pBU0VKDNMu3aqlf5Qoe4/f+ixRnu1IY
   /9eIzNVmVHUGJ1TRmae2j2duGi7cHRQ+mLK6rbP58j8jzU7ApCSICk55o
   J5s5vC7bMDOIo83ixulgwM68KzLvZRX+xEnxDVBmBqf7O5Bl5k99LfIuZ
   g==;
X-CSE-ConnectionGUID: ffpdW1yOTbmL50ZPX5a/7w==
X-CSE-MsgGUID: YoYIfb5hS+acFTQZGfbADg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="65151204"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="65151204"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 16:42:29 -0700
X-CSE-ConnectionGUID: wq9BUk/DQmGE4yeHR06lgA==
X-CSE-MsgGUID: jQpv6YKHQG+rKAddi/+Mrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133871247"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2025 16:42:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9uao-00031f-1S;
	Tue, 29 Apr 2025 23:42:26 +0000
Date: Wed, 30 Apr 2025 07:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/7] kernel/cpu.o:
 warning: objtool: write_cpuhp_target()+0x232: unreachable instruction
Message-ID: <202504300708.cOHQhJm0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a5dd34cc79ba9654a63fc26c7187ce9dddbe583f
commit: 270700e7df960fa227c2106718578302bab8ce44 [0/7] cpu/hotplug: Make target_store() a nop when target == state
config: x86_64-buildonly-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300708.cOHQhJm0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300708.cOHQhJm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300708.cOHQhJm0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cpu.o: warning: objtool: write_cpuhp_target()+0x232: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
