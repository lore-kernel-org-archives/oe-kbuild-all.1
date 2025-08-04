Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334441BCA07
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754333852; cv=none; b=EC/fqr/yN9ULb5JvqMGvmuxLMiU5gKQccQSiHbrazbWMdvx9hyrA/loVjcBiqElijjx5B6qD2NXVyRFSOHK9lmhd9xLCdConL8ISr4wSAza9+h+Y+oNxK9MzLMkGrXyjQpVXqrUBeXAaD9w5eRESb+0fxNa+50F18ghQm0YsIf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754333852; c=relaxed/simple;
	bh=WJU2CY0abZ1UMsZbAP4ExVQQSkbCSLqI2YoLmxQg49E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2DuKRgSlYzyKdvMwh7n+1ogIZxhhkAJgMsCafCk6bB7x6HhdZqIBjhCByFHHtMKK+aTGnuJCPsG7SDNaG4qNeEH5r42pnga940COL/T+gZNts3PY01QOfdN4oZlsuWMeF0WrhCfdfRcBXDxfRyhAnd74YT6GhK9zgpa5CnhB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XivKKQ9U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XivKKQ9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754333851; x=1785869851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WJU2CY0abZ1UMsZbAP4ExVQQSkbCSLqI2YoLmxQg49E=;
  b=XivKKQ9UzFGevbNu34CZXkrElfcTH/+JYD6YSE+PkDaCyvCCekjm2wPx
   OLMl+rNqnbYXz3mNy7Bv8YHZ2WOGbx0DbF1HPxQNNCdAxz95louQcNPJ2
   BkyLXoq0DkKVouA5R7tiZBhNbIjJkiVUMn7nOVEPR4Jvob7B2w+2nWyCa
   WMEMzai/ETx/idFUmDiqfh9Rmjq1tB/R2rMN0t+psqexnHI8LX93bE1qN
   CYc7WLvoX26q+OkeQR+mEUHvit534l5gFIaJRXG60eAEya/Ou57phch+o
   R0iMZ2QOx+qnAP053TbnpYqf5GxfHWHfqzbDwcBmkXcnej1XtbY+a3+HG
   A==;
X-CSE-ConnectionGUID: rbTz2Tn+Sc2ARDu+kJ+Kdg==
X-CSE-MsgGUID: 6RrUQUwQRVWlrFOfykp8+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67312831"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67312831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 11:57:31 -0700
X-CSE-ConnectionGUID: ijIdPkTjScSa9St7s+Rsow==
X-CSE-MsgGUID: y5T7l26yQ4uicx2istYxzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169548815"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2025 11:57:30 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj0ND-0001pj-1o;
	Mon, 04 Aug 2025 18:57:27 +0000
Date: Mon, 4 Aug 2025 20:56:34 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/fastpath_cleanups 5/18] arch/x86/kvm/lapic.c:1503:13:
 warning: 'kvm_apic_send_ipi_fast' defined but not used
Message-ID: <202508042019.Nos8A768-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/fastpath_cleanups
head:   08556c37b38e79abe3b7f28f0d6977da3222e039
commit: 3808e95e74487c08cd3e1003ba137e583d6b9bd0 [5/18] KVM: x86: Drop semi-arbitrary restrictions on IPI type in fastpath
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250804/202508042019.Nos8A768-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508042019.Nos8A768-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508042019.Nos8A768-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/lapic.c:1503:13: warning: 'kvm_apic_send_ipi_fast' defined but not used [-Wunused-function]
    1503 | static bool kvm_apic_send_ipi_fast(struct kvm_lapic *apic, u32 icr_low,
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_apic_send_ipi_fast +1503 arch/x86/kvm/lapic.c

  1502	
> 1503	static bool kvm_apic_send_ipi_fast(struct kvm_lapic *apic, u32 icr_low,
  1504					   u32 icr_high)
  1505	{
  1506		struct kvm_lapic_irq irq;
  1507		int r;
  1508	
  1509		kvm_icr_to_lapic_irq(apic, icr_low, icr_high, &irq);
  1510	
  1511		if (!kvm_irq_delivery_to_apic_fast(apic->vcpu->kvm, apic, &irq, &r, NULL))
  1512			return false;
  1513	
  1514		trace_kvm_apic_ipi(icr_low, irq.dest_id);
  1515		return 0;
  1516	}
  1517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
