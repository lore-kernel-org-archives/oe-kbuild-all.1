Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D437DE9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773957130; cv=none; b=pnAC2kvZRVif327QuC5v6l43LYMTPwyxPFiDWu3Btc045LcIaGhYI93WMQ0k14y3KSj7KImga5hWsD9fwFAJi70u+JAXBUHULaHQVEfX9/1i2ObBGgnHNsdQaFdU/73RMuEWZE0gRHwdJXu7hBIfxnbXKdPYA71GQfrsp5yGNaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773957130; c=relaxed/simple;
	bh=YRiAGotOo75vkH2R+rMNPmafZATFY93pCG02jb77+28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMLORLKS4OCcIYRJAlT9jMwKKuKX43QuZmm74V2GN21ry0vgW9ZTkbj9ZVX1qoc0dNC827PPcOwfocTxKfvno5V/KE7UR7DHgPlUV53Kc6zX1ONZoX0yLlRiLTHHknVOyrb0G00LTPMaDubBSlk74h32U73zDg6t6VknNC5Me6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrFioLUk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrFioLUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773957129; x=1805493129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRiAGotOo75vkH2R+rMNPmafZATFY93pCG02jb77+28=;
  b=IrFioLUk7LIbWRUTce11gi6olUsr43D13mk8L20fOiz2nsIcQWUknilN
   /1DS4ow4BrMgWNlIukfLFippsj4e9ubWYMVvqnQJqShZsR7Re/rzHtz49
   uG74Rl+yNdeNIQhoRx2seLNe1cCkUWh7gRtecFCk8Baf8jIwZFEnTqrRw
   cKXAJPX9A9nWwxNmqHnhQDf7mHHeG0qkSRIw/yjdm+UtPSZqKQFYVHaIB
   zOXz3OMtuWJYXtDyohARPuwqu1K4J3HCpgjUA1FbNGQQRR8qo0XGARaSV
   vYVt1+B4jjn/3U4hYt3XeS50C/9bIsat77zFL4eBFvhae30eXEkAlsDo3
   Q==;
X-CSE-ConnectionGUID: dxY7xv5fTla52fA9qPofww==
X-CSE-MsgGUID: 2V9/GL7/QbuuYkwdDMbacA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75010885"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75010885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 14:52:07 -0700
X-CSE-ConnectionGUID: Z+i0t6puTmqAY2sDR6Xbqw==
X-CSE-MsgGUID: le7Rd7RLR36oEfw7sUVfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="253576972"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Mar 2026 14:52:00 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3LHX-000000001gz-3PpB;
	Thu, 19 Mar 2026 21:51:55 +0000
Date: Fri, 20 Mar 2026 05:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Huth <thuth@redhat.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kevin Loughlin <kevinloughlin@google.com>,
	Zheyun Shen <szy0127@sjtu.edu.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Xin Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Clark <james.clark@linaro.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: [PATCH v8 2/3] x86: Implement acpi_get_cpu_uid()
Message-ID: <202603200500.chfBJwpF-lkp@intel.com>
References: <20260318060151.29438-3-fengchengwen@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318060151.29438-3-fengchengwen@huawei.com>

Hi Chengwen,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge pci/next pci/for-linus arm64/for-next/core linus/master v7.0-rc4 next-20260319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/ACPI-Refactor-get_acpi_id_for_cpu-to-acpi_get_cpu_uid-on-non-x86/20260318-225938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260318060151.29438-3-fengchengwen%40huawei.com
patch subject: [PATCH v8 2/3] x86: Implement acpi_get_cpu_uid()
config: x86_64-buildonly-randconfig-001-20260320 (https://download.01.org/0day-ci/archive/20260320/202603200500.chfBJwpF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200500.chfBJwpF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200500.chfBJwpF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/xen/enlighten_hvm.c: In function 'xen_cpu_up_prepare_hvm':
>> arch/x86/xen/enlighten_hvm.c:165:13: error: implicit declaration of function 'acpi_get_cpu_uid' [-Wimplicit-function-declaration]
     165 |         if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
         |             ^~~~~~~~~~~~~~~~


vim +/acpi_get_cpu_uid +165 arch/x86/xen/enlighten_hvm.c

   151	
   152	static int xen_cpu_up_prepare_hvm(unsigned int cpu)
   153	{
   154		u32 cpu_uid;
   155		int rc = 0;
   156	
   157		/*
   158		 * If a CPU was offlined earlier and offlining timed out then the
   159		 * lock mechanism is still initialized. Uninit it unconditionally
   160		 * as it's safe to call even if already uninited. Interrupts and
   161		 * timer have already been handled in xen_cpu_dead_hvm().
   162		 */
   163		xen_uninit_lock_cpu(cpu);
   164	
 > 165		if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
   166			per_cpu(xen_vcpu_id, cpu) = cpu_uid;
   167		else
   168			per_cpu(xen_vcpu_id, cpu) = cpu;
   169		xen_vcpu_setup(cpu);
   170		if (!xen_have_vector_callback)
   171			return 0;
   172	
   173		if (xen_percpu_upcall) {
   174			rc = xen_set_upcall_vector(cpu);
   175			if (rc) {
   176				WARN(1, "HVMOP_set_evtchn_upcall_vector"
   177				     " for CPU %d failed: %d\n", cpu, rc);
   178				return rc;
   179			}
   180		}
   181	
   182		if (xen_feature(XENFEAT_hvm_safe_pvclock))
   183			xen_setup_timer(cpu);
   184	
   185		rc = xen_smp_intr_init(cpu);
   186		if (rc) {
   187			WARN(1, "xen_smp_intr_init() for CPU %d failed: %d\n",
   188			     cpu, rc);
   189		}
   190		return rc;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
