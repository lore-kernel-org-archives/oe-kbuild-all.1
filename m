Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8520B216
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728636552; cv=none; b=KeK/Kz2juT7Vqwm+MNXa4NNkgUWGr79hHsp1ax/X+YRIGZjiBzR0NIex49t9sWRtgKozHZN4TGrXTdUbenIVw3Kss+Hxfygmf/EHFBZNPgQxKAsbzAEBk9VaAmlVyLPz3DawZRAm4r0Ny5IMqkWTn++Mlk5BEFXavpfqytZLt6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728636552; c=relaxed/simple;
	bh=Owc7M+jBDTSe5hOZ7n9AlQxMva4sUNydh3QcN71WZHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVibhhQsDYplv5V4AIiuYFVOqmHvSUH+XAjbHPI5BWkwON6WAqAIKDFiST8w7lWauRvHltWIt9yUSLh0I2Ir1gowTCrFM/rcO385vPzqTB11q/ZzeOasp9AT5Kgmuz5+6FBF+e2zXCIOjHmfhiABR2jxiVlrbrvFYULlkgYMOe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cn4ldeo2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cn4ldeo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728636550; x=1760172550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Owc7M+jBDTSe5hOZ7n9AlQxMva4sUNydh3QcN71WZHI=;
  b=Cn4ldeo2QLEhJsGqsVvQ/LGY+AlSl5WzVP828SeH2pJSqIBt+p1YF3BE
   fVY9OnAL4ZUw+pW0x+36BMAeHaU31vji2elr5swa+OopnAe1/vqw3u7Dg
   FX3/Fs35iB7N74QoyLdn2WQKEbSBZXKTR1GTPqNNN10Ream6wkKTMk+6+
   f4U/ZUIESJPwcv+DwAdGgkMHcRIuOWgKixiszxGvM7vD1XRPmqFc5nPvk
   Yaiuskk2C9hUbNyTk1YslKm5/PDRprVE92bylnV1yH9a7fJqufKsilfGY
   ZsAeJr96FJNymvEgoxNix/meTLTMg8/rLprXC1yIN8DMBfV9ehPX21oLn
   Q==;
X-CSE-ConnectionGUID: qPyWJEG3R2O6PHenr2T7ZQ==
X-CSE-MsgGUID: D1SDMNUGQiSskvQJFBFA1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27974477"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="27974477"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 01:49:08 -0700
X-CSE-ConnectionGUID: Ajxng0XmS7S+a6QeLyFU4Q==
X-CSE-MsgGUID: 5zUSxCbcSTSdASCVwTH+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81671606"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Oct 2024 01:49:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szBKa-000C61-0M;
	Fri, 11 Oct 2024 08:49:04 +0000
Date: Fri, 11 Oct 2024 16:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>
Subject: [linux-next:master 2837/4143] WARNING: modpost: vmlinux: section
 mismatch in reference: failover_exit+0x14 (section: .exit.text) ->
 initcall_level_names (section: .init.data)
Message-ID: <202410111637.9OGG0uh7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 03fa534856593bb4edf4935451fa55863e34a108 [2837/4143] rtnetlink: Add ASSERT_RTNL_NET() placeholder for netdev notifier.
config: xtensa-randconfig-001-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111637.9OGG0uh7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111637.9OGG0uh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111637.9OGG0uh7-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x14 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: failover_exit+0x14 (section: .exit.text) -> initcall_level_names (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
