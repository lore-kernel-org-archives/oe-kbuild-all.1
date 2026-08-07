Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDAE36167F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 07:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087548; cv=none; b=nh3e215iGiNpFf/bb8PJUXTRTmVPRs41x+lxCHeAMML8uruOsBWYeCNbIz0qv8B1Fy0p8/gDSMJax6CqVbTOctzA6ByxQgnNGR7iul2tVtH7pBocrKOnZdp/iBSz6JS64QYbqFN3I9udc6zbLgnqgFypzRYEife2BUkf9jtC5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087548; c=relaxed/simple;
	bh=szm/i2O0OpYN69LDC94LkBwPYQMNm/UHA300IMbZHpw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TYnl2xg/o1RujKXXEkTt7ugdWjVz+BcQbDfYOi1Jgd4LbXv+0z8zDBulhNv4u0rrJ84s7HCYRA4LUT8MmJTpS4/lHW6U35HoGH+u70HN3JakBX+3VGCvU8fnOjuTZXCrgw7djtNfz0odbmXUSnGIkH30BQBgNqklS1t2vvgU7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpbqOF82; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpbqOF82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786087545; x=1817623545;
  h=date:from:to:cc:subject:message-id;
  bh=szm/i2O0OpYN69LDC94LkBwPYQMNm/UHA300IMbZHpw=;
  b=lpbqOF82ZVrOicYayPHFX1QEoW2niDMmQXHj7Q6+rozlsMJxzEgx+BLH
   tSH1KUt4nJTo1HTIQYSUTf3ZB9HJkNKzTTlemyrVv2dzVWqAiUbSipOgC
   webZDXpei5Rl57pWGorD3NwXlx9PSeIWT2GaQ6CG6R7To82L3CTsVuPEX
   kvGwBWKgXRz7Ul9t0IEIJKoG+ROtJGTxFwkb+A7ecL2Q6i+rhm6iJHslh
   Almi+mnb/CFdb9QGVIte8QfQfWmFrDflzShTzRz3C1Am8qMVW0oRSab5I
   ABpXME4DEZkRlXSJcgLwb1XATnQa9+70o1ndt4Fm5kPalbEBN22HAsQ5R
   A==;
X-CSE-ConnectionGUID: xsLhXYjERqm54DobLwpnIg==
X-CSE-MsgGUID: iKCCQ2oNSfipANi7BY1imA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86720256"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86720256"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 00:25:44 -0700
X-CSE-ConnectionGUID: WH+cjhgOQhWFciZjCfqAbA==
X-CSE-MsgGUID: beChshAUSnG/rcJWjqBbFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="285710045"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Aug 2026 00:25:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsEwr-00000000HTn-3IFe;
	Fri, 07 Aug 2026 07:24:57 +0000
Date: Fri, 07 Aug 2026 15:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:xen-v2 8/10] arch/x86/kvm/xen.c:676:79: warning:
 right shift count >= width of type
Message-ID: <202608071502.rYOi3Pg8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux xen-v2
head:   e8c3b5bdc2b164cc8134a0cb30a58ba7d7b49351
commit: b363d2ca18aaa6cecced31654605577f66ef6d95 [8/10] KVM: x86/xen: Use 32-bit atomics if vCPU's evtchn_pending_sel isn't aligned
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260807/202608071502.rYOi3Pg8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071502.rYOi3Pg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071502.rYOi3Pg8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/xen.c: In function 'kvm_xen_inject_pending_events':
>> arch/x86/kvm/xen.c:676:79: warning: right shift count >= width of type [-Wshift-count-overflow]
     676 |                                        [src_hi] "r" ((u32)(evtchn_pending_sel >> 32)));
         |                                                                               ^~


vim +676 arch/x86/kvm/xen.c

   630	
   631	/*
   632	 * On event channel delivery, the vcpu_info may not have been accessible.
   633	 * In that case, there are bits in vcpu->arch.xen.evtchn_pending_sel which
   634	 * need to be marked into the vcpu_info (and evtchn_upcall_pending set).
   635	 * Do so now that we can sleep in the context of the vCPU to bring the
   636	 * page in, and refresh the pfn cache for it.
   637	 */
   638	void kvm_xen_inject_pending_events(struct kvm_vcpu *v)
   639	{
   640		unsigned long evtchn_pending_sel = READ_ONCE(v->arch.xen.evtchn_pending_sel);
   641		struct gfn_to_pfn_cache *gpc = &v->arch.xen.vcpu_info_cache;
   642		unsigned long flags;
   643	
   644		if (!evtchn_pending_sel)
   645			return;
   646	
   647		/*
   648		 * Yes, this is an open-coded loop. But that's just what put_user()
   649		 * does anyway. Page it in and retry the instruction. We're just a
   650		 * little more honest about it.
   651		 */
   652		read_lock_irqsave(&gpc->lock, flags);
   653		while (!kvm_gpc_check(gpc, sizeof(struct vcpu_info))) {
   654			read_unlock_irqrestore(&gpc->lock, flags);
   655	
   656			if (kvm_gpc_refresh(gpc, sizeof(struct vcpu_info)))
   657				return;
   658	
   659			read_lock_irqsave(&gpc->lock, flags);
   660		}
   661	
   662		/* Now gpc->khva is a valid kernel address for the vcpu_info */
   663		if (kvm_xen_has_64bit_shinfo(v->kvm)) {
   664			struct vcpu_info *vi = gpc->khva;
   665	
   666			if (IS_ALIGNED((unsigned long)&vi->evtchn_pending_sel, sizeof(u64)))
   667				asm volatile(LOCK_PREFIX "orq %[src], %[dst]\n"
   668					     : [dst] "+m" (vi->evtchn_pending_sel)
   669					     : [src] "r" (evtchn_pending_sel));
   670			else
   671				asm volatile(LOCK_PREFIX "orl %[src_lo], %[dst_lo]\n"
   672					     LOCK_PREFIX "orl %[src_hi], %[dst_hi]\n"
   673					     : [dst_lo] "+m" (vi->evtchn_pending_sel),
   674					       [dst_hi] "+m" (*(((u32 *)&vi->evtchn_pending_sel) + 1))
   675					     : [src_lo] "r" ((u32)evtchn_pending_sel),
 > 676					       [src_hi] "r" ((u32)(evtchn_pending_sel >> 32)));
   677	
   678			asm volatile(LOCK_PREFIX "andq %1, %0\n"
   679				     : "+m" (v->arch.xen.evtchn_pending_sel)
   680				     : "r" (~evtchn_pending_sel));
   681			WRITE_ONCE(vi->evtchn_upcall_pending, 1);
   682		} else {
   683			u32 evtchn_pending_sel32 = evtchn_pending_sel;
   684			struct compat_vcpu_info *vi = gpc->khva;
   685	
   686			asm volatile(LOCK_PREFIX "orl %0, %1\n"
   687				     "notl %0\n"
   688				     LOCK_PREFIX "andl %0, %2\n"
   689				     : "=r" (evtchn_pending_sel32),
   690				       "+m" (vi->evtchn_pending_sel),
   691				       "+m" (v->arch.xen.evtchn_pending_sel)
   692				     : "0" (evtchn_pending_sel32));
   693			WRITE_ONCE(vi->evtchn_upcall_pending, 1);
   694		}
   695	
   696		kvm_gpc_mark_dirty_in_slot(gpc);
   697		read_unlock_irqrestore(&gpc->lock, flags);
   698	
   699		/* For the per-vCPU lapic vector, deliver it as MSI. */
   700		if (v->arch.xen.upcall_vector)
   701			kvm_xen_inject_vcpu_vector(v);
   702	}
   703	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
