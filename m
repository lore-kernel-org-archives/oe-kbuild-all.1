Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1E2D94AA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760427368; cv=none; b=G4P8YRwZdbfZZ6+uz2UfXpdnWEPjIJut4SjO8C10+CKVuNhvcMhysV450Cx/lC+7kYCFPXYSVhVUJIla5n9SmQ/cRGOmB1wsDg1Z2y296APcEi0Zby/vNRf+4yqu9qDnzLxRvd25iEHj1hQ977ERJDU/2xSntnKX0IBBH3a+1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760427368; c=relaxed/simple;
	bh=0Cd9k404tvMxHzVPKqh1Jaav93uttR9Yd3NTudLb2t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY0pJXJMh04ggCN9/oi8C7mHdvtXhOTVxNNMP0OrCaVxyPffk/gJGURbjGPkfd4fHMdOm/IweaBEAsw3pSARyklgWiWfR9sYCdKWw2EH02TDD33a2QFT5Ymcv47WJGPNjK6fwA3zfjqQoSDGT0DZiWo1fCbVfBTXSFhgIm6Nzg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1Aiq6Vy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1Aiq6Vy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760427367; x=1791963367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Cd9k404tvMxHzVPKqh1Jaav93uttR9Yd3NTudLb2t8=;
  b=L1Aiq6VyyJxJ1AqB/6epgcqF4Xs+etnarENknZif8jYu/cYEdXZp1fV9
   wzIr4212pswM9VwNRBu/YbRNXO/WC4ULoLA86D/eP6zvjhNrYYKFEJ6im
   uliqn0D+gMZNywe/i2wV9YxUa86x+sySUkaH/RL0vMACOcLpPgOuOozLn
   5tnCACmKjQdOCwMjP9QU7vy/k7HDhKW95s1XG7+NnttlTSunDwuq3nOLx
   lI4j+7A7v7QPAmcKJhms6kkOp2XjKDIrloUO//6OA63MDIFKufifu90IN
   dBd5eB5PNvNQ/p00qWeLtemkG+bHOayEwuLLSI1jgpRVgfHYBkSCMxaOn
   Q==;
X-CSE-ConnectionGUID: WWG1bpiyR/WqgfkqVRReng==
X-CSE-MsgGUID: nbnhMQUyT3WkT4/VrJK3gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62676444"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="62676444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:36:04 -0700
X-CSE-ConnectionGUID: n4iQ24TyTSifGT7znAyOGw==
X-CSE-MsgGUID: /jWW4rEgTX6i5ZLdeLhEIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="205508513"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2025 00:36:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ZZc-0002W1-0Q;
	Tue, 14 Oct 2025 07:35:57 +0000
Date: Tue, 14 Oct 2025 15:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Kaplan <david.kaplan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 30/56] x86/nmi: Add support for stop_machine_nmi()
Message-ID: <202510141529.N8HejZLM-lkp@intel.com>
References: <20251013143444.3999-31-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013143444.3999-31-david.kaplan@amd.com>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on a5652f0f2a69fadcfb2f687a11a737a57f15b28e]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Kaplan/Documentation-admin-guide-Add-documentation/20251013-231516
base:   a5652f0f2a69fadcfb2f687a11a737a57f15b28e
patch link:    https://lore.kernel.org/r/20251013143444.3999-31-david.kaplan%40amd.com
patch subject: [RFC PATCH 30/56] x86/nmi: Add support for stop_machine_nmi()
config: i386-buildonly-randconfig-001-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141529.N8HejZLM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141529.N8HejZLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510141529.N8HejZLM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/nmi.c: In function 'default_do_nmi':
>> arch/x86/kernel/nmi.c:385:13: error: implicit declaration of function 'stop_machine_nmi_handler_enabled'; did you mean 'trace_nmi_handler_enabled'? [-Wimplicit-function-declaration]
     385 |         if (stop_machine_nmi_handler_enabled() && stop_machine_nmi_handler())
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             trace_nmi_handler_enabled
>> arch/x86/kernel/nmi.c:385:51: error: implicit declaration of function 'stop_machine_nmi_handler'; did you mean 'trace_nmi_handler'? [-Wimplicit-function-declaration]
     385 |         if (stop_machine_nmi_handler_enabled() && stop_machine_nmi_handler())
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                                   trace_nmi_handler


