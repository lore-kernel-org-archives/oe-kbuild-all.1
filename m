Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5633A1A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056154; cv=none; b=IBGKM51e//yLsjDlkY6pVYqLnPy0ZUdxDkHaD3zzH80kNdaTOrzaaZFsRrpLMkdNqprN8NYPN4qezZugRbVMydy1nxCgHcC+xFOQEqSoShzSR5bS5W7X1MyCe2UqA/BG3b8VWcuXoo4afnfpLpDSEzjdKwaXDx2nJs+wDTXuoGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056154; c=relaxed/simple;
	bh=H01oTb1X9+jGcdpaWevDBHEBJgJau/FJYYkdSSGAlgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=muLqCXHpw9ljianS8DYvdNl+londal9dxgNeU4QX4BEn3Uit+7w4JOBUgDjri9MmwRG8EJccCGNYvJL4dxFTbLbOaH5pQtXHsWbqL4eJZEKPJEccAqm2lV5D51wDUztwKW156aB2CkxTZF84yvNgMpzxAFUwNCdyKnglZCrMtDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lByaoGTi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lByaoGTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721056152; x=1752592152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H01oTb1X9+jGcdpaWevDBHEBJgJau/FJYYkdSSGAlgE=;
  b=lByaoGTiao5LcCy4Pd1w3YN8VtNWJFy3a1mEOvjJsyHaht9tcEl8iv7h
   Q8v9B9SlHyu0MActv3cmpUwZktiyTICjMpP6imL5Yki5ejUDBUW+3+mkK
   uU4xiJut0MeVGS0aYhjmGXOEdz9UIozb/AE9NGWX2Sbm7U3IADs7EcfqR
   wR0y7VnI1OLRCsPsylKohNPAlVqltQAM2m9P1X70qPtCiXQ7Fl7d8GVPg
   NPzDRiPNn3PYPswTB92jMcH8MV0TnmeNdYuYEBnHGpwllxhJdtSh26jDS
   WWJtKo411OT21pWisc0aXFULTKvQUWLYiXGW31vtv6dCEazewjX2hYhoQ
   Q==;
X-CSE-ConnectionGUID: Zdt5KfmDRm6zltRfsu0BwA==
X-CSE-MsgGUID: IR4iWZxVQhqpu6nc6eeqFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22253498"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="22253498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 08:09:09 -0700
X-CSE-ConnectionGUID: JzUIRhByQ3+3JalqBwP1Ew==
X-CSE-MsgGUID: 3orrxue8T02kSRmF2f+IOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="49613173"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2024 08:09:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTNK6-000eLO-08;
	Mon, 15 Jul 2024 15:09:06 +0000
Date: Mon, 15 Jul 2024 23:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9862/12989] ld.lld: error: Function Import: link
 error: linking module flags 'Code Model': IDs have conflicting values in
 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(skbuff.o at 2129720)'
Message-ID: <202407152313.WjCqy7Cq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e3b24eb7d297d9d99030800ed96944b8652eaf
commit: 6458b8780cc5120173dcc544020490e2e5f9a94a [9862/12989] kconfig: refactor choice value calculation
config: riscv-randconfig-r061-20240715 (https://download.01.org/0day-ci/archive/20240715/202407152313.WjCqy7Cq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407152313.WjCqy7Cq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407152313.WjCqy7Cq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(skbuff.o at 2129720)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(r8152.o at 2055500)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(raid5.o at 2093300)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(net-traces.o at 2131940)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(memcontrol.o at 1886120)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(super.o at 1936400)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(md.o at 2093540)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(core.o at 1882220)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(trace.o at 1877900)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(vmscan.o at 1883360)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(filter.o at 2130800)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(drbd_receiver.o at 2028680)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(syscall.o at 1879520)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(inode.o at 1937000)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(protocol.o at 2174300)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(mds_client.o at 1947380)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(rbd.o at 2029280)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(core.o at 2041940)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(volumes.o at 1937540)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(tcp.o at 2141240)'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
