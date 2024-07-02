Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A877F15218A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719936082; cv=none; b=LO7MUV6F84/ajYPAGIDk+9LkNliTt1HXnQTHfsEC/YtmyzJuYhcwHkmTPuWSy6sGq56ZX2JO9cRHx4/dR2OYnZ7ZzzROKWGi9SsIEMmT9KSbW4c139brD/3ikS4/FxlcXSfDgbks0KyQa70WPIcDoulbv3+RxNCmqXVHuE9Ot3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719936082; c=relaxed/simple;
	bh=9aV3P37DZ0Dw10gTeOVjQsLc+dTA3RAUmAbqlTRrxkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8YWMTi/dyW7VE+QGmA+SsFz8wqJZAYw/sKpjtFunalh2u3nG8ZqbOb0Q7FLCmpE0bhnmUVq7rzHcHIlLrw+RA9HbQitOwzwhdx9SL7dAS6d5LD0fQACpMajfcuwoNg3UkffH2rNmN6jrfA1H0LHXj0tt6GCm1GQjvIAIGmyNZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HY9ZQpYO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HY9ZQpYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719936080; x=1751472080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9aV3P37DZ0Dw10gTeOVjQsLc+dTA3RAUmAbqlTRrxkU=;
  b=HY9ZQpYOYtxOZsrGNfzkRPN8rWnzC948G5CrZvE75Gidw0aRlw9PvhES
   9cQZqEA4PKb6BpU3AJK/UdR92hDawnwo5n/AE4Du27+UTmiUTF2ZYjUFW
   /7GkH1GiAs357glj9WFlwqWJvqaOkrPNZUuZyhiUqSJEz9TOB9+iPt+et
   hfrvMsYMREPdbekvnn27LzuCDM+SDd/msR9nWNTr8kTjwzXP5K68eRLwC
   X+hewCmzooylFmr00HEheWdPixKTXWP5/Wsk1FqmoWCsdhW8BwRnu9O3+
   0kxiIJZEcExJKRD1e8ttT63FgSrzQg/lo+09iidoZwY//Su8AnYlCOQMb
   w==;
X-CSE-ConnectionGUID: 55aG19AsTPmWDqhZdjoyRA==
X-CSE-MsgGUID: FM+6DFfNQXOrFYBE2v1Z+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27799565"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="27799565"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 09:01:20 -0700
X-CSE-ConnectionGUID: b5Z0gC2US2ibScwfa9ZG/Q==
X-CSE-MsgGUID: 6X7f6BfoTfC1HSKeCqpCWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50803859"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2024 09:01:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOfwS-000OMi-0I;
	Tue, 02 Jul 2024 16:01:16 +0000
Date: Wed, 3 Jul 2024 00:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Pratik R. Sampat" <psampat@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Michael Ellerman <mpe@ellerman.id.au>,
	Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
Subject: [linuxppc:merge-test 19/24]
 arch/powerpc/kernel/test_cpuidle_latency.c:33:6: warning: no previous
 prototype for 'run_smp_call_function_test'
Message-ID: <202407022346.FdPrcQ7b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux merge-test
head:   abcc5fdeacec65419fccafbefae1974afea31dc1
commit: b5af3438997c07a6c4f5f3bf3a00f2172f019759 [19/24] powerpc/cpuidle: cpuidle wakeup latency based on IPI and timer events
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240702/202407022346.FdPrcQ7b-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407022346.FdPrcQ7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407022346.FdPrcQ7b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/test_cpuidle_latency.c:33:6: warning: no previous prototype for 'run_smp_call_function_test' [-Wmissing-prototypes]
      33 | void run_smp_call_function_test(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/run_smp_call_function_test +33 arch/powerpc/kernel/test_cpuidle_latency.c

    32	
  > 33	void run_smp_call_function_test(unsigned int cpu)
    34	{
    35		ipi_wakeup.src_cpu = smp_processor_id();
    36		ipi_wakeup.dest_cpu = cpu;
    37		ipi_wakeup.time_start = ktime_get();
    38		smp_call_function_single(cpu, measure_latency, &ipi_wakeup, 1);
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
