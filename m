Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42FE63A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 02:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715827288; cv=none; b=dHD3IGGXSqBUHfRtydXwCFBcFp5CK4BRY1lq8ZiQ/48lBzjZHm8Hf2O21G0HX0UGWiZnFYARQdsuXqd6c92i49N7Ixhiyqud/LxESWv+dk+woZKwrSHhXXmlkD1sSd3H9k6/p0nINBMVkbomcc88bBfyq0gQ5eDEfaoGsseDAiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715827288; c=relaxed/simple;
	bh=c3dLfjk3Ct3fhflUUi7cZlZZ3TDHbcH4sRgEVg+0+Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ghBC59Hm3ENqqbX9sBuRXLaxgWbyYgcPlSvGLu3+ZO3k/bihuk1PC90AQoXrl902OWQGq5seDL+c/IUvslNH79goakR1upVBLDczeUg+RSmTWRDQxN/GvyE82QluyMUHlEiu2gamuGoywbGVNNz+ZGkXK1pASBlQArRuNAg/WKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azVkyHa2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azVkyHa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715827287; x=1747363287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c3dLfjk3Ct3fhflUUi7cZlZZ3TDHbcH4sRgEVg+0+Z8=;
  b=azVkyHa2GjAlc+TzE1jOxn9cyCdVgBgB49utVYS67GrraUjACu4y6B4l
   1QQtibsWENXQsuG/GH2+Is3jZEaP6tEmf/or8LWolwtYobVElXfmSb3hZ
   fmawyxFvh9pMB0cICuPhS3kEtkXi4uBk2wl7HZwr2iZmt2YKKxakal/Th
   rb1Ves8Z5gE65LLYmEoE3T7Q28Rfr1Z8YYHKI6HdP4UyntcPdV99A8uZV
   pr1mWlcA/BN3EzQTKkZdCnRAFPUr0ItIt+jw3qa74VWXGrfzUV3h6q5uC
   oIVlr2yCJe0jIJARsJ8/t5TSbvp0HZx2YXCX4QWNi78Si1nHzjL+u/J3t
   Q==;
X-CSE-ConnectionGUID: XJb7TN3GQgKH1Fd4IkfAag==
X-CSE-MsgGUID: ARdqJu/2RYyPqfly1nvXCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34426381"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="34426381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 19:41:26 -0700
X-CSE-ConnectionGUID: aUvZGYVNQMGSrryoedz92g==
X-CSE-MsgGUID: xs7gH18mSTOB1ymz22mrJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="31198141"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 May 2024 19:41:25 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7R3a-000DWX-30;
	Thu, 16 May 2024 02:41:22 +0000
Date: Thu, 16 May 2024 10:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/rt712-quirks 6/9] ld.lld: error: undefined
 symbol: sdca_lookup_function_mask
Message-ID: <202405161022.0kD9tr4k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/rt712-quirks
head:   667a5afcfd541df0169d7f1e3ef905e22a565472
commit: 2c87f4f405f2434fc6b30661259aec51ea949145 [6/9] soundwire: slave: parse function types and store function mask
config: i386-randconfig-141-20240516 (https://download.01.org/0day-ci/archive/20240516/202405161022.0kD9tr4k-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405161022.0kD9tr4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405161022.0kD9tr4k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sdca_lookup_function_mask
   >>> referenced by slave.c:91 (drivers/soundwire/slave.c:91)
   >>>               drivers/soundwire/slave.o:(sdw_slave_add) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
