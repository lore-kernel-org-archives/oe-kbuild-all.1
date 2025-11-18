Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFE8248F72
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 04:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763439522; cv=none; b=meeYsZcND0Cgw8gHYTjBSDZfizN42d5w23CTwaPxUzJkwV+TGK6X4J6neMs9aVFh/l5RZgwuHEPghoLoNMK3ngk32/42ZizqB805s3qWf1xJxW0qFcgshEdRMJkfmvbkL6UIcvMmF818BhfNssyyJIA7IgBwk4myA0XGygWO4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763439522; c=relaxed/simple;
	bh=fXut0BNnoo4bHqDOgier9ESinMp1k9WZY2znE7WChbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J/ujGV3rOYSnorDcQQTurmzaWyKZrCu+cieWYcrirwHVvadcs+iNlzYIax8H3cY78RI1bAVgG3vT6bf0FjwuuYuNRBuNJ/VwQs5D3YRqqyodp+XBZNVRQUkLn0Bz7oKjKbkp4oP0on+8JZPsbn8/nWPrUA0wv0nNrdGI93XQSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+r7CCFJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+r7CCFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763439521; x=1794975521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXut0BNnoo4bHqDOgier9ESinMp1k9WZY2znE7WChbQ=;
  b=W+r7CCFJQONCVW93JjEsZI9g4FHMZ/+s71UQ7tICvJNBwFi8SVmfl2Bg
   xaTbt/7vHX2EqzoJBRxcTN77hSqlVXW13V0A07yQMV+RCaYFVlDzf/1B5
   wh4+3A9rzvKQYINLralNJSoQ73rc9OWaJTmtRzGCpOT2BVupZdRkP2eyA
   +ZNEHl7bCgtKejhEWdJrW3/G1dn/TUtycT8pK25ZBTpblHwvCSU/JEtUb
   Is37zb4//3GjDzFA32cCmL4Quhtu8IKjNkT9pelkrDsgHZ8mV/aDDz5yw
   76q9dIQDgLpyehWKgwdX91xPUyF73k72YVQj3o8b9Cpcez8lWS4mUY8cg
   g==;
X-CSE-ConnectionGUID: 9b46ad1ERiO0d/aGdpEB0g==
X-CSE-MsgGUID: rw7ds+HuRJyxUqbDcE/15Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75774895"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="75774895"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 20:18:37 -0800
X-CSE-ConnectionGUID: NyVImG48S4mQqsPlRKvjaw==
X-CSE-MsgGUID: A2df7sFqQX2k3bfa57Vurg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="191427795"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2025 20:18:35 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLDAn-0001Jf-0x;
	Tue, 18 Nov 2025 04:18:33 +0000
Date: Tue, 18 Nov 2025 12:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214] drivers/base/arch_numa.c:194:12:
 sparse: sparse: symbol 'node_reclaim_distance_setup' was not declared.
 Should it be static?
Message-ID: <202511181224.q1NCFdeb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4bd802eb810aced0425a9fbdedbf306c0c1e0fda
commit: 5e5d40e65cb55e4699c9879674a004f246606a8d [3214/3214] arch_numa: Make node reclaim distance adjustment always available
config: arm64-randconfig-r121-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181224.q1NCFdeb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181224.q1NCFdeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181224.q1NCFdeb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/arch_numa.c:194:12: sparse: sparse: symbol 'node_reclaim_distance_setup' was not declared. Should it be static?

vim +/node_reclaim_distance_setup +194 drivers/base/arch_numa.c

   192	
   193	#define DISTANCE_MAX		(1 << DISTANCE_BITS)
 > 194	int __init node_reclaim_distance_setup(char *str)
   195	{
   196		int val;
   197	
   198		if (kstrtoint(str, 0, &val))
   199			return -EINVAL;
   200	
   201		if (val < LOCAL_DISTANCE || val >= DISTANCE_MAX)
   202			return -EINVAL;
   203	
   204		if (val != RECLAIM_DISTANCE) {
   205			node_reclaim_distance = val;
   206			pr_info("Force set node_reclaim_distance to %d\n", val);
   207		}
   208	
   209		return 0;
   210	}
   211	early_param("node_reclaim_distance", node_reclaim_distance_setup);
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
