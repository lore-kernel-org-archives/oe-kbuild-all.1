Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C357300
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710188704; cv=none; b=Q6WJPWIVMfp2G7mYl+1YFC5e/QdoFo34bnG/owo+edNye47upIgsIY7LX6d1TseArHHtfYhdIpZ9Nf54mr+KuOr5x1TSg+p0Wa7EeXxN/raTSxdJ/yTNH466MiEuJi/7DB0qrAldLV8b2i7xUTRdBinNUApSKumHWczJpR4t9GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710188704; c=relaxed/simple;
	bh=T7mauSTu2sykUuDqTQAHXHhjLTTs3N/3D8wENJUbijQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iYIDjaYtThnklm/VWcX65fcXCQMafHs5N3rO0eZWAyQGa/pwF919EvbOP/UWM941chgkIMC/XjUkHBor/ENan0VQy7Cd1cj3icVole2jf0EFqybYsDxSZhFztaPEFEZvx0kjr7kWGN+MC0hWcWCqMHkf+RR6a9meaZSyhpT5SiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4kimdKg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4kimdKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710188703; x=1741724703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7mauSTu2sykUuDqTQAHXHhjLTTs3N/3D8wENJUbijQ=;
  b=E4kimdKgqnFO2ttRjYXAENKs/G1JuZhg2pq+q2gnLHJINp+Sb/H75NRv
   tbcyTYAabbwiTBDQXmivkXSqkesDWsT+ti8k6StsG/5Gwm17jN7NLaije
   xqxxw+0rO5pbqdjY3+Q9spM55J8QH7ojUklJYKnJ6/XgIqOoC91e3UvCM
   nJ0RxBzt4QatJHMEScaZYqQmP9/h3wROG7qd11rTbwJwMxZTpEvxyxz4j
   JZmbM95WCaHY1l9EMhhyRz4gLaGjpTyrC9k1I5NQecZtY3BQcfbjiBjwu
   iMNZe0KuilF6NvpWRys+AKkkZH1jDJYgvd13bXe8q/7iXX0n+BgWpqnM5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5002696"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="5002696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 13:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11354634"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2024 13:24:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjmCe-0009Qt-0e;
	Mon, 11 Mar 2024 20:24:56 +0000
Date: Tue, 12 Mar 2024 04:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26638/27506] page_alloc.c:undefined
 reference to `vm_pagecacache_system_usage'
Message-ID: <202403120416.MHN1jcwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: c00014331fe35823156c30381a646b4dd7b20689 [26638/27506] rue/mm: pagecache limit per cgroup support
config: x86_64-buildonly-randconfig-003-20240310 (https://download.01.org/0day-ci/archive/20240312/202403120416.MHN1jcwn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120416.MHN1jcwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120416.MHN1jcwn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/page_alloc.o: in function `proc_pagecacache_system_usage':
>> page_alloc.c:(.text+0x6e47): undefined reference to `vm_pagecacache_system_usage'
   ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_evaluate_cst':
   acpi_processor.c:(.text+0x348): undefined reference to `acpi_processor_ffh_cstate_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
