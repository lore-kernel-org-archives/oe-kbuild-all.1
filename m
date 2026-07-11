Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC612246781
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783793644; cv=none; b=RPtV5iaGJJGsa9DFoBJJBN6RxI541JLNwk7J8CJXmWdHBjX+ZrEgEQhUqHX5+TlHpw178hh21rIspSbthecp6ePPd92ghHv/QcFO6VP36r+rhjJORl59LWqG+66hL3Iy/NxVdG2ZxFOY7ZaBi7IJOcfIgwYq3thZK2HqEl5y24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783793644; c=relaxed/simple;
	bh=X07Br6UYKk48S9a0BoVT9UoEvd8KbgC8pOJvaX6viSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tZQQxx12GgHmsdFd+AJzjlbAx9zTUfrcEjaAMcfzD3gCBoq4KQRk/YWeBtowtVe+KEOnpOKUXc+oVLcEpqhPGit3vsDUr7LYlxyULr7lz3D1Zl0L3FKX8J+neWHlepg50Y79HQYzsQtwj1j7vfU/iqH2u7qLhNTzKumExAnsqpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkHwysWg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkHwysWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783793641; x=1815329641;
  h=date:from:to:cc:subject:message-id;
  bh=X07Br6UYKk48S9a0BoVT9UoEvd8KbgC8pOJvaX6viSs=;
  b=bkHwysWgUVPijK6xvKenOYuiBnKnuisEsf73ZWD8v4gdsdXttC1kuuMh
   gQ+R5GW7hAw9QIrVG87iGc1ZWSj5yLaMAeaTYYHqUsJgKIDiDIcz4k4z4
   dtXpdTG4UDAgbsgY3EPQM1ayaQeHGRvUDZtSYoyUpGU/wrexDXfrgfZEC
   YYTKQQzaR+EpNz/vemVEFkfUQObxq+EsZZ4d/1qPAXqHt12O2Ztj4ndH3
   7Do4eLPhXUPHkfWARlQQyyAuQmCt98/NiVWqkh9kzYLJxCIIN18X98LmG
   MAjJa4XmYkJRkFtTgGxcAwyXJEVXxM+ojbGmP+HpjKd2Ug+uW2tAqg/BO
   Q==;
X-CSE-ConnectionGUID: txDW/OV6Rl+RJ63/Kg1SIg==
X-CSE-MsgGUID: UV6RE5zZR+ilCppSgj+osA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84566525"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84566525"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 11:14:01 -0700
X-CSE-ConnectionGUID: 13vO6f6LRVCOBHEzbla4Ng==
X-CSE-MsgGUID: 4/34nsQRQ3KaRlSOmlECRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255811756"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2026 11:14:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wicCl-00000000KHB-070L;
	Sat, 11 Jul 2026 18:13:42 +0000
Date: Sun, 12 Jul 2026 02:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/frpc_demo 73/88] Warning:
 drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described
 in 'qcom_glink'
Message-ID: <202607120115.Ti7toHHg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/frpc_demo
head:   c465ecabc7dee9cfb5640b25a4d75a5cad9f33da
commit: c2f6396aed9a6a996faa7a7eb8bd7c23f1b18151 [73/88] rpmsg: glink: auto-open channels listed in device tree
config: hexagon-randconfig-r071-20260711 (https://download.01.org/0day-ci/archive/20260712/202607120115.Ti7toHHg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120115.Ti7toHHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120115.Ti7toHHg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described in 'qcom_glink'
>> Warning: drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described in 'qcom_glink'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
