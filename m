Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7D200A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723297646; cv=none; b=VjpTM53V+btQA0KRL6iFnOAI1+36+W/0/0PkBHvGbe+Yu7lGKYlSIZp3b5h6XBsU2pks5+ywVvrECFJS3LUSvJ9yXdEKVi3dlN90jjcm0wSzj/KjR4tj+1vJRinyi0xxRuXghr41jbUo2qQZ0dScCmv+bV58iHSGcGZw6zd7aAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723297646; c=relaxed/simple;
	bh=I/3rFsH4ROEO0ukGPdFnriv5SAshk0m+FqX3XWhp/8I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MS/m614jGRPzB9/Hedv1abCpv7JOukEWm7nCP9OtxfcDQI48wgs7cHRiT6SOoGiUkspt/Vf1OAO9ucxYMG9MMA2kUktbzVAXK8+iGJ5ZXJ13mwDzNKW0Y/dlnAj1QjJ2qbL5colWSnB2jLiM/o4pX+ALMLU+7HXWMBeFqvoM3No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqNVtFbx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqNVtFbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723297644; x=1754833644;
  h=date:from:cc:subject:message-id:mime-version;
  bh=I/3rFsH4ROEO0ukGPdFnriv5SAshk0m+FqX3XWhp/8I=;
  b=cqNVtFbxIbPqrpHiIznuvusPQfakr+XS6pdfVZy/8sY6tDV+e3pu1jH+
   llkyI6yd0GAz7PrkHw1eAiMeOrG874i+h/F8bybG6SLJkeS57tSGpPKfN
   8tBB8QC18sHWsIWwhKATvQymRJCST4sPekw0nNglpf+WrVssSsVlMVj95
   N2Q3kqWxQUgr+rDLp3ZkM85LvKAagFdO+/nd2a7NN0EuobuaZf2DvDHiU
   s7awJKNGM09DKtlZ2Z3JRC2cMNQBFPwT8KCDH4fJvJ6z85+xhbewFgOtu
   6SmB6kQsNjpRY86C1kbYZ8KS/Lpi/UQs9qR4RdEN0kOARIxFNgqErPWWL
   A==;
X-CSE-ConnectionGUID: EtgbPX1xRtu3ojLHlYdB4w==
X-CSE-MsgGUID: 6qk1TTf9SxiAlPnAtCybKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21590063"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="21590063"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 06:47:23 -0700
X-CSE-ConnectionGUID: L12nC+xJTd6CZBWRGjco2Q==
X-CSE-MsgGUID: adVOA2f2RUec7A1FIte5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57910571"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Aug 2024 06:47:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scmRD-0009yR-2F
	for oe-kbuild-all@lists.linux.dev;
	Sat, 10 Aug 2024 13:47:19 +0000
Date: Sat, 10 Aug 2024 21:46:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3720/9574]
 arch/x86/kernel/irq.c:53:9: error: implicit declaration of function
 '__apic_eoi'; did you mean 'apic_eoi'?
Message-ID: <202408102113.LghBnWO6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   c2530fc7095f682dd411b807a75445d3ff3b0d7c
commit: 09c7bb5439e48682e81937413314d9cf3759d81e [3720/9574] x86: irq_pipeline: add IRQ pipeline core
config: i386-buildonly-randconfig-005-20240810 (https://download.01.org/0day-ci/archive/20240810/202408102113.LghBnWO6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408102113.LghBnWO6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408102113.LghBnWO6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kernel/irq.c: In function 'ack_bad_irq':
>> arch/x86/kernel/irq.c:53:9: error: implicit declaration of function '__apic_eoi'; did you mean 'apic_eoi'? [-Werror=implicit-function-declaration]
      53 |         __apic_eoi();
         |         ^~~~~~~~~~
         |         apic_eoi
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from arch/x86/include/asm/trace/irq_vectors.h:383,
                    from arch/x86/kernel/irq.c:28:
   include/trace/stages/init.h: At top level:
   include/trace/stages/init.h:2:23: warning: 'str__irq_vectors__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/kernel.h:30,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/kallsyms.h:10,
                    from arch/x86/kernel/dumpstack.c:5:
   arch/x86/kernel/dumpstack.c: In function '__die_header':
   include/linux/kern_levels.h:17:25: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'int' [-Wformat=]
      17 | #define KERN_DEFAULT    ""              /* the default kernel loglevel */
         |                         ^~
   include/linux/printk.h:450:25: note: in definition of macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   arch/x86/kernel/dumpstack.c:410:9: note: in expansion of macro 'printk'
     410 |         printk(KERN_DEFAULT
         |         ^~~~~~
   arch/x86/kernel/dumpstack.c:410:16: note: in expansion of macro 'KERN_DEFAULT'
     410 |         printk(KERN_DEFAULT
         |                ^~~~~~~~~~~~
>> include/linux/kern_levels.h:17:25: warning: too many arguments for format [-Wformat-extra-args]
      17 | #define KERN_DEFAULT    ""              /* the default kernel loglevel */
         |                         ^~
   include/linux/printk.h:450:25: note: in definition of macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   arch/x86/kernel/dumpstack.c:410:9: note: in expansion of macro 'printk'
     410 |         printk(KERN_DEFAULT
         |         ^~~~~~
   arch/x86/kernel/dumpstack.c:410:16: note: in expansion of macro 'KERN_DEFAULT'
     410 |         printk(KERN_DEFAULT
         |                ^~~~~~~~~~~~
>> arch/x86/kernel/dumpstack.c:412:16: warning: operation on 'die_counter' may be undefined [-Wsequence-point]
     412 |                ++die_counter, pr,
         |                ^~~~~~~~~~~~~
   include/linux/printk.h:450:33: note: in definition of macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   arch/x86/kernel/dumpstack.c:410:9: note: in expansion of macro 'printk'
     410 |         printk(KERN_DEFAULT
         |         ^~~~~~


vim +53 arch/x86/kernel/irq.c

    34	
    35	/*
    36	 * 'what should we do if we get a hw irq event on an illegal vector'.
    37	 * each architecture has to answer this themselves.
    38	 */
    39	void ack_bad_irq(unsigned int irq)
    40	{
    41		if (printk_ratelimit())
    42			pr_err("unexpected IRQ trap at vector %02x\n", irq);
    43	
    44		/*
    45		 * Currently unexpected vectors happen only on SMP and APIC.
    46		 * We _must_ ack these because every local APIC has only N
    47		 * irq slots per priority level, and a 'hanging, unacked' IRQ
    48		 * holds up an irq slot - in excessive cases (when multiple
    49		 * unexpected vectors occur) that might lock up the APIC
    50		 * completely.
    51		 * But only ack when the APIC is enabled -AK
    52		 */
  > 53		__apic_eoi();
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
