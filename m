Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB551B4F12
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 22:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728080807; cv=none; b=uIQRla0ljY18abvDGw3xTgqZZT4BAPNibyfPZ4RrmnbyNnXRC3KUY5WR8cf6Up5tkzF8cAalFEh1XLehOn2d3GQpuYZuKrKAaFsGbs5FVlqAWw+bE/AtM2v+xEFBrxgfK1UrPdxmk2CTLEBJEbPs5o/zDw3tXLPkXNLf9+SvtEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728080807; c=relaxed/simple;
	bh=msWo4BQ3UUua7xAKNiffNXTV4e7TYAsAVdSqPWiaEKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suYwAeDmYQs4cvW/qe7w4MH1GtyYaMHJzyEQT7nis/grZkOvu1z49wKNpaqhCIrQpU+bbNrfP632PSa1CEqIyZSOCpITfyAC0fWQJp+sRT60Dr0v+Tz64SKZ2ZJEHi/8AJkDZ2ZDvYSdhN4HXxymzhPBTx+BzeOUbsK9p/bIF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCoT/aFA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCoT/aFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728080806; x=1759616806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=msWo4BQ3UUua7xAKNiffNXTV4e7TYAsAVdSqPWiaEKg=;
  b=aCoT/aFA/Sg0QulBbuGBfymvNK56kwqXntmrxg/oadNZHHvfDQJqn4YG
   bspi1CwbZj7gyxvV4afTu63ctldHDqtGt3ev3un2LusXVoX3fr3Wcarpv
   OF0xlRAXcAwYXA1DEprqlkhhtvb6p34PADqgkAcJpWEzv98ho6/7r9CSh
   jlF3Foxg6ByNv2L6BSW3HlWqEBuLWsnge3zYIHasAAJk77QBgAReU3Jc+
   1nNlJQX1wb25R07xikruMmWPa3uObAFHfkT/HPBWdG+a7YECPzgfpQkdV
   /JX1apRPyuSgA3GNL1vKcR1/+UFruWYtN3USJVgTs2TEsk3RNuoMFoaUl
   w==;
X-CSE-ConnectionGUID: 5mWlEwqdQcO1I66w0/93qg==
X-CSE-MsgGUID: yRaRLyIfSc2KeKDmwVS/gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27447498"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27447498"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 15:26:45 -0700
X-CSE-ConnectionGUID: jt8j1E1xQNaTWsmtOqtTbg==
X-CSE-MsgGUID: jD6onhROTMqsQ8SaPQoKfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="75660221"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2024 15:26:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swql0-0002IA-0U;
	Fri, 04 Oct 2024 22:26:42 +0000
Date: Sat, 5 Oct 2024 06:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 30/31] ld: warning: orphan section
 `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
Message-ID: <202410050651.nYR7fFlK-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-006-20241004 (https://download.01.org/0day-ci/archive/20241005/202410050651.nYR7fFlK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050651.nYR7fFlK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050651.nYR7fFlK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld: warning: orphan section `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
   ld: .tmp_vmlinux1: section `.rela.dyn' can't be allocated in segment 2
   LOAD: .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .bss .brk .rela.dyn
>> ld: warning: orphan section `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
   ld: .tmp_vmlinux2: section `.rela.dyn' can't be allocated in segment 2
   LOAD: .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .bss .brk .rela.dyn
>> ld: warning: orphan section `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
>> ld: warning: dot moved backwards before `.rela.dyn'
   ld: vmlinux: section `.rela.dyn' can't be allocated in segment 2
   LOAD: .init.text .init.rela .init.relr .altinstr_aux .init.data .x86_cpu_dev.init .altinstructions .altinstr_replacement .apicdrivers .exit.text .exit.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .bss .brk .rela.dyn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
