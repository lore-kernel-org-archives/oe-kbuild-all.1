Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166D6116
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 04:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721189322; cv=none; b=qnGjyrIKUYYs9RHFbhPvcl5aHjvH8xTvozH/jIae0NFRgkelbjA7Om0V6HnfnwZS9ylQxgr838lFmsuBZIeuJWqP9ciZ9qmhy83af/zJZs4sekZvJEBaznzpf3d+SNraz/xzo/xhZyrEE09Wg8vTyQXhzneUjGiRcoX+Dkk8oKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721189322; c=relaxed/simple;
	bh=3KnzbIbVTNowF58TYIs8DfZJG7D2Z0nXaU/zvXWRug8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kP2udxyoY+Gup/wbOpB3pjWVepQaPF8SPMT0/dim1W1y7ulY/Ku3I7lHrjW8qkRQyajxTfLc9CyL28UOdSv+kd8qxH0GihibiMR7ayFtapwwti1Ef5mkPlqS1JPs07DV4pAoATJ0Fn/VgDMhJSNizl7YQYh7uBNrFj8dS64UcqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAytT+En; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAytT+En"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721189320; x=1752725320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3KnzbIbVTNowF58TYIs8DfZJG7D2Z0nXaU/zvXWRug8=;
  b=UAytT+EnNDDKK+ZOzE1qi+EjPZMRD6ce1TyHEsnG4crALrleFF9eBvLK
   SxAti2o4Q9ZSwwHgcD+VoXop+Cu/oRB1jpJQJlmJ1ZgRJCIy2KLq54lu8
   lHhsQSuTnTaRh0Ok/CUbboeMGd+aMwuiViAsIvEEEIaZn2A0KQuHFhICy
   0815htKjGO9uR4UR94K01TZoiVOkcHU7cXASx4k/oFmAKQT4YHdPWCDID
   3/LmXPwKuSNGwPyDKMYx/Va4sm8U1dH+mc0pUyiJecljBXNPSmA/V31EC
   OdYnHlN/QQJBlT3DRzOnN6o7LHOxM9+OnSwEEmmfj/S8x/U6ulK+R9b/1
   A==;
X-CSE-ConnectionGUID: GgPdiYofQ6qBJQyyFR312A==
X-CSE-MsgGUID: D3KH36RFTqO/kcc6VeRKsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22528057"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="22528057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 21:08:39 -0700
X-CSE-ConnectionGUID: qfidPCbqRDKr2VpoOL1pkg==
X-CSE-MsgGUID: oIn+mo2zRjmTAwbkNOzTaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="80912045"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jul 2024 21:08:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTvxz-000fxC-2o;
	Wed, 17 Jul 2024 04:08:35 +0000
Date: Wed, 17 Jul 2024 12:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9862/12989] ld.lld: error: Function Import: link
 error: linking module flags 'Code Model': IDs have conflicting values in
 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(segment.o at 1940660)'
Message-ID: <202407171133.iy5GToiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f40be61af99a67d5580c1448acd9b74c0376389
commit: 6458b8780cc5120173dcc544020490e2e5f9a94a [9862/12989] kconfig: refactor choice value calculation
config: riscv-randconfig-r061-20240715 (https://download.01.org/0day-ci/archive/20240717/202407171133.iy5GToiY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407171133.iy5GToiY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407171133.iy5GToiY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(net-traces.o at 2131940)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(skbuff.o at 2129720)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(memcontrol.o at 1886120)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(r8152.o at 2055500)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(filter.o at 2130800)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(md.o at 2093540)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(core.o at 1882220)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(super.o at 1936400)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(raid5.o at 2093300)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(trace.o at 1877900)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(vmscan.o at 1883360)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(syscall.o at 1879520)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(drbd_receiver.o at 2028680)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(inode.o at 1937000)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(protocol.o at 2174300)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(mds_client.o at 1947380)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(core.o at 2041940)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(segment.o at 1940660)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(volumes.o at 1937540)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1866440)' and 'vmlinux.a(rbd.o at 2029280)'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
