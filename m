Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0299155390
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712684638; cv=none; b=LrMZ7DUhsDZIZBxa41ZR+LyliFxWK9sYU0DWL4J3XD+6mX4P0JN+hgafsseVyPHlI0OjQl1+hQODL0h0LWkV489VD7+ibxwjkWvV8ikP0cM49Z5zypaWK3fsF+Xg8u5AuqPhFHXq6QU6x0pVF5qPIi5QyUa5n0gVukWHNK4Zkec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712684638; c=relaxed/simple;
	bh=pUZ25fnKvBC4eI73lYXThQ4w+vA0wUB5WFWOSOmEFEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cF8vvoPZbpJCVlZ1Kd+x4QnSqjqVz5QUJmTeZtypmbDmezqa1hY3/kLgOdvI7PoMo4kpkZtfiuzikXg/YPDpEtxI1bMbyE5uqsEOVl23yAiq58TBlM3ldTeR9Ejqt++FHFJLT58XHqqdGd37VSL51rPO0S9MhoJ0zW5nZXL9WKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUzxsMdw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUzxsMdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712684636; x=1744220636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUZ25fnKvBC4eI73lYXThQ4w+vA0wUB5WFWOSOmEFEs=;
  b=bUzxsMdwwWA28TPTxQjQEQM82/S48ZNI1Ibo9fRXEoSvKTD4sApVEe/d
   SVQmQeERXEMTYL/kUbVb4a405x9ZhqP69Ig7EFn533uqyKeFEBRgoJYQy
   Km9Ij7//fQN559xw2YRRNiAbX6X3LbVZmn694MxLx8VQIVGc0GO8GTObX
   AKkngWDyb6u0SOhh7BDMity6QCNOmNxTdx2m3i3YmmOeCBNKPMDu+7sjD
   DR2PqnoPi1ILY8mDQpFy/AqCX6WHWb7vVnL3w6q2bt2IsRg1nyU9Q7eNY
   G46mJjOUtznBcBAuRM/zEE+vvY8hS5PT9EaRA36ej8o8JV0MCOdZXUioQ
   w==;
X-CSE-ConnectionGUID: Rnms0g99S1GKVq6TiNT7fw==
X-CSE-MsgGUID: eqCm3JmnSgG9QG91vQk2PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19165380"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19165380"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 10:43:56 -0700
X-CSE-ConnectionGUID: 9pMzqRHQSTy5SkfY+2Yftw==
X-CSE-MsgGUID: JL6DyqSSQHKPjtlGIw5/4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51290043"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Apr 2024 10:43:55 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruFVg-0006NF-0S;
	Tue, 09 Apr 2024 17:43:52 +0000
Date: Wed, 10 Apr 2024 01:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26370/30000]
 drivers/cpuinspect/inspector.c:34:22: sparse: sparse: symbol
 'prev_cpu_inspector' was not declared. Should it be static?
Message-ID: <202404100142.WYaJGYT1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9f126942e6d283d9a0ca99f3e46dbebe8aec3afd
commit: 069486b6d96472a22fc9fdb779ae3676710eea5a [26370/30000] cpuinspect: add CPU-inspect infrastructure
config: x86_64-randconfig-r132-20240409 (https://download.01.org/0day-ci/archive/20240410/202404100142.WYaJGYT1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100142.WYaJGYT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100142.WYaJGYT1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpuinspect/inspector.c:34:22: sparse: sparse: symbol 'prev_cpu_inspector' was not declared. Should it be static?
--
>> drivers/cpuinspect/sysfs.c:92:9: sparse: sparse: symbol 'patrol_complete_show' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:98:9: sparse: sparse: symbol 'cpu_utility_show' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:104:9: sparse: sparse: symbol 'cpu_utility_store' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:117:9: sparse: sparse: symbol 'patrol_times_show' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:123:9: sparse: sparse: symbol 'patrol_times_store' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:139:9: sparse: sparse: symbol 'start_patrol_store' was not declared. Should it be static?

vim +/prev_cpu_inspector +34 drivers/cpuinspect/inspector.c

    31	
    32	LIST_HEAD(cpu_inspectors);
    33	struct cpu_inspector *curr_cpu_inspector;
  > 34	struct cpu_inspector *prev_cpu_inspector;
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
