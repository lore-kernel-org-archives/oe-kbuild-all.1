Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7D85FEFC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706530424; cv=none; b=J3Ev18QrblQWEQ3TzGLUbXo8qjywnPTRAA3JAZHV+T8ISFecN30zj15XuG0pvj/wIi5pfteGMHB0Dh8j01e7SwsFdTQxgSOhgpqH8wVMB3755XuBhLp740DnKOJ6y2uHYV1dVXLIV6S/5d/yQnUpDgnvcfSxIuIVReYVPxsdjt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706530424; c=relaxed/simple;
	bh=TvIz+n/xcjDgj9Ck1YCno+t4InqByf1yUH2vo9EcGyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftqXzwDVPMU3pWxL1BO6YBp4Ne9Y7GQ5/cNCnbxddqAy7CUk68BqAjwXEXPXqJd1uZN5I1H+5x5vtncLt1bkA4HvVmssURhVEaN9/wnrMg9qT4NYDvbtzlrOAUiS9KeL3n4baOZa9Lkk/OcFovOwhyU2eGgbjBYNuwJD39eSGlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfUx3SbY; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfUx3SbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706530421; x=1738066421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TvIz+n/xcjDgj9Ck1YCno+t4InqByf1yUH2vo9EcGyg=;
  b=VfUx3SbY7DXglNJlhPa1SWu5IUSQnWKfqcr3Fs+DfMRM+fU57hwiiQGE
   ykXuNQplphyNhdi8NEvOF46kAI4J6x0SJBLAvwj/gSSAtc6KabebfCC4c
   H0NUlh9SOaWtzPUNPyJVBRmxc8ywe4Fp0wBrWc/dbqdfzVDN2efmJqoux
   2AjAjdkXeDA/xuupICkc5MqdtumKLEO34oH0Oc0Bp6nUllRdVRlQVKcZV
   9tGY3GxyDSaEPEUzORF5oABUCpSFvMDIrli5SGrws3xcB6CI9lx03yh+7
   lFVv5LdBWpq2h+S6C8/JLV2TIXKXezV98SmdjinW/YcppGEa47YX4aysk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="393369298"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="393369298"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 04:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="878054509"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="878054509"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2024 04:13:34 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUQW4-0004HS-0q;
	Mon, 29 Jan 2024 12:13:32 +0000
Date: Mon, 29 Jan 2024 20:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 14/17]
 drivers/platform/x86/amd/hsmp.c:743 is_f1a_m0h() warn: always true condition
 '(boot_cpu_data.x86_model >= 0) => (0-255 >= 0)'
Message-ID: <202401292056.qkUFS09Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   d04e52b47ab62cf36fddaa0feb1c5508e420e48d
commit: 66ba7fd3949c4262dbc51d79e233c71e55725dac [14/17] platform/x86/amd/hsmp: Non-ACPI support for AMD F1A_M00~0Fh
config: x86_64-randconfig-161-20240128 (https://download.01.org/0day-ci/archive/20240129/202401292056.qkUFS09Y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292056.qkUFS09Y-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/amd/hsmp.c:743 is_f1a_m0h() warn: always true condition '(boot_cpu_data.x86_model >= 0) => (0-255 >= 0)'

Old smatch warnings:
drivers/platform/x86/amd/hsmp.c:574 hsmp_metric_tbl_read() error: we previously assumed 'sock' could be null (see line 573)

vim +743 drivers/platform/x86/amd/hsmp.c

   739	
   740	static inline bool is_f1a_m0h(void)
   741	{
   742		if (boot_cpu_data.x86 == 0x1A &&
 > 743		    (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
   744			return true;
   745	
   746		return false;
   747	}
   748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
