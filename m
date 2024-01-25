Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467C882A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 05:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706159849; cv=none; b=AGq44WWddMzYfvl6zyhZ7bERyCWnOl6jipGHmDMG2pSGoyGKkRlhvVf+SBaF4DpvCJ87TnQQD7J2RJJWEMmY/1ZpqYWeWyzd52SqNzfnEISm5ZLaepHN2TNkaU0LRwqAW8QYtpl7cQnBUY+NPftdTgFs8u08LTrgHPfs30HARAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706159849; c=relaxed/simple;
	bh=zTGtKt6JsoQiOZgI7vzRntGF/t/ZFoXu131sNRij20Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdN+nYM8gBj1zuVhL5/4RP95yNp+1isWHz1RN7lva63adQDowoH2B6EzJeqGbymFLfjKG4+wT/EBuslHaZmRfZWleOl0NpBW8lqRRv+Y+4LikRnFO15xXrjAaFdayhOao2ibuGxpVzike1nnzM8rdzxX32yp8P4+al3luH7GdN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNdZIA7O; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNdZIA7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706159848; x=1737695848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTGtKt6JsoQiOZgI7vzRntGF/t/ZFoXu131sNRij20Y=;
  b=BNdZIA7OznXoAL6J97z/UGf10wrB1vMi6jSeevuIURTvkN5RnwXSOURM
   eH7sxPK0tw375QZeZDwEyVE8htrdSmFESvW4QN9qrtOhbHVmn8yO52twn
   710vUlggpGQX62atv/7KXqNjIgwb8CCkxjYgMltv6hgckXJVDF5qv7hxh
   2rxsgA29Zhw09gxrWKjEVQRAP3PA/VpgEAKR84TMSy6CCK+ztPUVehTi6
   ZJs+nRxe9IbgUO2HIvfLbc6TpMlWdQbjpF+P4fhHqFJhXkgWvHS7KbAAm
   +eBlFlsgClppnE590GzjC0zsD7yS2l5BXQhNtdB38nQLUAhCG8wYNMuEt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9441475"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9441475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 21:17:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="736204887"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736204887"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2024 21:17:25 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSs79-0008jb-1z;
	Thu, 25 Jan 2024 05:17:23 +0000
Date: Thu, 25 Jan 2024 13:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 4/4] cc1: error: code model 'small' not supported
 in the 32 bit mode
Message-ID: <202401251354.ZRNxjLYS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   1e140a96e8ce220d86926c91c3985f13ac88d816
commit: 1e140a96e8ce220d86926c91c3985f13ac88d816 [4/4] x86: Build the core kernel with position independent codegen
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240125/202401251354.ZRNxjLYS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251354.ZRNxjLYS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251354.ZRNxjLYS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   /tmp/ccmjaDoS.s: Assembler messages:
>> /tmp/ccmjaDoS.s:12870: Warning: setting incorrect section attributes for .rodata..c_jump_table
--
>> cc1: error: code model 'small' not supported in the 32 bit mode

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
