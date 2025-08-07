Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8CE204F93
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754578547; cv=none; b=VoyKir9SKk74DCYfuZY95bL+Et/RyZdc7XfqJ/QZQkAzP2Szz4YRgjop9Chjv2fpIE+WsGrXykzNYWqbW7GocWFpOeMOgZYKBh+CAeiOKdBdXoPJpSd/uZe9BvRlpMuv08jVGZw0D6+oIx1lV/NmXvmNnQNurfCRnvDWo6A5Opk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754578547; c=relaxed/simple;
	bh=Fhit9vfjfsOK0eAoAlIn12knBVzoMR45mt+QmoWMn4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gvc3o6BX4NdvvbtZLY+tS1wApXy0QzevdirpfA8IX8JvPmOiF/EUt5zF7cGqOaECokhRAA4ri/9/VIvhAp0f40IklDnKKEuijs9ylCrvzjwSgeBHZ/mv5v8/xbd3OazaS/0X27/+e5yvDoNHZw6RgOVGmRJKQVnAWsUGSBSM1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3+nj2mm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3+nj2mm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754578546; x=1786114546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fhit9vfjfsOK0eAoAlIn12knBVzoMR45mt+QmoWMn4A=;
  b=V3+nj2mmZM5MLwQDDGF2GjRrClDNAa0zM46vp49zmSz1r582ce7o9Bv+
   9iL0BGNQAML8rL6M9AFCoqZ8MhFBD1fl3GBAdsi7INZLudSGlRvtFcdIl
   C264lXsUDBBAty4dXMNSFXexnV69MzvO/5N7tZ+9dJ1qvt6W3RY7JVXVB
   HWmoyTK6hBcqLSvsI6PUU0SzZIexcDLGQ4oT7Ka8+yALJh7eFV+3YqhsC
   2Zlul3EwKn0PfpulHrHb5+aQL18Mg7tQD8olMN8FE+BBwN0J5JTgF5zHH
   8MMqq29RA/mGo9iL8GjBeL2nzVKYF4kB1w1QvSzfTbRvMYfZFfnFhbtbB
   A==;
X-CSE-ConnectionGUID: mK64LzmLTo+vCyH6hFK3yw==
X-CSE-MsgGUID: fk8ByTOWS4+vT2OUYsH4+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74494116"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74494116"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 07:55:38 -0700
X-CSE-ConnectionGUID: a4i5FKK+T1uVnjo5N4aqqA==
X-CSE-MsgGUID: yMw3687BQMSHmCn4ObmIEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165496292"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2025 07:55:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk21n-0002uB-1I;
	Thu, 07 Aug 2025 14:55:35 +0000
Date: Thu, 7 Aug 2025 22:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 61/61] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202508072238.O1crRGTc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   613d77dfd48aefb35495f9e9425ad216f55f1439
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [61/61] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250807/202508072238.O1crRGTc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508072238.O1crRGTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072238.O1crRGTc-lkp@intel.com/

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
