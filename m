Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DEC364E9C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161317; cv=none; b=QYH23x96hNkJKRcyWcSXL+CTUs2pxmn63PA86W2mGylJ1MDUmlaYXTMdpTOt3h7oLmXxpTwl3Z3Uvmb/Ww+s5xnxKy5VX0TmoR9cSCcJpxXeANri4JCXE8aIOzxuYfqcYER+4oKjWnzmPSxjaBbDSqI3+jNISBLrpSrmkZtIkzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161317; c=relaxed/simple;
	bh=bYe+5mye5EU5BZsStchEKf+8Drtyqh4KMfvGrN988sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0SXv24pYwPxb8KqKvQkwYwmcmPIV8dXyqJYrFV3iRgSui1S41yDj5n3x8q2+Teco8i1w4exdMXLb7VpuI6uW3L7QO1kC9KuUM3pDP9+eEUx7bEge1oR/h0jat4VDqzgtw7c/ShvWwwhX0NH09BRfPUtgQgXN/gSJZR3QA0Xpho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHm49pte; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHm49pte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769161310; x=1800697310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bYe+5mye5EU5BZsStchEKf+8Drtyqh4KMfvGrN988sQ=;
  b=nHm49pteXILbPvm1g5PhwXZqCg9fRx/OtkbjXLMDSL/W6UiOsrfNydaI
   rlXeJkvQLDkdSPLzvG1j+4YFzLR9Nvy1Ppf/E/YKMhQ4rwXHj5UgBIGTC
   1dyaGYGIKNiHpMcL1Bj026DDtBfFpus096SPh20RQTu541nOkl7zHWFg+
   krMC578CRe5Rh91RNp+n5im26F5JEZQGuS+ZDsNcQm4s0zn5uIyat+K/Q
   T52kXf/RKyx5c8mzCLCeO0Xktd3uCdv+sVstR1irHb89k/qCtDVvEOCZQ
   qoYiUQEpF90SoN0XN4R4HdT4W+kuIxPUA6jSclzfZdUrPgptSOu5wkz6y
   w==;
X-CSE-ConnectionGUID: zi8XdzRJTN+Ts4zoPo59fQ==
X-CSE-MsgGUID: 2srABaEPS2qjvI5llWtp9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="69609346"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="69609346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 01:41:46 -0800
X-CSE-ConnectionGUID: kyXBHUVgTH2HCovzzPevqA==
X-CSE-MsgGUID: kowiCTB3S32lqyVb8NcsVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211985262"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 23 Jan 2026 01:41:43 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjDfg-000000000gj-3hLp;
	Fri, 23 Jan 2026 09:41:40 +0000
Date: Fri, 23 Jan 2026 10:40:58 +0100
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, rafael@kernel.org, dakr@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pavel@kernel.org, lenb@kernel.org,
	neelx@suse.com, atomlin@atomlin.com, sean@ashe.io,
	mproche@gmail.com, chjohnst@gmail.com, nick.lange@gmail.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] PM: QoS: Introduce boot parameter
 pm_qos_resume_latency_us
Message-ID: <202601231030.N1gaWeuj-lkp@intel.com>
References: <20260123010024.3301276-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123010024.3301276-1-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master amd-pstate/linux-next amd-pstate/bleeding-edge v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/PM-QoS-Introduce-boot-parameter-pm_qos_resume_latency_us/20260123-090409
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20260123010024.3301276-1-atomlin%40atomlin.com
patch subject: [PATCH] PM: QoS: Introduce boot parameter pm_qos_resume_latency_us
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260123/202601231030.N1gaWeuj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231030.N1gaWeuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231030.N1gaWeuj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/qos.c:56:13: warning: 'pm_qos_resume_latency_cmdline' defined but not used [-Wunused-variable]
      56 | static char pm_qos_resume_latency_cmdline[COMMAND_LINE_SIZE] __initdata;
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pm_qos_resume_latency_cmdline +56 kernel/power/qos.c

    55	
  > 56	static char pm_qos_resume_latency_cmdline[COMMAND_LINE_SIZE] __initdata;
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
