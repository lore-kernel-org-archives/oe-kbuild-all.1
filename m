Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F92C11EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760474083; cv=none; b=DTEhuqS1DP0/Wtp7dB/WoT0QKvT8SmqI/QO+SNukCLpB7RxmUwt+9r4v9KmDCeBHnDn+7JeK6PVEHkkdZmUPt2ViPCLtGq4/g8FOgeQgfD0zChU+3Tbj4po3b+ykxL6FvyvrhUUguhGJzLMS8Z40Kzkwmd8ltfmk86ses2H9GlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760474083; c=relaxed/simple;
	bh=M9FwRAbYbS/bCHZUIL/b70jM2OEADFgSfpGJJ+O9iIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEtfoTzWm2nl1B7I/7ry6G9t2bNmumZ7K4frXLP1AKXO6a7T/edrNtTJ40nNrG54y51AG8ZHeqeEgSzLCbjD/yaZ30UEYZ0B51WZirtBNuPzBLnXcBFinfj/orfmxb8stJsCqp+IwatnJww5khu/CnMiA4VKdbLhu6jPSXL/i7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blo3BPo8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blo3BPo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760474081; x=1792010081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9FwRAbYbS/bCHZUIL/b70jM2OEADFgSfpGJJ+O9iIw=;
  b=blo3BPo8R/7L2dm0yoz+n5jCKxG1bOtY509md3YwyJDe3XfjAO0jM0YB
   D6Rcw2kqt0NWAdAoS9xXRxTlzlXsok+nMoK4Vxw8IGcoHGcYR0h2ab5Ah
   h+NJrMNRTpQxHP3K0QvFfVMEc5XSnNUcVLWse+0+tzX95aUboXlxfTXvD
   FofzZ2yo0zCggSw0dQqV0gOMvNMJq2/T6gR7hf9u3CbsxTfBknLo3BgW5
   pbrtGbWPXMfePH6+poXJHDFvsuYbFGEyINxL9evfRPt2bvvgpy3b1V23L
   xi/L/Rt4BSq7coqEDTb2faYM+x83+cIrGjGc/Cu9W2fQo9r8z660SxjFh
   g==;
X-CSE-ConnectionGUID: qEQAA7HlSpywqUXDzsEd8A==
X-CSE-MsgGUID: kfwlDF25QVSOgGmwCzsl/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62677574"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62677574"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 13:34:41 -0700
X-CSE-ConnectionGUID: pHcuiCRJRKquVQxjPYQUEg==
X-CSE-MsgGUID: VbR9s2aiR4uaI2HuSCIohA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="212939089"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Oct 2025 13:34:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ljB-0003Ad-02;
	Tue, 14 Oct 2025 20:34:37 +0000
Date: Wed, 15 Oct 2025 04:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:amd-staging-drm-next 1/12]
 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:76:undefined reference
 to `__umoddi3'
Message-ID: <202510150400.RzNvEFPG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   bf23da0a89873c8144f93cc6ac9a36ad615100b6
commit: a4299d6c4879390acc1ad074b4bc0eeef51a6cc8 [1/12] drm/amdgpu: Add ras module files into amdgpu
config: i386-buildonly-randconfig-001-20251014 (https://download.01.org/0day-ci/archive/20251015/202510150400.RzNvEFPG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150400.RzNvEFPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150400.RzNvEFPG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/ras/rascore/ras_core.o: in function `ras_core_convert_timestamp_to_time':
>> drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:76:(.text+0x176): undefined reference to `__umoddi3'
>> ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:76:(.text+0x192): undefined reference to `__umoddi3'
   ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:86:(.text+0x1d3): undefined reference to `__umoddi3'
   ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:86:(.text+0x1ef): undefined reference to `__umoddi3'


vim +76 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c

