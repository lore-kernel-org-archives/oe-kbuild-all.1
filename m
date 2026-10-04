Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1043AFD0A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109808; cv=none; b=kSIUfrovpQAZaLq3nb6BdGtg9Oql+hsLKL6R2VCypcqs/RPjp7wbBXSpKo1IQoTMCZSg0lyBDJoynJS1Mni3LaNsgFF+sY9Gsb3Ys+pITKDvJYNy3pvVwUs+zZp3oEqmIZ7nLLtKVdHtL4znoKNCERo0W3/ZNaMKJcbGVxnEL6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109808; c=relaxed/simple;
	bh=bSRnQb+HoeoXF3yr0xHYAw/KhWVFKFlJDzObJNcNVus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bMeLh6n+tmY1yTNJINmPk6dJmHm/Ol9cJ7FrpVa4y7pWWjLN3UZU5rgSla9oOmNQh9X0xLOa+aen+s9GSewefxRwsk4yAbdfiM6jp1BP4OpgZEXVjpdE0ooJ/B+GzNLf1+GhII6KBP1SUbLOT0plwtTfp8Kyiri4jLUn4QQ45us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GujSq3kE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GujSq3kE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791109806; x=1822645806;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bSRnQb+HoeoXF3yr0xHYAw/KhWVFKFlJDzObJNcNVus=;
  b=GujSq3kEEJAW7mBzpNfF4S4g3PvK95WjkSXpueJ99Tw93mCuT6iHGRrt
   mBfbJXRl7Ynj5eeNGZXFNIUYJeEE6GgFVOYN3Qy2DKon0jJnSV3riqFti
   HVdLmqGcY0acJgqCb53jsdRhPsecme5nzXY2cDuJ+6rwHRRdW1ukbiGoN
   g3ni1PLntkJ/LR6X4kry5embDnY1yklyHPLYW7RWZztmcfIvvZSmM/UVt
   b8XL4M1Lr0dso5zEZNgxMgSvjLtiwYImRVLkSgqQKlNt/jKB5bDkPi/F2
   KzptVZanH8UPJvlEDy01sHGiTZf0P3siYf9rnYy7m6HvScIU3TfzBGxB2
   g==;
X-CSE-ConnectionGUID: kSTXgZ4lQ0SucPQb/Cny4Q==
X-CSE-MsgGUID: t6/NNVplRq+OgmZsFoBNbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91667978"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91667978"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 03:30:06 -0700
X-CSE-ConnectionGUID: I4L4ku4KSumpJQsfFL+gRQ==
X-CSE-MsgGUID: Co+NUh9oT/uywOogBlgsyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="275695598"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2026 03:30:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDJTl-00000000UfX-0Voy;
	Sun, 04 Oct 2026 10:30:01 +0000
Date: Sun, 04 Oct 2026 18:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
 Oleg Nesterov <oleg@redhat.com>
Subject: [pcmoore:dev-staging 19/19]
 arch/alpha/kernel/ptrace.c:500:21: error: passing argument 2 of
 'audit_syscall_entry' makes pointer from integer without a cast
Message-ID: <202610041836.6TatRQSm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git d=
ev-staging
head:   de903b3126651c6a97cfb7786e535de974368708
commit: de903b3126651c6a97cfb7786e535de974368708 [19/19] audit: rename audi=
t_syscall_entry_regs() to audit_syscall_entry()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/2026100=
4/202610041836.6TatRQSm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261004/202610041836.6TatRQSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   arch/alpha/kernel/ptrace.c: In function 'syscall_trace_enter':
>> arch/alpha/kernel/ptrace.c:500:21: error: passing argument 2 of 'audit_s=
yscall_entry' makes pointer from integer without a cast [-Wint-conversion]
     500 |                 regs->r16, regs->r17, regs->r18, regs->r19);
         |                 ~~~~^~~~~
         |                     |
         |                     long unsigned int
   In file included from arch/alpha/kernel/ptrace.c:18:
   include/linux/audit.h:375:67: note: expected 'struct pt_regs *' but argu=
ment is of type 'long unsigned int'
     375 | static inline void audit_syscall_entry(int major, struct pt_regs=
 *regs)
         |                                                   ~~~~~~~~~~~~~~=
