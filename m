Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE21CDFD5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389301; cv=none; b=CdUxzcmD3o+Tr7uWVCXIVGzXq5ZByYn8oMSxS3Md7fLxqP+Qsmhz2OI5sP9j4w0usgTEeAc7muLR/eIR+lTvvmaF+XzEwcUtr57gdXruJF8i+MN/QWWoonfM/Tf0G+l2GaiWO2qbmCUY+h1JBSSXtOj5Q0PYR/nSZGeACneSrBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389301; c=relaxed/simple;
	bh=+2kSxya7KZXkPCvk8by0wDLj+9MamYmaP40Zfi9f9ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jirqd3sCdU5opeqGTG/IN22jh/DKtlYwybsTJ8vm59x4qhmeMsBRXZYuTUZQdfNGKW9LWBEPCxHqp9eGU2k0JM8UBTl/CSqUN1dZT68GGXoLRrxWuEGhROChXRdKCxe/qrdezOOx3Cm003SyiBtfmHJtCJlebu9b6+l7lAeaO20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDA/cGgw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDA/cGgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756389300; x=1787925300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2kSxya7KZXkPCvk8by0wDLj+9MamYmaP40Zfi9f9ak=;
  b=kDA/cGgwxPdJ+3Grzs8/UsAgRBQn31YBIVYdq45FQH3KaUbnu3yIE2Sv
   ho9E7rM6zIcXcxTmdL9N02CDruarCmXhWYEGMVd2KQKGgpd/qFhG/XHOW
   qp018Ei7t3YA7kyzghzwxoo18pOR4TE61ALvqBE5MGi/JX/RPYetwRuno
   Bx9g3WYbhOChVBjGvW92bBZ6iSTSm63KPAf0KCdMy1RHIaGbbY0g71S3V
   MUicGOJrQXXi0yYGtNl85jyv+hZGw5KAXGqB+WM9dJsfSI65A04yFwdgs
   FeBX1IrKaZv+6mGfyS8ylhjZnHxjani35AEWXvhdhU07BtNQ3UDK1Qz2+
   Q==;
X-CSE-ConnectionGUID: QVk1x066RRyPtvXM2CXcUA==
X-CSE-MsgGUID: 1EFArMXqRVSfEjwywcbisw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58759230"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58759230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 06:54:59 -0700
X-CSE-ConnectionGUID: 8lYzO/13TLy3BGzxZQiPSQ==
X-CSE-MsgGUID: T4cb2Dh4R7ec+WsnbOo42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170509812"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2025 06:54:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urd45-000TkN-0z;
	Thu, 28 Aug 2025 13:53:48 +0000
Date: Thu, 28 Aug 2025 21:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2784/2784] arch/arm64/kernel/idle.c:51:5:
 warning: no previous prototype for function 'is_sibling_idle'
Message-ID: <202508282129.EDKxrS6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ed9bff77568b702badeef2b7c7776bb93d993768
commit: a91091aed1fa925eef3085facb44c4826b317f39 [2784/2784] sched: More flexible use of CPU quota when CPU is idle
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250828/202508282129.EDKxrS6o-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508282129.EDKxrS6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508282129.EDKxrS6o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/idle.c:51:5: warning: no previous prototype for function 'is_sibling_idle' [-Wmissing-prototypes]
      51 | int is_sibling_idle(void)
         |     ^
   arch/arm64/kernel/idle.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | int is_sibling_idle(void)
         | ^
         | static 
   1 warning generated.
--
   kernel/sched/fair.c:7235:6: warning: no previous prototype for function 'free_affinity_domains' [-Wmissing-prototypes]
    7235 | void free_affinity_domains(struct affinity_domain *ad)
         |      ^
   kernel/sched/fair.c:7235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7235 | void free_affinity_domains(struct affinity_domain *ad)
         | ^
         | static 
>> kernel/sched/fair.c:15430:12: warning: no previous prototype for function 'is_sibling_idle' [-Wmissing-prototypes]
    15430 | int __weak is_sibling_idle(void)
          |            ^
   kernel/sched/fair.c:15430:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    15430 | int __weak is_sibling_idle(void)
          | ^
          | static 
   kernel/sched/fair.c:730:19: warning: unused function 'max_vruntime' [-Wunused-function]
     730 | static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
         |                   ^~~~~~~~~~~~
   3 warnings generated.


vim +/is_sibling_idle +51 arch/arm64/kernel/idle.c

    50	
  > 51	int is_sibling_idle(void)
    52	{
    53		return this_cpu_read(sibling_idle);
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
