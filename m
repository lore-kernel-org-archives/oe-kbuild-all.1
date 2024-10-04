Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54BC1DACB5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728067238; cv=none; b=inyY9lfmdNmK4ojlSnPOtRdEhXnkB85R0b7AEYJawdSOLmYvQxnNmVpETzsvSIahNEKltq2ATy23sdBLZmedoR6EVYSmi4OORKd+E4arDkf0sXbqGTnhcyGNwXEsaw7lisLlrPtY+I8DdJ5rPk9HOCulP9rWbRvoTcxqKInpxio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728067238; c=relaxed/simple;
	bh=aVjHoW/D4fPaY1wSjMAH1uZxd7gsSrNJL5H73AYvHrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lcoivM9s3CsWudS1ZJIdhXWTbsp7SR6zLArJqIvsaHMqG0CDP+bOMjfmijF9MCcyKzhFIlW/Mzpw3LgUC9zP2gLb9w5zCcI6VYzIwA8FyIq5YjgOPgXbpfNnc9C0/iWhUgYKeaQqY19igTft03jXiuHkUnUt3c9U2jV3bnSerBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKU/814r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKU/814r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728067237; x=1759603237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVjHoW/D4fPaY1wSjMAH1uZxd7gsSrNJL5H73AYvHrc=;
  b=LKU/814rw1EKzmaYse5sdsIZ4z0ANex4WwnsMbuO9kQVeGOMcxDrqnpq
   DcZOPTEu6UPbcxvlq3J8iLD09b6PrsEzC4raaJIUjXj19GR+5m9cVJkHi
   2aiWrTFeOBEBoHFLk19wg0z3DJr5ZLxBjkLpEwzg3Ns2s7o4AvnMdvhRa
   PtKvhd+lQxUux7fkZG3NFhcpKk1lciUgJY17uFH1Rp2mbMqs2mwL8gdFU
   jZPiKwMdD3/hCQjHYt6uoCfLlZJPSzIs90HpSimHWWnXTcpukZY8wUeZz
   ZXWiuM5CfX7zeK4GZ5nKV66KdRU4Pp/jT64/sfdXnZNBfD67nM7iXsoQV
   w==;
X-CSE-ConnectionGUID: W13mT/8iQcaVynT+2GSwHg==
X-CSE-MsgGUID: CCLa70kFQ9eY/D4tAOjXvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27445834"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27445834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 11:40:36 -0700
X-CSE-ConnectionGUID: CedBQJXhSBikn1pbUBDoQA==
X-CSE-MsgGUID: XRmPfyWOQky2P0B5GbkOdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="79617772"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2024 11:40:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swnE8-000252-1P;
	Fri, 04 Oct 2024 18:40:32 +0000
Date: Sat, 5 Oct 2024 02:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 30/31] ld: warning: orphan section
 `.relaalloc_tags' from `vmlinux.o' being placed in section `.rela.dyn'
Message-ID: <202410050254.3w5ZA1bb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   1295be6d1a5cb6a30132ee8b01c79018794d0c3e
commit: 61f3a3cf6f5940319514b36400d7c994b163d8c5 [30/31] x86/kernel: Switch to PIE linking for the core kernel
config: x86_64-randconfig-013-20241004 (https://download.01.org/0day-ci/archive/20241005/202410050254.3w5ZA1bb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050254.3w5ZA1bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050254.3w5ZA1bb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld: warning: orphan section `.relaalloc_tags' from `vmlinux.o' being placed in section `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: .tmp_vmlinux1: section `.rela.dyn' can't be allocated in segment 2
   LOAD: .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .retpoline_sites .ibt_endbr_seal .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .bss .brk .rela.dyn
>> ld: warning: orphan section `.relaalloc_tags' from `vmlinux.o' being placed in section `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: .tmp_vmlinux2: section `.rela.dyn' can't be allocated in segment 2
   LOAD: .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .retpoline_sites .ibt_endbr_seal .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .bss .brk .rela.dyn
>> ld: warning: orphan section `.relaalloc_tags' from `vmlinux.o' being placed in section `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: warning: dot moved backwards before `.rela.dyn'
   ld: vmlinux: section `.rela.dyn' can't be allocated in segment 2
   LOAD: .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .retpoline_sites .ibt_endbr_seal .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .bss .brk .rela.dyn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
