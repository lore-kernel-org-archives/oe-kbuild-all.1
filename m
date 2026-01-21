Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2023D281
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769016533; cv=none; b=KIatr8/u/p/UbPFGbCckv6HoGWSM5GfKdq4uFRpKBUh8tJ1VDnY9P0Yjk4IcrPLAppnOfB2sD69Gi2GLEv/T8MkqtiFFI7BW9uApPE65ZbwH7p7329Aor7TCNY1otsjrsTOSyY00sN+JeMbKE7JdgT8g0mtdHQ393xhCRntymXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769016533; c=relaxed/simple;
	bh=qO6BzzO/AVl75Maf9MAN1bvcCuUjKESyv/iFnH1wUls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OeudEAJV4CyoHvnZ7cnzrFBzCXvuz4vWfjETPDuJMFbFTh4s6otiq+AGCjmB2VB5i56wy4OIWijb2gEUQRosVg78LaJMGi6xTBRgBLLyJbXabhNvl0w+UJOz4YgJ4Yci48FoyUX1RGHanyD/GEUCfWPS/ho+1HWKudd8mwGDSiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfWwRqp8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfWwRqp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769016531; x=1800552531;
  h=date:from:to:cc:subject:message-id;
  bh=qO6BzzO/AVl75Maf9MAN1bvcCuUjKESyv/iFnH1wUls=;
  b=KfWwRqp8qP8FuAuaqhO08qvL9STxpLkV78t36C39AtLyS4w9bKRf3QRy
   si9YuZ9olDG1khyJ/NA4yW49dfaGXWrP9LkfrkVgivLZUxM/B8x+ItNF6
   jQ1fp1qIeT+8GL+jgK1NFvrc8vR87lNYf0uAFskoJmle9d+o3aQceY2iZ
   grs65l+F4mOFGRBH8JNJJfx9qLugVD0B4YwLFjNrJ51Kxnamna3D8ao4O
   GPAcoPg07nvw7SBKXwsddBOguT1adLmVLuLWjIKYzRpypPYnQ8k/6CyIZ
   xtir5RyHC1nIi+wCBhkJV5vcxzS9cw6jdZ7FYQ5zhq+BUMrF5xkUt8Kuq
   A==;
X-CSE-ConnectionGUID: 0jQpQimMS3yvtynNe+PkrQ==
X-CSE-MsgGUID: /izM51kYSvCcK0Q9zgK9fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81694258"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="81694258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 09:28:51 -0800
X-CSE-ConnectionGUID: M7DMCnAITj+jGl+TpRU9Mg==
X-CSE-MsgGUID: /3oypHJlQj2WHnE1ay0OyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205640036"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jan 2026 09:28:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vic0d-00000000RTp-1Fw0;
	Wed, 21 Jan 2026 17:28:47 +0000
Date: Thu, 22 Jan 2026 01:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/19]
 kernel/sched/core.c:198:35-53: opportunity for
 str_enabled_disabled(sched_proxy_exec ( ))
Message-ID: <202601220129.9eNp05O3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8a1e87d5bd9ffafffe8896a41307fc9d02cc57e3
commit: ab57c5d354dad6e7eebcb10a7c831f4d36d658a8 [0/19] ANDROID: sched/core: Improve boottime output so we can detect if proxy-exec is enabled or not
config: x86_64-randconfig-103-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220129.9eNp05O3-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220129.9eNp05O3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:198:35-53: opportunity for str_enabled_disabled(sched_proxy_exec ( ))

vim +198 kernel/sched/core.c

   193	
   194	static int __init setup_proxy_exec_toggle(void)
   195	{
   196		int retval;
   197	
 > 198		pr_info("sched_proxy_exec: %s\n", sched_proxy_exec() ? "enabled" : "disabled");
   199		sched_proxy_exec_kobj = kobject_create_and_add("sched_proxy_exec", kernel_kobj);
   200		if (!sched_proxy_exec_kobj)
   201			return -ENOMEM;
   202		retval = sysfs_create_group(sched_proxy_exec_kobj, &attr_group);
   203		if (retval)
   204			kobject_put(sched_proxy_exec_kobj);
   205		return 0;
   206	}
   207	late_initcall(setup_proxy_exec_toggle);
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
