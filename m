Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F891D5174
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503111; cv=none; b=ak89Ic3FDfLejVTgVnlWEdFw3wLT1lqAdWXr6KqJODtDRLVUH9IySsZ2qVpeUVVGA72tFyIWPthWphQoa9fMX3eyxk+JZim6HQaCPZRJY7ye4eeRz9T/98SsDpMsjjTMf0X7BDNjQygapelczZLuWQCJLsHzuJrx7c2Fi9IXJeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503111; c=relaxed/simple;
	bh=bbepyKsMcQgSs3LPZ6WleB8EbP4xXg8J62bAuWdr3T4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WSknZ1ioDSnNXLz74VOV593L6038JXwtiv659Qc0kDqnVEicfWEnQHI4L9CDQ6soW2Eq1JdW8WaNeH17QkNvK7FRjKN1os8T8vS6Fo2TTVJQqe8cIwzKFRMvsQ65EOht1oWh81LGvUGeMm/PpwuiCh9UhWKllY0rywbcodW7E0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLRg9J4z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLRg9J4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790503110; x=1822039110;
  h=date:from:to:cc:subject:message-id;
  bh=bbepyKsMcQgSs3LPZ6WleB8EbP4xXg8J62bAuWdr3T4=;
  b=ZLRg9J4z03RhQS1Xq/qVOpJiMO6q9TxOQbQfDviUTnlTsjdYpW2kO9d4
   5UrVKD3/TifR4RlvTr0txMHIrJCg16cVDln81aXLszzJFruEnaGAgTlBO
   4XrQ9E4e5WpRmvnsN1vc9Emt523C7+TJkSBFBLKdk7tBuyxFdu7sxivQ7
   pecX7rC6RfTHlaOuGhi4ADtcQsq1eVGZgEZ7sJuwAjWNhJFdqMe9pfWJ1
   /8i9oBP7H9KMls9wQrm1ngtoprU6spASQ2UTVEn/EtGdvQU/cKrYVE4Z3
   w0cGcU6gCn2gXwk0EwC+yTGGUAEMved8nKSfQviTakjy8K9IkQ0+hhfoZ
   A==;
X-CSE-ConnectionGUID: Psh0vv/ATPmg/cc01HPlVw==
X-CSE-MsgGUID: dCINkV6uQbOmK8K43ICG6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="116755260"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="116755260"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 02:58:29 -0700
X-CSE-ConnectionGUID: Sdx7wxkUQsmlTc4XxYJQlw==
X-CSE-MsgGUID: ljq+7IN0SrCD/xhYwT2ufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="278582285"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2026 02:58:27 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAleK-000000000Wp-3Trw;
	Sun, 27 Sep 2026 09:58:24 +0000
Date: Sun, 27 Sep 2026 11:57:26 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_TTM when selected by DRM_LOONGSON
Message-ID: <202609271139.DpjVdepU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_TTM-CONFIG_DRM_LOONGSON-0-0 (https://download.01.org/0day-ci/archive/20260927/202609271139.DpjVdepU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271139.DpjVdepU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271139.DpjVdepU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by DRM_LOONGSON
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_LOONGSON [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (LOONGARCH || MIPS || COMPILE_TEST [=y])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
