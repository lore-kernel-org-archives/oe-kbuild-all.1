Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E093A452D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504829; cv=none; b=c19NQM7V36HOH6BtuJ2SXaZVjMNoe9teC1upisLo40j6pND12tOeaP5VQyYXXwK4J2HnDQjWhd7cIKMhDB8zqSLEhgBCNry3D++rpjmrVtYsxONGR92pu+95ZBQERSFTaGZRVYgCkJeynoHOInj0YqLucnJjhBjzaGUP09t+pEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504829; c=relaxed/simple;
	bh=9ghFhHtrB6Zqh/2hki4TThveyTwf92kEPzJJUIO/7Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KOp+mxa/sVpZdZXjJBEqxLm5357WtyrHwMTIJXRSbkV9Bpueg7FnzB7P7HLhMCR/ZfjwxsapDyiaAdfXN5WrwR/Dx5vfOyndj/eoRTxVnAOdnyGbvaaY5Nm2k+098xQHilBtK8iF37+SGVIdc+Cq60+4uQpAWTQvu66a0m/xQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEi6nJWJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEi6nJWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778504828; x=1810040828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ghFhHtrB6Zqh/2hki4TThveyTwf92kEPzJJUIO/7Ns=;
  b=KEi6nJWJ5BzPkHgkGvuJyIGJGteFnd9gCns+cTO3dP7B57hPKwSNWE1X
   RZa8E9FDeOCG0QBZCkiYLmmpCiu1VG+h/1969r3aeQaYU38/eLcZZsbAK
   pUqkDeLccoRUx9CMzqPvxV6Z0oukgvMoVsz6Xht+y4vJLrSoW7gBvsFGv
   mH6Sou0K4wiuw6iQ4RQh+CRUwUTNWpRrhJNt7oBwI2lXlQ5mokDJXf+TB
   wodFqetzadzQaMPPZ2AR92jLpHXJKWqkIy04ucYMQ+2DywttI1X6vxric
   wYkMYaWxIMLWd9CH0LbG0Bt/k4C9k8ijaDWrwXD5GgxQ3x9DPC7Sx5+tk
   Q==;
X-CSE-ConnectionGUID: YDnGn6z5SxOuWoiZc9ZmLQ==
X-CSE-MsgGUID: sHvuuZZEQtG3dN0bkmIsEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89693265"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="89693265"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 06:07:05 -0700
X-CSE-ConnectionGUID: 0Ce8GQoXSdGDykPk6w9Kow==
X-CSE-MsgGUID: 39BjdhctQraGcjhTBjpNnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="233121532"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 06:07:03 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMQLc-000000000c3-3ac1;
	Mon, 11 May 2026 13:07:00 +0000
Date: Mon, 11 May 2026 21:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Noah Klayman <noah.klayman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 =?utf-8?Q?"P=C3=A9ter?= Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 21/72] ERROR: modpost:
 "sof_client_ipc4_find_debug_slot_offset_by_type"
 [sound/soc/sof/snd-sof-fw-gdb.ko] undefined!
Message-ID: <202605112153.OOSSw1Pt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   f0f2834ec142e66f2cd1e3aad558d7cb5adaf80d
commit: 630b7a23f1ebfd6a5c945ad1c48d7c9f25d6bf16 [21/72] ASoC: SOF: sof-client: expose Zephyr GDB stub
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260511/202605112153.OOSSw1Pt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112153.OOSSw1Pt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112153.OOSSw1Pt-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.o
ERROR: modpost: "sof_of_pm" [sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko] undefined!
>> ERROR: modpost: "sof_client_ipc4_find_debug_slot_offset_by_type" [sound/soc/sof/snd-sof-fw-gdb.ko] undefined!
ERROR: modpost: "__divdi3" [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
