Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FEC22157B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 07:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740640351; cv=none; b=WVdGddIOKjHkCCO7F0tCgQ2cAc0c7B18JBs1v7yQcyeJZ0PTJ/VNF5xdzX79McgVxSU8hFy3H/67Og1fFCsdtpbzQoT0Hw1UwuAN5otTaTd9xVpoNNKxTdcw3JMZ6epAUZbvU+MTw8mUs+M8/s5B+D55ejxT69N2t3AchNxCvFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740640351; c=relaxed/simple;
	bh=V3CvTMZ2Rxqtmz8acMJCMzgMiqPVIWn06Q5Id6TdhdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGiZAOkifGn5gc01k9vW7DJFukgPSCJU2rkrrYcRSt2r26d6gBDa1tsvEiSDFMxKRzke74NOQPeMk7WAaEQzF+AKGVsPrereqC/VcDonr+2Wo1zAWW+zOOSjkCDy9KtP5v7O3UDK+64CJYgOJ7q5PNcRLOfiVEeYX21bklPFt9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awoX9ust; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awoX9ust"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740640350; x=1772176350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3CvTMZ2Rxqtmz8acMJCMzgMiqPVIWn06Q5Id6TdhdU=;
  b=awoX9ustXPwPneKmgYo9LH1q8z4S1T6POlQ2gyh9lzdK3XMT4SIdE3wf
   OWvQwrO2yPdMCu7AGs2Y2Df/6Qp5QVdYOMmO8/e/kye3J2gFjIXUXRTJ7
   SGu2V5GtEYnc7rxT7FHRpiSHm+Z8LdJI8Sg4+7KJKFgEMHu0B2Yx+8trf
   lreiRG2ukgq+xE0KSwAVn17AkcaB926uMC2lzOEJIe/9/EStkjP2r45sR
   zMHzP4hJFzW3Bzk7f282ktozXakTRku6/Lb1AH681RL85Kvd4o0TZAH6i
   uBsX72Rk9EZoyfkfrajWSfBrv6T7jHVsh08YZGB5B+arYPtSIYfBOClA3
   Q==;
X-CSE-ConnectionGUID: EowDePc5RdGwa5iF4hfx1Q==
X-CSE-MsgGUID: Y8EGgpXeTsyX3akt0h/y3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45171059"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="45171059"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 23:12:29 -0800
X-CSE-ConnectionGUID: GJtc84NVSBeC6oPe3j3u6Q==
X-CSE-MsgGUID: ZJB91gYoTYCyaMX/AVhbhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="140167488"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Feb 2025 23:12:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnY4E-000D0d-1L;
	Thu, 27 Feb 2025 07:12:23 +0000
Date: Thu, 27 Feb 2025 15:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-str-2025-02-26 47/47] arch/s390/kernel/dis.c:506:22:
 error: implicit declaration of function 'str_user_kernel'; did you mean
 'pte_free_kernel'?
Message-ID: <202502271507.qlL6Y1mN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-str-2025-02-26
head:   7f39dbcead9f7b6498531131dce3ce435fbfc915
commit: 7f39dbcead9f7b6498531131dce3ce435fbfc915 [47/47] ALSA: Use str_yes_no() helper in core
config: s390-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271507.qlL6Y1mN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271507.qlL6Y1mN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271507.qlL6Y1mN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kernel/dis.c: In function 'show_code':
>> arch/s390/kernel/dis.c:506:22: error: implicit declaration of function 'str_user_kernel'; did you mean 'pte_free_kernel'? [-Wimplicit-function-declaration]
     506 |         char *mode = str_user_kernel(user_mode(regs));
         |                      ^~~~~~~~~~~~~~~
         |                      pte_free_kernel
>> arch/s390/kernel/dis.c:506:22: error: initialization of 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   arch/s390/kernel/dumpstack.c: In function 'show_registers':
>> arch/s390/kernel/dumpstack.c:159:16: error: implicit declaration of function 'str_user_kernel'; did you mean 'pte_free_kernel'? [-Wimplicit-function-declaration]
     159 |         mode = str_user_kernel(user_mode(regs));
         |                ^~~~~~~~~~~~~~~
         |                pte_free_kernel
>> arch/s390/kernel/dumpstack.c:159:14: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     159 |         mode = str_user_kernel(user_mode(regs));
         |              ^


vim +506 arch/s390/kernel/dis.c

   503	
   504	void show_code(struct pt_regs *regs)
   505	{
 > 506		char *mode = str_user_kernel(user_mode(regs));
   507		unsigned char code[64];
   508		char buffer[128], *ptr;
   509		unsigned long addr;
   510		int start, end, opsize, hops, i;
   511	
   512		/* Get a snapshot of the 64 bytes surrounding the fault address. */
   513		for (start = 32; start && regs->psw.addr >= 34 - start; start -= 2) {
   514			addr = regs->psw.addr - 34 + start;
   515			if (copy_from_regs(regs, code + start - 2, (void *)addr, 2))
   516				break;
   517		}
   518		for (end = 32; end < 64; end += 2) {
   519			addr = regs->psw.addr + end - 32;
   520			if (copy_from_regs(regs, code + end, (void *)addr, 2))
   521				break;
   522		}
   523		/* Code snapshot usable ? */
   524		if ((regs->psw.addr & 1) || start >= end) {
   525			printk("%s Code: Bad PSW.\n", mode);
   526			return;
   527		}
   528		/* Find a starting point for the disassembly. */
   529		while (start < 32) {
   530			for (i = 0, hops = 0; start + i < 32 && hops < 3; hops++) {
   531				if (!find_insn(code + start + i))
   532					break;
   533				i += insn_length(code[start + i]);
   534			}
   535			if (start + i == 32)
   536				/* Looks good, sequence ends at PSW. */
   537				break;
   538			start += 2;
   539		}
   540		/* Decode the instructions. */
   541		ptr = buffer;
   542		ptr += sprintf(ptr, "%s Code:", mode);
   543		hops = 0;
   544		while (start < end && hops < 8) {
   545			opsize = insn_length(code[start]);
   546			if  (start + opsize == 32)
   547				*ptr++ = '#';
   548			else if (start == 32)
   549				*ptr++ = '>';
   550			else
   551				*ptr++ = ' ';
   552			addr = regs->psw.addr + start - 32;
   553			ptr += sprintf(ptr, "%px: ", (void *)addr);
   554			if (start + opsize >= end)
   555				break;
   556			for (i = 0; i < opsize; i++)
   557				ptr += sprintf(ptr, "%02x", code[start + i]);
   558			*ptr++ = '\t';
   559			if (i < 6)
   560				*ptr++ = '\t';
   561			ptr += print_insn(ptr, code + start, addr);
   562			start += opsize;
   563			pr_cont("%s", buffer);
   564			ptr = buffer;
   565			ptr += sprintf(ptr, "\n          ");
   566			hops++;
   567		}
   568		pr_cont("\n");
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