2ebcf78447ca62 YiPeng Chai 2025-03-17   60  
2ebcf78447ca62 YiPeng Chai 2025-03-17   61  int ras_core_convert_timestamp_to_time(struct ras_core_context *ras_core,
2ebcf78447ca62 YiPeng Chai 2025-03-17   62  			uint64_t timestamp, struct ras_time *tm)
2ebcf78447ca62 YiPeng Chai 2025-03-17   63  {
2ebcf78447ca62 YiPeng Chai 2025-03-17   64  	int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
2ebcf78447ca62 YiPeng Chai 2025-03-17   65  	uint64_t year = 0, month = 0, day = 0, hour = 0, minute = 0, second = 0;
2ebcf78447ca62 YiPeng Chai 2025-03-17   66  	int seconds_per_day = 24 * 60 * 60;
2ebcf78447ca62 YiPeng Chai 2025-03-17   67  	int seconds_per_hour = 60 * 60;
2ebcf78447ca62 YiPeng Chai 2025-03-17   68  	int seconds_per_minute = 60;
2ebcf78447ca62 YiPeng Chai 2025-03-17   69  	int days, remaining_seconds;
2ebcf78447ca62 YiPeng Chai 2025-03-17   70  
a4299d6c487939 YiPeng Chai 2025-09-30   71  	days = div64_u64_rem(timestamp, seconds_per_day, (uint64_t *)&remaining_seconds);
2ebcf78447ca62 YiPeng Chai 2025-03-17   72  
2ebcf78447ca62 YiPeng Chai 2025-03-17   73  	/* utc_timestamp follows the Unix epoch */
2ebcf78447ca62 YiPeng Chai 2025-03-17   74  	year = 1970;
2ebcf78447ca62 YiPeng Chai 2025-03-17   75  	while (days >= 365) {
2ebcf78447ca62 YiPeng Chai 2025-03-17  @76  		if (IS_LEAP_YEAR(year)) {
2ebcf78447ca62 YiPeng Chai 2025-03-17   77  			if (days < 366)
2ebcf78447ca62 YiPeng Chai 2025-03-17   78  				break;
2ebcf78447ca62 YiPeng Chai 2025-03-17   79  			days -= 366;
2ebcf78447ca62 YiPeng Chai 2025-03-17   80  		} else {
2ebcf78447ca62 YiPeng Chai 2025-03-17   81  			days -= 365;
2ebcf78447ca62 YiPeng Chai 2025-03-17   82  		}
2ebcf78447ca62 YiPeng Chai 2025-03-17   83  		year++;
2ebcf78447ca62 YiPeng Chai 2025-03-17   84  	}
2ebcf78447ca62 YiPeng Chai 2025-03-17   85  
2ebcf78447ca62 YiPeng Chai 2025-03-17   86  	days_in_month[1] += IS_LEAP_YEAR(year);
2ebcf78447ca62 YiPeng Chai 2025-03-17   87  
2ebcf78447ca62 YiPeng Chai 2025-03-17   88  	month = 0;
2ebcf78447ca62 YiPeng Chai 2025-03-17   89  	while (days >= days_in_month[month]) {
2ebcf78447ca62 YiPeng Chai 2025-03-17   90  		days -= days_in_month[month];
2ebcf78447ca62 YiPeng Chai 2025-03-17   91  		month++;
2ebcf78447ca62 YiPeng Chai 2025-03-17   92  	}
2ebcf78447ca62 YiPeng Chai 2025-03-17   93  	month++;
2ebcf78447ca62 YiPeng Chai 2025-03-17   94  	day = days + 1;
2ebcf78447ca62 YiPeng Chai 2025-03-17   95  
2ebcf78447ca62 YiPeng Chai 2025-03-17   96  	if (remaining_seconds) {
2ebcf78447ca62 YiPeng Chai 2025-03-17   97  		hour = remaining_seconds / seconds_per_hour;
2ebcf78447ca62 YiPeng Chai 2025-03-17   98  		minute = (remaining_seconds % seconds_per_hour) / seconds_per_minute;
2ebcf78447ca62 YiPeng Chai 2025-03-17   99  		second = remaining_seconds % seconds_per_minute;
2ebcf78447ca62 YiPeng Chai 2025-03-17  100  	}
2ebcf78447ca62 YiPeng Chai 2025-03-17  101  
2ebcf78447ca62 YiPeng Chai 2025-03-17  102  	tm->tm_year = year;
2ebcf78447ca62 YiPeng Chai 2025-03-17  103  	tm->tm_mon = month;
2ebcf78447ca62 YiPeng Chai 2025-03-17  104  	tm->tm_mday = day;
2ebcf78447ca62 YiPeng Chai 2025-03-17  105  	tm->tm_hour = hour;
2ebcf78447ca62 YiPeng Chai 2025-03-17  106  	tm->tm_min = minute;
2ebcf78447ca62 YiPeng Chai 2025-03-17  107  	tm->tm_sec = second;
2ebcf78447ca62 YiPeng Chai 2025-03-17  108  
2ebcf78447ca62 YiPeng Chai 2025-03-17  109  	return 0;
2ebcf78447ca62 YiPeng Chai 2025-03-17  110  }
2ebcf78447ca62 YiPeng Chai 2025-03-17  111  

:::::: The code at line 76 was first introduced by commit
:::::: 2ebcf78447ca62ccf66fa0f6702596b8d7e8efdd drm/amd/ras: Add rascore unified interface function

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Linux Infrastructure <z1.linuxinfra@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
