Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66BB3803EB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725759; cv=none; b=j7tX6T+yAJtVfCXDdYq/KdQCjndopS0X0fGlf5J3q3QcWZTdw6VuGF4OInhVCaoMmRbGJ8t27CqyVT9uC5OWbseB5TIz8QS4rh88QPlXISCPEZgex5UmpupGRrBtY5wfSwrkaBU1TveLlYZbrMPL8o9yczQOMDfWtzJZFnAm+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725759; c=relaxed/simple;
	bh=opr+CrqKrUO7+Jgnt9/wxMIUJnA+x08o9oowYwmMUwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oUsTZO5PHRo2KpIBfDN7UsPnaE52LcjHWDJ3eM+e1r/+psFnKvKDhD0xYYw8hnC1DWINU4pqf3Tm5BVfk1L27y9qygWgf9tbhlHc7s1XJcOoYPH3UFjXBlht6Ty0+viQstX/3gcjCFkYTzAj8DWh5sbocyq0ZZg8iceidChTFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K02Bth0h; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K02Bth0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772725758; x=1804261758;
  h=date:from:to:cc:subject:message-id;
  bh=opr+CrqKrUO7+Jgnt9/wxMIUJnA+x08o9oowYwmMUwk=;
  b=K02Bth0hDyjs0T8N6hsOSMnG8PD4a2Ih1IetOojnr10Uq3MmEYwC3ifG
   7VCj8MjHQ2J5nmnz7cztgbvd3mtzpVk5j6LWRtwj9xpqyODYv7JhpJKYd
   im+WDrCgEByffhAXgNEQSF/ALtKsR52+bBJQ/zK8dm4QbpIFFdxP1EQ0u
   C7dTE7XX6WKr6hL9DlFSUrwJ0bonPN0GlU+rY9YGPJX6aZEzIdel/a/ND
   0o5S4JI79780UBS7c8eYZ5vmkavwfZtU1gRnx+ZKm9SeQGAc8/quNzmGG
   VOMRihtyrwzy4AckUtoSKqcXTIKbpde0EA0jRPr1JMQ2m0OBfYcOXPU1E
   g==;
X-CSE-ConnectionGUID: mL9Xu2gcQHSMXBb1OoMNmA==
X-CSE-MsgGUID: acAEtSHyQEKOAElEzhc22g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73889912"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73889912"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 07:49:17 -0800
X-CSE-ConnectionGUID: MYC4I7lLROWjnsUHyOb84Q==
X-CSE-MsgGUID: lC0LJMH/S8SFoyb2UAvA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="215936830"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2026 07:49:16 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyAwr-000000000r8-3KBD;
	Thu, 05 Mar 2026 15:49:13 +0000
Date: Thu, 05 Mar 2026 23:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 16/467] include/linux/nsc_gpio.h:34:36:
 warning: 'struct kiocb' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202603052334.uzZ7qet5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 75d39a3ceebf5341f422373a3098aee1d54fb7f1 [16/467] char/nsc_gpio: convert to read/write iterators
config: i386-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052334.uzZ7qet5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052334.uzZ7qet5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052334.uzZ7qet5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/leds/leds-net48xx.c:16:
>> include/linux/nsc_gpio.h:34:36: warning: 'struct kiocb' declared inside parameter list will not be visible outside of this definition or declaration
      34 | ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);
         |                                    ^~~~~
   include/linux/nsc_gpio.h:35:35: warning: 'struct kiocb' declared inside parameter list will not be visible outside of this definition or declaration
      35 | ssize_t nsc_gpio_read_iter(struct kiocb *iocb, struct iov_iter *to);
         |                                   ^~~~~


vim +34 include/linux/nsc_gpio.h

    33	
  > 34	ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
