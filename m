Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF421F8ACA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075537; cv=none; b=ONrbKfRQAHMpOdBw3GpvSHEWz20Wi1UE6/qyt35hXqsJ42hWcG0vrDgQ1DYcktk7RXuuGLXvaToqZPvcPUkP6V8c7OMVml2SYAe4Y2BPimtFpK/BcF8OSgcjEPfZKwf+Nc3AGQc6lCovDs0C1IjNA3p3WU1uHjcCFZyE3jNqjoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075537; c=relaxed/simple;
	bh=HJDFLqQ5Z1pSbYRR6VuWxY6GK1Q58pWcfCzJvRh5vy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5gq2KU3FIMYg2Ed9zvuiWx6jpYYM3JGeooEUwzwD2I6oXQ8Nzr2dLrnnTJaxvIVifbu/OCnC9NaYFHIrIqQmc2mo03j8s2W5GcRbbPhXokAs1/L8rwiCsL+A6kzJuK0kD5V0qMZQB9knSobNG2QTcAxl9Up2Om6Nnx82y2bW+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uq1KDSRt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uq1KDSRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741075536; x=1772611536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJDFLqQ5Z1pSbYRR6VuWxY6GK1Q58pWcfCzJvRh5vy0=;
  b=Uq1KDSRteuRs/bcyyAb924zUSe3UGsZ2xu4lpaGOOGHuVhL1SE9EjSsl
   8g5AtaZD2xyoLeeRH5cXysQwtK8xyTbaY5DKYiZ7LG2C3lpLNlXd9B6BY
   m1kiOcy9d/LlX/MfNx41skHTVDwDhObR8mLF6LwPY1lt2Rpku2Fl4tx4y
   vVgjpLvV3wbmG7HGxwrTNlbH7wHy+KuVO3Xwy45UoGOMay/yT/ViafhLM
   jP+EGusHTsHaqeaaWSjb/o0k7m+fmhHGt2mgwir+09gxh5cYq0H0JInS7
   NpC6+y6o+yBxD0LEka72j+9h93AZNLyc/WJW9QTgajlj+0hvNJYQXsd73
   A==;
X-CSE-ConnectionGUID: 3NWW/PJ+TeyGA2lro8084A==
X-CSE-MsgGUID: ycRBwnMGSJ+dYitXcbobwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52625726"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="52625726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 00:05:35 -0800
X-CSE-ConnectionGUID: 4oPo8jfES/aM5e+0zTEPLQ==
X-CSE-MsgGUID: 2rNSXYVySQGdaDf7JpwZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122428289"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2025 00:05:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpNHQ-000JT8-1N;
	Tue, 04 Mar 2025 08:05:32 +0000
Date: Tue, 4 Mar 2025 16:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 7/7] of_reserved_mem.c:undefined
 reference to `cma_get_first_virtzone_base'
Message-ID: <202503041535.d3zmY5dT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   46d2359d75bd941964a80569e952827904b763fa
commit: cb268664c36e97586b7d5c3836c2027339dcc91f [7/7] ANDROID: mm: Skip the virtzones area when reserving the CMA region
config: i386-buildonly-randconfig-004-20250304 (https://download.01.org/0day-ci/archive/20250304/202503041535.d3zmY5dT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041535.d3zmY5dT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041535.d3zmY5dT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/of/of_reserved_mem.o: in function `__reserved_mem_alloc_size':
>> of_reserved_mem.c:(.init.text+0x190): undefined reference to `cma_get_first_virtzone_base'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
