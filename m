Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC291C7B90
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726418637; cv=none; b=Iv+kbXeXJXK0Ed4i8HieCR2IsXFUdMNAJjPGnlVi2V27YbKn+BjSLnTWZ4Gkv4zdYSoRYzsChcEI6CyG6Wk9G0WLuHu9TwUj5j7z4nntac5+3mu182M73TopcF55ZAncaVVE+Jl9styPFAXh8bbP27U3Hy6GrPxieTBL+7GPVFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726418637; c=relaxed/simple;
	bh=xYmFzWDb+GZY8OnsCuXu2b1tK20MBaguCnTH4fVa38w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8xNKPMmDLNa5c26h8LdtUc/x6u3jYWM4Bc9jv4DlQ5oY/+gOm5CGE0AsYkoCDFREWS3AKgWtFFgFnIetZq+7QHBhxmHoUD3+H/SFnlY9X8R5uteH4pNMoXVszBqOJUJLMLunEJ4FntDHIZE/oq1pyVOJCfHPqWv98YwU+iHDoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=br8y7t0u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="br8y7t0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726418636; x=1757954636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYmFzWDb+GZY8OnsCuXu2b1tK20MBaguCnTH4fVa38w=;
  b=br8y7t0uI88AbCvOrK+ipPHYDKZbxTYMWyrnkwVxnxRjSE7Qrq5apN9V
   H69axkoScOWOsHI8cLagiuje/Gz5pS/rbOmcSGAwkN6ChATbsJCV5xCVK
   THuHgOZNnDvjT+H4IPDbeSGbKvpKV9muGewku365JxV2b2ynH7lLVuIh7
   CqMqkwbxBPkgDdyizt7jBIjlZO8Dz2ZAW262b3ABL8K5jgYQei0xWyvej
   ejfsUtvb3fIB5pP22IkV9DqpJdF17dw8Rf/hli4RnkF5xIXOJUIWtG/BR
   9s95xZrDmoni8BnpwDlahkvhNl4Kx3S3qx/8LGWaHMaIAl+cfA5l/LYN1
   A==;
X-CSE-ConnectionGUID: E0Ag6E2TS52BENEXWsIg4Q==
X-CSE-MsgGUID: iDDX5hdtSa6r0N8oGJb6xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36641440"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="36641440"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 09:43:53 -0700
X-CSE-ConnectionGUID: 4BSrgfVtQUCybeFoZiD5TQ==
X-CSE-MsgGUID: RZb1+EzDQZe3zuH/JLCcxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68897855"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 09:43:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spsLl-0008qg-1t;
	Sun, 15 Sep 2024 16:43:49 +0000
Date: Mon, 16 Sep 2024 00:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11886/11962] main.c:(.init.text+0xef4):
 relocation truncated to fit: R_ARC_S25W_PCREL against `no symbol'
Message-ID: <202409160044.ogHHPKFy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5acd9952f95fb4b7da6d09a3be39195a80845eb6
commit: 9b3e805e7dc536b172a9c2512b0e66212100747f [11886/11962] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
config: arc-randconfig-r121-20240828 (https://download.01.org/0day-ci/archive/20240916/202409160044.ogHHPKFy-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160044.ogHHPKFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160044.ogHHPKFy-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `start_kernel':
>> main.c:(.init.text+0xef4): relocation truncated to fit: R_ARC_S25W_PCREL against `no symbol'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
