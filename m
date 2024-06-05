Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAD114E2CB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717615674; cv=none; b=G6PW095M/9DE23QUqkFDY6cj/jQr05FBS/RplmeHxTc4zppM/UqaaGMgvzQndG1QTrJQz6/y6k9XVbL9818CgqbnnMGPI5+RFZNuUECZg9YKL6OdiL2qkt9ZZrOM+phYVl8LrQpSjrCI6G5nbcMQ1bVOCYh2rNOi4VSrC+adsgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717615674; c=relaxed/simple;
	bh=bozFBOpfosRPI8vU3SPVRfqeU3q5wQWomPLlJiGctms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aB7bvziVkcqBgjBG7zptWFGLD9KZmO5aUOM2c4qK6RNH5dUoTb5sFca1qLpb6/0bvbQNAr8mLMFVKEVfdl+T05/dNJY0u8CQKbezOkv+DORpsKrNNxubl/xV1hmqlN7Zgzr5CeSA8HFU9sNT+FMaYNKjxWF4bm7LuASgnrBsRcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rynqv23H; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rynqv23H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717615673; x=1749151673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bozFBOpfosRPI8vU3SPVRfqeU3q5wQWomPLlJiGctms=;
  b=Rynqv23HcrcESqfNAGyxTRCQG72w7z386wvmoAZ8ckurMn8yVAtv3sOG
   PmApQ/lSRnt2FsW0b0JBBVLYO5wJLKwGpTU0y53vRBR6y7pBkVrlRGfIW
   u37Au7PKioLUcWCFv6JzNvkahl2x/ciNrCGq61GXq6+M7OIoDv7qmeuez
   nNCbyjonwUahToreEY7oncvR/dJGfrx5uQ3QyeZAvBOxYnC82WaIylpcC
   Is4N8/Z/m3TOLVV4jJID8PgP1gnoCM1jaSPKEiYk7biMj4BWYM7v6P8bh
   /En0hWxIlTRJOr3bxCGghRX8sxv7G5rUMcCEtSkzGzf73jzQUaybDd7HF
   g==;
X-CSE-ConnectionGUID: 17X/PGy8Rii0r/HC8JqyAw==
X-CSE-MsgGUID: WDwXvmvgQkao5DIVhOpG3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24821045"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="24821045"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 12:27:52 -0700
X-CSE-ConnectionGUID: kxmd57luQGmAgTBjziSXhw==
X-CSE-MsgGUID: GsbqeOVCSyCksaDWK1/Ufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="68524985"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2024 12:27:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEwIW-00027s-1R;
	Wed, 05 Jun 2024 19:27:48 +0000
Date: Thu, 6 Jun 2024 03:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-interrupt-handler 22/24]
 include/sound/sdca.h:146: multiple definition of
 `sdca_interrupt_clear_history';
 sound/soc/intel/avs/topology.o:include/sound/sdca.h:146: first defined here
Message-ID: <202406060355.IncYSdKY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/sdca-interrupt-handler
head:   29c13e7e99fdbbe864c31571d446c99b46cacdfc
commit: 8f80b6d5086267ba847153ddf5ab9413d2ccc6fb [22/24] sdca_interrupts: add detected_mask
config: i386-randconfig-012-20240605 (https://download.01.org/0day-ci/archive/20240606/202406060355.IncYSdKY-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060355.IncYSdKY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060355.IncYSdKY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/intel/avs/pcm.o: in function `sdca_interrupt_clear_history':
>> include/sound/sdca.h:146: multiple definition of `sdca_interrupt_clear_history'; sound/soc/intel/avs/topology.o:include/sound/sdca.h:146: first defined here
   ld: sound/soc/intel/avs/board_selection.o: in function `sdca_interrupt_clear_history':
>> include/sound/sdca.h:146: multiple definition of `sdca_interrupt_clear_history'; sound/soc/intel/avs/topology.o:include/sound/sdca.h:146: first defined here


vim +146 include/sound/sdca.h

   145	
 > 146	void sdca_interrupt_clear_history(struct sdw_slave *slave, u32 preserve_mask) {}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
