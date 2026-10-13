Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708E306D2A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 04:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865792; cv=none; b=P1n6NPORHGx5tPVBcG70M9SSZmF5zHZPhHVnPI12aL1e6tqbSNlwqX9MUGMSISA0CmsA/yfOXmh15K7VAl+K0AlzIPy4pOWSyUKyarvtfAP4jO5UWS+yLKrsdIAt3DLJUJqdu+JoHBZngzqFLPehfxc27icyc5E077M4NrCDG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865792; c=relaxed/simple;
	bh=r2VvdiVqdKv9nmvYDujhlbTFxC3GBuTulrLElcsVUw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMdkLMvZDYdqmsEmUj2QnRD6LbqxSkyj+TIDuG1HmCHd+cdVjEO/xq4O3kA7/hQWm1aXLPhk8KJSVKqBfnHVY8ewU2Lq0RvT/C4b79lJbo4hQATh7no6KT0LdU3gUmuivT8cEm/OgP/gVrkTqW/GPDYknq2pdSXYF36twkftNlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGo5hnhF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGo5hnhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791865791; x=1823401791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r2VvdiVqdKv9nmvYDujhlbTFxC3GBuTulrLElcsVUw0=;
  b=ZGo5hnhFKheWYqJurBxN8um/7Sy9nIt0qIU6ZN8/aP5y32zSwCL9iqXA
   PT5T5lzLNGu6q/wOBHTXU8e1MDefWvsw5uucvBbVbUelyZPW0nchr6wzf
   HDSr5Bd/iwR4WIh+p/pJlm54sRg7RT/ZthfjoGXFFofYXVhDb1/RM+h9g
   Rxjfp+4UzvYx+Icwmwtkv2FhWCf3rdrvqEMtzfH2/uuRlHBQnmSTbiQYe
   TXlknJV7H9Ytdjr5QJW9503I/rb+4n6fLp7SGoP5pNp6fUpmCjUbIAKi4
   RS3v0rF8llXswisK0ji/15YI4PJv687zbxGVTAiurDqxi+lNux/dRRqc3
   A==;
X-CSE-ConnectionGUID: 1wx8v+0KTMCKlSfoMntr5g==
X-CSE-MsgGUID: alRJvjqBQmO5N+OgBvw8MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="469153"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="469153"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 21:29:51 -0700
X-CSE-ConnectionGUID: LLFFodjhR6KSB9AuZxdNDA==
X-CSE-MsgGUID: 20C8C+a5QLCruzaLX9AhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1391334"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2026 21:29:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGU94-00000000CWe-44YB;
	Tue, 13 Oct 2026 04:29:46 +0000
