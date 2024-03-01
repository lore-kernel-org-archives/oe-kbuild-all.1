Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C5376F8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 01:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709257361; cv=none; b=LLJoGURBiyb0upR5B54DGQZIBdQ8g5IkbdcSmr0fyxq52HlMlCzFjts3q0WZO7kzoF2EoXwY6O+4QAzXPoCPe5pFIvtEX3VEFwotht48elal+H0riiYoBkaF+ckcEctRMiXCFTOVIktf+WJDnXyUfJsSBbLSEI/PRuvehU8rPq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709257361; c=relaxed/simple;
	bh=g+1YoKJcmndn1V/+ZvXOKeBUE0cd0FZU0Ot+ttn/Bg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STOfn/GsgPVsiUD5Pe28/Av15u9adjbfJYD7avs2AcDAu4Wz/lD3yilgE/8wGUem8ZhU2aHNHokwJ1oQPWQGEzKSADC5NdtwcqzlMOUM2cf8ppnDSOiscM4VApQL3mM4FCSgqK0EotjlWYm1kjYRtEIqkh45qfQjFTq6/8O1aYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+stTizM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+stTizM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709257359; x=1740793359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g+1YoKJcmndn1V/+ZvXOKeBUE0cd0FZU0Ot+ttn/Bg8=;
  b=l+stTizMpBE0fW7AEClu15pjCS3uKkRF9lwl47iopKTmsOAatNntIDIq
   4AxXQg0NAxgItH1hVph0pAXIdjpTGH9gB4NaR+p9mDi+LlAcIUxlSpDMT
   niiynXREyxLB9IA4yX4BDSx7pE4TuydYox3hzJ67vzCKuX9HRW+rZRzF2
   cE2dtvAFeUwrxPR0XjnwZ5h0iZc4wMusNHBcbFCKeCDlr0PmzJosCaX0j
   7r7iSHNlmTj/uWzG0YR6hXJvFH8GNJ6NFp3s8G6OKuF15rB8Wy8R788+R
   8obcaKawGahymzmVc1r/2agGBCZ/Srs3QrJobHxxJSg1OmSTqohVpKbL5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7593574"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7593574"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 17:42:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7951167"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Feb 2024 17:42:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfrv0-000DRb-1R;
	Fri, 01 Mar 2024 01:42:34 +0000
Date: Fri, 1 Mar 2024 09:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhoukaiqi <zhoukaiqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3620/3684] include/linux/ras.h:45:1: warning: no
 previous prototype for 'log_arm_hw_error'
Message-ID: <202403010924.KlNHxAf6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3016126ef302b602feaa8a7b99e4f85987536d65
commit: fa75636857993e25030c3db31444d2aa01d5d9de [3620/3684] RAS: Report ARM processor information to userspace
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240301/202403010924.KlNHxAf6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010924.KlNHxAf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010924.KlNHxAf6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/mce/core.c:36:
   include/linux/ras.h:45:1: error: return type defaults to 'int' [-Werror=implicit-int]
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         | ^~~~~~~~~~~~~~~~
>> include/linux/ras.h:45:1: warning: no previous prototype for 'log_arm_hw_error' [-Wmissing-prototypes]
   include/linux/ras.h: In function 'log_arm_hw_error':
>> include/linux/ras.h:45:51: warning: 'return' with no value, in function returning non-void [-Wreturn-type]
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         |                                                   ^~~~~~
   include/linux/ras.h:45:1: note: declared here
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         | ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/log_arm_hw_error +45 include/linux/ras.h

fa75636857993e Shengwei Luo  2022-02-23  40  
fa75636857993e Shengwei Luo  2022-02-23  41  #ifdef CONFIG_RAS_ARM_EVENT_INFO
0607512d0a8d7f Arnd Bergmann 2017-06-27  42  static inline void
fa75636857993e Shengwei Luo  2022-02-23  43  log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
fa75636857993e Shengwei Luo  2022-02-23  44  #else
0607512d0a8d7f Arnd Bergmann 2017-06-27 @45  log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
297b64c74385fc Tyler Baicar  2017-06-21  46  #endif
297b64c74385fc Tyler Baicar  2017-06-21  47  

:::::: The code at line 45 was first introduced by commit
:::::: 0607512d0a8d7fac86667466b884095e04b10a59 ras: mark stub functions as 'inline'

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
