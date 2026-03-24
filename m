Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB9D2773EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380729; cv=none; b=bVIlGQdXDwHBDMq2x50j0FVqyg9kSbe33sfqMp9FwfHr7iCxLZ/ytkZ/V4TfOzjxtvyyFOc6JVTzlQ+6xCMN2VboTQDUTbqUhVUxiSbytt9CCY5GppT+5979QkTwKhMgem/WJ2EYlHAqSF3tl018tPCFu3ATNIWz7+Yw49XPXEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380729; c=relaxed/simple;
	bh=UqtlAU0pEqA1OS50CvpiIGl9s+vH6ssrkyeSTiN9ZpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7gB0unl2697pCfjDYlfJLPV/ZbL4j4PRWN0nFfWeneqFJ7EOazg6jQa4B6WJkzLIqr/4vbxDiLs5CDCKPRcmrpTCWF7DWZjsVT2xdhkGEAnAPS+IOEDO+F1AhjlHplvFrYQ77/J6/HjjPjlAWIPzcgj2kNVEMydh6ckF33E4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iC9RTqDD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iC9RTqDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774380727; x=1805916727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UqtlAU0pEqA1OS50CvpiIGl9s+vH6ssrkyeSTiN9ZpU=;
  b=iC9RTqDDPlE70J3Cx2FD4y2IsZF8MqhwqD7eJoB/E+cNviiW36UwAWl5
   DeqY9i66ozl6OB/aK1Gh/usjsfACSzFIKu8w/jyzzuTvvgTEVY6cVw7Y7
   WTZPjW0GQLpklpHFMu5DXiVEctFZp8c79JGASaISEq+S5v9f4HVHaL8Ix
   egNFePL9Op2GCp8ZqK7WAApfnIqHEAXcyyLKI4qoW0H3B6VwRcIZJ0Iab
   DyETV41YuqMhYPczSOzAnBn1hcZBDUpGq2VbQk2XTmdSbrKhXjSg/1XWu
   V6d1BAPpKpIY22OGgOdhyy3m1OdTJWs0lTOkckt6Qk1LCSyxlKvEDDoG0
   Q==;
X-CSE-ConnectionGUID: 3Uciz4yXTz+t2+q3lD/egg==
X-CSE-MsgGUID: 4G2eJMcdTHW64NWj2e1zfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62961298"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="62961298"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 12:32:06 -0700
X-CSE-ConnectionGUID: F+/CIvQBQyujQnpKa0GX8g==
X-CSE-MsgGUID: 4azcV2UFTIaQ8rReTd55Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224408903"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Mar 2026 12:32:05 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w57Tu-000000005LX-3MIE;
	Tue, 24 Mar 2026 19:32:02 +0000
Date: Wed, 25 Mar 2026 03:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/2] lsm: add backing_file LSM hooks
Message-ID: <202603250308.5J5NvIuE-lkp@intel.com>
References: <20260323042510.3331778-5-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323042510.3331778-5-paul@paul-moore.com>

