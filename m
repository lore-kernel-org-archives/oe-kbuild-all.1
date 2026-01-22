Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A4B3803FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 02:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769049094; cv=none; b=HLoqdHzZ5ID3PzZ1lie5YKJTijkp0nVDjwSXQOm3wufOlXsKUxST2UT4dsR8IcLAKmisEvBEscvvPmC8Ip2AvIsC9Hp9m4EFHSb35N8XmOjcXLYFQgfoVYRfScEQrY1ZYUX0ma8ltZJyqN1mGK8CjocdW8ODPuoCWz9PySrqhSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769049094; c=relaxed/simple;
	bh=2HblUV5C8wpiJAwySPd2lXcrTYu1cGvyOm1A2rHnvVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idnzhvBHmPE45Vywro7k6FTXRAlMP7JVXuCm8DgB4rWSoohddbpD/nfJlkaZVjFHvIoAfXPJQX9NmyNEhwxauKE/0Id8IaEzARZzrLEEwufk8hsoaPnSjhjYCa2vUCZbMWpH0v6GDBgTW5b4XB7suNxa8sBNceQbvGX8EoG05OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfZfpvPS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfZfpvPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769049092; x=1800585092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2HblUV5C8wpiJAwySPd2lXcrTYu1cGvyOm1A2rHnvVw=;
  b=NfZfpvPSCCnw9fE++ctDd7u+mW3purvftg7dnwavm+MYp3bjWOu2jUaI
   U3tVfrcd3Upy6FeMv4HAq7x10grnV0fMydt4uqKGzPiF3C4tFGva7i/zY
   RRLITNRUZWqizY9TUpobkxxRLYfElp5E2GXi/AZh71RNXIoTyQG6fBc9f
   MaOtGC2aAPEX/feWJR5TlwhTCTRYYUMNjZHouvlgFejzR5fn0TF6lm7Kf
   qBrY0pDjruGuj9LLJA5fC07TNPe+IJH7W2xZWFV3qLSkFXCZ+3OBY67aS
   /rAuSiVeB8Mjn9lRjcO0eDr9TV2lwBHxAPP/mOrDvCgZFmAaWJGY86zu2
   w==;
X-CSE-ConnectionGUID: tXUlhLUAQjKbVH27ilhUNQ==
X-CSE-MsgGUID: k40NKcHJQ3miGVv2sKxUaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70453299"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="70453299"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:31:30 -0800
X-CSE-ConnectionGUID: MQhK5G2hTFulia/P5ySCLA==
X-CSE-MsgGUID: YbA9IFSUTtWqrxBheakejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="237282220"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2026 18:31:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vikTm-00000000SKV-1w1p;
	Thu, 22 Jan 2026 02:31:26 +0000
Date: Thu, 22 Jan 2026 10:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [i915-rt v5 20/21] PREEMPT_RT injection
Message-ID: <202601221037.9YksOSlP-lkp@intel.com>
References: <20260121135318.651622-21-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121135318.651622-21-dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20260121]
[cannot apply to drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20260121-223353
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260121135318.651622-21-dev%40lankhorst.se
patch subject: [i915-rt v5 20/21] PREEMPT_RT injection
config: i386-buildonly-randconfig-002-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221037.9YksOSlP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221037.9YksOSlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221037.9YksOSlP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1534,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
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
