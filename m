Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48BC23F36F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741016235; cv=none; b=jGejmK1XtASKMVWnJXd7aFte86mcFBp+JxoX5ctcvwN2Vn+jLccmbZ0xGk5En3+2ES3w7mjLIasCxhmj7gsR/2TX8YH/8438TNwPyoqIUoDfAy0NNKtBAhIS7Caxj6Dd7U1wjqVeIvYplwgmogki1OZB/rictQMkROi5dG8hoB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741016235; c=relaxed/simple;
	bh=01ZwcJT/hHs79VvHA4XGQryE44OE0fLv1sNfvcdGzW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qxa4NCcr58DFphRU7g4kCMBAnw4xxzs5AXb5MO5Cg8vSbcTBPmymY1NGX9e97JIJGEYSck26O/C8rocHnEU8hNVgEHWXJXURo+nZ843SJbS0/92TM40WnXeLBYoSYuvYLOmjgYf2MC0tbNYDPqewEITIicm7HpScP1J62JWFAx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmkeehCL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmkeehCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741016233; x=1772552233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01ZwcJT/hHs79VvHA4XGQryE44OE0fLv1sNfvcdGzW8=;
  b=FmkeehCLik0qdUWAWglzrwB4P3eYvz249D9cVfJ123wzDJRs01fJ3kNB
   /lfz0uSDwCM5l6I9NhhMjEwZDOMBuXDw/9k69CVxcasGiXYyc+An5UIDg
   06qe0H1VTRKdAbAoII/qeMrECWXiQHOLpUWf0qgUlFFuR7jta/070DYZ7
   wayMKmAcqCR6006xFqx912ilcGMs8NEjuBqZeI0oyrJgehj8IyNU6aJw+
   YcpTOOWzxkwvOAytb7+pELNA3gp0DaazcMYzrib5qmQQoT7JxbOcGoPKH
   HAmSTqhlaDbhPErEpNraNB2RPryy/MFnxvYW4NPbOWkVWKXmt6ArQ2F4F
   Q==;
X-CSE-ConnectionGUID: JkfttNNaRky/GV7umKm/oQ==
X-CSE-MsgGUID: 2bB6lXKzQOCtA3yMelxo2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41786675"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="41786675"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 07:37:07 -0800
X-CSE-ConnectionGUID: GU+guan1QJCu+8XtyZQlbg==
X-CSE-MsgGUID: fdO+aiQORg2PefZCADJCYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="148871741"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Mar 2025 07:37:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp7qp-000Iel-2p;
	Mon, 03 Mar 2025 15:37:03 +0000
Date: Mon, 3 Mar 2025 23:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by
 X86_CPU_RESCTRL
Message-ID: <202503032332.kRDjrdBI-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_RESCTRL_FS_PSEUDO_LOCK-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250303/202503032332.kRDjrdBI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250303/202503032332.kRDjrdBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503032332.kRDjrdBI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]
   
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