Date: Tue, 13 Oct 2026 12:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
Message-ID: <202610131201.wWk11MLy-lkp@intel.com>
References: <20261010065442.23780-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010065442.23780-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.3-rc6 next-20261009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/MIPS-lib-prefetch-ahead-in-csum_partial/20261009-235442
base:   linus/master
patch link:    https://lore.kernel.org/r/20261010065442.23780-1-rosenp%40gmail.com
patch subject: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
config: mips-rbtx49xx_defconfig (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131201.wWk11MLy-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> arch/mips/lib/csum_partial.S:202: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x100($4)'
   arch/mips/lib/csum_partial.S:203: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x120($4)'
   arch/mips/lib/csum_partial.S:204: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x140($4)'
   arch/mips/lib/csum_partial.S:205: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x160($4)'


vim +202 arch/mips/lib/csum_partial.S

   102	
   103		.text
   104		.set	noreorder
   105		.align	5
   106	LEAF(csum_partial)
   107	EXPORT_SYMBOL(csum_partial)
   108		move	sum, zero
   109		move	t7, zero
   110	
   111		sltiu	t8, a1, 0x8
   112		bnez	t8, .Lsmall_csumcpy		/* < 8 bytes to copy */
   113		 move	t2, a1
   114	
   115		andi	t7, src, 0x1			/* odd buffer? */
   116	
   117	.Lhword_align:
   118		beqz	t7, .Lword_align
   119		 andi	t8, src, 0x2
   120	
   121		lbu	t0, (src)
   122		LONG_SUBU	a1, a1, 0x1
   123	#ifdef __MIPSEL__
   124		sll	t0, t0, 8
   125	#endif
   126		ADDC(sum, t0)
   127		PTR_ADDU	src, src, 0x1
   128		andi	t8, src, 0x2
   129	
   130	.Lword_align:
   131		beqz	t8, .Ldword_align
   132		 sltiu	t8, a1, 56
   133	
   134		lhu	t0, (src)
   135		LONG_SUBU	a1, a1, 0x2
   136		ADDC(sum, t0)
   137		sltiu	t8, a1, 56
   138		PTR_ADDU	src, src, 0x2
   139	
   140	.Ldword_align:
   141		bnez	t8, .Ldo_end_words
   142		 move	t8, a1
   143	
   144		andi	t8, src, 0x4
   145		beqz	t8, .Lqword_align
   146		 andi	t8, src, 0x8
   147	
   148		LOAD32	t0, 0x00(src)
   149		LONG_SUBU	a1, a1, 0x4
   150		ADDC(sum, t0)
   151		PTR_ADDU	src, src, 0x4
   152		andi	t8, src, 0x8
   153	
   154	.Lqword_align:
   155		beqz	t8, .Loword_align
   156		 andi	t8, src, 0x10
   157	
   158	#ifdef USE_DOUBLE
   159		ld	t0, 0x00(src)
   160		LONG_SUBU	a1, a1, 0x8
   161		ADDC(sum, t0)
   162	#else
   163		lw	t0, 0x00(src)
   164		lw	t1, 0x04(src)
   165		LONG_SUBU	a1, a1, 0x8
   166		ADDC(sum, t0)
   167		ADDC(sum, t1)
   168	#endif
   169		PTR_ADDU	src, src, 0x8
   170		andi	t8, src, 0x10
   171	
   172	.Loword_align:
   173		beqz	t8, .Lbegin_movement
   174		 LONG_SRL	t8, a1, 0x7
   175	
   176	#ifdef USE_DOUBLE
   177		ld	t0, 0x00(src)
   178		ld	t1, 0x08(src)
   179		ADDC(sum, t0)
   180		ADDC(sum, t1)
   181	#else
   182		CSUM_BIGCHUNK1(src, 0x00, sum, t0, t1, t3, t4)
   183	#endif
   184		LONG_SUBU	a1, a1, 0x10
   185		PTR_ADDU	src, src, 0x10
   186		LONG_SRL	t8, a1, 0x7
   187	
   188	.Lbegin_movement:
   189		beqz	t8, 1f
   190		 andi	t2, a1, 0x40
   191	
   192	.Lmove_128bytes:
   193	#ifdef CONFIG_CPU_HAS_PREFETCH
   194		/*
   195		 * Fetch the block two iterations ahead, but only while it lies
   196		 * inside the buffer: on non-coherent systems a line prefetched
   197		 * past the end could belong to a buffer the device still owns.
   198		 */
   199		sltiu	t5, t8, 3
   200		bnez	t5, 2f
   201		 nop
 > 202		pref	0, 0x100(src)
   203		pref	0, 0x120(src)
   204		pref	0, 0x140(src)
   205		pref	0, 0x160(src)
   206	2:
   207	#endif
   208		CSUM_BIGCHUNK(src, 0x00, sum, t0, t1, t3, t4)
   209		CSUM_BIGCHUNK(src, 0x20, sum, t0, t1, t3, t4)
   210		CSUM_BIGCHUNK(src, 0x40, sum, t0, t1, t3, t4)
   211		CSUM_BIGCHUNK(src, 0x60, sum, t0, t1, t3, t4)
   212		LONG_SUBU	t8, t8, 0x01
   213		.set	reorder				/* DADDI_WAR */
   214		PTR_ADDU	src, src, 0x80
   215		bnez	t8, .Lmove_128bytes
   216		.set	noreorder
   217	
   218	1:
   219		beqz	t2, 1f
   220		 andi	t2, a1, 0x20
   221	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
