Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD98277CAC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753730376; cv=none; b=pHXxgiTrphZN57dw+Gvpuz8kzkHuQFJ50A0yHaKtul93rH8HJ9Vxpmie6TwKG8nZLTfq+K5GAfPtzNxadfoQCv0vCDi9abLiOxtECU0ZKSGiycBiw43tK0yu3UbO70dP/EomoifwYFW/RbBOZX8dGLeZiXLGUxzCCJjkr2dlSXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753730376; c=relaxed/simple;
	bh=0RRCbgHws8CH2+OOpoUA9cHOWjaYSWyZmKNlx4uKCO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bcnVIzUtAuIGaTSgkO5ioEZ6XAXMmbEJAYVb57fyGN1bOamk0OYRlqM+GmOt+2apo78NNqSWn0qU7+aQp0oCc6V5UL28odLTJ34bZhVa6DTNPFuwwq43+NgQADzx9PDAyHz9gh5BzwpFHCUwo/5AA+/TF38fo8Om1UpWXGipBpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSw2n9Kw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSw2n9Kw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753730374; x=1785266374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0RRCbgHws8CH2+OOpoUA9cHOWjaYSWyZmKNlx4uKCO8=;
  b=CSw2n9KwrPcCKqxYZzAhGnPFXQtyri1qE6bUZXm/UgGBSmTEoE3N7Gy9
   OvhRYcGZDIkAnwGb7v2XtyoW/bHRxKvGJNctFyxw35xAC2kjXN3gZhYEo
   wfJpp5NtOlVNtXEAZUftKIB3HYnXRnuP69XALxc9mf6NeMpkKuS/XA61y
   5BSJ8sCg/0D+5PK5a5a9saIAVMugDO0XBdYcwGc95McHwE1utC8xcTjUy
   iNXmKuxbrgCG1e0XG+Oz5qJF4AmpG7DbA9jK8vbfo1XJrS+OUjGS3A03Y
   SbGS6IzDE6ZtRzRO6lqpFMoPiVm+RFzsY79Ju3nUKou2UocVGd+VuVi3I
   g==;
X-CSE-ConnectionGUID: hejtuwu5R76FgrFpo/8gsA==
X-CSE-MsgGUID: 8Sdm80wJSRejjgS4hKUiNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55193407"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55193407"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 12:19:32 -0700
X-CSE-ConnectionGUID: Kd748MzyTRuwGtul0f+XZA==
X-CSE-MsgGUID: 7r6dlwhWRxeAHPmd8gps8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166748148"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jul 2025 12:19:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugTNh-0000hb-0F;
	Mon, 28 Jul 2025 19:19:29 +0000
Date: Tue, 29 Jul 2025 03:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-has-macros 15/16]
 arch/sparc/vdso/vdso32/../vdso-layout.lds.S:12:3: error: #error unknown VDSO
 target
Message-ID: <202507290344.glXsPDek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-has-macros
head:   9a936a47effe3789cade26c8b92f9c7d6e6b44d1
commit: 47e5b41b9f5fad2afe6a0274dce6e3ad328eca60 [15/16] BUILD_VDSO32
config: sparc-randconfig-001-20250729 (https://download.01.org/0day-ci/archive/20250729/202507290344.glXsPDek-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507290344.glXsPDek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507290344.glXsPDek-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/vdso/vdso32/vdso32.lds.S:9:
>> arch/sparc/vdso/vdso32/../vdso-layout.lds.S:12:3: error: #error unknown VDSO target
    # error unknown VDSO target
      ^~~~~


vim +12 arch/sparc/vdso/vdso32/../vdso-layout.lds.S

9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21 @12  # error unknown VDSO target
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  13  #endif
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  14  

:::::: The code at line 12 was first introduced by commit
:::::: 9a08862a5d2e266ecea1865547463da2745fc687 vDSO for sparc

:::::: TO: Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
