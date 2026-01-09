Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA441A9F93
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767990137; cv=none; b=VLTlJUKH9Hcmz4JWW218Q79xBYsMvwsJqoo9iuutEQuRnsvNKcuYgQXjKPoLUXt+5D4PfVsEjfsRMsjsYHwkoGySdTsjbCGtje8Igc480Yyrdh+2X/+Cs7lnvkRpeXLRy4Pai73dJY3kUHOQxMvAG6mkgeqKGQ2SDijGIom4JSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767990137; c=relaxed/simple;
	bh=MVlIl/wbvGxjfoo5oJvKnkEADLAA1Nju3RdetXurn9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M4k3p40fpY1R8jNP2jWHqZSSADzu3X7PEyrN0REnJzGKUiNOSkpSsM4Dh/HNn73JppvjCW2Z3bAa56dMjZfayG1i3KFkp6BKiTeDT791FdPrTpxR6A7HMuiPGkIMfq6FQaMf0RwnhuL2F1veymTjqBDXA2ARPw9oMyIr3224BVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YC/rO3G+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YC/rO3G+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767990136; x=1799526136;
  h=date:from:to:cc:subject:message-id;
  bh=MVlIl/wbvGxjfoo5oJvKnkEADLAA1Nju3RdetXurn9A=;
  b=YC/rO3G+U4ZTeONU9zpqyrlVGmA8WuCmp9EuggcJeXQFnUYzG40QAgY0
   GlYzaPz0IvPfSW+Ry9YbQyFyTyMCWilAkkyaHFuPQ8ALMhsLM2mDedpVy
   /5vGmN1Jor2rIQElP7XuoC39GtvIGl1/MDgpil27LWZPrV4xEr+COMlWG
   GY+l28aGLi4bgIu0NCnce5EOxK65qnqFeRLgbIy7ddIz+LvY+8/ob40b1
   9LT0dZ9kp2PQaWWMoI1m9IpC1zHJ/W3ISgCjHkA3atEv+I69MjdcW1846
   mEwIxGI3y7HsjLTaQ5cqfyLo+6LIJ2eWya3BiVam2ufeJs2xubrE3MRNA
   Q==;
X-CSE-ConnectionGUID: vsDqXkh/ROOAp4Dx+Vwstw==
X-CSE-MsgGUID: PqjukkEBSqOx0cBgKvfGZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68575822"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="68575822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 12:21:43 -0800
X-CSE-ConnectionGUID: PkLSytpNSRmVJKK+q8iBNA==
X-CSE-MsgGUID: N82iV7L5R8mxUQTsueQk+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="203625123"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2026 12:21:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veIzL-000000007h6-1XJl;
	Fri, 09 Jan 2026 20:21:39 +0000
Date: Sat, 10 Jan 2026 04:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2] WARNING: modpost: EXPORT
 symbol "inet_sk_get_local_port_range" [vmlinux] version generation failed,
 symbol will not be versioned.
Message-ID: <202601100435.sHZ6gRg5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   92006aa7394b93146726ae6bdcfd782233f202dc
commit: 5ce1842cd12dbf6fb8c0373e4b727073ef0d2e3b [0/2] ANDROID: GKI: net: add vendor hook for network quality estimation
config: i386-randconfig-003-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100435.sHZ6gRg5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100435.sHZ6gRg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100435.sHZ6gRg5-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: EXPORT symbol "cpufreq_frequency_table_verify" [vmlinux] version generation failed, symbol will not be versioned.
Is "cpufreq_frequency_table_verify" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "inet_rcv_saddr_equal" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_rcv_saddr_equal" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "inet_sk_get_local_port_range" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_sk_get_local_port_range" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "inet_csk_get_port" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_csk_get_port" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
