Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208A20ADE9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511434; cv=none; b=fv+qR7/M45SyOKRjChdHWawGpyx4aLXlBHrjEAEBNHt8yzeOfscoNfrBczVvJD5JkjjV93cbfoDFscgmjMQPaQbZSOCYekB+jyfxLnTutEpuMLuujg4dV15XYZdSLeJEzKabMghbcv2NHENrClMIVHU5X8LF+ayWFiBBqO1dSTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511434; c=relaxed/simple;
	bh=Vg4odEx4GHO4uN4IhAtIEKFcfuZ7/hPIHXlhniv4dOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XS7b5lxcx58yUvwsun5tyZlTh4c14cvXtS5e0BzvG5asGunE8aFdjSdc6GXAwINN9a1yvs8erJCzm9lpH+JCym3H+1L/eOANmshKmVuBeExk9KJW4ogcZun0wLr2sPJC1CoxsGaOUEIcKsxzZ1PrVnsd4FDPxHyjnfCpFYjx/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbT+e3As; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbT+e3As"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736511432; x=1768047432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vg4odEx4GHO4uN4IhAtIEKFcfuZ7/hPIHXlhniv4dOI=;
  b=MbT+e3AsyaEDjXBL7PVo+jKo1XbQ3RKu/b4P0McA9f9KNIgH6Et86zc0
   d/5ktuwhK+uv0PuY2KdXecaBuXT4scQ7ynFnWjppBRX+KwNChmdR9wQAx
   OHzFSEXZ1ZgjTtjYF7BCEyi/+XxCygboBGG2VBRy2YTkvR3orw5bLFSBD
   T6P5+2EXmbPStolKRhYoHwA2Y130HnSKoUamKqG6c2+7dGeKO5IMMyK1w
   LqEuqkdR/x3DL0kt68vjeOfOeWBAAkutap4jzb2W4bFcKaT+9KseBYS5E
   Z9Kn+CN24014dCcjFKVpITXNr284cEiJ8vVZ2CuzaGfxPhDlqJdpN5V71
   A==;
X-CSE-ConnectionGUID: HC2Cpl0ASQKeMVXZ9xMuMg==
X-CSE-MsgGUID: 8wqpWLN3Q7as2VMzwoQhug==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39619721"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="39619721"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:17:11 -0800
X-CSE-ConnectionGUID: ws+TSfq5S6qrLeDspZqvqQ==
X-CSE-MsgGUID: EouMdR43RvCKfWc3f0Zzjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141025794"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2025 04:17:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWDwq-000JCn-0i;
	Fri, 10 Jan 2025 12:17:08 +0000
Date: Fri, 10 Jan 2025 20:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com
Subject: [xilinx-xlnx:lkp_test 1/504] .github/pull_request_template.md:
 warning: ignored by one of the .gitignore files
Message-ID: <202501102051.JxlgAj8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 3aeba26c6f71a039285b64abf8a6c0e4a202bf87 [1/504] xilinx: Add a github template telling people to not use pull requests there
config: csky-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501102051.JxlgAj8s-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102051.JxlgAj8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102051.JxlgAj8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/pull_request_template.md: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
