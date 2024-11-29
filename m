Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F1158520
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732884902; cv=none; b=J6gZLbZspsaV/uz6eECP2ju1muAnGE2hS7XL8C0qcw5OroQy5sEz3OAnHnIU6X5JoViQXmqnGFxziM9talwfRLBrG7wQMGjyD1M6ohdeR5n18LEYcdJaquvmbViiL9Q1IuZmRwPRLxtcxnsa/KvheaCWHX7B91m7rEAZAZH/MrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732884902; c=relaxed/simple;
	bh=OQJLZK5YUss4cHael1UZFN3y8l+sNA6Mxc0oMsWz3Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZKwXtq+jJatfyyvEVKJR5eBQcJ/xcm3b3hXo3FHdlgIpEui5QxQV/d7lTDqX6emWibklXBcK5azZaZRxYF8VIH+bghqPv6A0GbtG0+jIzyfn5zpIjX1aBGGKMnGieS2Uv0sl0j6xT9T3/q9Q8d+jUNArY5fyyAVMvma3B84lxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3bqjiz/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3bqjiz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732884901; x=1764420901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQJLZK5YUss4cHael1UZFN3y8l+sNA6Mxc0oMsWz3Eg=;
  b=e3bqjiz/Tg8hvq+PHTlgEjp+lcSgXd1AeuFVKMop+XQwILo1F0JWKf1A
   cDoMSXPlVD/gLom7maNZOk/cpl+Y77ZFn4SrAacIWTK5r3DBC5Ih3i76U
   i/opG3+xoEP4Gge8aYM09S3HtfwLuk4EwQOPZfhFLKqAzN/gTMxA2l3vi
   kPnmbZWwXAvp8u91DYVpj74Qv1ZjP8PR9/xfBLfuxvYzQSpvC1+xMrCDa
   n6Ftm1ESP0K9akjrAGGxVXTVWuQnsQ7Q3yD7VVKe5CQ6UkHFHfFcISpYe
   qFU6CT3klgD0XvfZABxQ6deF1PbxcyQsCk688QjkfALCMTn/6vFukuCBR
   A==;
X-CSE-ConnectionGUID: MsNWXcldTkGMJP3qz2o3zg==
X-CSE-MsgGUID: /kvz+fKsTDWMYl8LevAU1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32986963"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="32986963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 04:55:00 -0800
X-CSE-ConnectionGUID: BxwucwU3Rh6N7AfdKp1FLA==
X-CSE-MsgGUID: Wr7zzsGDRkqvL7ZDGV586w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="97455075"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Nov 2024 04:54:59 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH0WO-0000Kb-2L;
	Fri, 29 Nov 2024 12:54:56 +0000
Date: Fri, 29 Nov 2024 20:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 11/16] ld.lld: error: undefined symbol:
 __tracepoint_cros_vfs_rename_exit
Message-ID: <202411292009.FNiB3AKt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   332faf4fa569dc4d6e09fd420037512abcddec6d
commit: a6725d3a987f03c22ed97a67a8ab6b5c63243807 [11/16] CHROMIUM: add cros file rename tracepoints for bpf
config: arm64-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241129/202411292009.FNiB3AKt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411292009.FNiB3AKt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411292009.FNiB3AKt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __traceiter_cros_vfs_rename_exit
   >>> referenced by cros_file.h:68 (include/trace/events/cros_file.h:68)
   >>>               fs/namei.o:(vfs_rename) in archive vmlinux.a
   >>> referenced by cros_file.h:68 (include/trace/events/cros_file.h:68)
   >>>               fs/namei.o:(vfs_rename) in archive vmlinux.a
   >>> referenced by cros_file.h:68 (include/trace/events/cros_file.h:68)
   >>>               fs/namei.o:(vfs_rename) in archive vmlinux.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: __tracepoint_cros_vfs_rename_exit
   >>> referenced by namei.c
   >>>               fs/namei.o:(__jump_table+0x8) in archive vmlinux.a
   >>> referenced by namei.c
   >>>               fs/namei.o:(__jump_table+0x18) in archive vmlinux.a
   >>> referenced by namei.c
   >>>               fs/namei.o:(__jump_table+0x28) in archive vmlinux.a
   >>> referenced 3 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
