Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72718B665
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 00:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849029; cv=none; b=JgZYj5ZHN6EDLnkX+805DXAJZ1AUKp+0D6i7FIwnQUzq37jX+JlShonW7xQ9FqIzP43ZQTVMGxca10GoqvppF5AZdqostL2z4c+IXZnqgdCFw0jUgkJWbseILkDLGteSA9+l65J10a+xpCjh3vDWRRDS7IrjbbhnrCEyWe9uEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849029; c=relaxed/simple;
	bh=RwkgwsnL6oiZazuanWCB1UfErt2w0PdPKONSyjQP7TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MbcCMCQD8olKdjIRlOb0cdoCLgjO1RZegHcM0BdTRK6u/1njtpNLMCyhmZAiS5b57ESWW2Gv//k3Ny5UkH1N6UeVvcyuF8FO9VdtvFaNz0h6CSbGZQM10prdGvBrWk8yOsEBoXnvUwe+GQSibYPDLJL9B1MvWNZr3jovfvAhKog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5NJ1lGg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5NJ1lGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744849026; x=1776385026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RwkgwsnL6oiZazuanWCB1UfErt2w0PdPKONSyjQP7TM=;
  b=K5NJ1lGgmn3F63bCmB2at4ogcPfAUzP10mBTTKpk7qaWwj0aavezrX4x
   QtS+649zPwZkRGDLffL/QX5MYWN0NfEqlr+edvLzlBfEQ7vJv3lPrMcGz
   EGiv5NA9vYZ7wf//RVi9m+NOQl7h6hD3M7SDAP4NmSEcUExtj8+iRO8tA
   C+rAThUq3mZmzukWUafDrCmdUt9Z5p94StNDBkXZjwnT/VeADHzjHhX9w
   oS07zQizkkWI29O2XQOfuvBt2I83qTmOXx1wrVba41g84LksK7uWPGVV2
   jdDqReuJ7iG8JCBprgiDAWqq3EWDQNviYuOUSM8pmVbC1QoHgfV1mqVPn
   Q==;
X-CSE-ConnectionGUID: UvyBk//5QwW6IYjFeOioLA==
X-CSE-MsgGUID: qbwVgDZlTcGr6l005wiHDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68912710"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="68912710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 17:17:05 -0700
X-CSE-ConnectionGUID: GXlarx5zQmezsslsuLFX7Q==
X-CSE-MsgGUID: 2hrHyz7NRyibmIX5dtFpfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="130609390"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Apr 2025 17:17:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5CwA-000KTw-27;
	Thu, 17 Apr 2025 00:17:02 +0000
Date: Thu, 17 Apr 2025 08:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2862/2862] fs/erofs/fscache.o: warning: objtool:
 erofs_fscache_release_page()+0x55: unreachable instruction
Message-ID: <202504170830.iw6x6XXN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2affea8965688b8231cf977864ba7539320d5db8
commit: f18ca5e7c9d96c676424c3a36c121697e477ac20 [2862/2862] erofs: implement fscache-based metadata read
config: x86_64-buildonly-randconfig-005-20250415 (https://download.01.org/0day-ci/archive/20250417/202504170830.iw6x6XXN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170830.iw6x6XXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170830.iw6x6XXN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/erofs/fscache.o: warning: objtool: erofs_fscache_release_page()+0x55: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
