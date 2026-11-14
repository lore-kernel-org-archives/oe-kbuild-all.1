Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686529;
	b=aQ1ZEng1QdkbYLSgDlsfOaNHTM8POSpMRqUt5AcOxlxVrBrq/lWVx7Al0YwnlHizh2QF
	 n+NLgnYairKHh7kkADNOZ3LUbE06nq7WtqW6nbeDY7wAhRjmnKuWDpMG1Q6OWYPzU/q+u
	 M8LDYyFXoVOg5xJBE9MZounR6fmuTC+zgaiojbxmp1XQDaqifForIh/SzFXeXO2MRYyPP
	 n0UAz0XmtX9BLGC91BZYSlaRAa3E4CRnPuy/DUp4dce0ZHSol8H1n9LicLUg3VxHyp1PC
	 3LwMR+Tga/vbgRRviC0Fat8EzMgV1NSha27H1IfoNStJefYqugAYIAe1mzimLgF6nKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:Cc:
	 Subject:Message-ID:User-Agent;
	bh=G0b6hUrjVUEULSXA1tfsqWWoIEzucl6sxNuoLO2y2fM=;
	b=qkMSdnm9/N1j4XycogyE/85ftBvQBTtQPpm7UITWKEzxm0k58riOX7sfIQ6rlhnR1sGh
	 NY6APInpHtyJYgVqX9tcfV000p7yCJECusgZWARK77XsZlxbrVbUwiY5ZqS3UleCdcKZ+
	 QdhPPRM78MkOwXHGxoKC7fKA2wwA3gMIOyD2AjowXMPpJ8y9Fe+Dcx+XM0ND0zRySWrW4
	 h0HWSo29gfPEy2LgeNu1lghO2bd+WnW+T3jgqzeyHnPIXbhpMZetQNV5JZk8d09gLxer6
	 85b90xQ1U7xDryDoBGDcSsVDqvPqbOHCEYQmz9Ekvgl/NlGdI3GslnpKYdIveDxRPcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MfFKAdws;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A99606A32D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 20:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A99606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MfFKAdws
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794686528; x=1826222528;
  h=date:from:cc:subject:message-id;
  bh=2RgJg+1+eEs9HwOulX1kWRjXjvJrgRQZFPepsPHyJ8s=;
  b=MfFKAdwsvcJ0ZjqjxhFItdLBL/l2P0R27JXeiG2AK/J2DoPJxTHCDMZr
   Grz6B4iK64BMdNymtgR24vVGO66quEVznS0tyrvBOwJzgELYhkGCg9nuW
   lE2ahQ9NVmSymkK6RjC0tnqbjFgKRs6zSiDjBISjT+CBu8S1ntla/2f3I
   gDM0H6ft5RNVzwM4p/XqzVWJ6d0+qBbPN7GZMVw8cw/oH6q0GR/Vc1I9y
   f6hPgokMGAWgCUqyOfEiGjO96h8e2OMF00984DzFo3q5cfGGmefZ3Wlk2
   spIWfaNybJlKd0l6BXVf1NmLj//7gYBOyyzBUQ+lTvq3TtWpbG65zHzrt
   w==;
X-CSE-ConnectionGUID: sPWb0hwCR+OwWZSTx4XW6g==
X-CSE-MsgGUID: loT/jcwISw+/XmY81g1p3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3572235"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3572235"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 12:02:07 -0800
X-CSE-ConnectionGUID: dG6MaIruQV66MdswIZ403A==
X-CSE-MsgGUID: oN8brTwYRxS0w7dwtcMh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9271016"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Nov 2026 12:02:05 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSJwp-000000015vg-1oLI;
	Sat, 14 Nov 2026 20:02:03 +0000
Date: Sun, 15 Nov 2026 04:01:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fyu1:hlim.rfc.v1 16/26] Warning:
 drivers/resctrl/mpam_resctrl.c:1726 function parameter 'cpus' not described
 in 'mpam_resctrl_offline_domain_hdr_mask'
Message-ID: <202611150303.jJjjjHRx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/fyu1/linux.git hlim.rfc.v1
head:   83634d5bc1946bf1e8f7d8267da39263bd301f7f
commit: e29343ddaf3d45892f7fc1d9df8b84ca6a758ea0 [16/26] arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261115/202611150303.jJjjjHRx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1b1fed44d3dcca649a9877915d57c3357a98124e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150303.jJjjjHRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611150303.jJjjjHRx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/resctrl/mpam_resctrl.c:1726 function parameter 'cpus' not described in 'mpam_resctrl_offline_domain_hdr_mask'
>> Warning: drivers/resctrl/mpam_resctrl.c:1726 expecting prototype for mpam_resctrl_offline_domain_hdr(). Prototype was for mpam_resctrl_offline_domain_hdr_mask() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
