Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D760A10F4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 May 2024 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714610103; cv=none; b=CIJLSEjzzK1yjo0IL5jRipNsPqeOE1s53FkpCcfrbwUK7NMK0LGXV1mUIdX9gS/OZxh5q2ZDAde6aEvXREHGBvFZVFIrAPIEp3rD+dzEjlVLYndHbiGxIpWe38b6otRUWEYAZs/7ifQrChoxp/3tnJGs3vhv/9G/4Q0FoOxvZvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714610103; c=relaxed/simple;
	bh=YU3lZrBxxlBwZrb3Zch9Gj+T+4gqn8Xq6KvN0oAZwgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hxj3KDf0g/HbOWo5dxu2a9bfQ3hHoRTdaloEsvWgycGGbwCxui3OpYT653pJd2idNjrhpIJc1nsIli+p1LS1y5i3GFnw1UllKQRQxJgjjKtvm1iUjKQ1efALcAUIJ98qsoTfbxVP8HzkP6pn3yFTtXGJrIjtZr6SCP0ZCU4tBP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoLtHbcM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoLtHbcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714610101; x=1746146101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YU3lZrBxxlBwZrb3Zch9Gj+T+4gqn8Xq6KvN0oAZwgw=;
  b=IoLtHbcMxyZcXESqBs+SiaBoRdhVAGMQnB7GUFC7LyxQFztB1CCa38kL
   pfh9rDwkk+NskKq9neJt/RF4YXSXeYlqCR42/D3NvWJxmP1wDPCsK2+nK
   7hB9beZFQS3xToD5l1WMS8oQpHIVQccBvaSSfKxBg+BokwOi20pGwuDTs
   u7rloqsoSRP1mGz31Hy6wKHhtiWl7uhdGdqIXwTHj9EkqLVAuftaaEZ2k
   YPUd4jmAV/KZDOUOtmip6bvKcYzDyAINZsNstZ0rbZxLgVgAGNKi8r4N5
   frgBJpUr+kfHxWSMwD6RqhgYVDcCi8v6xDc/eRCepu2p5xiM9EzlKf8mj
   g==;
X-CSE-ConnectionGUID: 29139VrZR7Kj+uD7o6Mqhw==
X-CSE-MsgGUID: VQhXFY4qSSKZBfFw5+eUbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14168182"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="14168182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 17:35:00 -0700
X-CSE-ConnectionGUID: M9XVYW74T5SgbZNd9PCkSQ==
X-CSE-MsgGUID: JT5F7dx7RmSb3RSuK3PgHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="27032159"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2024 17:34:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2KPY-000ACu-2C;
	Thu, 02 May 2024 00:34:56 +0000
Date: Thu, 2 May 2024 08:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: KP Singh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <keescook@chromium.org>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: [kpsingh:static_calls 5/5] undefined reference to
 `security_toggle_hook'
Message-ID: <202405020848.mDKFUGLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kpsingh/linux.git static_calls
head:   654713c5bec96290562355c40aca6b98bb5c01c4
commit: 654713c5bec96290562355c40aca6b98bb5c01c4 [5/5] bpf: Only enable BPF LSM hooks when an LSM program is attached
config: parisc-randconfig-r063-20240501 (https://download.01.org/0day-ci/archive/20240502/202405020848.mDKFUGLg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240502/202405020848.mDKFUGLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405020848.mDKFUGLg-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/bpf/trampoline.o: in function `bpf_trampoline_toggle_lsm':
>> (.text+0x54): undefined reference to `security_toggle_hook'
>> hppa-linux-ld: (.text+0x80): undefined reference to `security_toggle_hook'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
