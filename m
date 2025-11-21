Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A472F6187
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713778; cv=none; b=XOGBWtzSLNq5TUMvZ0z93IwRTlDGW75lxmG2xVwsRVD4Zt1XQRkZ4fMutBTbkRwqsMEv5t4FPIBEVK3wiCLwJCsE2npfk1fPTH6czubZIPU1ADdh6ezKIchUhsWc2L/hO3lKJMlUHA9dyldAcrfJJ+KvjrpgXg3QM69FoAr1G1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713778; c=relaxed/simple;
	bh=BB4/6hGUoiLibs4Na2AJzu1fx/ZenLoo01mFy4fD8p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ub8n2RCzCn/kVkECFGB8nQTH/83MiIl3OZDHTBUvoY+hp1PkZHtlcIBNyZW6UrIJsQ9VhcDH91XoEMumiNY4VcPrUjU1Fw9QjpkaGiqXl3V3odJS3WRdJ2R2kVcHxkENdIMasTNlhUJ47Y0xj3q6EhEm3v28x421W9hCBApatlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYkv8T1A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYkv8T1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763713777; x=1795249777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BB4/6hGUoiLibs4Na2AJzu1fx/ZenLoo01mFy4fD8p4=;
  b=kYkv8T1AzoL/wXbeLoC2WfvKVBxoRmG3M5/snfaIABqqfUqwPezpaIA/
   CNnuyYkOzpoRVrL0+yyGpFYuCTadGGCAB2je5JV7NGKfNBtmToRTGfykW
   ZtikN07C58cpFOe/o9lYfgowWwboAaWu3F/MsW6xUXSeoBiQuujshXM6w
   F2lVigugG45LboeNMxZznkA8/Cl4LWfHU2odl8tVYSvSElIHDhhsIIe0z
   eSoPzxXUFiEp+kPz2DnyaQI3B2wZLPewIs9EY07RO75J2zW4wgW2y8oxI
   vx+96bwUfBivdBl3ja7aj+qX9PKCmK4J/4I+uJCdrfsdTWXvA7BZ3NBLd
   g==;
X-CSE-ConnectionGUID: ZdJOm4LkSgWqLef8BgZAWQ==
X-CSE-MsgGUID: 5PmRy4L0SEWhg7L6JW7jUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83193108"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="83193108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:29:37 -0800
X-CSE-ConnectionGUID: IFcT6buWSgylRLtiFzTJOw==
X-CSE-MsgGUID: HnY3eJyGTEa8YGbHZclxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191428265"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 00:29:31 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMMWH-00056t-07;
	Fri, 21 Nov 2025 08:29:29 +0000
Date: Fri, 21 Nov 2025 16:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, sshegde@linux.ibm.com, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de,
	yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
	kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 12/17] powerpc: method to initialize ec and vp cores
Message-ID: <202511211643.QVn7aDHd-lkp@intel.com>
References: <20251119124449.1149616-13-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119124449.1149616-13-sshegde@linux.ibm.com>

Hi Shrikanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on next-20251121]
[cannot apply to powerpc/next powerpc/fixes driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-docs-Document-cpu_paravirt_mask-and-Paravirt-CPU-concept/20251119-204931
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251119124449.1149616-13-sshegde%40linux.ibm.com
patch subject: [PATCH 12/17] powerpc: method to initialize ec and vp cores
config: powerpc-randconfig-002-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211643.QVn7aDHd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211643.QVn7aDHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211643.QVn7aDHd-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/kernel/smp.o: in function `smp_cpus_done':
>> arch/powerpc/kernel/smp.c:1735:(.init.text+0xd5c): undefined reference to `pseries_init_ec_vp_cores'


vim +1735 arch/powerpc/kernel/smp.c

  1721	
  1722	void __init smp_cpus_done(unsigned int max_cpus)
  1723	{
  1724		/*
  1725		 * We are running pinned to the boot CPU, see rest_init().
  1726		 */
  1727		if (smp_ops && smp_ops->setup_cpu)
  1728			smp_ops->setup_cpu(boot_cpuid);
  1729	
  1730		if (smp_ops && smp_ops->bringup_done)
  1731			smp_ops->bringup_done();
  1732	
  1733		dump_numa_cpu_topology();
  1734		build_sched_topology();
> 1735		pseries_init_ec_vp_cores();
  1736	}
  1737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
