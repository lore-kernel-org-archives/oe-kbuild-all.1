Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB983D2E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706153545; cv=none; b=UOOYTiT9Q1qthII6VrFak0/Wbxu8F/dlpl84sO5ZPWDmDTnn3SjGCHmAaaYweZGcgXokrcjuv52EOp25bPTaG3hKHNkTPxw4o5/rvoKUOY7hRqC/oCJrbm2KdUVFP03SafXwcU5uKDFi2/8A3Dk0yY+q+4lJvNahOSkHRBVLgVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706153545; c=relaxed/simple;
	bh=x67XSPF3+WY6FQ8QjEABrQI+43WBdFkP36pmFn/pbJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KVmc52c6EqWIMyIDskrcE/xFXB+oC3iVZ/5RtrzrFxMjMWMF52nz722Rd9FvN7IZRPr9k2aArC3bXiEeiJWGEOM7gC5Iwdg2+RPEwiQrwx3dFFE1ZgNHNws1BCURGtMVkTquzZDWHi77cClpm8R56FH1t2+88oentZGQrpotcqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIiXfbHR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIiXfbHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706153544; x=1737689544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x67XSPF3+WY6FQ8QjEABrQI+43WBdFkP36pmFn/pbJs=;
  b=IIiXfbHR3vQEUyCLuWGL2oyPcNIFSjUP03G41Wo/QKo/3Bb/lakmMolE
   ObFMbU8uGSUNrGbi94XfO0G+O8BFfZcOHpkdr58rlcuo3aOl0mjxGCkij
   CC6igG6w7jY2wKs0nJFoi2FmSyvNw8wNo9M6o6BP6XhXx2g0KQbm6Fd7g
   M05WYMuMHGXQkgJf0lNjXQvyWr2auD6HJlNbTNCsAG1mskusYak3Q0ysC
   CNPLbK3EinF9Jl2BmHcqicsFDLm8Xtk0kcnoPlwLSTO1RCgrGYZZHrWtk
   ewZiJPSDy2Dn+OTxnl0kw0MbOb3YEhIoxr5HPnfvpaxtySPLj8j9tlKii
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8701809"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8701809"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 19:32:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856936639"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="856936639"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2024 19:32:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSqTT-0008cn-2p;
	Thu, 25 Jan 2024 03:32:19 +0000
Date: Thu, 25 Jan 2024 11:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pic 5/5] fs/fcntl.o: warning: objtool: do_fcntl+0x52:
 can't find switch jump table
Message-ID: <202401251126.u6Ztaovm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pic
head:   019a7844cc2a63d08a2b5f396f68e2c547224ae7
commit: 019a7844cc2a63d08a2b5f396f68e2c547224ae7 [5/5] x86: Build the core kernel with position independent codegen
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240125/202401251126.u6Ztaovm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251126.u6Ztaovm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251126.u6Ztaovm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fcntl.o: warning: objtool: do_fcntl+0x52: can't find switch jump table
--
>> fs/ioctl.o: warning: objtool: do_vfs_ioctl+0x778: can't find switch jump table
--
>> fs/fsopen.o: warning: objtool: __do_sys_fsconfig+0x65: can't find switch jump table
--
>> fs/signalfd.o: warning: objtool: signalfd_copyinfo+0x57: can't find switch jump table
--
>> io_uring/register.o: warning: objtool: __io_uring_register+0x4f: can't find switch jump table
--
>> kernel/ptrace.o: warning: objtool: ptrace_request+0x64: can't find switch jump table
--
>> kernel/reboot.o: warning: objtool: reboot_setup+0x64: can't find switch jump table
--
>> lib/cmdline.o: warning: objtool: memparse+0x3a: can't find switch jump table
--
>> lib/maple_tree.o: warning: objtool: mas_find_rev_setup.constprop.0+0x21: can't find switch jump table
--
>> lib/parser.o: warning: objtool: match_one+0xbe: can't find switch jump table
--
>> lib/refcount.o: warning: objtool: refcount_warn_saturate+0x1f: can't find switch jump table
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
