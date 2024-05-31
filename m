Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419D16AC0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 01:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717118555; cv=none; b=lbyDNx+QimV1+ntRW9zftnSqOM9fob1vpm3dOU055UeQiQ/OzXbN+rlce0CrUs+jRSJ0JXgemZXzTjqlSpoMY54IymYE+aaGqVAknlpSN4OLt/Yp6SYQTK597yrk2VUnactQUFDI/6dEWcHGsM5B9cmARnc13eoAAIuUYfgvxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717118555; c=relaxed/simple;
	bh=UEuPOoGG72CAdHxvkun+9984TDqxWxOQYcrNXZdKUAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pc/AA7LV9Jl0svS/6x/WPH2YsQQj2qLXyVjteOSy5dDNoNLp+Hyu0KGErIbOJAcUp6w2gKmG2qyfrx3ZWJjd9iny2w8pWAkSs0/EQAXVmBUeLBPkXv7TUCwXBzsMM+Wb6GlYB/UyN6K7hLv8H+NYdAH8ZGGbdASysEQ1YkljmVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kr8efysH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr8efysH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717118554; x=1748654554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UEuPOoGG72CAdHxvkun+9984TDqxWxOQYcrNXZdKUAQ=;
  b=kr8efysHbBD1YtqrZxlwog7W6U5mSOIlF2+LNPj1ymex0ny9Jd57zWJG
   KSVNsjDblhL0+c8654GMgNBgCTsuvMPIMBQI7HS94lVhGOGOxsNnb37Fa
   lCq9ey6/wRIkWzz+Dcj8Az5kSSoycOOJ2rsYj7BYXSLYjtisjnYKly14L
   g5/Kns+7m2IgsO+vZei0gk+1iQLjchy4y9vjvG1+ok2sHX28G5+MKuB+V
   vrkbevEMX3caQEQ5qxd/3Up/rmj/2fmlhpLsosRLXckdcgHQ5fDEq7zjY
   ucM5UbG5DGlMi7q0o3OzEOXEsqNZmt+w/5gKhNv0t8vTh6egJod7PnuXG
   w==;
X-CSE-ConnectionGUID: 3fK/Fn6wTIWwjqzbCWL8dg==
X-CSE-MsgGUID: MGqxfSKsTdaXOFPI7jNGaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13467920"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13467920"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 18:22:19 -0700
X-CSE-ConnectionGUID: tjSW8HsdTL69QrJRU2VR+A==
X-CSE-MsgGUID: cWZNv16IR7SuCR3Cfgy6hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40455194"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2024 18:22:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCqyG-000GL5-0U;
	Fri, 31 May 2024 01:22:16 +0000
Date: Fri, 31 May 2024 09:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 4/25] drivers/base/node.o: warning:
 objtool: unexpected relocation symbol type in .rela.discard.reachable
Message-ID: <202405310925.8DyjN7nf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   2dbb1fcf83b9b3edac443981ac46cab63e9c5c3b
commit: 8b7f4e4c8a97d8102bd7cfad3d3fbdaf432e1140 [4/25] memory-node-dbg
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240531/202405310925.8DyjN7nf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310925.8DyjN7nf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310925.8DyjN7nf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/node.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
