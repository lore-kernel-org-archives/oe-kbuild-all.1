Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745577;
	b=agHJ7ptmZtU2UPl7UVRefIJ+ZmjcvlL6SpT6AytbsPu/vkqPKXjMqP9K6KFu9Scix0HQ
	 TiqQ5ZGAXwKgmUCjzqKjLQ3+4LCYz8Yufvd5hVsLa0bCViL7vNIEhmlZDrUSxI2N5kjD9
	 4HezQI0OKr9nMIklMQnZxjYwyezGDpsm6/baKOolHeYFYKVMzCj/rp4r7I0/dQECX0x5U
	 HL0DnmV+nwBFhKgaba2/G38MBRE8g9oVaduy5UqgOQVWDtHHoPzRffpKlhF5re4gTxVR0
	 AxS7h7xi41jZQrazu5JfnD9/kQp9GUhHICB3ZlLG3hCBnK6wdnbOPTveM3J8oISVutQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745577;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iOaLRHM+RmCTz3HkmRT8qrgG8aXyQiYm5n9OVhyQIH0=;
	b=pPsHaG7wev/c3C8hrD09vK3PJw4Pa6jP27FRUV3wCIxjz3eE7tpwxJScTp1N7augGBpu
	 5RiFJDdOE5m3CWlz2F9RergWo3qvXp18bOJf8Zzr/riqqD9ERcB/7ZzySxLJ8adG03Ik5
	 i2Lzgz+A/xTUQ73nTR/k8IH2Q5CRb+zil4RQ1azd6jPA26Pi0xf0BsNayJbM+HINoALe/
	 lXA00HHdavgsreqIUrQWzRRTCFylqmcGcCv/irvxtKub4zcD0HslcT29EaLkQAgjVZT2H
	 PSseg06w1sYNHP0ty15IysolYXNO9U5zmS2j088s4SmafZA8qYgCMnaQgUfxsZySnmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nTW3Iec+;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F6606A31B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Nov 2026 22:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB1F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nTW3Iec+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793745576; x=1825281576;
  h=date:from:to:cc:subject:message-id;
  bh=5k8eh7Z7d3n3zKLLeufom6P3Dxocgb1kDMG16eQG7DA=;
  b=nTW3Iec+rF39zhWSjpAyPE0QTHOjXGmuubJYkmSQy5ImQNTUOH7hkSr4
   b8euhWSTSp75rj3xtOw35adDkqZyVq250B29+ebMvQuyIN/sch9qcWSRJ
   WRTvWALmYJcfrHwc5hZHX7zI8JRDiaDcBy+S/Lqxyk7Dfb1VBGDxU1bn3
   JogXHc/q0tbubdlFeCXVPVJXGQ6qtR6lwUMCqCYycK644KkqSrMLqw8w8
   haFIEHcs4FNRBdUAYBW3QYI8DYNaQiEfRtq2VIVxBcAc/XhWonRPZKxZ9
   jtgzj8dS//XN4YyBowKMcna7OXc/pvkMgs+pQY0ODl1iWZ33UbS6ovnTk
   g==;
X-CSE-ConnectionGUID: glwrWqCdRv6TNqejz7lWmQ==
X-CSE-MsgGUID: Pvu6Gi8uSU2vRfAFCOdcLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2377831"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2377831"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 14:39:35 -0800
X-CSE-ConnectionGUID: 3zTOsTvuQ4u/SN1JN7aYdQ==
X-CSE-MsgGUID: CurGzmV3S0SCoiOFlVQMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7089334"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2026 14:39:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xONAB-00000000jQ3-2TVa;
	Tue, 03 Nov 2026 22:39:31 +0000
Date: Wed, 04 Nov 2026 06:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:unwind-cb 4/12]
 arch/x86/include/asm/nospec-branch.h:656:31: error: '__KERNEL_DS' undeclared
Message-ID: <202611040636.FfSLlQvP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux unwind-cb
head:   af3bc9f217a6b30a55a3f3de352eaac424b2f087
commit: 8e4203c7e99a0ccfdd78656e69fdf08c7828f735 [4/12] bpf: Let a callback unwind into the pad of its helper
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20261104/202611040636.FfSLlQvP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040636.FfSLlQvP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611040636.FfSLlQvP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpf_unwind.h:55,
                    from kernel/bpf/verifier.c:13:
   arch/x86/include/asm/nospec-branch.h: In function 'x86_clear_cpu_buffers':
>> arch/x86/include/asm/nospec-branch.h:656:31: error: '__KERNEL_DS' undeclared (first use in this function)
     656 |         static const u16 ds = __KERNEL_DS;
         |                               ^~~~~~~~~~~
   arch/x86/include/asm/nospec-branch.h:656:31: note: each undeclared identifier is reported only once for each function it appears in


vim +/__KERNEL_DS +656 arch/x86/include/asm/nospec-branch.h

6a9e5292725177 Thomas Gleixner       2019-02-18  646  
6a9e5292725177 Thomas Gleixner       2019-02-18  647  /**
f9af88a3d384c8 Borislav Petkov (AMD  2024-09-11  648)  * x86_clear_cpu_buffers - Buffer clearing support for different x86 CPU vulns
6a9e5292725177 Thomas Gleixner       2019-02-18  649   *
6a9e5292725177 Thomas Gleixner       2019-02-18  650   * This uses the otherwise unused and obsolete VERW instruction in
6a9e5292725177 Thomas Gleixner       2019-02-18  651   * combination with microcode which triggers a CPU buffer flush when the
6a9e5292725177 Thomas Gleixner       2019-02-18  652   * instruction is executed.
6a9e5292725177 Thomas Gleixner       2019-02-18  653   */
f9af88a3d384c8 Borislav Petkov (AMD  2024-09-11  654) static __always_inline void x86_clear_cpu_buffers(void)
6a9e5292725177 Thomas Gleixner       2019-02-18  655  {
6a9e5292725177 Thomas Gleixner       2019-02-18 @656  	static const u16 ds = __KERNEL_DS;
6a9e5292725177 Thomas Gleixner       2019-02-18  657  
6a9e5292725177 Thomas Gleixner       2019-02-18  658  	/*
6a9e5292725177 Thomas Gleixner       2019-02-18  659  	 * Has to be the memory-operand variant because only that
6a9e5292725177 Thomas Gleixner       2019-02-18  660  	 * guarantees the CPU buffer flush functionality according to
6a9e5292725177 Thomas Gleixner       2019-02-18  661  	 * documentation. The register-operand variant does not.
6a9e5292725177 Thomas Gleixner       2019-02-18  662  	 * Works with any segment selector, but a valid writable
6a9e5292725177 Thomas Gleixner       2019-02-18  663  	 * data segment is the fastest variant.
6a9e5292725177 Thomas Gleixner       2019-02-18  664  	 *
6a9e5292725177 Thomas Gleixner       2019-02-18  665  	 * "cc" clobber is required because VERW modifies ZF.
6a9e5292725177 Thomas Gleixner       2019-02-18  666  	 */
6a9e5292725177 Thomas Gleixner       2019-02-18  667  	asm volatile("verw %[ds]" : : [ds] "m" (ds) : "cc");
6a9e5292725177 Thomas Gleixner       2019-02-18  668  }
6a9e5292725177 Thomas Gleixner       2019-02-18  669  

:::::: The code at line 656 was first introduced by commit
:::::: 6a9e529272517755904b7afa639f6db59ddb793e x86/speculation/mds: Add mds_clear_cpu_buffers()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
