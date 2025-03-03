Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3278F44
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741009370; cv=none; b=s2pgUz+U1cW0XuCe5WBbGefCMwKYrVMkP54mNxHhYXcVJ3c1hjfewZTHlR7I7eGJnzmXEr9AvrWnzyBwjn4av1/jczke11XVJGjfvCRu48G6W9IeWqeoQ59Zv2yB1CPlPouoGYVlN9oBB/vToe+VjhPXLt6bmTR34fBZAGt1ST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741009370; c=relaxed/simple;
	bh=6+Cx9e4fFKCkQo3DXLDBY+FKgQgARm8wnQN5D3iI2pM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rF1X/WdAuI1JEp7VbcVbJ8ahwkofYm89wS1wVTj7TplhVI/s9/adyASHvZfVNrXGu+PlY3/4AeBJPrgjxRCHQzar+7bjEZ5w8716x0ILWLurV0R1n2Cc9pB22Yng9O7pXwMqluzADhWt/EnaXdFHMhsiT0Ilr8b5+s84JI9OXKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3YIG5wn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3YIG5wn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741009369; x=1772545369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6+Cx9e4fFKCkQo3DXLDBY+FKgQgARm8wnQN5D3iI2pM=;
  b=L3YIG5wnr9nGNaizNv3Ws/UTP6aK4hnwQuH60s00EHqqJ5UyPZBVCQr5
   XSmsrWRw66e4tZR8UnF4QOwfcfPDH5oRdRt+0BmtnSizPHMxsHHl5mYIQ
   zmUXoHR01Z7xBcw25LWLM3b760XoNNywEZl/YxGEOIVLPBBCNg3M0pnlG
   UJWV56damwJvd+1gpuNoUl4scf+tcvhF+IgIszey8kEgYjTM/p+r46Jmr
   YSvHAyVoQeA34bKgUDWqwAPTEdLINWElwN7WFwd/7Ok45PgrRIxi3sGte
   wb3Ifif6xzaESBuWKpg3zJwIEnF2K8O5v5xD9dwTzJ1PIdaij9BBKGXtP
   w==;
X-CSE-ConnectionGUID: cX2eXVppTJ+0Yk+khWqP/w==
X-CSE-MsgGUID: aY3mCY8XSTe+QtBxFzDmIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52522174"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="52522174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:42:48 -0800
X-CSE-ConnectionGUID: tpHAg6ZCTR+EUpZeqtHLwQ==
X-CSE-MsgGUID: KLiLPt0dTlyFnrFBWbc/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122138839"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2025 05:42:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp63h-000IY9-1y;
	Mon, 03 Mar 2025 13:42:21 +0000
Date: Mon, 3 Mar 2025 21:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202503032129.BVpr1lfa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   413645820de6d715e23ec6200a3e5a469ec69672
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [2/2] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250303/202503032129.BVpr1lfa-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250303/202503032129.BVpr1lfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503032129.BVpr1lfa-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
