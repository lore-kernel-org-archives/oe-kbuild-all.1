Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB672CCDB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754173192; cv=none; b=iaA3im70zE3lJtkY9hUorZgaNs2Bp8ZVsKacF2oHMBu3JbZO53igmbuZPoy+7G+mXYgSqaI7ZhTruJSPjj7+8wud5s6zGcgC5c8+8obkkjZ2EswsYDQGEOkarplLisRoQHtqeZI/WFxR4ygfmyI/fbvV6uKlLIbXzyZ/RGh18Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754173192; c=relaxed/simple;
	bh=TOCegUuLxLNBm/I9c3o3mDB6x8I7hdLDFFgclLWKb/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfjBGjivemqmEnKPUG5CI6oY6OXnq5inDKlLoxYTJAc8UYswJSex8LX5AFB6gfDjFD1nqfNpOi0EVTwdEI+9ipfwpaCTFbL+t00fEZkSI9wUvIrg7lLpHrF0nwpyWw6w7QHLqVNxdHPudXrhPxrak7fZyfGO9W/Njn9RvCVto9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbC6eFvR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbC6eFvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754173191; x=1785709191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TOCegUuLxLNBm/I9c3o3mDB6x8I7hdLDFFgclLWKb/8=;
  b=VbC6eFvRi7M6Yuqw4BTlS9RvogGQt3edsRyKZr3z1f6hZ4rsQzrFfVak
   mz4prm9IZgglF/i942eDd4XdxKYdw/zW0YKNeIgc+Y73zHYwvj9pKmnYj
   ezG6sdmWC3Wuioujujw78vsN8f9xEVdM7sOmOsyOyYsa1AGFEfMMhRtf5
   IQaFq/ECGGGaGEa9iHCXbbwqHStGOR1TLppzAPWVAnlRIXwE/7KmFFq69
   s6ingzNONs4qg8rNLWLnlj1AGBaHQ641+W5v6Ikju10DHv/PSAu4TrHxy
   DSwMj5I682MG+w4s6Tk5U89zVZDicjzeoe7ZzAMurUQUorbSgYRRaRwsV
   A==;
X-CSE-ConnectionGUID: OgFYSH5YRE+cErqMpDNbLA==
X-CSE-MsgGUID: J6NsTGJoTMKmnvaBuD1AQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="60312831"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60312831"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 15:19:50 -0700
X-CSE-ConnectionGUID: shUPuvNuTTCZ6slRDOfP6A==
X-CSE-MsgGUID: yUHuLqm5R/aPjg1Ac7wtQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168031661"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Aug 2025 15:19:49 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiKZu-0005d6-2D;
	Sat, 02 Aug 2025 22:19:46 +0000
Date: Sun, 3 Aug 2025 06:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/fastpath_cleanups 5/18] arch/x86/kvm/lapic.c:1503:13:
 warning: 'kvm_apic_send_ipi_fast' defined but not used
Message-ID: <202508030631.Haxg7KS9-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250803/202508030631.Haxg7KS9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030631.Haxg7KS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030631.Haxg7KS9-lkp@intel.com/

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
