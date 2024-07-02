Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F616C699
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935358; cv=none; b=ZvViml8QHceouf59qRpHbY0X1W9jCEfDJruMlWX4cD1IXXXGINYhU1ZBJQcRpuf42xMpblaPU9cR1vkr8vt1cg/MKbuRV+eVaDP3aWzr7DsFNXwby/J4R+EHOaM0yiPjUq8cGespe0e5URTe8r78iIOIaYQG16oNALaXE3pIMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935358; c=relaxed/simple;
	bh=1bXk3fVxtmT3t4OBthf9K/NlhG47ZFcskU6K1jKTiwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tylQQE1nK4upIhxxg/Im/hsr9QEREdYc07ha7JaJ+SrWo3EdDtMOiekid9g1Nsz2yFVQS8DFEqhGYtdb0znJ5/WolmZ+wQbsRX1i6HtY56FkStR6TiIe3HRGxmd68DWl1g5PopJE+kjLKRM6xW/bEEwlb10QxS8VAkYqIWvhRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U38YEFs+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U38YEFs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719935356; x=1751471356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1bXk3fVxtmT3t4OBthf9K/NlhG47ZFcskU6K1jKTiwA=;
  b=U38YEFs+N4daVNgjUSoJ9e1Tu4Pt7N/ovQAgCPwVa4TkNhDCu11/Z8TK
   gR05c2bl4DGBDmHp0O8Dh1cqynq81Xi8NrivK+jZwvcvJSdImSKbMzK7C
   Ozf9ZtFJGH2vmKW6oqTg9IlrTJ/YaNIfJJVurrQGR1unoFMxL/ezkNCGH
   de095HDItJTcVEXzETcR88F+hDp/Eao1sNXRB/D892DqEDZpgBEYUvXIL
   PIcODtiQ44XO80NZuc89daXn0mh7o/7aJws0dxInp2T8jYhmGjkd0HFhB
   2JkvShwsWZUcHDKaPv3VYOorW2AXUNa4FIFfsjsl1/KKzF2o/FyXEYm/F
   g==;
X-CSE-ConnectionGUID: 61K0tL/BQo6aWyBs/CQvag==
X-CSE-MsgGUID: BHf/7k/bQJqxZOxGT65jpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34657765"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="34657765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 08:49:15 -0700
X-CSE-ConnectionGUID: gN5VoYl4TwmvEUzvLbnX7g==
X-CSE-MsgGUID: SLRXOCNyS4mRIup+XwNnTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="46679177"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2024 08:49:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOfkj-000OLw-3D;
	Tue, 02 Jul 2024 15:49:10 +0000
Date: Tue, 2 Jul 2024 23:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Pratik R. Sampat" <psampat@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Michael Ellerman <mpe@ellerman.id.au>,
	Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
Subject: [linuxppc:merge-test 19/24]
 arch/powerpc/kernel/test_cpuidle_latency.c:33:6: warning: no previous
 prototype for function 'run_smp_call_function_test'
Message-ID: <202407022350.nrtxMzWZ-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240702/202407022350.nrtxMzWZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407022350.nrtxMzWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407022350.nrtxMzWZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/test_cpuidle_latency.c:33:6: warning: no previous prototype for function 'run_smp_call_function_test' [-Wmissing-prototypes]
      33 | void run_smp_call_function_test(unsigned int cpu)
         |      ^
   arch/powerpc/kernel/test_cpuidle_latency.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | void run_smp_call_function_test(unsigned int cpu)
         | ^
         | static 
   1 warning generated.


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
