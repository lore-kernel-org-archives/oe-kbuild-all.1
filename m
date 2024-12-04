Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350FA18732E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 21:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733347416; cv=none; b=n323PQQHUlcgxo2zb33Vhdh5sSi9vu33ZcNTKcj4dBf3VVSvwTjHMFiDj0sMsu4OOEa2/GpL9Id3tdEOhzBZw/dXzekg9jRz/DacGvxxaF4u1QUmnmdz0KQATJCuxt596MB6tuN/xAyG0hWE9Mhj3iJpzVRfz125aWZp8o7HHfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733347416; c=relaxed/simple;
	bh=vTdLKIs7ebBZu2Ws2Y+DnduT3TbI/7mQ85tTB/+fyB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQTKilaXELZMJ08utG7tqQ4psUIaG8eHWrMSEVvdzkGIyTMBd8ekvJJ6KorjSzvOtBkh6PclEePRKYDPJ+mOVN+LDhxyT2MQO8ROiOR2J08yTaDR56l6mQu0PHoBuT64110pdRaaSHPpuersiFXnCn3F+U6ZhyGsiansVbK7eMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrLcQHoF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrLcQHoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733347413; x=1764883413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vTdLKIs7ebBZu2Ws2Y+DnduT3TbI/7mQ85tTB/+fyB8=;
  b=hrLcQHoFUr7WFdgO99c17KS+58npLPHYAEs+oSlPrf013Apg1PQfoyP+
   ZTx5z8P+qYapUQB/SPkyy3zmrQcLTlZoPYAVXc1sX/nPdpr64YRaYy1fp
   GNDKamPnb668GVy2it7W/FMRCmZzuBAW3GZlq6kcxTTpRPAVeYAqO/IXL
   gEw8dgfhhT7HTNopOB0miYwPiSB2IM4Rkuy4blwQiFZyJh0Oh5KmmqJDE
   /xQtidCrYd602p384Bc8s6wfcAUvviBIXtzzbhOfxs79wWUr7i/2czBu0
   sf7uwE6c0rmvMhbZYO2Kuwu9/7QMOSr+BgcDVM8nb9vyCY5fYFLQiCIYg
   g==;
X-CSE-ConnectionGUID: MvdNcGGwT7qqmizkcJ0egQ==
X-CSE-MsgGUID: uoCrERBrRuymh7kMpCJ93g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37572700"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="37572700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 13:23:32 -0800
X-CSE-ConnectionGUID: pOd312oXQZe8ugkbw+avLA==
X-CSE-MsgGUID: YAuA8fusQ1i9fioUZWDaLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="98338115"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2024 13:23:29 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIwq9-0003Vl-2S;
	Wed, 04 Dec 2024 21:23:23 +0000
Date: Thu, 5 Dec 2024 05:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: liujing <liujing@cmss.chinamobile.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, mat.jonczyk@o2.pl,
	rdunlap@infradead.org
Cc: oe-kbuild-all@lists.linux.dev, bhelgaas@google.com,
	mario.limonciello@amd.com, linux-kernel@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: Re: [PATCH] arch/x86: Fix the wrong format specifier
Message-ID: <202412050541.CvNgnYXM-lkp@intel.com>
References: <20241204143322.7772-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204143322.7772-1-liujing@cmss.chinamobile.com>

Hi liujing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/x86/core tip/auto-latest linus/master v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/liujing/arch-x86-Fix-the-wrong-format-specifier/20241204-225811
base:   tip/master
patch link:    https://lore.kernel.org/r/20241204143322.7772-1-liujing%40cmss.chinamobile.com
patch subject: [PATCH] arch/x86: Fix the wrong format specifier
config: x86_64-buildonly-randconfig-006-20241205 (https://download.01.org/0day-ci/archive/20241205/202412050541.CvNgnYXM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050541.CvNgnYXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050541.CvNgnYXM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/hpet.c: In function 'hpet_late_init':
>> arch/x86/kernel/hpet.c:731:40: warning: '%u' directive writing between 1 and 10 bytes into a region of size 6 [-Wformat-overflow=]
     731 |                 sprintf(hc->name, "hpet%u", i);
         |                                        ^~
   In function 'hpet_select_clockevents',
       inlined from 'hpet_late_init' at arch/x86/kernel/hpet.c:1146:2:
   arch/x86/kernel/hpet.c:731:35: note: directive argument in the range [0, 4294967294]
     731 |                 sprintf(hc->name, "hpet%u", i);
         |                                   ^~~~~~~~
   arch/x86/kernel/hpet.c:731:17: note: 'sprintf' output between 6 and 15 bytes into a destination of size 10
     731 |                 sprintf(hc->name, "hpet%u", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +731 arch/x86/kernel/hpet.c

   703	
   704	static void __init hpet_select_clockevents(void)
   705	{
   706		unsigned int i;
   707	
   708		hpet_base.nr_clockevents = 0;
   709	
   710		/* No point if MSI is disabled or CPU has an Always Running APIC Timer */
   711		if (hpet_msi_disable || boot_cpu_has(X86_FEATURE_ARAT))
   712			return;
   713	
   714		hpet_print_config();
   715	
   716		hpet_domain = hpet_create_irq_domain(hpet_blockid);
   717		if (!hpet_domain)
   718			return;
   719	
   720		for (i = 0; i < hpet_base.nr_channels; i++) {
   721			struct hpet_channel *hc = hpet_base.channels + i;
   722			int irq;
   723	
   724			if (hc->mode != HPET_MODE_UNUSED)
   725				continue;
   726	
   727			/* Only consider HPET channel with MSI support */
   728			if (!(hc->boot_cfg & HPET_TN_FSB_CAP))
   729				continue;
   730	
 > 731			sprintf(hc->name, "hpet%u", i);
   732	
   733			irq = hpet_assign_irq(hpet_domain, hc, hc->num);
   734			if (irq <= 0)
   735				continue;
   736	
   737			hc->irq = irq;
   738			hc->mode = HPET_MODE_CLOCKEVT;
   739	
   740			if (++hpet_base.nr_clockevents == num_possible_cpus())
   741				break;
   742		}
   743	
   744		pr_info("%d channels of %d reserved for per-cpu timers\n",
   745			hpet_base.nr_channels, hpet_base.nr_clockevents);
   746	}
   747	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
