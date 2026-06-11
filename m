Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ACC38BF8D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 22:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215555; cv=none; b=oBuFbnhtk8pLhFSyQj7SKGrzj5Q3EMwOEcVhEsjY/SW+bhH0qSSDwt7umIsvrLgjz3yM1OiBfTur2Wot0Pua6Ht1ziy3gdA2KcR20x7NNP5tnT2FefkIkIAAvqReJEh/x/If09+FB/lwnvfwM0qkUJEW8e2JhNn01ah1AI/6etY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215555; c=relaxed/simple;
	bh=Wf7elqASvOVzTxoeoqeSqJDKPBIX8/GqgzfLtCC17Js=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sv+Ya1+XiK4WFGN2o44qpC1YxTuYA+fXvrVtg2jr9CjBl02HzkmJSLB7tYLbkkLIaezSpVW9b0G22uMIwme95jdYXRx4dHsSoPa+Czlh6ColWjPH7QNUPZTXQbXd6pP3hGYwDyx4Rr0LgP34WPArLDAYxrnKKqKPNNZq4oBztUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVdwbPPZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVdwbPPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781215552; x=1812751552;
  h=date:from:to:cc:subject:message-id;
  bh=Wf7elqASvOVzTxoeoqeSqJDKPBIX8/GqgzfLtCC17Js=;
  b=HVdwbPPZ4ttstJjYEWH9Tq9ZK0dmXN8AYkC2hQJlF6Sk/g/qR2DaFksk
   pQvLYV5aAnfN12PSzSO4vbapLuLDTNBlUEQs1y2+VZI7tchqt5ZZtuVfB
   ZxDoi9SHqYyXxudYpezGZuvyvDzJNKrq1dV4faH8eM4RvldPLawV9gC08
   9WIWw7iRdAKdvRdn+ft1X0YGUhv/9Ls/NNNgBXpYz0mzGsemSTgwRuTV6
   mmAmav9UkRGLKQwf8QdCU6MT3mXMueLUMQ7WBpkY0BZ/1Pbl6q5vQ37wT
   jcODzHB0WI6H2k/nj/Rc+BI9+/dK/xmpQgiJHqcylEtottboKxhl60zyV
   A==;
X-CSE-ConnectionGUID: mjJ8ey4HTqSNoIbEfXNf2Q==
X-CSE-MsgGUID: d19mxCJfQLutc222ka/7ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81178279"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81178279"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 15:05:51 -0700
X-CSE-ConnectionGUID: MKU4P9qJRxGgp0UU9nvv5Q==
X-CSE-MsgGUID: 4cjJGPZHRkigfzPMAKr2nw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 15:05:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXnX1-00000000Nut-2Inq;
	Thu, 11 Jun 2026 22:05:47 +0000
Date: Fri, 12 Jun 2026 06:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-dmr-pmu-core-ANBZ36969 21/21]
 setup.c:undefined reference to `topology_apply_cmdline_limits_early'
Message-ID: <202606120544.YqClKtWP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-dmr-pmu-core-ANBZ36969
head:   d9af544c0b402dd99545ddad4a58e030ebc44e7f
commit: 6b66d9b27695b15e9226171e6cd8849a336ba7b5 [21/21] x86/cpu/topology: Rework possible CPU management
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606120544.YqClKtWP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120544.YqClKtWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120544.YqClKtWP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x7dc): undefined reference to `topology_apply_cmdline_limits_early'
>> ld: setup.c:(.init.text+0x7ec): undefined reference to `topology_init_possible_cpus'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
