Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51FBE49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 02:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740452305; cv=none; b=efLvXTnpKRNM9mQwHa7ZbrM1p1iQF4tonG+/+POPoEOnKjmyBPffEWeWUBo4ac2D0OqvxQa0vhkaC7StLwYgNfDag6hj8SQ7mwpf7TKbMsH2lwVv50/1Aqd9WTVkUt+xQbeMEUzO1xIaJmAq3HMxI9rtGp56O9ZYX2VXUwgZWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740452305; c=relaxed/simple;
	bh=//uy/VFJYPPGTpoLhzH3d23t9eOqJy3Xbh+K0SGwA1g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UL923PZZ09sMOIP7VyR/QFug65qtxDbfHX7qc9CXdNenMwkgwPCWPmf/kEIoLsx1hqNbvH5r33OYDOORhO0bbJ81GTxn3dlL2BNQsy7Dbp5w4xnQYT/dqLysHt2JL60LUMid75pYehLTo5hesZH8gkq7dNBQvNwOdoNQxUZPjmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njYKE5yD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njYKE5yD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740452303; x=1771988303;
  h=date:from:cc:subject:message-id:mime-version;
  bh=//uy/VFJYPPGTpoLhzH3d23t9eOqJy3Xbh+K0SGwA1g=;
  b=njYKE5yDtTpuiGjb6R3gGmTH6Ne85hBNWkEGj8YJdJCRknBs15a0/Cjb
   daqxlGVFfFwwySH3KkePEqcy7VtJOWpo8v+IzPWa/10F9+JMwzd7jSPSl
   X6Rc1qSphCWXhe7KlMEm+SS/Kcq8aSGDNuvOc0lBiiZWjakDshsPu4zsu
   1sWZR7LrQCtk1EVXPgL2WZzMsf+F/QiuLdFTuo3PWqpoGgHaWTO1NiSil
   JYXrYaH2QGn6+xSljeh9vS/x3t1xTdFXD4VVI1gstARcQrEUrBFeZcIQT
   McSmnkxA61BOantWzhxo3XAb7kMqPL9N61oGm7PQ+B6SGN9gl6YcKfY26
   w==;
X-CSE-ConnectionGUID: gpptEYQdSsuDFSz0kkTqPA==
X-CSE-MsgGUID: D7QYUkLfR1avbIiLQIeAhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51878346"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="51878346"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 18:58:23 -0800
X-CSE-ConnectionGUID: aMuUOcY7Sp+XUjJCeXLplQ==
X-CSE-MsgGUID: FCYcG3fVSpKaGqEv8tKsAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153449834"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2025 18:58:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tml93-0009gT-0v
	for oe-kbuild-all@lists.linux.dev;
	Tue, 25 Feb 2025 02:58:10 +0000
Date: Tue, 25 Feb 2025 10:57:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/68 1/1] kernel/ptrace.c:1090: Error: unrecognized
 opcode `csrs sstatus,s4', extension `zicsr' required
Message-ID: <202502251019.pzZpKpXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/68
head:   1512b732e7eb769e47792aa376270df979374d81
commit: fcfc2aa0185f4a731d05a21e9f359968fdfd02e7 [1/1] ptrace: take into account saved_sigmask in PTRACE{GET,SET}SIGMASK
config: riscv-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250225/202502251019.pzZpKpXZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251019.pzZpKpXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251019.pzZpKpXZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/ptrace.c: Assembler messages:
   kernel/ptrace.c:1174: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   kernel/ptrace.c:1174: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   kernel/ptrace.c:909: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   kernel/ptrace.c:909: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> kernel/ptrace.c:1090: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
>> kernel/ptrace.c:1090: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   kernel/ptrace.c:1091: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   kernel/ptrace.c:1091: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   kernel/ptrace.c:1096: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   kernel/ptrace.c:1096: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required


vim +1090 kernel/ptrace.c

