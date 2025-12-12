Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B313195FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765537035; cv=none; b=jUbKyqacuYY04tHrDRibNadNRrh4qXN8f9X6MVI2CWeH2o968Z5XqEC32YSdvqT7Ci7nNdZ6mAdqJBSUc2VZEav83qzgU7lGc+Gd0hOVxXteUpG5bNBMj/rmdBR1Luo17EvjBV+fFU1c8pVld2xoafabxqwYrJckhx3S+Il/ZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765537035; c=relaxed/simple;
	bh=TUZdofw9Q/RtOM5QlGE9srEpKibhRVMDpxT0vcrvIGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzso3ZwHLYfuD6fbGBsXemMddO53yq1jKMpfrd+uZF1xvmEf7Erc9NxDG2qkmLex3vN9khkOh2DJ8L+ml/IGMghLSaIeew0i1ViSnFu3UpUtLYQIP397zamMaZkJtYAaPp8HyHG72IB7UinuYkMQy9BgbkCCs3xz5bftl3NS3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqaoAUCg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqaoAUCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765537034; x=1797073034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TUZdofw9Q/RtOM5QlGE9srEpKibhRVMDpxT0vcrvIGs=;
  b=gqaoAUCgeZdumyNhbX4PfPBxQWH3eVAUlBN6KiPwKwc+6h3U991MduoH
   f1BXWA2CLiFOs4a2V5eavSjyCfE+Y/g/MiYbFJvbtcHKHF5taIkRpzV61
   rAu+rdaPYTQolrAxdRUdQW4CSa3Udk8n6nnuU1cmi580t+7tlS3VCDIs6
   LEtLNwdlcwsGIE7QZ5xE6b/9kiuWAgJ8t5pAK7iT7ih61cpySJQZyJozp
   nWMxp31L5+milj7FigsmBqujB1x1AjJTKE1kEKmLC4HqW07Kihp/iv8RF
   NH9r9IvG9E3cHNhYTLozAYdWfpEs+s/CsZchUYDp6WAuflAPc2jUjeAma
   w==;
X-CSE-ConnectionGUID: Ipcfwp+pT7y95k696Y5Nxw==
X-CSE-MsgGUID: sMvYmo/gT3uysHUlpS4dhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="77848909"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="77848909"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:57:14 -0800
X-CSE-ConnectionGUID: Jkn+0AGiT0q2PMi/876ImQ==
X-CSE-MsgGUID: WMeXPWi6S/2Te4zksem8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197048142"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2025 02:57:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0pi-000000001ga-0AEj;
	Fri, 12 Dec 2025 10:57:10 +0000
Date: Fri, 12 Dec 2025 11:56:49 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] proc-loadavg-001.c:17:9:
 warning: '_GNU_SOURCE' redefined
Message-ID: <202512121121.OF881GoG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 61d47c4e71c1f080e7412315c8685bc682a8e53a [1941/1941] proc: test /proc/self symlink
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512121121.OF881GoG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121121.OF881GoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121121.OF881GoG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> proc-loadavg-001.c:17:9: warning: '_GNU_SOURCE' redefined
      17 | #define _GNU_SOURCE
         |         ^~~~~~~~~~~
   <command-line>: note: this is the location of the previous definition
   proc-loadavg-001.c:18:10: fatal error: errno.h: No such file or directory
      18 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
--
>> proc-self-syscall.c:16:9: warning: '_GNU_SOURCE' redefined
      16 | #define _GNU_SOURCE
         |         ^~~~~~~~~~~
   <command-line>: note: this is the location of the previous definition
   proc-self-syscall.c:17:10: fatal error: unistd.h: No such file or directory
      17 | #include <unistd.h>
         |          ^~~~~~~~~~
   compilation terminated.
--
>> proc-uptime-002.c:18:9: warning: '_GNU_SOURCE' redefined
      18 | #define _GNU_SOURCE
         |         ^~~~~~~~~~~
   <command-line>: note: this is the location of the previous definition
   proc-uptime-002.c:20:10: fatal error: assert.h: No such file or directory
      20 | #include <assert.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
