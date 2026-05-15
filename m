Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E139E184
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 22:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883833; cv=none; b=Dk0/BPrS3R66cwOmuUo+bfpESb+jGDX5Cg7vybjfm3lBD8t3FBjY34taryJJdcJD9zccSt6D1EPSUmOTLuk9Xk2as+V65qi4p/0FsYCZ4opVvL4OH4dXWXQNK6FFEqHZWIVfbiBxpSwtWqrMJcBVuhCd/E5NA2gpNK+f4KI2d2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883833; c=relaxed/simple;
	bh=Qvvt1a/t6+yE6sqcjWcnv/liUDb36quZg/ZHIGqVsX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pZ9mBeUl9xjBcBJkVEnqt23Kt1jmf076UDtLP+x25MGRCGximPRda0dKSk/ksUn8K1OvwJieyxa579EgWCMEf1bB+Y3jsWSroC5EvGpYC6gQmC/urWVmiCP9hMftGp+PnzVRsmQmbWB9lAhRXqaFVd/G4VWhO4UYim6nVxiP/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIb2+wwh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIb2+wwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778883833; x=1810419833;
  h=date:from:to:cc:subject:message-id;
  bh=Qvvt1a/t6+yE6sqcjWcnv/liUDb36quZg/ZHIGqVsX8=;
  b=UIb2+wwhKjbnrymKvriORYfE6l3Ts+n2ZetUZMepHGldgRG2Y8ay6ZUb
   7eoC3vYe9nN0S2M2zniJ8KAg4/VpaPJPjvR3QxQLC1NRHI2WCyU8YKa1p
   BlcPpfrWNEm20ZVA+zVW883uPJ3vqPN5uloyPBZ3W3BxT4YeW4mXUl2ZD
   9Jx3tB1yvBRfqP+b8PDmNSV10Pu52HiSgTXUPKwQEmxLtis5RKcx6P5n2
   QKFfVWSgRY6NDaalkTuorCjluszXxOMra81wRhiIEk7w5Ks4h/niODYUk
   PHJuSEXeUllwmBz4aq4j8FQ2f5Q+GK7sUJoCOTFfDHzMOqNJ2kAzZYAV3
   g==;
X-CSE-ConnectionGUID: UEyHMpLPR1ulWewfaHv9lA==
X-CSE-MsgGUID: 81YsAF+qQ1GCv00YRg6TZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79737288"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79737288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:23:52 -0700
X-CSE-ConnectionGUID: 0hdIDMh7RvyWqrMB5LaLIg==
X-CSE-MsgGUID: s83fqd8LQsOL/jI/2Me6qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="243787354"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2026 15:23:51 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO0we-0000000009z-20sf;
	Fri, 15 May 2026 22:23:48 +0000
Date: Sat, 16 May 2026 06:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-sp 1/1]
 kernel/trace/trace_events.c:2807:6: warning: no previous prototype for
 'remove_event_from_tracers'
Message-ID: <202605160607.pSTEcSVp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   f815f5cffc922b8894200a0522dcb04211c469ec
commit: 43c26111cafa87d81570c63d96c497e13ec883da [1/1] ANDROID: binder: unload C Binder trace events
config: arm64-randconfig-003-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160607.pSTEcSVp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160607.pSTEcSVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160607.pSTEcSVp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.c:2807:6: warning: no previous prototype for 'remove_event_from_tracers' [-Wmissing-prototypes]
    2807 | void remove_event_from_tracers(struct trace_event_call *call)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/remove_event_from_tracers +2807 kernel/trace/trace_events.c

  2806	
> 2807	void remove_event_from_tracers(struct trace_event_call *call)
  2808	{
  2809		struct trace_event_file *file;
  2810		struct trace_array *tr;
  2811	
  2812		do_for_each_event_file_safe(tr, file) {
  2813			if (file->event_call != call)
  2814				continue;
  2815	
  2816			remove_event_file_dir(file);
  2817			/*
  2818			 * The do_for_each_event_file_safe() is
  2819			 * a double loop. After finding the call for this
  2820			 * trace_array, we use break to jump to the next
  2821			 * trace_array.
  2822			 */
  2823			break;
  2824		} while_for_each_event_file();
  2825	}
  2826	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
