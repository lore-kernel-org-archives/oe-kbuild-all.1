Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58494F20C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717832007; cv=none; b=m/OBlCLlvkucEKO44eeqr8u44Khdegj4/mqVUl8wuP+aGJRx5s/5JhYDZtUvM/vhU9CIft8KWA/uuzWhisHA/v/LjwNHgcShUAEv5EGYsrpPo3Wc+thz1ZEKZZIUWYeFiUcM2SBs8Bcmt0yt0gcVV48SDlNFml4pIWMza+iSspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717832007; c=relaxed/simple;
	bh=tLlqostnaGDwqVMO/zCllRTucDPYUHdQFxKW43nUcsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3tg4jGDGplgtKPEB8UfmIelgE5aR6cthhfLOLs4xrB0OQj+9ImnkS2BGSJ3JxGx6bHg+p2pLmtG4o/y6nPaP60yo690fd2oRvOcyP0G5AtPsAkhjegQjiXqxaueLBVcnYT9UY/iwVI2HT/gSU+h9Hzr7XElTqUGK+7nVgB1kf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lewvOLKY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lewvOLKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717832004; x=1749368004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tLlqostnaGDwqVMO/zCllRTucDPYUHdQFxKW43nUcsc=;
  b=lewvOLKYHd4YnbDWPx51mWtid/kccLtTxRKMlMdDh37h+xTHnD3kxMnz
   re9T2mMgPsgSGDL29kPYc9paC0ZwiWHf2MsVur2BQvrXvgleX3i4meZj0
   FY8eW4XcNSqa7BmvBfngEOqm3khF19sctKKUK9thx+YCnVCR8BOlcGGc+
   qy9AVrln2xyGd1whqYe3sgMefph/xEVDXiugS7JkzuA/IJQX/Hk7Zt2rI
   +RyN0NTzzd+shB822sVLCSXkKS1BWzhAg7hpDl6t6SVb/6xFfo222bY+w
   EvaNH1DBTLhFOimlKmqG7ObBzW2HoopxCO7hvakVpTPe8qWgNDMaM5t/h
   g==;
X-CSE-ConnectionGUID: tS6dAWQ6SuOiyJ7zZyl3dQ==
X-CSE-MsgGUID: fqDbuD97QFagUC22bHSRvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="39962131"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="39962131"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 00:33:23 -0700
X-CSE-ConnectionGUID: wKEWkUW7T/iZSA3S7vfwvg==
X-CSE-MsgGUID: 6v4/yLn/RQCSh7FkBd2HWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="43107612"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 00:33:22 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFqZk-0001Ec-1B;
	Sat, 08 Jun 2024 07:33:20 +0000
Date: Sat, 8 Jun 2024 15:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 7/42] include/linux/cpumask_atomic.h:16:16:
 error: implicit declaration of function 'find_and_set_bit'; did you mean
 'test_and_set_bit'?
Message-ID: <202406081512.79MXq6vm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find-and-bit-v6
head:   01a427072a49f0674209d92684f2bc928b2509a1
commit: dc5d867fa2ddb0dd3f1fbbc6ec0d426fc4b61c86 [7/42] sched: add cpumask_find_and_set() and use it in __mm_cid_get()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240608/202406081512.79MXq6vm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081512.79MXq6vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081512.79MXq6vm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:33,
                    from kernel/sched/core.c:87:
   include/linux/cpumask_atomic.h: In function 'cpumask_find_and_set':
>> include/linux/cpumask_atomic.h:16:16: error: implicit declaration of function 'find_and_set_bit'; did you mean 'test_and_set_bit'? [-Werror=implicit-function-declaration]
      16 |         return find_and_set_bit(cpumask_bits(srcp), small_cpumask_bits);
         |                ^~~~~~~~~~~~~~~~
         |                test_and_set_bit
   cc1: some warnings being treated as errors


vim +16 include/linux/cpumask_atomic.h

     6	
     7	/*
     8	 * cpumask_find_and_set - find the first unset cpu in a cpumask and
     9	 *			  set it atomically
    10	 * @srcp: the cpumask pointer
    11	 *
    12	 * Return: >= nr_cpu_ids if nothing is found.
    13	 */
    14	static inline unsigned int cpumask_find_and_set(volatile struct cpumask *srcp)
    15	{
  > 16		return find_and_set_bit(cpumask_bits(srcp), small_cpumask_bits);
    17	}
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
