Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26740194C82
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442630; cv=none; b=Pmj7Dz+ijoc3BDvLD+PcvPYFBITe2MhQ7E0WBJZMJQg0+nshkOrkcyDhnqPAlbqASZTZK1+PCV7CRhieGyUudsAblYM+EHsnOMMIR4v2SiWuY33bbxg4zvc0d1gXm0i6KVmPNCy/kzz8YVaQl/KwcpNKeoNgP6MS14OkWcYkQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442630; c=relaxed/simple;
	bh=7Sv16vXmIGiUNO21for2OpgcX+UbGtQt0QP98OkNw90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f09nXDhbpYo/E+itu9AEp776eg1gNBhFRcuCoUqP+zYHU5Cwee0ELEoQs/WyeUqx/cu7/F3RLNm8DI6zqe0xtSVbLp/XPMrPk/3j8CdEXm3wNHd+UNFOQLTbtiRlHg/Pi7o43wpv2AlbMprAUZ3YbHtyIhtAq/WgypWsc1AFdUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zk/DkpGf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk/DkpGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725442628; x=1756978628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Sv16vXmIGiUNO21for2OpgcX+UbGtQt0QP98OkNw90=;
  b=Zk/DkpGfjZUuVGi5NUdualR6b8LIpFRn8/a5sUICRqdgi1HETJFrp4AJ
   ozHuXO5uJqNgpTCdEs5xXuvQ5+PfQmOWM6iL128t3sUJe094+jmzpfZ+y
   NUy5dUEgRiGer7Hqm/0w6MuuD02CncMBiy6p1s3HAhw6nDB4+3G6wVdLO
   s6EO/YuEdeeIKTcbyNY6fPlra0+lfks6RWoqzraxa64wy/vjeDULHU0KS
   iKBIaXFSH3PnuhtlIXyl++ExJlEPdBrnonCuHMkVUI675J7LMcQGW4Xjt
   gk5kzeCmN06bDmNHxGDOm1Ou33EbrBa2vJ3A5bFoo6zlcy/MkhvpJXCcY
   g==;
X-CSE-ConnectionGUID: U0f6Y3LqRsCEI6msN4geWQ==
X-CSE-MsgGUID: wNHUWNGcQee7WbK8X1rxvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24282231"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24282231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 02:37:07 -0700
X-CSE-ConnectionGUID: 32zsDYm7RfSvwrbWeDPZiA==
X-CSE-MsgGUID: HYVg5+j+QImLeHHhmBJ2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="70076394"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2024 02:37:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slmRk-0007ok-1I;
	Wed, 04 Sep 2024 09:37:04 +0000
Date: Wed, 4 Sep 2024 17:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/cleanup_smp_nmi_shootdown 1/2]
 arch/x86/kernel/reboot.c:596:48: error: 'crash_ipi_issued' undeclared
Message-ID: <202409041705.kPz0aaCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/cleanup_smp_nmi_shootdown
head:   2d66e97505d0772d0ae26174538d4368541dfec7
commit: c7de2d2c0cab7d890294b5437faf1bccb6bc978d [1/2] x86/reboot: Open code nmi_shootdown_cpus_on_restart() into its sole user
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240904/202409041705.kPz0aaCe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041705.kPz0aaCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041705.kPz0aaCe-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/reboot.c: In function 'emergency_reboot_disable_virtualization':
>> arch/x86/kernel/reboot.c:596:48: error: 'crash_ipi_issued' undeclared (first use in this function)
     596 |                 if (IS_ENABLED(CONFIG_SMP) && !crash_ipi_issued)
         |                                                ^~~~~~~~~~~~~~~~
   arch/x86/kernel/reboot.c:596:48: note: each undeclared identifier is reported only once for each function it appears in


vim +/crash_ipi_issued +596 arch/x86/kernel/reboot.c

   576	
   577	static void emergency_reboot_disable_virtualization(void)
   578	{
   579		local_irq_disable();
   580	
   581		/*
   582		 * Disable virtualization on all CPUs before rebooting to avoid hanging
   583		 * the system, as VMX and SVM block INIT when running in the host.
   584		 *
   585		 * We can't take any locks and we may be on an inconsistent state, so
   586		 * use NMIs as IPIs to tell the other CPUs to disable VMX/SVM and halt.
   587		 *
   588		 * Do the NMI shootdown even if virtualization is off on _this_ CPU, as
   589		 * other CPUs may have virtualization enabled.
   590		 */
   591		if (rcu_access_pointer(cpu_emergency_virt_callback)) {
   592			/* Safely force _this_ CPU out of VMX/SVM operation. */
   593			cpu_emergency_disable_virtualization();
   594	
   595			/* Disable VMX/SVM and halt on other CPUs. */
 > 596			if (IS_ENABLED(CONFIG_SMP) && !crash_ipi_issued)
   597				nmi_shootdown_cpus(NULL);
   598		}
   599	}
   600	#else
   601	static void emergency_reboot_disable_virtualization(void) { }
   602	#endif /* CONFIG_KVM_INTEL || CONFIG_KVM_AMD */
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
