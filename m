Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5775C9CA52
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkgqWWMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696657850; x=1728193850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LYZVC1bonbmfH2o4oz/RivKL31l+Ncigd22Q+IytNL0=;
  b=VkgqWWMZRWLYvbBzg7S4u8XUC7OM9aeO+RzavB0cIqymhUvMiE4NrMEH
   WinA+2/OYqlX6TuHZYhoNDbw1LXaCvT5JGf2A+RVv0LNr6EJ50tsRlHkt
   CdH4oZAXT0qA9k2oqgr5+34fFkGi5KdsE0l1cLkc0Or4bXX8YwHqzZBZq
   DzpuncfGdt3mPGoorQ6UB7AERRb3/4P0ZaEnNNA+qcWEP711IjQnFIFkF
   i+gx2fJ9k/xLmwMOgDJ1rHQToLFaO/YI3bd8mE7cLrOjWTMZ5UlwqKq86
   KWfZmVm5nLvtJQYcWMUzKVmoCyQxpkO+QKVakmuK8RUUFMGe1F1iRoZYy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="2504471"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="2504471"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 22:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702294594"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="702294594"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Oct 2023 22:50:48 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qp0D7-00041z-2Y;
	Sat, 07 Oct 2023 05:50:45 +0000
Date: Sat, 7 Oct 2023 13:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] scripts: Build per module Rust crates
Message-ID: <202310071313.F8OX0lvD-lkp@intel.com>
References: <20231006155739.246381-2-yakoyoku@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006155739.246381-2-yakoyoku@gmail.com>

Hi Martin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Rodriguez-Reboredo/scripts-Build-per-module-Rust-crates/20231006-235823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20231006155739.246381-2-yakoyoku%40gmail.com
patch subject: [RFC PATCH 1/1] scripts: Build per module Rust crates
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20231007/202310071313.F8OX0lvD-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310071313.F8OX0lvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310071313.F8OX0lvD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/input/input-core.o', needed by 'drivers/input/built-in.a'.
   make[5]: Target 'drivers/input/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/iomap/iomap.o', needed by 'fs/iomap/built-in.a'.
   make[5]: Target 'fs/iomap/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/proc/proc.o', needed by 'fs/proc/built-in.a'.
   make[5]: Target 'fs/proc/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/devpts/devpts.o', needed by 'fs/devpts/built-in.a'.
   make[5]: Target 'fs/devpts/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/ramfs/ramfs.o', needed by 'fs/ramfs/built-in.a'.
   make[5]: Target 'fs/ramfs/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'fs/exportfs/exportfs.o', needed by 'fs/exportfs/built-in.a'.
   make[5]: Target 'fs/exportfs/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'kernel/printk/printk_support.o', needed by 'kernel/printk/built-in.a'.
   make[5]: Target 'kernel/printk/' not remade because of errors.
--
>> make[5]: *** No rule to make target 'lib/crypto/libblake2s.o', needed by 'lib/crypto/built-in.a'.
   make[5]: Target 'lib/crypto/' not remade because of errors.
--
>> make[6]: *** No rule to make target 'drivers/base/firmware_loader/firmware_class.o', needed by 'drivers/base/firmware_loader/built-in.a'.
   make[6]: Target 'drivers/base/firmware_loader/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
