Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E792F5A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739551907; cv=none; b=Zovrs+pa30zu6PJIuu8Upnb7dISJhJAEQnWl1s+RymTjy5carFuCggiJjnc1jfEJx3l4mAPp6cDxauXguqwrZ0N2nRg5j3NT9zYC0fuMKN/vlEyd6MPSdc6qD0d3VX2Znqmc9yYIY4ljIzMDIWSTvALK4oeb9llZsFXB1kmkcdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739551907; c=relaxed/simple;
	bh=wAH4+FFY/kSf+2GgBy4TFxUf6E3f1elQSzM5RnrtTmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h3VA8xEgsXd83Ou7oANotX2nJYlLMcfm1SHHHO0OqaQsNfudpnkzp01fyNamkRDknaTXheMjnZQm926St2BYC9Or6yYFSlRwXBqVZBecYeyVejFqcXMgQn8X/WvlB6ymfzt0dq95jDDk60xk+CsjpyLxv0n+kAI0XESBv3t84AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DO++JQSZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DO++JQSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739551905; x=1771087905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wAH4+FFY/kSf+2GgBy4TFxUf6E3f1elQSzM5RnrtTmI=;
  b=DO++JQSZ1wm/SQHn501KeqR4wLjezuxbPMSBH3O5dWHGU9Lxw+kKuMBU
   1YUmBRhcPnXh+fmVWM64sl8gzanQSkn1ivw9ftIJ48OjxpaVb3gTd++XM
   Eh2YGzd9mQS6cSlVqMXPJOqXpHKP+QXSJk9ZGkMUV6KQnudAEvSebJa3V
   q0FXSt3QlIjA0VUYfhzyTWDWWpMaIk3NEuagRj72+tu7twBIeLVXjFqOo
   hWDFxhdkYKWMc4+MtvNC34vR5j8BnJOu7ykIr8I+XwwEgJyKqi4KCzPg3
   S0ddJx2InBsXMZnMZieqt06a2J7tf0+bN2k3/gVBfT6o0BjrV6jMnQdVN
   w==;
X-CSE-ConnectionGUID: 2yAIwnvzS2ulJryD0+bgeQ==
X-CSE-MsgGUID: pS2bi29CTMG2NH0jJoJ4zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57713405"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="57713405"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:51:45 -0800
X-CSE-ConnectionGUID: VShLoACfTy++7Vx0oo/htQ==
X-CSE-MsgGUID: mlbKGPZqRQ+TmkkWaTV2MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114410442"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Feb 2025 08:51:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiyuj-0019tt-2t;
	Fri, 14 Feb 2025 16:51:41 +0000
Date: Sat, 15 Feb 2025 00:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 249/249]
 mm/pgsize_migration.c:98: warning: expecting prototype for What(). Prototype
 was for init_pgsize_migration() instead
Message-ID: <202502150058.n8f1F2An-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d2ae202da688a9a795c238142e01da921b3e4b81
commit: e79c1d45908063d1d7bc247e0e9bde6d9283a09e [249/249] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_miration/enabled
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250215/202502150058.n8f1F2An-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150058.n8f1F2An-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150058.n8f1F2An-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pgsize_migration.c:98: warning: expecting prototype for What(). Prototype was for init_pgsize_migration() instead


vim +98 mm/pgsize_migration.c

    81	
    82	/**
    83	 * What:          /sys/kernel/mm/pgsize_migration/enabled
    84	 * Date:          April 2024
    85	 * KernelVersion: v5.4+ (GKI kernels)
    86	 * Contact:       Kalesh Singh <kaleshsingh@google.com>
    87	 * Description:   /sys/kernel/mm/pgsize_migration/enabled
    88	 *                allows for userspace to turn on or off page size
    89	 *                migration mitigations necessary for app compatibility
    90	 *                during Android's transition from 4kB to 16kB page size.
    91	 *                Such mitigations include preserving /proc/<pid>/[s]maps
    92	 *                output as if there was no segment extension by the
    93	 *                dynamic loader; and preventing fault around in the padding
    94	 *                sections of ELF LOAD segment mappings.
    95	 * Users:         Bionic's dynamic linker
    96	 */
    97	static int __init init_pgsize_migration(void)
  > 98	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
