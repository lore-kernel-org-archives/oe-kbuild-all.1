Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18181474CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 23:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469995; cv=none; b=eDIXTCaGcsd+uc0sl2unNqiPbuDr2Biu6DODt3ncKJq6RXNTkDeqCvjdryYiqD2s2ExQSU2BZFHYHRzvmYHAL1l2FYBmfYqKDZ/Qzjg4J2hOZDL5xWvu8cBwQDe3V/5FxaSlza2TJKbzl3EZtEL8DpnQlyb+fQqEgE+pbh4Vybo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469995; c=relaxed/simple;
	bh=ZLs9CKeqOkF0f9j2yNRickGxgvNchY94txADGPsJ2p4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K7k3DalwnkZd1o6SActAppjUKzJGlKPLFM5Sg9H0oNF70iNHa4YnppcYUoXTR2bmX8ntDPjnVCqvp3W5zkzhjGJJaUBG1yeSqbefz+YSGOPvaG1jt/up1cSTh2m1bzvfLNqb2EVwQ4jqbbgTd9Ux/UL8kF1S6vgaT9YACWZ4+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgUBsl6A; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgUBsl6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776469994; x=1808005994;
  h=date:from:to:cc:subject:message-id;
  bh=ZLs9CKeqOkF0f9j2yNRickGxgvNchY94txADGPsJ2p4=;
  b=XgUBsl6AFRSjSfeGICP0Eq8EKL0tUzaAI8JNLgjxvRcSW1N5eUDSNdj5
   5jRNpXDBsBDHW1h9d7B69DhVcgz7yHO7RBYKhwcmLGS68OSgPzJX9kp/a
   CIlgUx0+Mitir8y1ILkp7MBjOMTD8pIddg1fhG5+isuOgScLGjxYXnbms
   pmfjdDNYJuiZldoZ61xfENuXMI4u0DT5xqIthzsQUhy1TMDQOjDj5Yeay
   bDxoxDZn1DLQrKjH33yb6FWLG83fI2PqNGSVI7OdtW1ibPBwKAE5iBH1C
   sqISsZwSSDwRASCTxuvKYApuzNQQaQF59Zg6X/FI1/OpJq8wy9gUsuota
   w==;
X-CSE-ConnectionGUID: PQF8My18Rg6MgGcvBP2/aA==
X-CSE-MsgGUID: BO+//vMaSxiTcJwBfZzy0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77673189"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="77673189"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 16:53:13 -0700
X-CSE-ConnectionGUID: 9vIoOgYwQMSaHfCbZkZxFg==
X-CSE-MsgGUID: RtrJhANERtWRAfVDtCZwPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="230166688"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2026 16:53:13 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDszl-000000001SD-3iFS;
	Fri, 17 Apr 2026 23:53:09 +0000
Date: Sat, 18 Apr 2026 01:52:40 +0200
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: mm/slab_common.c:1342 struct member 'defer_head'
 not described in 'kfree_rcu_cpu'
Message-ID: <202604180157.ye50OffR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo-Oracle/mm-slab-introduce-k-v-free_rcu-with-struct-rcu_ptr/20260417-105128
head:   9a622bfd287229f4a91dcae07d37b4db2a3d41fd
commit: 7f2f0174037b58426221582c493815f7083a2b90 mm/slab: introduce kfree_rcu_nolock()
date:   21 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260418/202604180157.ye50OffR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180157.ye50OffR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604180157.ye50OffR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slab_common.c:1342 struct member 'defer_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'defer_free' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'sched_delayed_monitor' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'run_page_cache_worker' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'defer_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'defer_free' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'sched_delayed_monitor' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'run_page_cache_worker' not described in 'kfree_rcu_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
