Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3AF1448F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 23:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732837314; cv=none; b=gRXMQP5zR6Srw2AyEFP8OZ57R9jW01BoBsRmdDXdizLDYHLqz+Gy3MdW8WW6rH60lI4FTPixKMSHNmeBqmTKf1vQ+UZUUxgSXcXs6Duj5bgDdctkasa84fEpe/tGPdfSvJ1iX/oNo6MHxX+D93IsdD/edFhjALJWvrBYzICa+gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732837314; c=relaxed/simple;
	bh=meQ5o4g1cofdu5QSnxXHFf5t8/fs6P2ph8gcCWFsJ4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkdjaa2928WnuiPia8kg43s5IEIHBtd+npdXxuMEQy1iZgUqEXhEmbV4kA1+MhNbMLzOk2+eLRIuQyN0Dax3hgWscIReDizsiIBswpyuXcNc8K2ya+xIuUuTwgLHKv5DZ9/oUVOcW/5gSlA+0m/o6UFpRdhkhYRP+o/rs5nZ1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lslHUip/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lslHUip/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732837312; x=1764373312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=meQ5o4g1cofdu5QSnxXHFf5t8/fs6P2ph8gcCWFsJ4Y=;
  b=lslHUip/KIa17rwFxUIH8lOCkQOIiP/QrmztA8nqltyAFgyO6EuF/Q3n
   okAQHUOP4EQQ7CBYWnNnX306CCKv3qVafu40a/KP2A98SR3D6+I9Xn0I7
   h5apgnGvUI1wH9KDxdsyMchSEtP49lLpgsDp9Ab+krs7cPEULBCJfmHVv
   B1E8TL4/dlyevjY3GqC7eDVX9qIMIgGPAUqtJTagv4H90fCUjIcaJn7bU
   KQ+J4YZfjGn4S6uIPVh51/TVrFJNd/RLo1xkQTHFvcYECjkfWTYdP+y5u
   vHKi63XzR6OqW86besONPn139fslcEHPjowRAbahMO7bOxv+l6L+u5dhn
   g==;
X-CSE-ConnectionGUID: f+P7xboAQ2qN9ILE1ZTXlA==
X-CSE-MsgGUID: I96Oyk+tTfeSKgt9zS8A5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33214402"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33214402"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 15:41:51 -0800
X-CSE-ConnectionGUID: I6HtjnnLSPeGiiHAfximVg==
X-CSE-MsgGUID: /hy5N5gsQDm4UGth/UMt7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92723461"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2024 15:41:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGo8p-000AA3-0Q;
	Thu, 28 Nov 2024 23:41:47 +0000
Date: Fri, 29 Nov 2024 07:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1559/1559] arch/arm64/kernel/cpufeature.c:2387:6:
 warning: no previous prototype for 'fast_syscall_enabled'
Message-ID: <202411290709.0jx9FZzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 5c3cf22892983304b18d87296ed96ff0ab7d6c95 [1559/1559] arm64: Introduce xcall a faster svc exception handling
config: arm64-randconfig-004-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290709.0jx9FZzQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290709.0jx9FZzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290709.0jx9FZzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:2387:6: warning: no previous prototype for 'fast_syscall_enabled' [-Wmissing-prototypes]
    2387 | bool fast_syscall_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/fast_syscall_enabled +2387 arch/arm64/kernel/cpufeature.c

  2386	
> 2387	bool fast_syscall_enabled(void)
  2388	{
  2389		return is_xcall_support;
  2390	}
  2391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
