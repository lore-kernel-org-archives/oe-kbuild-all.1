Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD14F8A0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 19:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722971523; cv=none; b=DGUWBpgwOEVVTeXbS1jrH9xsWNv+MdaV2GTTwGfDOpiEUcwosQsylEeMthEEDvjVBVpYOl12G/Dyspdjrjq2J4pfGzFnst4ogE0M7mlht6G9I6oOUcF7VlQDhhFLEVuMNSVhBu16MMo8eYlWtyO9Oj5Ym4k7/bG+zSddFxOQpew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722971523; c=relaxed/simple;
	bh=8nvBa5CVaVOQvPhuNg9Ge6gTtVSMRWZhs8/Nk79A1Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzeevZpHANykVw7WPkltsnsBNf5iclcrzi3nnShQinTI8uweemZjrqkEGNrsER0fN4l4pcc+LbMuypfXSMyaTYINcC/AIJOG4gzfY0uG2eSeb1lEwF/ngdESdLPbP+TixvwCOLGNFxFBHLKWiGX1r0BmSvGRezKqvlTh5vURWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMGDgWSv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMGDgWSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722971521; x=1754507521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8nvBa5CVaVOQvPhuNg9Ge6gTtVSMRWZhs8/Nk79A1Cc=;
  b=UMGDgWSvk2ZPBfw4T7K3ZiplRFLYyJMmJ9aW584wxxeNpUC/hwIJ11Pk
   AYvwe+KbZ5qe2lq8U3EFwGOrw8VLf1nDzQMb2iH0xMGz1FuwHmWK1tyBF
   t7js3f8PN8UpIMgosYY3hpSVESdEBz5fVBADN4qU2Eo4P+x4RBXl7jqIW
   UqATNfnKbpuabBmB78W+Top6mxld0+3qe8H2a7jpNasWWBF3/AetVjP5L
   +2w3mPzWVN1FMxwrLR55UZplN3l2rYz+8tl+LeqCjjA+ukzPCu0xEUDmF
   S3ZgIZpVzj0UTicJsxkH5oOxALeMzFHgNn4NuYstr9CMJ/bj21T3XZ1Uh
   Q==;
X-CSE-ConnectionGUID: fFuBm3JmSyCnJV3aWEJ4+Q==
X-CSE-MsgGUID: PNDxfD/IThSNz5TILS6m8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="43539251"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="43539251"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 12:12:01 -0700
X-CSE-ConnectionGUID: DnIsBmpsSSOvuCAGORbECA==
X-CSE-MsgGUID: O810D0jBREuuuQzGiRHQ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="87272535"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Aug 2024 12:12:00 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbPb6-0004lw-2N;
	Tue, 06 Aug 2024 19:11:54 +0000
