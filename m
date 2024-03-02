Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D168A566A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 06:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709361962; cv=none; b=fikkHlOCp16xgCcvdPD799JR0SZAIbDst1NkgCBZ0ctz4jM2nkd1BCPcM50uODhpPFht3QYzYcpqP8cLtpkAslSLPfnxI9eCtHorzFr5//E/Z910mDXi5o6BsNduFSyVWdBbFYbojto1o0mWp+BERqCAB4iiu+bORtHRsrUxC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709361962; c=relaxed/simple;
	bh=Kw3D1zMxisD1/WdaD6CmtAdp27+Bpe7kbVH82IUQu8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfNYWu35Flr3H9pE3bqgfwWh6gE21MTnQY3W2zQGHUCtCOeYaR+EBuM381bfdRu339Y9O4AoKmZxmXCIhceSfENwNtyYy84aEtbKTC4o+i+7FZFLNX3xXWP7ypZkCCMFp/cf7d8ga/vTGI+Otscir/y90JKaO0aDx+Dex0T0muA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXXtFvPX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXXtFvPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709361960; x=1740897960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kw3D1zMxisD1/WdaD6CmtAdp27+Bpe7kbVH82IUQu8M=;
  b=aXXtFvPX8YLiqI1YJ21F64JCMhIsioj6dadgUMJBd02Tnj8hY5HGyzvp
   94H5dKwpeUW7d2t9N77qyY7m8UQ1nbzZS+oUWOdEtz+gK0PjIhXPWQwW0
   SNqXstY3g00ZsRtcQRDuM8FONefQXWi1ti89fBjQURbrmTvZmw0IJUNqh
   cwTzz7sbVPJw/ZcON90bCZ4cy0FDcVhA7nYdtcU1qelM3/NrNmE6dXu0t
   equRuwYRFQ+VtgQZmXk6QA0MYS1yrYS1Bhx8iSGtLIFiRrkDR5BxfVH2G
   hE7uenqlVuj/WlNeXC1BNuV8GOVCtURDW5w++bhsCy4JgcJcf5e/uh7WZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="26377293"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="26377293"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 22:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8358138"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2024 22:45:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgJ87-000EOT-2s;
	Sat, 02 Mar 2024 06:45:55 +0000
Date: Sat, 2 Mar 2024 14:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhoukaiqi <zhoukaiqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3630/3767] include/linux/ras.h:45:1: error:
 return type defaults to 'int'
Message-ID: <202403021440.BIb46Slr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   236cb940335e3542c9d5ac16b5d8546a0cbbdfc1
commit: fa75636857993e25030c3db31444d2aa01d5d9de [3630/3767] RAS: Report ARM processor information to userspace
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240302/202403021440.BIb46Slr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021440.BIb46Slr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021440.BIb46Slr-lkp@intel.com/

Note: the openeuler/OLK-6.6 HEAD 236cb940335e3542c9d5ac16b5d8546a0cbbdfc1 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/mce/core.c:36:
>> include/linux/ras.h:45:1: error: return type defaults to 'int' [-Werror=implicit-int]
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         | ^~~~~~~~~~~~~~~~
   include/linux/ras.h:45:1: warning: no previous prototype for 'log_arm_hw_error' [-Wmissing-prototypes]
   include/linux/ras.h: In function 'log_arm_hw_error':
   include/linux/ras.h:45:51: warning: 'return' with no value, in function returning non-void [-Wreturn-type]
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         |                                                   ^~~~~~
   include/linux/ras.h:45:1: note: declared here
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         | ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/int +45 include/linux/ras.h

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
