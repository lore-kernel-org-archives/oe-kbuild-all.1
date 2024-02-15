Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DF42595
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Feb 2024 21:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708033997; cv=none; b=qPv+xtOw+AdlTENK2UFsSuCQWac/YhtyLD+/Kf5tebpzqoS5XJcnwgzctv3FiSIpAYEvp74SDkQ7csBQ1OA4VcerSKgWYpF1yyaudtzsGEcXKi9y8B8Fu5v5Ti0WXJH2/jCs0T9DWsWnfqWov2Q/UpzkDPtpPOCLOdAk175n+pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708033997; c=relaxed/simple;
	bh=aSh60wTJA+toy9sciDuJdbd8hPJLLMqTOKmaz1OVkJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6SpGzHTLDCunVzl8jjd4047FSW3Q7jzTKTMExQDoTKxjHJZaq9HIg+kWW6NbyEJSuOXQSn7l2gGKnWZ7JqKBjP2N2jag9Ycu29K8p+WZ10zNrZDFED9gcYBcucRrK4YpBGv3e52InqnZez3bC0NXyx/U9hWvEWe/UAtNU8YWOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhSqLPtC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhSqLPtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708033995; x=1739569995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aSh60wTJA+toy9sciDuJdbd8hPJLLMqTOKmaz1OVkJw=;
  b=ZhSqLPtCdcVYPDeSLMsi3Gn8H3hphmKbtwwmh0/eQQ5oquQ9bcL779wx
   eQ+1ntgXU1mD7EQ4me5N9of29/TO2vvOsCIP88p2ytzlDfb1d7lqs/417
   tWOnT9EX5qVcpfKvtX4rKvRWlMsZh/S0QueZQvCf3guGcsEl0uVHVkQng
   O470FOF+a39qcyaC3tblkiNxOef7QQgr5FHwoSttUTGmLopcbHo6GZw8J
   lHIv5xOXKrpHgj+WW70Yk8tJBJ62xQ381qnlorX7GmLqaLy8QEd+Cv15q
   9iXXRvs1/pewK32Q/HLUZFf5QxKG+K1PWEeVn/n+6F7Ybfc7UbfF9uKUi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="27607392"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="27607392"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 13:53:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8313681"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Feb 2024 13:53:13 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rajf6-0000n6-1Y;
	Thu, 15 Feb 2024 21:52:57 +0000
Date: Fri, 16 Feb 2024 05:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linuxppc:next-test 4/11] arch/powerpc/kernel/setup-common.c:420:22:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202402160558.7tGRjPaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next-test
head:   14ce0dbb562713bc058ad16d281db355757e6ec0
commit: 9832de654499f0bf797a3719c4d4c5bd401f18f5 [4/11] powerpc/smp: Factor out assign_threads()
config: powerpc-randconfig-r132-20240215 (https://download.01.org/0day-ci/archive/20240216/202402160558.7tGRjPaN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402160558.7tGRjPaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160558.7tGRjPaN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/setup-common.c:420:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] hwid @@     got unsigned int [usertype] @@
   arch/powerpc/kernel/setup-common.c:420:22: sparse:     expected restricted __be32 [usertype] hwid
   arch/powerpc/kernel/setup-common.c:420:22: sparse:     got unsigned int [usertype]
>> arch/powerpc/kernel/setup-common.c:426:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] hwid @@
   arch/powerpc/kernel/setup-common.c:426:37: sparse:     expected unsigned int [usertype]
   arch/powerpc/kernel/setup-common.c:426:37: sparse:     got restricted __be32 [usertype] hwid

vim +420 arch/powerpc/kernel/setup-common.c

   413	
   414	static int assign_threads(unsigned int cpu, unsigned int nthreads, bool present,
   415				  const __be32 *hw_ids)
   416	{
   417		for (int i = 0; i < nthreads && cpu < nr_cpu_ids; i++) {
   418			__be32 hwid;
   419	
 > 420			hwid = be32_to_cpu(hw_ids[i]);
   421	
   422			DBG("    thread %d -> cpu %d (hard id %d)\n", i, cpu, hwid);
   423	
   424			set_cpu_present(cpu, present);
   425			set_cpu_possible(cpu, true);
 > 426			cpu_to_phys_id[cpu] = hwid;
   427			cpu++;
   428		}
   429	
   430		return cpu;
   431	}
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