Date: Wed, 7 Aug 2024 03:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3152/3348] kernel/resource.c:1246:undefined
 reference to `devmem_is_allowed'
Message-ID: <202408070357.fsOhv7Od-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e391b34f6aa043c7afa40a2103163a0ef06d179
commit: b2d1f5c72c630f7ded52898f5b655f1abcb57aa5 [3152/3348] lib: Move KUnit tests into tests/ subdirectory
config: riscv-randconfig-001-20240806 (https://download.01.org/0day-ci/archive/20240807/202408070357.fsOhv7Od-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070357.fsOhv7Od-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070357.fsOhv7Od-lkp@intel.com/

Note: the linux-next/master HEAD 1e391b34f6aa043c7afa40a2103163a0ef06d179 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/resource.o: in function `__request_region_locked':
>> kernel/resource.c:1246:(.text+0xe54): undefined reference to `devmem_is_allowed'
>> riscv64-linux-ld: kernel/resource.c:1247:(.text+0xe62): undefined reference to `devmem_is_allowed'
   riscv64-linux-ld: drivers/char/mem.o: in function `page_is_allowed':
>> drivers/char/mem.c:62:(.text+0x442): undefined reference to `devmem_is_allowed'
>> riscv64-linux-ld: drivers/char/mem.c:62:(.text+0x7e4): undefined reference to `devmem_is_allowed'
   riscv64-linux-ld: drivers/char/mem.o: in function `range_is_allowed':
   drivers/char/mem.c:71:(.text+0xb28): undefined reference to `devmem_is_allowed'


vim +1246 kernel/resource.c

71a1d8ed900f8c Daniel Vetter      2020-11-27  1206  
63cdafe0af982e Alistair Popple    2021-05-06  1207  static int __request_region_locked(struct resource *res, struct resource *parent,
d75fc8bbccf7c0 Greg Kroah-Hartman 2006-06-12  1208  				   resource_size_t start, resource_size_t n,
e8de1481fd7126 Arjan van de Ven   2008-10-22  1209  				   const char *name, int flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1210  {
8b6d043b7ee2d1 Alan Cox           2010-03-29  1211  	DECLARE_WAITQUEUE(wait, current);
c26ec88ea86ad5 Bjorn Helgaas      2008-10-15  1212  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1213  	res->name = name;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1214  	res->start = start;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1215  	res->end = start + n - 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1216  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1217  	for (;;) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1218  		struct resource *conflict;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1219  
4e0d8f7eff3fbf Toshi Kani         2016-03-09  1220  		res->flags = resource_type(parent) | resource_ext_type(parent);
4e0d8f7eff3fbf Toshi Kani         2016-03-09  1221  		res->flags |= IORESOURCE_BUSY | flags;
4e0d8f7eff3fbf Toshi Kani         2016-03-09  1222  		res->desc = parent->desc;
4e0d8f7eff3fbf Toshi Kani         2016-03-09  1223  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1224  		conflict = __request_resource(parent, res);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1225  		if (!conflict)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1226  			break;
b926b7f3baecb2 Dave Hansen        2019-02-25  1227  		/*
b926b7f3baecb2 Dave Hansen        2019-02-25  1228  		 * mm/hmm.c reserves physical addresses which then
b926b7f3baecb2 Dave Hansen        2019-02-25  1229  		 * become unavailable to other users.  Conflicts are
b926b7f3baecb2 Dave Hansen        2019-02-25  1230  		 * not expected.  Warn to aid debugging if encountered.
b926b7f3baecb2 Dave Hansen        2019-02-25  1231  		 */
b926b7f3baecb2 Dave Hansen        2019-02-25  1232  		if (conflict->desc == IORES_DESC_DEVICE_PRIVATE_MEMORY) {
b926b7f3baecb2 Dave Hansen        2019-02-25  1233  			pr_warn("Unaddressable device %s %pR conflicts with %pR",
b926b7f3baecb2 Dave Hansen        2019-02-25  1234  				conflict->name, conflict, res);
b926b7f3baecb2 Dave Hansen        2019-02-25  1235  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1236  		if (conflict != parent) {
59ceeaaf355fa0 Simon Guinot       2015-09-10  1237  			if (!(conflict->flags & IORESOURCE_BUSY)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1238  				parent = conflict;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1239  				continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1240  			}
59ceeaaf355fa0 Simon Guinot       2015-09-10  1241  		}
8b6d043b7ee2d1 Alan Cox           2010-03-29  1242  		if (conflict->flags & flags & IORESOURCE_MUXED) {
8b6d043b7ee2d1 Alan Cox           2010-03-29  1243  			add_wait_queue(&muxed_resource_wait, &wait);
8b6d043b7ee2d1 Alan Cox           2010-03-29  1244  			write_unlock(&resource_lock);
8b6d043b7ee2d1 Alan Cox           2010-03-29  1245  			set_current_state(TASK_UNINTERRUPTIBLE);
8b6d043b7ee2d1 Alan Cox           2010-03-29 @1246  			schedule();
8b6d043b7ee2d1 Alan Cox           2010-03-29 @1247  			remove_wait_queue(&muxed_resource_wait, &wait);
8b6d043b7ee2d1 Alan Cox           2010-03-29  1248  			write_lock(&resource_lock);
8b6d043b7ee2d1 Alan Cox           2010-03-29  1249  			continue;
8b6d043b7ee2d1 Alan Cox           2010-03-29  1250  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1251  		/* Uhhuh, that didn't work out.. */
63cdafe0af982e Alistair Popple    2021-05-06  1252  		return -EBUSY;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1253  	}
63cdafe0af982e Alistair Popple    2021-05-06  1254  
63cdafe0af982e Alistair Popple    2021-05-06  1255  	return 0;
63cdafe0af982e Alistair Popple    2021-05-06  1256  }
63cdafe0af982e Alistair Popple    2021-05-06  1257  

:::::: The code at line 1246 was first introduced by commit
:::::: 8b6d043b7ee2d1b819dc833d677ea2aead71a0c0 resource: shared I/O region support

:::::: TO: Alan Cox <alan@linux.intel.com>
:::::: CC: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