Hi Paul,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pcmoore-selinux/next]
[also build test ERROR on xiang-erofs/dev-test xiang-erofs/dev xiang-erofs/fixes linus/master v7.0-rc5 next-20260324]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Moore/lsm-add-backing_file-LSM-hooks/20260324-111550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20260323042510.3331778-5-paul%40paul-moore.com
patch subject: [RFC PATCH v2 1/2] lsm: add backing_file LSM hooks
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260325/202603250308.5J5NvIuE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250308.5J5NvIuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250308.5J5NvIuE-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: init/do_mounts.o: in function `security_backing_file_alloc':
>> (.text+0x40): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: init/do_mounts.o: in function `security_backing_file_free':
>> (.text+0x80): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: init/noinitramfs.o: in function `security_backing_file_alloc':
   (.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: init/noinitramfs.o: in function `security_backing_file_free':
   (.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: arch/parisc/mm/fault.o: in function `security_backing_file_alloc':
   (.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/mm/fault.o: in function `security_backing_file_free':
   (.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: arch/parisc/kernel/cache.o: in function `security_backing_file_alloc':
   (.text+0x4c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/cache.o: in function `security_backing_file_free':
   (.text+0x500): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: arch/parisc/kernel/traps.o: in function `security_backing_file_alloc':
   (.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/traps.o: in function `security_backing_file_free':
   (.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: arch/parisc/kernel/sys_parisc.o: in function `security_backing_file_alloc':
   (.text+0x400): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/sys_parisc.o: in function `security_backing_file_free':
   (.text+0x440): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: arch/parisc/kernel/ptrace.o: in function `security_backing_file_alloc':
   (.text+0x540): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/ptrace.o: in function `security_backing_file_free':
   (.text+0x580): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: arch/parisc/kernel/parisc_ksyms.o: in function `security_backing_file_alloc':
   (.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/parisc_ksyms.o: in function `security_backing_file_free':
   (.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: arch/parisc/kernel/unaligned.o: in function `security_backing_file_alloc':
   (.text+0x280): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/unaligned.o: in function `security_backing_file_free':
   (.text+0x2c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/fork.o: in function `security_backing_file_alloc':
   (.text+0xd80): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/fork.o: in function `security_backing_file_free':
   (.text+0xdc0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/exec_domain.o: in function `security_backing_file_alloc':
>> (.text+0x40): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/exec_domain.o: in function `security_backing_file_free':
>> (.text+0x80): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/cpu.o: in function `security_backing_file_alloc':
   (.text+0x800): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/cpu.o: in function `security_backing_file_free':
   (.text+0x840): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/exit.o: in function `security_backing_file_alloc':
   (.text+0x980): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/exit.o: in function `security_backing_file_free':
   (.text+0x9c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/resource.o: in function `security_backing_file_alloc':
   (.text+0x1640): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/resource.o: in function `security_backing_file_free':
   (.text+0x1680): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/sysctl.o: in function `security_backing_file_alloc':
   (.text+0x1a80): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sysctl.o: in function `security_backing_file_free':
   (.text+0x1ac0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/capability.o: in function `security_backing_file_alloc':
   (.text+0x680): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/capability.o: in function `security_backing_file_free':
   (.text+0x6c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/ptrace.o: in function `security_backing_file_alloc':
   (.text+0x780): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/ptrace.o: in function `security_backing_file_free':
   (.text+0x7c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/signal.o: in function `security_backing_file_alloc':
   (.text+0x1f00): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/signal.o: in function `security_backing_file_free':
   (.text+0x1f40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/sys.o: in function `security_backing_file_alloc':
   (.text+0x14c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sys.o: in function `security_backing_file_free':
   (.text+0x1500): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/umh.o: in function `security_backing_file_alloc':
   (.text+0x9c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/umh.o: in function `security_backing_file_free':
   (.text+0xa00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/pid.o: in function `security_backing_file_alloc':
   (.text+0xa40): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/pid.o: in function `security_backing_file_free':
   (.text+0xa80): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/extable.o: in function `security_backing_file_alloc':
   (.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/extable.o: in function `security_backing_file_free':
   (.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/params.o: in function `security_backing_file_alloc':
   (.text+0x1100): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/params.o: in function `security_backing_file_free':
   (.text+0x1140): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/nsproxy.o: in function `security_backing_file_alloc':
   (.text+0x440): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/nsproxy.o: in function `security_backing_file_free':
   (.text+0x480): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/nstree.o: in function `security_backing_file_alloc':
   (.text+0xc00): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/nstree.o: in function `security_backing_file_free':
   (.text+0xc40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/cred.o: in function `security_backing_file_alloc':
   (.text+0x900): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/cred.o: in function `security_backing_file_free':
   (.text+0x940): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/reboot.o: in function `security_backing_file_alloc':
   (.text+0xec0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/reboot.o: in function `security_backing_file_free':
   (.text+0xf00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/ksyms_common.o: in function `security_backing_file_alloc':
   (.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/ksyms_common.o: in function `security_backing_file_free':
   (.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/groups.o: in function `security_backing_file_alloc':
   (.text+0x3c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/groups.o: in function `security_backing_file_free':
   (.text+0x400): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/sched/core.o: in function `security_backing_file_alloc':
   (.text+0xac0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sched/core.o: in function `security_backing_file_free':
   (.text+0xb00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/sched/fair.o: in function `security_backing_file_alloc':
   (.text+0x48c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sched/fair.o: in function `security_backing_file_free':
   (.text+0x4900): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/sched/build_policy.o: in function `security_backing_file_alloc':
   (.text+0x5240): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sched/build_policy.o: in function `security_backing_file_free':
   (.text+0x5280): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/sched/build_utility.o: in function `security_backing_file_alloc':
   (.text+0x3480): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sched/build_utility.o: in function `security_backing_file_free':
   (.text+0x34c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/power/qos.o: in function `security_backing_file_alloc':
   (.text+0x200): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/power/qos.o: in function `security_backing_file_free':
   (.text+0x240): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/printk/printk.o: in function `security_backing_file_alloc':
   (.text+0x2700): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/printk/printk.o: in function `security_backing_file_free':
   (.text+0x2740): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: kernel/time/time.o: in function `security_backing_file_alloc':
   (.text+0x29c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/time/time.o: in function `security_backing_file_free':
   (.text+0x2a00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
--
   (.text+0x180): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/nullfs.o: in function `security_backing_file_free':
   (.text+0x1c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/proc_namespace.o: in function `security_backing_file_alloc':
   (.text+0xbc0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/proc_namespace.o: in function `security_backing_file_free':
   (.text+0xc00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/eventpoll.o: in function `security_backing_file_alloc':
   (.text+0x1ec0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/eventpoll.o: in function `security_backing_file_free':
   (.text+0x1f00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/anon_inodes.o: in function `security_backing_file_alloc':
   (.text+0x6c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/anon_inodes.o: in function `security_backing_file_free':
   (.text+0x700): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/signalfd.o: in function `security_backing_file_alloc':
   (.text+0x840): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/signalfd.o: in function `security_backing_file_free':
   (.text+0x880): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/timerfd.o: in function `security_backing_file_alloc':
   (.text+0x1040): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/timerfd.o: in function `security_backing_file_free':
   (.text+0x1080): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/eventfd.o: in function `security_backing_file_alloc':
   (.text+0xc80): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/eventfd.o: in function `security_backing_file_free':
   (.text+0xcc0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/aio.o: in function `security_backing_file_alloc':
   (.text+0x3240): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/aio.o: in function `security_backing_file_free':
   (.text+0x3280): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/locks.o: in function `security_backing_file_alloc':
   (.text+0x49c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/locks.o: in function `security_backing_file_free':
   (.text+0x4a00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/coredump.o: in function `security_backing_file_alloc':
   (.text+0x2380): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/coredump.o: in function `security_backing_file_free':
   (.text+0x23c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/fhandle.o: in function `security_backing_file_alloc':
   (.text+0x840): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/fhandle.o: in function `security_backing_file_free':
   (.text+0x880): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/proc/task_mmu.o: in function `security_backing_file_alloc':
   (.text+0x3a00): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/proc/task_mmu.o: in function `security_backing_file_free':
   (.text+0x3a40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/proc/root.o: in function `security_backing_file_alloc':
   (.text+0x8c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/proc/root.o: in function `security_backing_file_free':
   (.text+0x900): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/proc/base.o: in function `security_backing_file_alloc':
   (.text+0x3440): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/proc/base.o: in function `security_backing_file_free':
   (.text+0x3480): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/proc/fd.o: in function `security_backing_file_alloc':
   (.text+0xf40): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/proc/fd.o: in function `security_backing_file_free':
   (.text+0xf80): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/proc/proc_sysctl.o: in function `security_backing_file_alloc':
   (.text+0x2bc0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/proc/proc_sysctl.o: in function `security_backing_file_free':
   (.text+0x2c00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/kernfs/mount.o: in function `security_backing_file_alloc':
   (.text+0x4c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/kernfs/mount.o: in function `security_backing_file_free':
   (.text+0x500): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/kernfs/inode.o: in function `security_backing_file_alloc':
   (.text+0x700): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/kernfs/inode.o: in function `security_backing_file_free':
   (.text+0x740): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/kernfs/dir.o: in function `security_backing_file_alloc':
   (.text+0x1b00): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/kernfs/dir.o: in function `security_backing_file_free':
   (.text+0x1b40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/kernfs/file.o: in function `security_backing_file_alloc':
   (.text+0x1580): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/kernfs/file.o: in function `security_backing_file_free':
   (.text+0x15c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/kernfs/symlink.o: in function `security_backing_file_alloc':
   (.text+0x280): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/kernfs/symlink.o: in function `security_backing_file_free':
   (.text+0x2c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/sysfs/symlink.o: in function `security_backing_file_alloc':
   (.text+0x240): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/sysfs/symlink.o: in function `security_backing_file_free':
   (.text+0x280): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/sysfs/mount.o: in function `security_backing_file_alloc':
   (.text+0x200): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/sysfs/mount.o: in function `security_backing_file_free':
   (.text+0x240): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/devpts/inode.o: in function `security_backing_file_alloc':
   (.text+0x600): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/devpts/inode.o: in function `security_backing_file_free':
   (.text+0x640): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/ramfs/inode.o: in function `security_backing_file_alloc':
   (.text+0x240): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/ramfs/inode.o: in function `security_backing_file_free':
   (.text+0x280): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: fs/ramfs/file-mmu.o: in function `security_backing_file_alloc':
>> (.text+0x40): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: fs/ramfs/file-mmu.o: in function `security_backing_file_free':
>> (.text+0x80): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: security/commoncap.o: in function `security_backing_file_alloc':
   (.text+0x80): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: security/commoncap.o: in function `security_backing_file_free':
   (.text+0xc0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: security/min_addr.o: in function `security_backing_file_alloc':
   (.text+0x80): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: security/min_addr.o: in function `security_backing_file_free':
   (.text+0xc0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: block/bdev.o: in function `security_backing_file_alloc':
   (.text+0x1580): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: block/bdev.o: in function `security_backing_file_free':
   (.text+0x15c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: block/blk-ioc.o: in function `security_backing_file_alloc':
   (.text+0x1c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: block/blk-ioc.o: in function `security_backing_file_free':
   (.text+0x200): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: block/ioprio.o: in function `security_backing_file_alloc':
   (.text+0x380): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: block/ioprio.o: in function `security_backing_file_free':
   (.text+0x3c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: io_uring/io_uring.o: in function `security_backing_file_alloc':
   (.text+0x9c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: io_uring/io_uring.o: in function `security_backing_file_free':
   (.text+0xa00): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: io_uring/notif.o: in function `security_backing_file_alloc':
   (.text+0x3c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: io_uring/notif.o: in function `security_backing_file_free':
   (.text+0x400): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: io_uring/poll.o: in function `security_backing_file_alloc':
   (.text+0x1080): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: io_uring/poll.o: in function `security_backing_file_free':
   (.text+0x10c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: io_uring/wait.o: in function `security_backing_file_alloc':
   (.text+0x300): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: io_uring/wait.o: in function `security_backing_file_free':
   (.text+0x340): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: io_uring/uring_cmd.o: in function `security_backing_file_alloc':
   (.text+0x8c0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: io_uring/uring_cmd.o: in function `security_backing_file_free':
   (.text+0x900): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: io_uring/sqpoll.o: in function `security_backing_file_alloc':
   (.text+0x380): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: io_uring/sqpoll.o: in function `security_backing_file_free':
   (.text+0x3c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: io_uring/register.o: in function `security_backing_file_alloc':
   (.text+0x1140): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: io_uring/register.o: in function `security_backing_file_free':
   (.text+0x1180): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: io_uring/truncate.o: in function `security_backing_file_alloc':
   (.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: io_uring/truncate.o: in function `security_backing_file_free':
   (.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: drivers/char/mem.o: in function `security_backing_file_alloc':
   (.text+0x640): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: drivers/char/mem.o: in function `security_backing_file_free':
   (.text+0x680): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: drivers/char/random.o: in function `security_backing_file_alloc':
   (.text+0x1fc0): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: drivers/char/random.o: in function `security_backing_file_free':
   (.text+0x2000): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: drivers/base/core.o: in function `security_backing_file_alloc':
   (.text+0x5f40): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: drivers/base/core.o: in function `security_backing_file_free':
   (.text+0x5f80): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: drivers/base/syscore.o: in function `security_backing_file_alloc':
   (.text+0x100): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: drivers/base/syscore.o: in function `security_backing_file_free':
   (.text+0x140): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: drivers/base/property.o: in function `security_backing_file_alloc':
   (.text+0x2680): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: drivers/base/property.o: in function `security_backing_file_free':
   (.text+0x26c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: drivers/base/firmware_loader/main.o: in function `security_backing_file_alloc':
   (.text+0x480): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: drivers/base/firmware_loader/main.o: in function `security_backing_file_free':
   (.text+0x4c0): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: lib/kobject_uevent.o: in function `security_backing_file_alloc':
   (.text+0x700): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: lib/kobject_uevent.o: in function `security_backing_file_free':
   (.text+0x740): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here
   hppa-linux-ld: lib/vsprintf.o: in function `security_backing_file_alloc':
   (.text+0x7540): multiple definition of `security_backing_file_alloc'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: lib/vsprintf.o: in function `security_backing_file_free':
   (.text+0x7580): multiple definition of `security_backing_file_free'; init/main.o:(.text+0x40): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