9c1a125921d146 Mike Frysinger    2010-05-26  1061  
36df29d7994180 Roland McGrath    2008-01-30  1062  #ifdef PTRACE_SINGLESTEP
36df29d7994180 Roland McGrath    2008-01-30  1063  	case PTRACE_SINGLESTEP:
36df29d7994180 Roland McGrath    2008-01-30  1064  #endif
5b88abbf770a0e Roland McGrath    2008-01-30  1065  #ifdef PTRACE_SINGLEBLOCK
5b88abbf770a0e Roland McGrath    2008-01-30  1066  	case PTRACE_SINGLEBLOCK:
5b88abbf770a0e Roland McGrath    2008-01-30  1067  #endif
36df29d7994180 Roland McGrath    2008-01-30  1068  #ifdef PTRACE_SYSEMU
36df29d7994180 Roland McGrath    2008-01-30  1069  	case PTRACE_SYSEMU:
36df29d7994180 Roland McGrath    2008-01-30  1070  	case PTRACE_SYSEMU_SINGLESTEP:
36df29d7994180 Roland McGrath    2008-01-30  1071  #endif
36df29d7994180 Roland McGrath    2008-01-30  1072  	case PTRACE_SYSCALL:
36df29d7994180 Roland McGrath    2008-01-30  1073  	case PTRACE_CONT:
36df29d7994180 Roland McGrath    2008-01-30  1074  		return ptrace_resume(child, request, data);
36df29d7994180 Roland McGrath    2008-01-30  1075  
36df29d7994180 Roland McGrath    2008-01-30  1076  	case PTRACE_KILL:
36df29d7994180 Roland McGrath    2008-01-30  1077  		if (child->exit_state)	/* already dead */
36df29d7994180 Roland McGrath    2008-01-30  1078  			return 0;
36df29d7994180 Roland McGrath    2008-01-30  1079  		return ptrace_resume(child, request, SIGKILL);
36df29d7994180 Roland McGrath    2008-01-30  1080  
2225a122ae26d5 Suresh Siddha     2010-02-11  1081  #ifdef CONFIG_HAVE_ARCH_TRACEHOOK
2225a122ae26d5 Suresh Siddha     2010-02-11  1082  	case PTRACE_GETREGSET:
29000caecbe87b Andrey Vagin      2013-07-03  1083  	case PTRACE_SETREGSET: {
2225a122ae26d5 Suresh Siddha     2010-02-11  1084  		struct iovec kiov;
9fed81dc40f5a1 Namhyung Kim      2010-10-27  1085  		struct iovec __user *uiov = datavp;
2225a122ae26d5 Suresh Siddha     2010-02-11  1086  
96d4f267e40f95 Linus Torvalds    2019-01-03  1087  		if (!access_ok(uiov, sizeof(*uiov)))
2225a122ae26d5 Suresh Siddha     2010-02-11  1088  			return -EFAULT;
2225a122ae26d5 Suresh Siddha     2010-02-11  1089  
2225a122ae26d5 Suresh Siddha     2010-02-11 @1090  		if (__get_user(kiov.iov_base, &uiov->iov_base) ||
2225a122ae26d5 Suresh Siddha     2010-02-11  1091  		    __get_user(kiov.iov_len, &uiov->iov_len))
2225a122ae26d5 Suresh Siddha     2010-02-11  1092  			return -EFAULT;
2225a122ae26d5 Suresh Siddha     2010-02-11  1093  
2225a122ae26d5 Suresh Siddha     2010-02-11  1094  		ret = ptrace_regset(child, request, addr, &kiov);
2225a122ae26d5 Suresh Siddha     2010-02-11  1095  		if (!ret)
2225a122ae26d5 Suresh Siddha     2010-02-11  1096  			ret = __put_user(kiov.iov_len, &uiov->iov_len);
2225a122ae26d5 Suresh Siddha     2010-02-11  1097  		break;
2225a122ae26d5 Suresh Siddha     2010-02-11  1098  	}
2225a122ae26d5 Suresh Siddha     2010-02-11  1099  #endif
f8e529ed941ba2 Tycho Andersen    2015-10-27  1100  
f8e529ed941ba2 Tycho Andersen    2015-10-27  1101  	case PTRACE_SECCOMP_GET_FILTER:
f8e529ed941ba2 Tycho Andersen    2015-10-27  1102  		ret = seccomp_get_filter(child, addr, datavp);
f8e529ed941ba2 Tycho Andersen    2015-10-27  1103  		break;
f8e529ed941ba2 Tycho Andersen    2015-10-27  1104  
26500475ac1b49 Tycho Andersen    2017-10-11  1105  	case PTRACE_SECCOMP_GET_METADATA:
26500475ac1b49 Tycho Andersen    2017-10-11  1106  		ret = seccomp_get_metadata(child, addr, datavp);
26500475ac1b49 Tycho Andersen    2017-10-11  1107  		break;
26500475ac1b49 Tycho Andersen    2017-10-11  1108  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1109  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1110  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1111  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1112  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1113  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1114  }
481bed45424753 Christoph Hellwig 2005-11-07  1115  

:::::: The code at line 1090 was first introduced by commit
:::::: 2225a122ae26d542bdce523d9d87a4a7ba10e07b ptrace: Add support for generic PTRACE_GETREGSET/PTRACE_SETREGSET

:::::: TO: Suresh Siddha <suresh.b.siddha@intel.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
