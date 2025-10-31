Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724B83431F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909434; cv=none; b=GilqcjJkrNWOvINGcsPscKbL6UsS58u/VDxkGRFy9LFxYwn6VzH4BDmMEDy96Izc5GSK2t6WZaHiF3WsO5FJql9+z/ILPf+1tEbsCtU6790LPS/UnHRZWDtRjbDxULAHTgIfIIxFLeQQSk2AC/ZNj6lu3NK9lTwXWlSmr1FJmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909434; c=relaxed/simple;
	bh=Km9fCDeAt6lTPkpyCVnkXJdQ/JZmxNgpWUN6PsznVbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jspI7n60hEQAzw6u8iVDDg1jYeNSiw84p1NbpmHPAguuw+syuxUpwnifYroq0c3c2s44p+/mPbEC/Y6UZDnaQpJFcZq9jmeHJSrY3eEcc17RwCmp4gwravMXmBM+chSmF/Mf38kSZnlJkK79uHVWkzCMLTytKDHoMrpf8HIiSPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEH4UBno; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEH4UBno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761909432; x=1793445432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Km9fCDeAt6lTPkpyCVnkXJdQ/JZmxNgpWUN6PsznVbI=;
  b=MEH4UBno47QveAW8F4pzo8f6ELKsXoozVWtm7efDvl9cHCGnH+p4o1e1
   sQqR/V1i8tdY0oyxOCd44EFLcGoe516qjARNobD6KUJqzSrlADwR7No3Z
   e25/4R9hQlI9piO1CMc2HQdBv0nf36NyhliycSr0k6gZgr7PEpZ6NdIX9
   i24DAqX3owi76ZiYl4ol0PpRKC4HBnnYZlmNuHDUkcLTKfSuHQBLTeweG
   5SGxxApUM3Ym9KJlMQ6zyiBvFTo4Yx5csd3a+Y22jfaPWazYu+YQhZHPg
   Y7XagSRn3Vc3v8SAVqAPHNzwXy499rJvBqEqGrvlgDWVEB82WsArNRBL5
   w==;
X-CSE-ConnectionGUID: 5SViQ+dVTX+NTmevEkZmqA==
X-CSE-MsgGUID: 4xUOKp68R6iIOCHM+VsV2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89532942"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="89532942"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 04:17:12 -0700
X-CSE-ConnectionGUID: H+vyXE9WRWORumeu1K/MEw==
X-CSE-MsgGUID: OMg1gUVvQnG7eOn/whGv3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190561977"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2025 04:17:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEn6n-000N2C-1j;
	Fri, 31 Oct 2025 11:16:11 +0000
Date: Fri, 31 Oct 2025 19:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Elfring <Markus.Elfring@web.de>, x86@kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] x86/umip: Use pointer from memcpy() call for assignment
 in fixup_umip_exception()
Message-ID: <202510311836.iEStmwvO-lkp@intel.com>
References: <33c148ea-e1f3-47ff-8ce5-42a31a545b33@web.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33c148ea-e1f3-47ff-8ce5-42a31a545b33@web.de>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/umip.c: In function 'fixup_umip_exception':
>> arch/x86/kernel/umip.c:353:24: warning: variable 'reg_addr' set but not used [-Wunused-but-set-variable]
     353 |         unsigned long *reg_addr;
         |                        ^~~~~~~~


vim +/reg_addr +353 arch/x86/kernel/umip.c

c6a960bbf6a365 Ricardo Neri   2017-11-05  328  
1e5db223696afa Ricardo Neri   2017-11-05  329  /**
1e5db223696afa Ricardo Neri   2017-11-05  330   * fixup_umip_exception() - Fixup a general protection fault caused by UMIP
1e5db223696afa Ricardo Neri   2017-11-05  331   * @regs:	Registers as saved when entering the #GP handler
1e5db223696afa Ricardo Neri   2017-11-05  332   *
e86c2c8b938044 Brendan Shanks 2019-09-05  333   * The instructions SGDT, SIDT, STR, SMSW and SLDT cause a general protection
e86c2c8b938044 Brendan Shanks 2019-09-05  334   * fault if executed with CPL > 0 (i.e., from user space). This function fixes
e86c2c8b938044 Brendan Shanks 2019-09-05  335   * the exception up and provides dummy results for SGDT, SIDT and SMSW; STR
e86c2c8b938044 Brendan Shanks 2019-09-05  336   * and SLDT are not fixed up.
1e5db223696afa Ricardo Neri   2017-11-05  337   *
1e5db223696afa Ricardo Neri   2017-11-05  338   * If operands are memory addresses, results are copied to user-space memory as
1e5db223696afa Ricardo Neri   2017-11-05  339   * indicated by the instruction pointed by eIP using the registers indicated in
1e5db223696afa Ricardo Neri   2017-11-05  340   * the instruction operands. If operands are registers, results are copied into
1e5db223696afa Ricardo Neri   2017-11-05  341   * the context that was saved when entering kernel mode.
1e5db223696afa Ricardo Neri   2017-11-05  342   *
1e5db223696afa Ricardo Neri   2017-11-05  343   * Returns:
1e5db223696afa Ricardo Neri   2017-11-05  344   *
1e5db223696afa Ricardo Neri   2017-11-05  345   * True if emulation was successful; false if not.
1e5db223696afa Ricardo Neri   2017-11-05  346   */
1e5db223696afa Ricardo Neri   2017-11-05  347  bool fixup_umip_exception(struct pt_regs *regs)
1e5db223696afa Ricardo Neri   2017-11-05  348  {
172b75e56b0884 Joerg Roedel   2020-09-07  349  	int nr_copied, reg_offset, dummy_data_size, umip_inst;
1e5db223696afa Ricardo Neri   2017-11-05  350  	/* 10 bytes is the maximum size of the result of UMIP instructions */
1e5db223696afa Ricardo Neri   2017-11-05  351  	unsigned char dummy_data[10] = { 0 };
1e5db223696afa Ricardo Neri   2017-11-05  352  	unsigned char buf[MAX_INSN_SIZE];
172b75e56b0884 Joerg Roedel   2020-09-07 @353  	unsigned long *reg_addr;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
