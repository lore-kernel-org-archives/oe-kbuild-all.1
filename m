Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456AF1C54A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738331056; cv=none; b=uxPTKgjZONQeiRELeQZZEcCebUSeRnNRPYP3aLsqbFX0+drRB50Kt+E/0x87Yu9bncGLbuL5oHPYOVPWSEMsUIQTJdNDEhQD8cSwsSccKjKpYEc5klUph/yMW/SuL0OrXZJnryRa6iihc2QlQswoLzTgR73v+A9SPH6fVsCLkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738331056; c=relaxed/simple;
	bh=ZTnumPN0hO6W8SA+XJ4TwwIzgqswOeC8ByqSfrB1TcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tH02Y0y2zMlbVwm7pS7YzVHTI9FGX935GvNgE8dFvzx8XsloW2c5yquUxxMqvf/aQa8kTMM5wXyg4NJ5GNtkcg52kVT6561C9rp7puL0bK9zBTYm7wiYIIwtucQYSk4pxwsnGLP5UmRHEdlA4GTeZl1H8cE+rb+6vrztmkM305A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGAGjFYi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGAGjFYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738331053; x=1769867053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTnumPN0hO6W8SA+XJ4TwwIzgqswOeC8ByqSfrB1TcQ=;
  b=CGAGjFYiPYY/OMtc6KwDyShKAVADneF9CLfrM22QU7cvmeJffj3BLj8j
   QPbJfKXbnHcO4iT7NlJviZUK4sVFAQk5R3ucqJpOceK0tUG3EqsQgyy0s
   XIyC8lAvYx14ncW2FT25Tk/+gRmaStnyCSvpoxUMDyiy3dm0MExv0phSX
   PiAZ9dEEvJkKO9Cq3KywNKzFtwWrQavqCq36RHCd20KfhqXVkgFUjykEQ
   eUhLyGAh6v4TNvGqk/dUtpNLAfY/JCm76Efya7onLzojRGN8QOPl+nYdI
   Q7S6iBXv8xyLG+idSsyBiMWigmiFUqEyadc/Qs41/JWOHC+1tpHOXE0rT
   Q==;
X-CSE-ConnectionGUID: oZp+6IAFRE+e+yFI3d8TIg==
X-CSE-MsgGUID: BWlGsmQqSkOatxXqCbPvQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="64261044"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="64261044"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 05:44:13 -0800
X-CSE-ConnectionGUID: mAOG6B2yQ6KpL4JBtHC8Lg==
X-CSE-MsgGUID: nD3E8qP5RFyLYMD7BZDhDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132889101"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2025 05:44:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdrJa-000mQv-09;
	Fri, 31 Jan 2025 13:44:10 +0000
Date: Fri, 31 Jan 2025 21:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	Farrah Chen <farrah.chen@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [kvm:kvm-coco-queue-20250129 43/129] include/linux/init.h:319:27:
 error: redefinition of '__exitcall_vt_exit'
Message-ID: <202501312122.IIuMSJu4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-coco-queue-20250129
head:   0bc4f452607db4e7eee4d3056cd6ec98636260bc
commit: 4b55a8f7c5f508fe1dd0005aecc81bbb5676aaec [43/129] KVM: VMX: Refactor VMX module init/exit functions
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20250131/202501312122.IIuMSJu4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501312122.IIuMSJu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501312122.IIuMSJu4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/moduleparam.h:5,
                    from arch/x86/kvm/vmx/main.c:2:
   arch/x86/kvm/vmx/main.c:176:13: error: 'vt_exit' undeclared here (not in a function); did you mean 'vmx_exit'?
     176 | module_exit(vt_exit);
         |             ^~~~~~~
   include/linux/init.h:319:57: note: in definition of macro '__exitcall'
     319 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                                                         ^~
   arch/x86/kvm/vmx/main.c:176:1: note: in expansion of macro 'module_exit'
     176 | module_exit(vt_exit);
         | ^~~~~~~~~~~
>> include/linux/init.h:319:27: error: redefinition of '__exitcall_vt_exit'
     319 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                           ^~~~~~~~~~~
   include/linux/module.h:100:25: note: in expansion of macro '__exitcall'
     100 | #define module_exit(x)  __exitcall(x);
         |                         ^~~~~~~~~~
   arch/x86/kvm/vmx/main.c:183:1: note: in expansion of macro 'module_exit'
     183 | module_exit(vt_exit);
         | ^~~~~~~~~~~
   include/linux/init.h:319:27: note: previous definition of '__exitcall_vt_exit' with type 'exitcall_t' {aka 'void (*)(void)'}
     319 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                           ^~~~~~~~~~~
   include/linux/module.h:100:25: note: in expansion of macro '__exitcall'
     100 | #define module_exit(x)  __exitcall(x);
         |                         ^~~~~~~~~~
   arch/x86/kvm/vmx/main.c:176:1: note: in expansion of macro 'module_exit'
     176 | module_exit(vt_exit);
         | ^~~~~~~~~~~


vim +/__exitcall_vt_exit +319 include/linux/init.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  317  
^1da177e4c3f41 Linus Torvalds 2005-04-16  318  #define __exitcall(fn)						\
^1da177e4c3f41 Linus Torvalds 2005-04-16 @319  	static exitcall_t __exitcall_##fn __exit_call = fn
^1da177e4c3f41 Linus Torvalds 2005-04-16  320  

:::::: The code at line 319 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
