Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28A547B429
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583919; cv=none; b=ugiVo/zearr5tt8ZhtDHPGgTEKCOjI6dBEUFwAhtkrTkpcf0tizT1DS60Cyhz86yCvGmL8zBFY3+527D0JNZ7+WL3cZ4NzHhjSbXUGdeNQwJg+kS/GFmIh7SyJgdwLAAAu7UJMmTdKnU0EkcK8djikTCmpxnet1hzTmjS7OqbVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583919; c=relaxed/simple;
	bh=J94LiUzqtiMdmDZnEAB4xef4oJOepQRze+xcnLvKKdo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NafZNOpKq3zfx/xlYTP1gvxyrtp5lOpgsKeEM92N3wMA+Q7Iz9DOuWBLoiBi9oNdpGBP9nLbjWiFVzZH6My++lDlvVTCPHWr5C2PrchKg732x8WtjFq4zIQxe7e5IeSx8994n632BehXS2ctS/v8Qq25J8H8WBxkLP+c9P5PJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkcyyK1M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkcyyK1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780583918; x=1812119918;
  h=date:from:to:cc:subject:message-id;
  bh=J94LiUzqtiMdmDZnEAB4xef4oJOepQRze+xcnLvKKdo=;
  b=hkcyyK1MreMwRTZ8ii8XfCb3RE0asPdBhQb4Jrpw5KFCRFt+BP9+a+78
   al4WNwz3i9IqJ/vwbxtJuVqbwj9QTDy3tekY7RGhxQiOdJPNjbObs7QOL
   If1gLqp1qER+w2Xsvd5NxfMGtUI0BBugw8iKCkH+OM0Sdg1Z99G9OD8Qu
   D4HoYPWnLzkOPr+d9z2cE02pShVPID6sZdFkurn485agEvYhbNEdW6yoU
   bhc40523MMNzS+tXmpCF7C1QMxvwVmiP613Q8vWVzC74d/w/ziEpmvEAu
   uvOrfgEALqSTTBShBW2/JJFSkiI/PH95v5tEc+J1l/WYFJbfqBaXuO0RA
   w==;
X-CSE-ConnectionGUID: N2+tnvpCSNq4tYLucSRkCA==
X-CSE-MsgGUID: VEjwk0RkQa+NzWHnQPp1cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="91727783"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="91727783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 07:38:37 -0700
X-CSE-ConnectionGUID: o2k3OHsfTMuSel1d6XJ8PA==
X-CSE-MsgGUID: CFKmmnNdR0CMNPTO+0jcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="246393413"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2026 07:38:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV9DN-00000000EpC-2579;
	Thu, 04 Jun 2026 14:38:33 +0000
Date: Thu, 04 Jun 2026 22:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v1 1/31] Warning: fs/proc/proc_sysctl.c:1443
 function parameter 'fields' not described in
 '__register_sysctl_table_internal'
Message-ID: <202606042246.qHMtlurJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v1
head:   7c8f50dd793cb0314002e78bb70e3bfd0346e606
commit: 79fc2e54800860ebd5c972aa8309270a8a64bc63 [1/31] sysctl: add field descriptors for context-bound tables
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260604/202606042246.qHMtlurJ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606042246.qHMtlurJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606042246.qHMtlurJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/proc/proc_sysctl.c:1443 function parameter 'fields' not described in '__register_sysctl_table_internal'
>> Warning: fs/proc/proc_sysctl.c:1443 function parameter 'ctx' not described in '__register_sysctl_table_internal'
>> Warning: fs/proc/proc_sysctl.c:1443 expecting prototype for __register_sysctl_table(). Prototype was for __register_sysctl_table_internal() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
