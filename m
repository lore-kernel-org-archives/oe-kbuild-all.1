Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936328314A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 07:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765612518; cv=none; b=MM1+3AXBjUtOsNO20gEIPaNWD5xYzPMfAIuw0/TNwIuPCygssSW7FDezWc0rygzQKQylLKUS7t/yWBBfN6nVV9IVrcreuew+Tq6ZH5O2cNNsfCK+3mPBaCJhsJx+XlCBGhecNSgadSs2pULyu8viugK/Ckbw5OLun8w2b970j00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765612518; c=relaxed/simple;
	bh=NeoYkpU2X9NvwGHugzR2oZV2mJPEPfPPIJHrbOTzf9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDqwnafQoF2eSiHcHXxqYmxt8ADYM93Z+JUMkNDcikYQouvz1JbMgaCjwHdxK0J3CWCXsqLfXKNySkoPb9aTfO1P4gHa2PeiY2UGwGbaCNTxTaBSOYNfckBnIeaZ2O7I3+h6QjWu47p8PmYuAZ9jqyHRA/ZHu0oIrUb8wiw/+Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyE9u/YA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyE9u/YA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765612516; x=1797148516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NeoYkpU2X9NvwGHugzR2oZV2mJPEPfPPIJHrbOTzf9A=;
  b=KyE9u/YAwkYpnOJZptoMQCRc4VhJQTLGVkMUFv0/Y2IdNF+JL2XWGayV
   2xi55aGRavQOTt+SUZYYXwXvnIRHUv3N3A/03y2T3nW1JkSicKbeLEww/
   kNuMsjePqkt1ustakxQ9d6iakJOeZO/HwseoGIjmp/hV/NWFL1IzveRgd
   mz+qgckSUafgV3UuNMVpXKSBUJ0OkSBVdzWHIESoBebMpEot7hAxBW5zJ
   yJgSOXk+tWC1cstbhz/lLzIysr/p9UInp2wu8I/v1o4e3KHjrHcI5nBng
   64HKAIJDIHTILCzzZU+2lp44BpPRDJhcVnSs2K40fiYNqptC/ueh37Gpx
   g==;
X-CSE-ConnectionGUID: 5VaTwBr1QtGU1DQ8Rxj5Xg==
X-CSE-MsgGUID: +3iMtYO9TBKwcB3ZlqSkIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78243585"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78243585"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:55:16 -0800
X-CSE-ConnectionGUID: 6hMPXRPPT7mdAMLKFq1AlA==
X-CSE-MsgGUID: /OLBs6agSwmsPIInGK1Rkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227935856"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 23:55:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKT9-000000007G1-3sYW;
	Sat, 13 Dec 2025 07:55:11 +0000
Date: Sat, 13 Dec 2025 15:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [CI-ONLY PATCH v2 11/12] PREEMPT_RT injection
Message-ID: <202512131535.uNC5btt9-lkp@intel.com>
References: <20251212143504.973839-25-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212143504.973839-25-dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master next-20251212]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20251213-023952
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251212143504.973839-25-dev%40lankhorst.se
patch subject: [CI-ONLY PATCH v2 11/12] PREEMPT_RT injection
config: i386-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131535.uNC5btt9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131535.uNC5btt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131535.uNC5btt9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/uprobes.h:13,
                    from include/linux/uprobes.h:66,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/platform/x86/lenovo/wmi-gamezone.c:11:
>> drivers/platform/x86/lenovo/wmi-gamezone.c:34:31: warning: 'gz_chain_head' defined but not used [-Wunused-variable]
      34 | static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
         |                               ^~~~~~~~~~~~~
   include/linux/notifier.h:119:39: note: in definition of macro 'BLOCKING_NOTIFIER_HEAD'
     119 |         struct blocking_notifier_head name =                    \
         |                                       ^~~~


vim +/gz_chain_head +34 drivers/platform/x86/lenovo/wmi-gamezone.c

22024ac5366f06 Derek J. Clark 2025-07-01  33  
22024ac5366f06 Derek J. Clark 2025-07-01 @34  static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
22024ac5366f06 Derek J. Clark 2025-07-01  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
