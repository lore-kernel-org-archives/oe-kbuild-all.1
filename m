Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9037F8B0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205843; cv=none; b=FJZ2Vvevu4bejrE5co8Nm4mmWNkZ3Cngn4zLOYPmUEUNVN6u2axbFCUIO7UdDei86nJ7IUMDPVpuFsoKMQLv4jwTHlZJN5VJpQpiF2O/cIaC3Jx+LYbWni5lAyH0V9IYDB1N2/4KS2ojwKM8wIk9kJgoSFk9zYTgRj/rwZtqKfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205843; c=relaxed/simple;
	bh=MFvdupAjP0VOx+A8Ds5nWht3kNJusoOQmK7LCSsEjAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eJknBtsKA0UV+Zi3YAsVnnUVYK6R63iM5uQmv4qRAxPAWrl2bRb+rTOifwyhRSYtNG1CKjaF74aEMzUbIHG+zVNjucullc+UYV/uyLIAU2ZRQ8lUAZWYIGPL815E10N7IwcdLNVcrSpxyXcSYhXnfHg5QWP/pbS/Sw5GFEVh7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cv0UXoBe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cv0UXoBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205841; x=1806741841;
  h=date:from:to:cc:subject:message-id;
  bh=MFvdupAjP0VOx+A8Ds5nWht3kNJusoOQmK7LCSsEjAo=;
  b=cv0UXoBegcyDdD/1kvj5BZfZA9hXpWukLTg3UvypaTqBsuiWSIksuJNf
   E5Ww236p8K3zAEI8kunGsbLU72xf3jrEr9G/oV/zlRJ7vY/DugxURNXW2
   8INhcYhhpcIcl8pxjaxg6RYTh1dM9VUgIV70taszi0b5vMjklF9o7RIjb
   HTHrRmUZpBjV9cJeuTcQDj9oSzGr9hHnRO6EePU2thg0DxO/cgHLTKP7s
   +n2PQOx0eHhrDTPis5S8w8Blc4gEYh5fPAwa1ejKXgBU5WERNeebW2P+0
   UAE4wZDcbIyFPkFlpT1+PvBvFCUfX16DPXTBlS3fEPs/Hrj0gKza/hWbA
   Q==;
X-CSE-ConnectionGUID: URj0zWXLR3ePREut56CkRQ==
X-CSE-MsgGUID: RkQy7MiKQDipaUkopenrtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852232"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852232"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:43:59 -0700
X-CSE-ConnectionGUID: QGKuoyzsSw+PwgSSyRDo3g==
X-CSE-MsgGUID: k4eOsKR6TfmQEM8mhhy3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943420"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8B-0000000014V-3xnK;
	Fri, 03 Apr 2026 08:43:55 +0000
Date: Fri, 03 Apr 2026 16:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/entry/rework 6/11] /tmp/ccI9HExx.s:2018: Error:
 selected processor does not support system register name 'pan'
Message-ID: <202604030218.9gTYn40q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/entry/rework
head:   a15c105db582689c7a97c4983f6a6ba31d3a71e8
commit: 721fdffb0cb4b245f842916b778633c18f2167ea [6/11] HACK: arm64: Check CPU state at task-switch time
config: arm64-randconfig-002-20260402 (https://download.01.org/0day-ci/archive/20260403/202604030218.9gTYn40q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030218.9gTYn40q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030218.9gTYn40q-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccI9HExx.s: Assembler messages:
>> /tmp/ccI9HExx.s:2018: Error: selected processor does not support system register name 'pan'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
