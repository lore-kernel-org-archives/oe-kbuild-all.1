Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3891827FB37
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 03:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779854298; cv=none; b=Y5Ov9YkkLht1W+KvzfOM/Ijep5B++fzDXtNTOribEvwcY7RS9MDLFZEfJRVCyM8reJJ2qnLFRQFF/E/SJT5LWw5RW/VMXaIie7TM45a5UAZXRdOBX/4zE64HCcfgzFmxvlxezzMfEsbHxENy0/jkFfzb4fGstnURgsoVF/NkOuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779854298; c=relaxed/simple;
	bh=9XnchTT6cN6cG8ua5RSUteJ9SwapRXhFiQOTNWBHlmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UtRXZEYy3U2t7XnE3g9t+XM2N54+M2FtOLmzEan4lUQWU28xROkGCwTPYPTKmMxGVdxJvjR3E+3lP4o4s6USBulCzm2z334X9znEgTd4qenRpy+etZcLXaEvq9kvS3hlGke9qF3/AMq+iLBWtJfq4HwJxDxEHPAAmNaD+yo+jyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVTv3S1J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVTv3S1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779854296; x=1811390296;
  h=date:from:to:cc:subject:message-id;
  bh=9XnchTT6cN6cG8ua5RSUteJ9SwapRXhFiQOTNWBHlmg=;
  b=jVTv3S1JnMBTaYGmfyz70OIaIza86kZ3fy+awoPWqvRkWv0qmbXVGRiI
   LBBzkJVFNh9IeHSSt1UfPAvBrxLW5MTp2rx6/7ckGuDVjD0rqATqxUimu
   U6qjNQRr8+mhjJzx4dAIgl0usKt7mjUlav4F90nUc+0IkR8zkePEnrDs5
   412lfGjt6UaaOx9i6v+j0FvF8I5ZTxtbUb0L4QvG8wGdaRBugM9M/fQ36
   w6DrKdB8PkgQZjC09v2mgIgP2PdwzOeLXRBdpu6Zg+GAylFFW7hHt4wm9
   P9u3aAo5hia5RKzxV6IbY7yLGjNUnqPhQCGCnjnDzCuD4IhpYzBtwr9yZ
   A==;
X-CSE-ConnectionGUID: HadmF1VkRc+6AvY9Lt9KTQ==
X-CSE-MsgGUID: em1ne5RLSomI8Gp0NXBEJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80709333"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80709333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:58:16 -0700
X-CSE-ConnectionGUID: YxSXAjULTGOt81drVO04bA==
X-CSE-MsgGUID: JK0YEuvKRzyLdyfSO+mG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="239501398"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 20:58:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS5PH-000000003Mq-4Bbf;
	Wed, 27 May 2026 03:58:12 +0000
Date: Wed, 27 May 2026 11:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 18/1130]
 ./usr/include/linux/route.h:39:41: error: C++ style comments are not allowed
 in ISO C90
Message-ID: <202605271132.CcPuOsBJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: ff449510bed563971fd5f8a18111dc08c14744bd [18/1130] cheri: UAPI: Fix padding field in struct rt_entry
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260527/202605271132.CcPuOsBJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271132.CcPuOsBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271132.CcPuOsBJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/route.h:39:41: error: C++ style comments are not allowed in ISO C90
      39 |         unsigned long   rt_pad4;        // it is actually 8 bytes
         |                                         ^
   ./usr/include/linux/route.h:39:41: note: (this will be reported only once per input file)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
