Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C9B1F91E3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749294104; cv=none; b=KclrKLM64TH+HbdLVef3tNDWIocxBLI1Kv2Uyak3HMnsCpleRpy6EY96vKKPSGkO90zcv7QfdBWl2aHjXkGmJ7TgfAIaHH7aSA5Z+n0BiqzWsvs7ygV9rozlDgdxi1ira4dUWvILDRji5T1swY5ehXU1/kc6d9YQ7p7/+zBd6cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749294104; c=relaxed/simple;
	bh=GlxyQ4nsovTpL2v1ogQObVEDikJcFXWqStV8Z+1l7hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwQehH1ow1p77LTVyh+OfX6ShkYr+JC1BlwwZ/KLAco0fKUycndcMWReoXrHK46bvlAByVAkJ9nz8Fbo8BqMNRDF0uvFY68wHIc2/IWJaQFye0yh3Oe1R57+ZfVUEj+nGVFGxpsA5KzyUaSgTKhqG2uSoEtqhXE59JdVoouwvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7fMKHop; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7fMKHop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749294102; x=1780830102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlxyQ4nsovTpL2v1ogQObVEDikJcFXWqStV8Z+1l7hc=;
  b=A7fMKHopcU2pw+nvS9pYnxdLAhtBtCWIFYXSpo/HBJEudiOGoUNa1jQd
   tGd/cAT8vQ8y1ACU3A2e7R1g2a9ba2YC1dx7QttEqnMgu51dyrTP2s64p
   rosXjERDEuQAIJStg8DoJK6FjH6FyH+SFETdqaKU6NrdVvgdFEixWzKH+
   aUERVjUQCW/2BmeefS1nk1aVEFhehYFuvumOHDY+kFjIGToZ/BAYlxKvb
   fSD5ACu+BN9Xg0rsn9TsHTnDI9m208MuFZTFptwTXpnG+Fqw8fN6+nkZ2
   JtjqjpJK3GHdrHcbc7kqRznfVgivmsNh5K1cxwXUOS0TySYK4XPwJKwBk
   w==;
X-CSE-ConnectionGUID: uZLclOmERj2eyE9LhmwYEA==
X-CSE-MsgGUID: ZxkxESlPRJaLAM5fMY+57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="54062152"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="54062152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:01:41 -0700
X-CSE-ConnectionGUID: S7zs5Zn+SLiFYJK0TDz4kg==
X-CSE-MsgGUID: iHn6bjnIRpGjLgH2ODQ4OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="176950059"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2025 04:01:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNrIw-0005k3-1u;
	Sat, 07 Jun 2025 11:01:38 +0000
Date: Sat, 7 Jun 2025 19:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1664/1664]
 /kbuild/src/consumer/Makefile:626: include/config/auto.conf.cmd: No such
 file or directory
Message-ID: <202506071856.LxaA5NHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   31245821cb3d54a27ff007515f57af84d6842846
commit: 9cd721e370b364f30d97f7b5ea4ec036ce5dd807 [1664/1664] kbuild: turn auto.conf.cmd into a mandatory include file
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce: (https://download.01.org/0day-ci/archive/20250607/202506071856.LxaA5NHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071856.LxaA5NHF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Configuration file ".config" not found!
   ***
   *** Please run some configurator (e.g. "make oldconfig" or
   *** "make menuconfig" or "make xconfig").
   ***
   make[3]: *** [/kbuild/src/consumer/scripts/kconfig/Makefile:69: syncconfig] Error 1
   make[2]: *** [/kbuild/src/consumer/Makefile:539: syncconfig] Error 2
>> /kbuild/src/consumer/Makefile:626: include/config/auto.conf.cmd: No such file or directory
   make[1]: *** [/kbuild/src/consumer/Makefile:638: include/config/auto.conf] Error 2
   /kbuild/src/consumer/Makefile:595: Failed to remake makefile 'include/config/auto.conf'.
   /kbuild/src/consumer/Makefile:626: Failed to remake makefile 'include/config/auto.conf.cmd'.
   make: *** [Makefile:146: sub-make] Error 2
   make: Target 'headers' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
