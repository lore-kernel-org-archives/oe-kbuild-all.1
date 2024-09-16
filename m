Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B2A647
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 00:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726445446; cv=none; b=kxOfQvyB+ALU0/25PaQHoXimEieJ6QCpx4A2bqryT71S95tS6Blh15TD7h3AIqc1/vRps6FK6tgqw9FJ/lOJ6weKn2il5ZCKKkHfRjR5suXGSz02F22SxSsq4NfxEt6s9cJOPDLynjD0eOm9vxAQMjrSWzcNtpiQEjBj0k/Hcvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726445446; c=relaxed/simple;
	bh=wZTzr5+eMAy4+qZVTcafyl+gruR24WZX6cA7UVmz+bE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SNOj2ZqNdsrG6xPL3xjj+VO3CWWo17Jis5uhFj50efjO2IlRmZAq/5YNb8nFfrXtiRW/dHdU1EwD22VsLlMs7mAGQ2foLBK7B7dOLslVYqJhL/owfxAdg7WnbxO+YZzurTjblYPsJ+54YXrAQdw5JCZEzpew/t2MAkHsLutD5BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHTq4QkY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHTq4QkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726445445; x=1757981445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZTzr5+eMAy4+qZVTcafyl+gruR24WZX6cA7UVmz+bE=;
  b=AHTq4QkYUrbzNlfbfoPp8UFciPCqKkgww6scG+yEg13cf1yoBeErUx8v
   0Y90q1HfkFjs4YbYQ6oWdOdS+9B3LMQfFtOOSYcxnZw3AHK5xnxB40Onw
   1v+d5fH+FO++jEZDktwtIVpkiywXZcOMe1eSwrNBgIGrtqbkJ9XmuWUSr
   kFFIgh4JtKqPoBShFZulPKoPNi6ASbJvWOrdWUz/f/gzJm64823nhwSwJ
   gvC2odULIHuA0Ozni809s0SC9XQB7uGFDjuUlCYLTX8XWIEAVU44728ql
   Kkcq2i+HB/QF/8kPBqWiHzcVRPI1QAaGudzDq4w1a3bHKgzEyySuwJ9RL
   w==;
X-CSE-ConnectionGUID: 6dv3/OhkTdi5dsrV52hXUw==
X-CSE-MsgGUID: yFE4zCKAST6cXfzQ9QnhXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50690968"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="50690968"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 17:10:44 -0700
X-CSE-ConnectionGUID: pV3L0NzlQ92jm8UZPH9tZw==
X-CSE-MsgGUID: V58PnpmERcuZaJg2f7KOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73709359"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Sep 2024 17:10:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spzKD-00099Q-0K;
	Mon, 16 Sep 2024 00:10:41 +0000
Date: Mon, 16 Sep 2024 08:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 12815/15124]
 kernel/alt-syscall.c:50:34: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202409160803.FfCc1NNr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   ad8dacd5a4263ddf51685be3c2190a341c26869b
commit: f50b7d2c226ed73ee8be68842a1bbf7f49da1109 [12815/15124] CHROMIUM: x86: Add alt-syscall support
config: x86_64-randconfig-121-20240916 (https://download.01.org/0day-ci/archive/20240916/202409160803.FfCc1NNr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160803.FfCc1NNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160803.FfCc1NNr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/alt-syscall.c:50:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[noderef] __user uname @@
   kernel/alt-syscall.c:50:34: sparse:     expected void const [noderef] __user *from
   kernel/alt-syscall.c:50:34: sparse:     got char *[noderef] __user uname
   kernel/alt-syscall.c:45:5: sparse: sparse: symbol 'set_alt_sys_call_table' redeclared with different type (incompatible argument 1 (different address spaces)):
   kernel/alt-syscall.c:45:5: sparse:    int extern [addressable] [signed] [toplevel] set_alt_sys_call_table( ... )
   kernel/alt-syscall.c: note: in included file:
   include/linux/alt-syscall.h:36:5: sparse: note: previously declared as:
   include/linux/alt-syscall.h:36:5: sparse:    int extern [addressable] [signed] [toplevel] set_alt_sys_call_table( ... )

vim +50 kernel/alt-syscall.c

1c1790da976fa1 Guenter Roeck 2018-09-21  44  
1c1790da976fa1 Guenter Roeck 2018-09-21  45  int set_alt_sys_call_table(char * __user uname)
1c1790da976fa1 Guenter Roeck 2018-09-21  46  {
1c1790da976fa1 Guenter Roeck 2018-09-21  47  	char name[ALT_SYS_CALL_NAME_MAX + 1] = { };
1c1790da976fa1 Guenter Roeck 2018-09-21  48  	struct alt_sys_call_table *entry;
1c1790da976fa1 Guenter Roeck 2018-09-21  49  
1c1790da976fa1 Guenter Roeck 2018-09-21 @50  	if (copy_from_user(name, uname, ALT_SYS_CALL_NAME_MAX))

:::::: The code at line 50 was first introduced by commit
:::::: 1c1790da976fa1956d1923fe10bbe05d698d92c2 CHROMIUM: create alt-syscall infrastructure

:::::: TO: Guenter Roeck <groeck@chromium.org>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