vim +385 arch/x86/kernel/nmi.c

   355	
   356	static noinstr void default_do_nmi(struct pt_regs *regs)
   357	{
   358		unsigned char reason = 0;
   359		int handled;
   360		bool b2b = false;
   361	
   362		/*
   363		 * Back-to-back NMIs are detected by comparing the RIP of the
   364		 * current NMI with that of the previous NMI. If it is the same,
   365		 * it is assumed that the CPU did not have a chance to jump back
   366		 * into a non-NMI context and execute code in between the two
   367		 * NMIs.
   368		 *
   369		 * They are interesting because even if there are more than two,
   370		 * only a maximum of two can be detected (anything over two is
   371		 * dropped due to NMI being edge-triggered). If this is the
   372		 * second half of the back-to-back NMI, assume we dropped things
   373		 * and process more handlers. Otherwise, reset the 'swallow' NMI
   374		 * behavior.
   375		 */
   376		if (regs->ip == __this_cpu_read(last_nmi_rip))
   377			b2b = true;
   378		else
   379			__this_cpu_write(swallow_nmi, false);
   380	
   381		__this_cpu_write(last_nmi_rip, regs->ip);
   382	
   383		instrumentation_begin();
   384	
 > 385		if (stop_machine_nmi_handler_enabled() && stop_machine_nmi_handler())
   386			goto out;
   387	
   388		if (microcode_nmi_handler_enabled() && microcode_nmi_handler())
   389			goto out;
   390	
   391		/*
   392		 * CPU-specific NMI must be processed before non-CPU-specific
   393		 * NMI, otherwise we may lose it, because the CPU-specific
   394		 * NMI can not be detected/processed on other CPUs.
   395		 */
   396		handled = nmi_handle(NMI_LOCAL, regs);
   397		__this_cpu_add(nmi_stats.normal, handled);
   398		if (handled) {
   399			/*
   400			 * There are cases when a NMI handler handles multiple
   401			 * events in the current NMI.  One of these events may
   402			 * be queued for in the next NMI.  Because the event is
   403			 * already handled, the next NMI will result in an unknown
   404			 * NMI.  Instead lets flag this for a potential NMI to
   405			 * swallow.
   406			 */
   407			if (handled > 1)
   408				__this_cpu_write(swallow_nmi, true);
   409			goto out;
   410		}
   411	
   412		/*
   413		 * Non-CPU-specific NMI: NMI sources can be processed on any CPU.
   414		 *
   415		 * Another CPU may be processing panic routines while holding
   416		 * nmi_reason_lock. Check if the CPU issued the IPI for crash dumping,
   417		 * and if so, call its callback directly.  If there is no CPU preparing
   418		 * crash dump, we simply loop here.
   419		 */
   420		while (!raw_spin_trylock(&nmi_reason_lock)) {
   421			run_crash_ipi_callback(regs);
   422			cpu_relax();
   423		}
   424	
   425		reason = x86_platform.get_nmi_reason();
   426	
   427		if (reason & NMI_REASON_MASK) {
   428			if (reason & NMI_REASON_SERR)
   429				pci_serr_error(reason, regs);
   430			else if (reason & NMI_REASON_IOCHK)
   431				io_check_error(reason, regs);
   432	
   433			/*
   434			 * Reassert NMI in case it became active
   435			 * meanwhile as it's edge-triggered:
   436			 */
   437			if (IS_ENABLED(CONFIG_X86_32))
   438				reassert_nmi();
   439	
   440			__this_cpu_add(nmi_stats.external, 1);
   441			raw_spin_unlock(&nmi_reason_lock);
   442			goto out;
   443		}
   444		raw_spin_unlock(&nmi_reason_lock);
   445	
   446		/*
   447		 * Only one NMI can be latched at a time.  To handle
   448		 * this we may process multiple nmi handlers at once to
   449		 * cover the case where an NMI is dropped.  The downside
   450		 * to this approach is we may process an NMI prematurely,
   451		 * while its real NMI is sitting latched.  This will cause
   452		 * an unknown NMI on the next run of the NMI processing.
   453		 *
   454		 * We tried to flag that condition above, by setting the
   455		 * swallow_nmi flag when we process more than one event.
   456		 * This condition is also only present on the second half
   457		 * of a back-to-back NMI, so we flag that condition too.
   458		 *
   459		 * If both are true, we assume we already processed this
   460		 * NMI previously and we swallow it.  Otherwise we reset
   461		 * the logic.
   462		 *
   463		 * There are scenarios where we may accidentally swallow
   464		 * a 'real' unknown NMI.  For example, while processing
   465		 * a perf NMI another perf NMI comes in along with a
   466		 * 'real' unknown NMI.  These two NMIs get combined into
   467		 * one (as described above).  When the next NMI gets
   468		 * processed, it will be flagged by perf as handled, but
   469		 * no one will know that there was a 'real' unknown NMI sent
   470		 * also.  As a result it gets swallowed.  Or if the first
   471		 * perf NMI returns two events handled then the second
   472		 * NMI will get eaten by the logic below, again losing a
   473		 * 'real' unknown NMI.  But this is the best we can do
   474		 * for now.
   475		 */
   476		if (b2b && __this_cpu_read(swallow_nmi))
   477			__this_cpu_add(nmi_stats.swallow, 1);
   478		else
   479			unknown_nmi_error(reason, regs);
   480	
   481	out:
   482		instrumentation_end();
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
