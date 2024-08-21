Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739D1B3B38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724237729; cv=none; b=poDAJlABOy6zAcALViDctbxcEmINh0moaBfC55m/3/mdGqpXaHSt12Bey5Dd08P/vOVylHBdPmFiQU/KPzKVRu039LA8/DFyLFJssJNChU/SSrxJre+XNCYb1zILaogc+Oc71A7gfuMes9gj6OeWmFSIanKN85pTSAu2XFbFCEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724237729; c=relaxed/simple;
	bh=p1KLFc4MdmrGWWmWPfLn0phWIg6AUs9H9DvoWjGcPXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lB4aXa2wUVsfgoD566UkVFrrhvxaGc1Qnl6WFksOxZBRWFepLJhESZK9yat3zfeR7L3vXzLG5g+ZoZGEGh2k68KtWIkTTaFErC3nW99OY38fwXKmfNbyMds1MhVkpWI/Ip7xCOk3cQK0vtQ+DCJdepXs4fcyUVwCIHUoiaPGjtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNSDNs2d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNSDNs2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724237727; x=1755773727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p1KLFc4MdmrGWWmWPfLn0phWIg6AUs9H9DvoWjGcPXE=;
  b=jNSDNs2dthhX2ezGt7H10N5MtmA27VUhsV5Ko2E/D98fKw/MtxX1xFDU
   LY4kQc1Y+f/mVmjpa7DHReUlNd841ZquuEVCTvveTqob1Bz0JhpxApcwT
   Ip8YmkrEHqx01uZqDL7uPZRJWnCOXWqIQ/aAVYBf0jwr1ktx06vnGhq4B
   eFMikLgYJcIdDJjiF+dznKbt+LlMJjJI0PNY8l9SQvarHKjrzQRJYmc0u
   IFnOKH6COQeWd9G0cQzBwyGHr+kODy2djUmUwWhfEdjr8SPSdYr/EX3WZ
   44GsE+pOPHoRZ87HHzMxY+z+1XTNfRin+sckGDMgAJ4mS2/TCdgwe8uNV
   Q==;
X-CSE-ConnectionGUID: XGGXbAMKQsuXrOAQkve6ZA==
X-CSE-MsgGUID: 5qePlYoqTEa5NGW6kMh6CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="40046432"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="40046432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 03:55:26 -0700
X-CSE-ConnectionGUID: FS48Q9HYQ5qb7rpCJ4pY7A==
X-CSE-MsgGUID: o3xF0wawRKmmkaEE2khHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65935698"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2024 03:55:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgizr-000BEj-20;
	Wed, 21 Aug 2024 10:55:23 +0000
Date: Wed, 21 Aug 2024 18:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/selftests_arch 1/3]
 tools/testing/selftests/kvm/Makefile.kvm: warning: ignored by one of the
 .gitignore files
Message-ID: <202408211818.85zIkDEK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/selftests_arch
head:   e4bc326decd7ca436bed5135fa45a5eef967a327
commit: b06da595b143354ef3f89576c65163df722dab48 [1/3] KVM: selftests: Provide empty 'all' and 'clean' targets for unsupported ARCHs
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240821/202408211818.85zIkDEK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211818.85zIkDEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211818.85zIkDEK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/kvm/Makefile.kvm: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
