Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8317E8E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 00:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943006; cv=none; b=PSJEoL4Zb1sZREY6qL/3NCwwGGwvo9dV5hLCsDGmt7ZxScCKh9r3xKQkH0kgGbKco0XLRmh4JtrI9uRLQpwWT4tJ7tuyGqxuxG4ssABO3vi+QjzV9jy9tEo8ZJh+LKs8tAFnH9Y3xsGMVAOcr47zl5LSv4vq9xVTZWqqtdIWrDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943006; c=relaxed/simple;
	bh=uwDkLunLwjity6zB9oYaQ9fbDslgtTAovlJYkP9GbZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mo3pW3M/cUWNvv2P26+prbr+8nx1287OXTLRlNUbGDn9l4GqMXSjsYMepryJb87d/hcoLYo4XCuU0cEaUYZ1Q59afGlJebzNTJBLfS/KrOzf0sNlLt0AtDlocQg7B4PXfpsqQK7NviKHYICO6AXQmgFXKWKO3nphhyUN12H70Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YR6FS669; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YR6FS669"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716943004; x=1748479004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uwDkLunLwjity6zB9oYaQ9fbDslgtTAovlJYkP9GbZ0=;
  b=YR6FS669sB4QlTMTut0ZV6IYvaArXaZeBjIDTVkhkgVfbAZDU4Of1rwm
   Yu11t3IImbN96a5Q/4rYAzS1ysNL0bnd0ERdlRmfI+EFDmGy8v4KPepRv
   ie4wAUWXLInpS+TkOwlGZXhevolgr5UVXltdXWhVA25PjaY2JhTadIXwk
   Qb6gAoQk265fU9NpKaPiad2bu22uLVdbbaBPbj9k8tnS36gusLAZiZ5yv
   Tc9J45CT4FG4ja0wZB+cm/NnaRs3X5KD5irC2VsMKBH6/GHVTkEkgzzCm
   yxk74wMpbvIi9ppC4vql5V7j99KSrbP228JPOn27JASFQ1qo7ZmR/Xmrc
   g==;
X-CSE-ConnectionGUID: flFNuH3HQPK+rTAIhsFTFg==
X-CSE-MsgGUID: fzWIqu5MRvqn6bGcOo5neg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13142890"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="13142890"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 17:36:44 -0700
X-CSE-ConnectionGUID: L7McAlKQRICuHsqEA4Nupg==
X-CSE-MsgGUID: JDy5juobTpGxpgTmWsc0yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="39770111"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 May 2024 17:36:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC7J0-000Cvb-2k;
	Wed, 29 May 2024 00:36:38 +0000
Date: Wed, 29 May 2024 08:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 65/98] ld: cpuset.c:undefined reference to
 `get_idle_time'
Message-ID: <202405290837.WFaDE56x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   724ee3c4545840fd6d1af9474de10a9404f4d6c5
commit: f02c35d2e66fb42ca03914d72b8e25ed8bf6e688 [65/98] cpuset: add cpuinfo and stat show
config: x86_64-buildonly-randconfig-003-20240529 (https://download.01.org/0day-ci/archive/20240529/202405290837.WFaDE56x-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290837.WFaDE56x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290837.WFaDE56x-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `cpuset_cgroup_stat_show':
   cpuset.c:(.text+0x4a469a): undefined reference to `get_idle_time'
>> ld: cpuset.c:(.text+0x4a4c4e): undefined reference to `get_idle_time'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
