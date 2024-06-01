Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6566FB9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 03:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717211624; cv=none; b=En4Flvm6AtVYKhp2oYsLVyBlPeQ8YihxOgkdI5BrV3py4J4iKbkuwL1lIKKAOy2/yzjRE4OSJDBuTuyIy9rH4pGwv3B/gItpr/dnG7C46hMh2dsepSBUhHTJ8nNvA9Y+HqyzAcedbPQzPf3t+Fi7AVZSSSmSZVZbaPJFb2GJcwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717211624; c=relaxed/simple;
	bh=Cmlsnd8FTjt2wf+atbpmaJYozuztvdSnJ0N1WnHmgzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZ39gosJefjcEZL7a5PKWiHpeEy5/okIGwlPqAoplzGiPQoLZ4xFGTY5FLbSUhx8qHYyaZSJSnSpO2isl4MSifIMU9bmJKn32liwec71tDOV9ZhgWS7Obdpe0MJnMIM7WXL91L406Hnuaq/f78mFGeTiFK/iQPkyeEzjBaTDwxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWL+9q/B; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWL+9q/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717211622; x=1748747622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cmlsnd8FTjt2wf+atbpmaJYozuztvdSnJ0N1WnHmgzA=;
  b=dWL+9q/Ba7pRrl31LQGiK72cssHe2kjBmVyPjNOghQIMlGUPl5o+vzPO
   QcGYsaVrofdAqrguWLEHfWwfh1/2SfLuX5QhHb/dh2neTpzJqvKKvFvA5
   2nyh/3ZuX/PIm3eelsUWV3nvSaIDDVSGu8Vo3CssqT53A4GbGDE4cOAU9
   DpO0/7kSmg58bRTzzoCIXBwZ0Ba84Sc6Ylvt/AZ5PiznlxSu1aXJ++UO6
   7HmRYUvUaxQax3FRqsmGuXF2z8piB9ioH6LoLEh58dtaRJlFzWV0n7vyK
   oOlIP20UkuuRle9HY4SatHBWdCe+5fkvdRhs9pgyuTcUcTQttawyiCRBf
   g==;
X-CSE-ConnectionGUID: ir4nXVilRSqvClXw4x/bUg==
X-CSE-MsgGUID: 5tkYO9KoRj2DqVnsWF884g==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17598964"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="17598964"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 20:13:39 -0700
X-CSE-ConnectionGUID: VFeIB5DVRJ+4JCn00rksqg==
X-CSE-MsgGUID: 7UKASYetTLWTDmkzppBcTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="40887772"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 20:13:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDFBX-000IFu-1t;
	Sat, 01 Jun 2024 03:13:35 +0000
Date: Sat, 1 Jun 2024 11:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 9/10] kernel/irq/irqdesc.c:31:9: error:
 implicit declaration of function 'cpulist_parse'; did you mean
 'nodelist_parse'?
Message-ID: <202406011031.1hNlnnTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask-types
head:   73e9e98494988c844af62ffb6dc7aa5512d87034
commit: 46b57212fb7c3b4e7bef861e73110c4aff516336 [9/10] cpumask_str.h
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240601/202406011031.1hNlnnTB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011031.1hNlnnTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011031.1hNlnnTB-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/irqdesc.c: In function 'irq_affinity_setup':
>> kernel/irq/irqdesc.c:31:9: error: implicit declaration of function 'cpulist_parse'; did you mean 'nodelist_parse'? [-Werror=implicit-function-declaration]
      31 |         cpulist_parse(str, irq_default_affinity);
         |         ^~~~~~~~~~~~~
         |         nodelist_parse
   cc1: some warnings being treated as errors


vim +31 kernel/irq/irqdesc.c

3795de236d67a0 Thomas Gleixner 2010-09-22  26  
fe0514348452f5 Thomas Gleixner 2011-05-18  27  #if defined(CONFIG_SMP)
fbf198030e0b02 Thomas Gleixner 2016-02-03  28  static int __init irq_affinity_setup(char *str)
fbf198030e0b02 Thomas Gleixner 2016-02-03  29  {
10d94ff4d558b9 Rakib Mullick   2017-11-01  30  	alloc_bootmem_cpumask_var(&irq_default_affinity);
fbf198030e0b02 Thomas Gleixner 2016-02-03 @31  	cpulist_parse(str, irq_default_affinity);
fbf198030e0b02 Thomas Gleixner 2016-02-03  32  	/*
fbf198030e0b02 Thomas Gleixner 2016-02-03  33  	 * Set at least the boot cpu. We don't want to end up with
a359f757965aaf Ingo Molnar     2021-03-22  34  	 * bugreports caused by random commandline masks
fbf198030e0b02 Thomas Gleixner 2016-02-03  35  	 */
fbf198030e0b02 Thomas Gleixner 2016-02-03  36  	cpumask_set_cpu(smp_processor_id(), irq_default_affinity);
fbf198030e0b02 Thomas Gleixner 2016-02-03  37  	return 1;
fbf198030e0b02 Thomas Gleixner 2016-02-03  38  }
fbf198030e0b02 Thomas Gleixner 2016-02-03  39  __setup("irqaffinity=", irq_affinity_setup);
fbf198030e0b02 Thomas Gleixner 2016-02-03  40  

:::::: The code at line 31 was first introduced by commit
:::::: fbf198030e0b027538c290300cfaf9e2efdce122 genirq: Add default affinity mask command line option

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
