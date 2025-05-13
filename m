Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9764A1EB5CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747167902; cv=none; b=QU9lwJkawSkJYM3VNCWNgE9SeD8NRbuW5LlD6q86HouRdEfDYhYqJDmBLfQxsYxn1g8DzIALlC0lDwNdh9qVmAUQmpZVQ+0AnRVWVKwmgbqeSMC53wYu1AQlkP74VZEfJLgcFz+JiGJj+NEU/8R5+jPFIxexlKI/1vSfN5XfNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747167902; c=relaxed/simple;
	bh=zIqIcxVQZUGWl/G8xR/3XNRMp1ZfZmaeU4Kz37YbQ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OkmFigcxld9TF1YPW7wlUcBTX27fHyhvX8IOC2+uDTTvGLjmEx+2yFiRO15VxHLNC/l5RqgTHes99zjWS8ZMUcIUpN2CL2Ekhi4RWFbXLWgk46I031BkHHCb6l9Ro9I5FMDpTM8a54ZLXCJM5He7n2OwrJTWcy+bRVqjA0wt9HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/pJZso2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/pJZso2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747167900; x=1778703900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zIqIcxVQZUGWl/G8xR/3XNRMp1ZfZmaeU4Kz37YbQ4w=;
  b=H/pJZso2Gx727b/GRJikntOMTZbI6mrB5F8NnATd4jbOYebxq0cdgyce
   f2nkDMqWyWBv6tmPQlVCQkTtj4QBOj+2EDQ7ixUQaluuDb3GmJhYi8Z0x
   oD4VP/0nJ/7wE+tcv3DSNDmCDs2cKW8e3u8yiiT4UMyxocDb4CfMyUg8O
   D56+knswfAGe3Q51l0t34FOELOn4t1JZle+lq3T4tUiOhEUezpf7yHhli
   mPeB3hcNkzf9KkimRw6QqM1kPZd6PeaGw1EUQ+UkeJj3/kwnNQcOAfbZ/
   XGdWB1curWo+IzJquB9Ir97eeuVDDJMy/3/Ga4NdeZeZa/2sZ9mWdUJzb
   g==;
X-CSE-ConnectionGUID: RuXzouEzRTC5w7g4gpKESA==
X-CSE-MsgGUID: W8DrP13TTW27zbzahEOpkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66586779"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="66586779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 13:25:00 -0700
X-CSE-ConnectionGUID: ndPAa+LHTduKVTUmOVyAwg==
X-CSE-MsgGUID: I0G/LKB9TH+DS+wMsgwusg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="137736528"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2025 13:24:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEwBM-000GN5-1P;
	Tue, 13 May 2025 20:24:56 +0000
Date: Wed, 14 May 2025 04:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2893/2893] llvm-objdump: error:
 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory
Message-ID: <202505140440.zitmKJqg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   731227d05f54b13300b28332fabd3f3aaf0950eb
commit: 5476cb89ef2297bd36f8b38e27b54617b6f63236 [2893/2893] x86/vdso: Implement a vDSO for Intel SGX enclave call
config: x86_64-buildonly-randconfig-003-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140440.zitmKJqg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140440.zitmKJqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140440.zitmKJqg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed: symbol not defined
>> llvm-objdump: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory
--
>> llvm-objcopy: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
