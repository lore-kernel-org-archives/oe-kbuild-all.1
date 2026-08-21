Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5573D3254AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319465; cv=none; b=tQYe7GEKdvjd56eJ7m1S+TMgwjyJ0ut25RkTeUXCxwtcqdv4AfiR5U8msuETJ09pd//5L30ANLbubxtVchs6ZKgRfqJgQN605C/0INAE8JtBmONINrR5W3sZyRhXY3Wz23yVEV5+ZmpPg2keHk/J40+K8g3+kDFeAb/JClLTnn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319465; c=relaxed/simple;
	bh=H2s1auxtqh2HcUynRfTKE+W7nyD5hmrJBZl/nbUbNlk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CZNc94EpqzjU3a/IfACNKKVP6Gx6nsN6BZ4UIQPo1EBB42eZh/HYlyZydWtnf9XuO+v641/LMet01xcE7BHRri+iZ9GXExeN9Nkz5IGeLuvgwR1Ly1VCpQ58mHmSaTvEX6Jcoyr4W0GsmTQZsWPbXQefAf9BCUHWNFyhYhOchFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0Cu/0ZP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0Cu/0ZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787319464; x=1818855464;
  h=date:from:to:cc:subject:message-id;
  bh=H2s1auxtqh2HcUynRfTKE+W7nyD5hmrJBZl/nbUbNlk=;
  b=G0Cu/0ZPPyhZRO2XkZbNSuF/6gtHbd6U630mNI29463gWrvSPp6WilqY
   +ywIrvCsIpnL1FBNBMdxQIT1hrUeRBrgHGcLxqjOEa7AgLL1jdsDaCVBz
   Da24aqnXRqv+tKPPE6iRFWOAsfITANp/2Vmx3UsgQm49bzOKjxt4g7FGU
   AJ0NaRERFBmcaWMGQf+XG79W0SEr40WmZFpwk9MzcQ4Mez7tiiW7oJT+C
   wM9LN7j9SW3cBWfroPDXnnTjOvvzGGpj8RLWOYRtoHaE5Wjn9mtUYYzOC
   JCfRV5tvTXsUq0RUDQUNwh7EOdHkVxeJVXDrP6t8YwancLmFESHO8EiDa
   g==;
X-CSE-ConnectionGUID: X9beqXLnRtKJK1Od3U7HzA==
X-CSE-MsgGUID: HJXfVlhcQqmOjv1X1KVI2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="110653749"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="110653749"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 06:37:44 -0700
X-CSE-ConnectionGUID: B62jz4ukTsOYxW57GF4wgA==
X-CSE-MsgGUID: B0WM2RPQRjuD7hzRvIX/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270578042"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2026 06:37:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxPRE-00000000pyP-2Pz3;
	Fri, 21 Aug 2026 13:37:40 +0000
Date: Fri, 21 Aug 2026 21:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 5/5]
 mm/vma_readahead_boundary.c:64: warning: expecting prototype for What().
 Prototype was for init_vma_readahead_boundary() instead
Message-ID: <202608212143.RSt38Hpo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   5922ee2e751845b0716e158317a1dd492c6f7c39
commit: 5922ee2e751845b0716e158317a1dd492c6f7c39 [5/5] ANDROID: add /sys/kernel/mm/vma_readahead_boundary/enabled
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260821/202608212143.RSt38Hpo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212143.RSt38Hpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608212143.RSt38Hpo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vma_readahead_boundary.c:64: warning: expecting prototype for What(). Prototype was for init_vma_readahead_boundary() instead


vim +64 mm/vma_readahead_boundary.c

    52	
    53	/**
    54	 * What:          /sys/kernel/mm/vma_readahead_boundary/enabled
    55	 * Date:          April 2026
    56	 * KernelVersion: v6.12+ (GKI kernels)
    57	 * Contact:       Frederick Mayle <fmayle@google.com>
    58	 * Description:   /sys/kernel/mm/vma_readahead_boundary/enabled
    59	 *		  controls whether readahead triggered by mmap accesses will be
    60	 *		  limited to the bounds of the accessed VMA.
    61	 * Users:         n/a
    62	 */
    63	static int __init init_vma_readahead_boundary(void)
  > 64	{

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
