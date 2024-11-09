Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309BA233D7D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731167513; cv=none; b=A+B7yXo09XJb6fzmZMHHEgoLh5wcE3F6+JOcXrsKoF3jXPmsqDDZSwTGhFHRqSrEmfMXDthwBJF0FtU3uUklCvQn4SAS9QaF9lcXArzPgnofqw2AO9bwoXx6rKAbCjnZL4ZkOtR1oNBp6gXK9L3obUANujkckk3darC5nG1JyFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731167513; c=relaxed/simple;
	bh=6OTARmiiLFqLBjkU8x6y50F7D3wVINnR4m6ssLOc+ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wk6p/1hTacsCGK2DW6Fxcl1FN6ApZuNjVnPc0V/0EwOvGiy+xciWEEF4i2rO2ITbAaMacO3VVCAfHdtMT7sY5ivByLMoKr0QnYcVA6HJtRDEyUfvI02o5VTN5NlITyyGUtCf4rewSHiPtLYWLNiZ51hffztelnaf7NhcFJ7V0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECcPi+vq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECcPi+vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731167511; x=1762703511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6OTARmiiLFqLBjkU8x6y50F7D3wVINnR4m6ssLOc+ak=;
  b=ECcPi+vqR5Gz+D95ty5zIq+X77xSfwT4FcNHnpnCsPIdT/5EUFedZr23
   Uw/XKA7a08C44HCKy1lwaRGFy5N/ZLKpkHlko9hhJtL4wWto+bvslYVQe
   NxQhvCqywfwI/eZh5Iuf3aCiHHrB+ObXP0wAApTh5EISFJxUVp2M6ZVc/
   5SWuTwFHRB8C6KC6nDSX7vWPb/+vMxl9E5rbCEAQB3QWU3dpdn38uDPme
   YGL9YT0oJ7D+TU6MY4dj281KZm+qgvd5MPZUxYPTl7/4afXYvSb6dGtOK
   FlNTMOpO/RmO48sUo66MRqDJU3d/1oTX1hKZtELbLTrk94duVZfYcysFK
   A==;
X-CSE-ConnectionGUID: OapY7kxMTpeuamhMgvfFEw==
X-CSE-MsgGUID: CSf6QkzuQE66XQTrwf/9ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30916150"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="30916150"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 07:51:50 -0800
X-CSE-ConnectionGUID: AOlYOUNfSWqwHTyp8dVjpQ==
X-CSE-MsgGUID: D1ayFXQ6ThGteceaaGa3rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86011846"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2024 07:51:49 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9nkZ-000sRM-0Q;
	Sat, 09 Nov 2024 15:51:47 +0000
Date: Sat, 9 Nov 2024 23:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1438/1438]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.o: warning: objtool:
 .text.nbl_dev_start_user_dev: unexpected end of section
Message-ID: <202411092323.M70TbZtP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bennie,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36c1a71a1d2064b5fe3b05c035cc0104992c8c73
commit: 8d65cdad5ea8e309af47a9a70c538bbbc1223e9a [1438/1438] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-072-20241109 (https://download.01.org/0day-ci/archive/20241109/202411092323.M70TbZtP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411092323.M70TbZtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411092323.M70TbZtP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld.lld: warning: call to __write_overflow_field marked "dontcall-warn": detected write beyond size of field (1st parameter); maybe use struct_group()?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.o: warning: objtool: .text.nbl_dev_start_user_dev: unexpected end of section

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
