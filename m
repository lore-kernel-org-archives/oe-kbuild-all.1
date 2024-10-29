Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3D61F7554
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 03:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730173246; cv=none; b=CFHuQiC9iLLR9rS4LczHPhCpepf/QbyzSY2Bp4+/s0+GJE5X8/p0yrnvCVYPiVivQvk56ocBUNUOw9idJf30qpo6XlNL6QBNxIldNbyhaZVus/okeNOnibbg15IS7NOAz9a1q8M5yz0r37Ov7gv0xKIGqrRf0noNy8lnALMVQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730173246; c=relaxed/simple;
	bh=MXqqNmX6+BJmDvl28LvGOj3P5bw6zOrXG36gt6eY/aE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRiPKYdQIWnLknAsMizYJ5c5Zh9R/68N0ZzicyypGQd8cmZWvWqWC8o9l9AifFZKoDZ8K+yqCejeZ+CmBiIMb+JckpfoFYma13qWnF8ZPwz/5DIujiwXfBxhLt4bS3DMNvA5PjEeji9QWa/KEtZbWqyo3LG1y8UwjuhzXdtscdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaLmAlte; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaLmAlte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730173244; x=1761709244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MXqqNmX6+BJmDvl28LvGOj3P5bw6zOrXG36gt6eY/aE=;
  b=FaLmAltepM3nVwOoKZEvIkxpuv+4gb44IEOdbN+R2f7PAfyZRCoT6eGk
   x5wrNl3wd26ogLk2FYdr7+9vr7g79eECcuqDta1a87fDFVBO85RDqo8Oz
   Vx/uWPEsLq2Oa7q91I5Q847mZ0+3gp36FkODkGv0C0FlwQj4V9bRfh8hE
   e62yK4RFNwoepgKgbMI3b9lARYe0En+lPwJNLDOVtidAvwZKiBupYzk+N
   C/sjb0WyreDp8pa+bn64kqGjfEXB5UGwdH3iIQoIlk3ffZmcPyHSW6ua3
   zvnN4ZLZv9lT7kbAWFyfpbXJDHMXLnIomPO6LNTEpdO7GfO3eAWAb0vmn
   A==;
X-CSE-ConnectionGUID: yrcXWzR4TeCsb37xa33iDQ==
X-CSE-MsgGUID: sva2DpGWQdKLWGIGfXA4jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47257844"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47257844"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 20:40:41 -0700
X-CSE-ConnectionGUID: rZMQwyBZQD6uMz7JkZVrYQ==
X-CSE-MsgGUID: 7EIp11EgR9GhXfinE4wa1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="86956287"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Oct 2024 20:40:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5d5x-000dD0-2c;
	Tue, 29 Oct 2024 03:40:37 +0000
Date: Tue, 29 Oct 2024 11:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4d 82/82] lib/dynamic_debug.c:94:21: error:
 'mt_dump_str' undeclared
Message-ID: <202410291136.JIE6wc4m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-4d
head:   98a15f4b1948cdaabac1f0fc008c79870c4d4672
commit: 98a15f4b1948cdaabac1f0fc008c79870c4d4672 [82/82] mt-dump-str
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241029/202410291136.JIE6wc4m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291136.JIE6wc4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291136.JIE6wc4m-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_mt_scan':
   lib/dynamic_debug.c:94:9: error: implicit declaration of function 'mt_dump'; did you mean 'xa_dump'? [-Werror=implicit-function-declaration]
      94 |         mt_dump(mt, mt_dump_str);
         |         ^~~~~~~
         |         xa_dump
>> lib/dynamic_debug.c:94:21: error: 'mt_dump_str' undeclared (first use in this function)
      94 |         mt_dump(mt, mt_dump_str);
         |                     ^~~~~~~~~~~
   lib/dynamic_debug.c:94:21: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/mt_dump_str +94 lib/dynamic_debug.c

    90	
    91	static void ddebug_mt_scan(struct maple_tree *mt, const char *kind)
    92	{
    93		pr_info("mt-%s:\n", kind);
  > 94		mt_dump(mt, mt_dump_str);
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
