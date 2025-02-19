Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4989218E1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 00:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739926798; cv=none; b=pMuxAjG01B3vl0ajw6y4FE+W6DgFFemRRKAt6TGLjDBCxqpgGHu8Pdd0Gq9TdvWtFYTui2KzJ7C7wwuvmzULSgio7EKn0fs+9TE0N6ePbpyo5mbIo4Y1oxoaIr4F0rylW6Ed/UGpEmcFNNUiGFgZazWGIE0o1D+qK98FvcApURc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739926798; c=relaxed/simple;
	bh=EM/SdrrvZL/xqerXci8mfP1aHm+Fp/AZvnaaTDYzrOI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afpHNFAY4jPFH9h0uV64PoNUEPDR04yKjeKU0HE1DWxwPkgNiN60s8V48C1SDLMvNCyFakAzfN6a3XYXdwU9zWEgoT5wT8k8rWGnae/tW/rK7lfA33htc6O4Z5YKbgkyq7ZzdjB913ynLxeyDidpK91A57rg1sF43p9U5tS/Xrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vaz/upCx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vaz/upCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739926796; x=1771462796;
  h=date:from:cc:subject:message-id:mime-version;
  bh=EM/SdrrvZL/xqerXci8mfP1aHm+Fp/AZvnaaTDYzrOI=;
  b=Vaz/upCxfjCgJdSRey70Y3/7GMe/2Thfd6PMK1nFOoBcHRzIjjXuf0tT
   m/RsYXNo3COIry2RII9OyjbdXMWy7K5AJG2tjzMAWJMVDYd36olNYe56h
   ipQnmrZcdyT6+xaqPhB+Hq27NpaZJ1UytG6q5h6vqRCCoJlv2ff3uMmTD
   TWmiunjpgrep3WOJNWKSapqJpettWhydNO+ryCSU6aXh3Ck8WR/CVWuNi
   rbuSs3xpns8fCLc3sGHPCoNHOV3au/NxJVjw3vea1e7iDveXgxqMa4jFq
   2MQZ5LYAPfN0w8OBTpuVRBCqwMScZVCI2zim08LuhAKUiGxRO11/2fIar
   w==;
X-CSE-ConnectionGUID: 1L5acN6LQBO0xilGqyM2nw==
X-CSE-MsgGUID: UOx0DA7+Qhmq0fptQ/ZSrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52053217"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="52053217"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:59:55 -0800
X-CSE-ConnectionGUID: 3/LqcMI4QQmOZ8cBRag+rw==
X-CSE-MsgGUID: PsOQXyvcSb+VSBuAvZLQug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119213644"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2025 16:59:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkYRM-00012t-35
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 00:59:52 +0000
Date: Wed, 19 Feb 2025 08:59:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] net/core/sock.c:1151: Error: unrecognized
 opcode `csrs sstatus,s1', extension `zicsr' required
Message-ID: <202502190851.RbCXi03Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 887feae36aee6c08e0dafcdaa5ba921abbb2c56b [1/1] socket: Add SO_TIMESTAMP[NS]_NEW
config: riscv-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190851.RbCXi03Z-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190851.RbCXi03Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190851.RbCXi03Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/core/sock.c:727: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/core/sock.c:727: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   net/core/sock.c:1174: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/core/sock.c:1174: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   net/core/sock.c:1478: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:1478: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   net/core/sock.c:1317: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:1317: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> net/core/sock.c:1151: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
>> net/core/sock.c:1151: Error: unrecognized opcode `csrc sstatus,s1', extension `zicsr' required
   net/core/sock.c:664: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/core/sock.c:664: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   net/core/sock.c:1419: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:1419: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +1151 net/core/sock.c

3f551f9436c05a Eric W. Biederman 2010-06-13  1144  
28b5ba2aa0f55d David Herrmann    2017-06-21  1145  static int groups_to_user(gid_t __user *dst, const struct group_info *src)
28b5ba2aa0f55d David Herrmann    2017-06-21  1146  {
28b5ba2aa0f55d David Herrmann    2017-06-21  1147  	struct user_namespace *user_ns = current_user_ns();
28b5ba2aa0f55d David Herrmann    2017-06-21  1148  	int i;
28b5ba2aa0f55d David Herrmann    2017-06-21  1149  
28b5ba2aa0f55d David Herrmann    2017-06-21  1150  	for (i = 0; i < src->ngroups; i++)
28b5ba2aa0f55d David Herrmann    2017-06-21 @1151  		if (put_user(from_kgid_munged(user_ns, src->gid[i]), dst + i))
28b5ba2aa0f55d David Herrmann    2017-06-21  1152  			return -EFAULT;
28b5ba2aa0f55d David Herrmann    2017-06-21  1153  
28b5ba2aa0f55d David Herrmann    2017-06-21  1154  	return 0;
28b5ba2aa0f55d David Herrmann    2017-06-21  1155  }
28b5ba2aa0f55d David Herrmann    2017-06-21  1156  

:::::: The code at line 1151 was first introduced by commit
:::::: 28b5ba2aa0f55d80adb2624564ed2b170c19519e net: introduce SO_PEERGROUPS getsockopt

:::::: TO: David Herrmann <dh.herrmann@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
