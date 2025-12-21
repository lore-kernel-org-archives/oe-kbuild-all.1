Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8A4224891
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 05:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766296677; cv=none; b=IdtVT80pQU79+LTAQJhDPlISzgVcQld9BcJVymVAvwYMBH38lNFoz6Hbg8dNkB7U0hQIJlDShI+ATnUeKPQru1dzII8jQrHTCMMChSSQSrFsc6/2w3k0cQ0KifcGSV4ChG/sdOmq/7BpC6wdj+17d/BeronlSGkbR2BP93e0iKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766296677; c=relaxed/simple;
	bh=+w7oN1Qi3v8hP1A+BrdsUhiSoENtmgUQyqvDry2J2u4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c55nwqdJO+QcJr/GyC/H+dByeId8Fjtj7t2AlebWBSiz3QXxz0Y9heV0KroCii+GDtjqVPLagVqtf7VSlOkr7gfJvbq+CmIHd5qMZAVzfPlMDBwb5R/WPGcOt4o3L/gA6Ep0UsTuqcOxrswnjqlprF+85dP51BqXX0pWQtdRVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INPOu67U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INPOu67U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766296676; x=1797832676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+w7oN1Qi3v8hP1A+BrdsUhiSoENtmgUQyqvDry2J2u4=;
  b=INPOu67Uj+2iHgp7Uyp68wpP4bqRbDxa25bf7NkIdHQac9+ntpCyI0xG
   lmafqBA8Z4WTMtIfRDo66VI9VuVxRZPU+4wc8qfbdYdQJM4NMIX9BQjkI
   XcxMXfR8V/4TeH+CtXN1S37zCMNFJd9Iz8Ik6upq9h/QHtP8REeko0KDe
   G5td8hGLNH4E5yfSg8iBPO4e42YW0GW9tnNN/0+n7/pFh050fqj8YMKNJ
   89XyzSLUTMJSUZKoYclOXiWDNKY53uss6S2SNMZ6YzR0C41CJvz9sfHhg
   M8sj4m3a7ESaWEA+KkcarFjjjqylGK6GzcJ6Fxh1Mvm7U4O6wU1UDA2jm
   w==;
X-CSE-ConnectionGUID: DrmsEVadTlSwYL0LMPY65g==
X-CSE-MsgGUID: CEz32L6wToiLmy86LTUh/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70768369"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70768369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 21:57:56 -0800
X-CSE-ConnectionGUID: FlASbrfDSTG/ilzWHAax+A==
X-CSE-MsgGUID: SOhhfV5iR6mUepCdQcNnZw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 21:57:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXCS0-000000004wu-41vb;
	Sun, 21 Dec 2025 05:57:52 +0000
Date: Sun, 21 Dec 2025 06:57:21 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 26/26] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202512210654.sk2sFzt4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a9d28381f95a89bdcdd37365e033274ba5247458
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [26/26] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210654.sk2sFzt4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210654.sk2sFzt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210654.sk2sFzt4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
