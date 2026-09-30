Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53234E36DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780766; cv=none; b=nQSMWpKdPrt6l+VcgbEtuRZdhZ+YkYoCKW7m/5zT2gqi1EguURABfjdU7JEZMPNRggjHMa/FPGwx12UtpUWfwSUognIyhlDkeSzkOSBaVek8N0dj54wwEoOdTyD0+K9q1eMMI8xpo6p9FqMcwP6wkRupu+gyo0iKTh00flWndos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780766; c=relaxed/simple;
	bh=6cUaXqa+VbkA3NkQlE12S+V6IiNIQUyMBZr+ocyl27g=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSHp2g2iS4yO8khYcR/wscXqaCmxk2+xGcfWi4qLqSmjJGMW2VHUFCAfY8ToOXFWHXGEbHvJXI2ycYYpa+L6AglWsSqPOHdpfIKat0szE8bfxjOmJziu9zves62kf5QfOUMYmpLApKzbv9BQobnM05HeFzlHE0sCNAKlxPkz3rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkTfnu3C; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkTfnu3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790780754; x=1822316754;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=6cUaXqa+VbkA3NkQlE12S+V6IiNIQUyMBZr+ocyl27g=;
  b=TkTfnu3C1KMD1ac+z95MyxuN1i80qvGbWFSc4jkCFTbnFX/dEWrHY++Y
   zo+rl4yrDmfr3Us10JGwJQE+usX6+dhvBoUyMBySZe7EeUY036Si8SeIg
   se6f2YABnycjcj/5p15tLeVO+rbiRWps/1qMyb42YMqu4UC8E0gBiiXQj
   mzLdTY0s3sozb4APoNUb1eCU5llXBPlSvoam5tL0MvcF+bfl1kw8ejtC1
   nRNimiotJIxoi3OY/eS4eA+KH9mITBDOLS7AMYltVwOFe6Plwk20AZ07V
   RdoSCFWan63cYr0ovXxFi2n1nZX72obLtMbNx0Fb+hkByCiHSi0wcOVjs
   Q==;
X-CSE-ConnectionGUID: Kl9wkwusQIefPE8MtCgpzw==
X-CSE-MsgGUID: PvhIcaYyRgCkzgUBZ6ivbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90420807"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90420807"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 08:05:49 -0700
X-CSE-ConnectionGUID: g2ldVXptSoqkuJqV1kbqoA==
X-CSE-MsgGUID: zC0XkBSOSjyHK0/U+qY6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275265751"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 08:05:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBvsQ-00000000Qli-3uH1
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 15:05:46 +0000
Date: Wed, 30 Sep 2026 23:05:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: tracing: Make branch profiler counters atomic
Message-ID: <202609302311.J6C87vV4-lkp@intel.com>
References: <202609302311.J6C87vV4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609302311.J6C87vV4-lkp@intel.com>

Hi nanshuaibo,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/nanshuaibo/tracing-Make-branch-profiler-counters-atomic/20260930-110728
base:   
patch link:    https://lore.kernel.org/r/202609302311.J6C87vV4-lkp%40intel.com
config: x86_64-buildonly-randconfig-1003-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302311.J6C87vV4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302311.J6C87vV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302311.J6C87vV4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/tracepoint.o: warning: objtool: for_each_kernel_tracepoint() is missing an ELF size annotation
--
>> kernel/audit.o: warning: objtool: kauditd_send_multicast_skb() is missing an ELF size annotation
--
>> net/vmw_vsock/vmci_transport.o: warning: objtool: vmci_transport_dgram_allow() is missing an ELF size annotation
>> net/vmw_vsock/vmci_transport.o: warning: objtool: vmci_transport_stream_allow() is missing an ELF size annotation
--
>> net/vmw_vsock/vsock_loopback.o: warning: objtool: vsock_loopback_seqpacket_allow() is missing an ELF size annotation

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
