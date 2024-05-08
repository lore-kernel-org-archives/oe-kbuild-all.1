Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45727127E0F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715178999; cv=none; b=o51LM45vYGgHZLqI1UgydbhMkUOARGQhEeRi2ivR/rRUQgkpCJ6sMpuK+SiDiG0GmB8V1CHFp/yBF1+0gnBVfJHNVHVeN+mGMcTcFPnWtKlMa3LmA6T69g2h/KiZYgTazZwnqqipE0zHXHT8QyrdBR6RJPBvvfEtebqrenxOso0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715178999; c=relaxed/simple;
	bh=ekXBEtl4G7WnyFMzHww0Y19P8O7EsFhk8PGlJ4UYdkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avAQ++gLmV2tRrxINdXblYpnsO3irhpOTFuGlNKFMKhMNfjZP1dRSFqnFHgNeO4+SVBbShRFQh9obRnCXQlOjuuy/tjjG58vBK0hr+dRVKKrY37MewoYlIT8QomjB2UfcoTZvZV/v87KN1AjWd/mcLzO24u88G+jNtchc2jYJh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iW1rYPPN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iW1rYPPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715178997; x=1746714997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekXBEtl4G7WnyFMzHww0Y19P8O7EsFhk8PGlJ4UYdkE=;
  b=iW1rYPPNXCe9ObwCo6fP92t+3VjUtEti0VSPTY+oyyLl3DLVYZjHnBIV
   dR5vSpQx/1itrgu6HOrxQomOJtvRXNkzU/zP2IT61wCi30uht+9f8Kicy
   l85GYSYrkssyVi7T9DhNlYy2lAlSH9DxaPC2xwwwhrITNS8HE4fvOBn9l
   VbmJ7fApaHQ6c5/+zYAk9bJN+m4oMXXBJ2HfpeJ3nwN9qOFOWLZUBcbdU
   SME6J0kxo0NLM9eXLBBIr2PQAQhOCnWNzAYN+9s9n52+WS148k4cMB4mL
   3j5ItoS7WJ84urvJAHlMxzJJLSOSZp/iCBqT4kw5TNkwa7S0yGwTpuQmD
   w==;
X-CSE-ConnectionGUID: DHwb6IRZTPu8j9mjQAW7PA==
X-CSE-MsgGUID: 5sMXbD/pT/STvoQyagBbZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28522050"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28522050"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 07:36:15 -0700
X-CSE-ConnectionGUID: DFNgoIQeSOuxW81z5sfEkg==
X-CSE-MsgGUID: 7SM/52UcRBiYyZk7M+qy8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33377949"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2024 07:36:13 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4iOx-0003d8-2B;
	Wed, 08 May 2024 14:36:11 +0000
Date: Wed, 8 May 2024 22:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [linux-next:master 11830/12060] undefined reference to
 `mpfs_reset_controller_register'
Message-ID: <202405082259.44DzHvaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: 098c290a490d0121e209617097ea563e5e607066 [11830/12060] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: alpha-randconfig-r022-20221009 (https://download.01.org/0day-ci/archive/20240508/202405082259.44DzHvaN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082259.44DzHvaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082259.44DzHvaN-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/clk/microchip/clk-mpfs.o: in function `mpfs_clk_probe':
>> (.text+0x390): undefined reference to `mpfs_reset_controller_register'
>> alpha-linux-ld: (.text+0x39c): undefined reference to `mpfs_reset_controller_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