~~^~~~
>> arch/alpha/kernel/ptrace.c:499:9: error: too many arguments to function =
'audit_syscall_entry'; expected 2, have 5
     499 |         audit_syscall_entry(syscall_get_nr(current, regs),
         |         ^~~~~~~~~~~~~~~~~~~
     500 |                 regs->r16, regs->r17, regs->r18, regs->r19);
         |                            ~~~~~~~~~
   include/linux/audit.h:375:20: note: declared here
     375 | static inline void audit_syscall_entry(int major, struct pt_regs=
 *regs)
         |                    ^~~~~~~~~~~~~~~~~~~


vim +/audit_syscall_entry +500 arch/alpha/kernel/ptrace.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  473 =20
12f79be93d9469 Al Viro         2012-05-26  474  asmlinkage unsigned long sy=
scall_trace_enter(void)
^1da177e4c3f41 Linus Torvalds  2005-04-16  475  {
a9302e84394457 =E8=94=A1=E6=AD=A3=E9=BE=99          2013-12-20  476  	struc=
t pt_regs *regs =3D current_pt_regs();
55b22075f7840e Magnus Lindholm 2026-04-09  477 =20
12f79be93d9469 Al Viro         2012-05-26  478  	if (test_thread_flag(TIF_S=
YSCALL_TRACE) &&
622f04e97415e6 Thomas Gleixner 2026-07-07  479  		!ptrace_report_syscall_pe=
rmit_entry(regs)) {
55b22075f7840e Magnus Lindholm 2026-04-09  480  		syscall_set_nr(current, r=
egs, -1);
55b22075f7840e Magnus Lindholm 2026-04-09  481  		if (regs->r19 =3D=3D 0 &&=
 regs->r0 =3D=3D (unsigned long)-1)
55b22075f7840e Magnus Lindholm 2026-04-09  482  			syscall_set_return_value=
(current, regs, -ENOSYS, 0);
55b22075f7840e Magnus Lindholm 2026-04-09  483  		return -1UL;
55b22075f7840e Magnus Lindholm 2026-04-09  484  	}
55b22075f7840e Magnus Lindholm 2026-04-09  485 =20
55b22075f7840e Magnus Lindholm 2026-04-09  486  	/*
55b22075f7840e Magnus Lindholm 2026-04-09  487  	 * Do the secure computing=
 after ptrace; failures should be fast.
55b22075f7840e Magnus Lindholm 2026-04-09  488  	 * If this fails, seccomp =
may already have set up the return value
55b22075f7840e Magnus Lindholm 2026-04-09  489  	 * (e.g. SECCOMP_RET_ERRNO=
 / TRACE).
55b22075f7840e Magnus Lindholm 2026-04-09  490  	 */
7ba2ba74713c83 Jinjie Ruan     2026-07-07  491  	if (!seccomp_permit_syscal=
l()) {
55b22075f7840e Magnus Lindholm 2026-04-09  492  		if (regs->r19 =3D=3D 0 &&=
 regs->r0 =3D=3D (unsigned long)-1)
55b22075f7840e Magnus Lindholm 2026-04-09  493  			syscall_set_return_value=
(current, regs, -ENOSYS, 0);
55b22075f7840e Magnus Lindholm 2026-04-09  494  		syscall_set_nr(current, r=
egs, -1);
55b22075f7840e Magnus Lindholm 2026-04-09  495  		return -1UL;
55b22075f7840e Magnus Lindholm 2026-04-09  496  	}
55b22075f7840e Magnus Lindholm 2026-04-09  497 =20
55b22075f7840e Magnus Lindholm 2026-04-09  498  #ifdef CONFIG_AUDITSYSCALL
55b22075f7840e Magnus Lindholm 2026-04-09 @499  	audit_syscall_entry(syscal=
l_get_nr(current, regs),
55b22075f7840e Magnus Lindholm 2026-04-09 @500  		regs->r16, regs->r17, reg=
s->r18, regs->r19);
55b22075f7840e Magnus Lindholm 2026-04-09  501  #endif
55b22075f7840e Magnus Lindholm 2026-04-09  502  	return syscall_get_nr(curr=
ent, regs);
^1da177e4c3f41 Linus Torvalds  2005-04-16  503  }
12f79be93d9469 Al Viro         2012-05-26  504 =20

:::::: The code at line 500 was first introduced by commit
:::::: 55b22075f7840ef48254886758976531fe146609 alpha: add support for SECC=
OMP and SECCOMP_FILTER

:::::: TO: Magnus Lindholm <linmag7@gmail.com>
:::::: CC: Magnus Lindholm <linmag7@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
