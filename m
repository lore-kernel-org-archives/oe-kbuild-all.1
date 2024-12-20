Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29A31C4A06
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695725; cv=none; b=Ub+lBw/U/RNqakE+yku08Zl4WGPy+20rZywcf7mScyFCgIFZhNYJDRPMr2M+wajbGvtPA7Bgbdurh485i60VnR0ONnVt7itffAzEveKnb5K3ZWJMZK/5Ws/hguF6rIW7x17da2saE2L6DOR9UgMGy4d7HFS/51DnxqxrfJxQln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695725; c=relaxed/simple;
	bh=BVYHKeBvcjujU5VWJ/Q3TQzYRx22M2bNZEXsoUGAHg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbbE1jdb/f0+i/0Hp8M8SpkP+XuVKgMNd7izZyPmQCndVJ4wr53QEeYpYuAZqJqK2AUNrFVx16sIllm9YACjc5EF2NZOSsPUINsB9Ue6TAwfdqEBUK1Nu0pPSMoRUYibHxEhmJYDh/xJ7DKZt1ZaVuz9fQE0atPMxKH7IGFMRsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhfAVjY/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhfAVjY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734695721; x=1766231721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BVYHKeBvcjujU5VWJ/Q3TQzYRx22M2bNZEXsoUGAHg0=;
  b=dhfAVjY/5A4aLGAKLja51O3FiOh7idXuxUUxdaaLrZdf8WJv1OioF0RH
   H0iAeYBSBJCJUbsDEjBh3EOWONvJrR/BNLOONi38adxWUfhgQ6CvczjGm
   LUQSz5qWlIiDmbC3M84OJXGn5H+hUC9KdzcWteHkfKdRd0KEH6I/dVa28
   XMhIQ1xE2bMe01bM3kCyQJ/S5Q2A1VEmkOJhOdpfs00uU4K7bNJe/uxRM
   mhNhtUD/q9piQ3fFr5h6TECvH0jamuX9kUfGQKOJ+JXh2hilpAQ1YGJHG
   53F2Dn7+BoL7tKQtuJFwGObdPJk3vVh7nPC9YOvspo+9NBFTzeVGFxS1b
   A==;
X-CSE-ConnectionGUID: /BCETwGJRD6EgcCu0c9pPg==
X-CSE-MsgGUID: /xtwH4kFTeG2Ngsvh7Owag==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34564184"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="34564184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:55:17 -0800
X-CSE-ConnectionGUID: ZzYhQyNGRASksKhkvqWvIQ==
X-CSE-MsgGUID: Y0kELQPUT8WAV2V1jiIlBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="103477606"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2024 03:55:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tObb8-00017G-0F;
	Fri, 20 Dec 2024 11:55:14 +0000
Date: Fri, 20 Dec 2024 19:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <christian@brauner.io>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: <stdin>:1508:2: warning: #warning syscall clone3 not implemented
Message-ID: <202412201929.ZxqMkf4A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 8f3220a806545442f6f26195bc491520f5276e7c arch: wire-up clone3() syscall
date:   6 years ago
config: sh-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241220/202412201929.ZxqMkf4A-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201929.ZxqMkf4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201929.ZxqMkf4A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
>> <stdin>:1508:2: warning: #warning syscall clone3 not implemented [-Wcpp]
--
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-highlander: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-sdk7780: No such file or directory [-Wmissing-include-dirs]
>> <stdin>:1508:2: warning: #warning syscall clone3 not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
