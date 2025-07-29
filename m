Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9621C84D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753775088; cv=none; b=tBF58fTmceXMAj5GiW4StiyNfQQKJ62r3aUKZeUJBTn8/ZnqoAt6390XHK1ZN1dsVH50bwKXPbN+C/zBNnmml8LVxMLJixsNQ9sRmjf76jKLNyfKymWrxvxAGPE/I+gSKe/k3LH0OKxkgO/6R6M6BK7YiWKm8mOFdWWtx1hrHcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753775088; c=relaxed/simple;
	bh=d5VH8eL/bJYbk1ZmTodzumN+l13qBjEOH7O/pRsvmn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QqZyD5R8Pqb+tWuh0AldJpYWceSl3hVSnND73CYdH/6VLshSdKuT88vWJDWTSah4b3ibyq/aqcD47Reb10BScIKYzH7WEW6XXzc9rDTU7K3oKva0V2p2oc96XEyhKec2kYVA4UrP9e+VjQb0KALOHZT4hBg8EpSIXr3sZa2s3DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DP4JROvH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DP4JROvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753775085; x=1785311085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5VH8eL/bJYbk1ZmTodzumN+l13qBjEOH7O/pRsvmn4=;
  b=DP4JROvHJuL6DfQfQywmBz2E+gcv49FDXUiTY/eN8CC0wsvBORpyjRGy
   qMUHlSM/WjyDl1nuZKKnsaGflD9XC+zBdbJf7JwTC857qP/Jz53dbpY1I
   /BMTZWdxpK8BKXe0WBzR4g2jGCXc9Lh5bWX2DSGZkr041JOWj3DVxOGqd
   +d84qV2tYc6ZBAH7W0MxSeHuTvWdcCYJJ0f7I/Cvq1SzPI2LlH4D4n+HR
   u2KX+/Zd3y2gXb0DU/vBMDvQpPigOnSvyXoeVoRoIbjPRYU7P4nfJ6wRA
   RiRMslsECiWP4w69GApWJhA4KYEBGmZtar9e9OvoLpoN2S32PfnCfViPq
   Q==;
X-CSE-ConnectionGUID: +6pCtu6TR9OSYM0/spb/kw==
X-CSE-MsgGUID: LKTGriKrTNerwWgnbScz/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59839344"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="59839344"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 00:41:51 -0700
X-CSE-ConnectionGUID: qftLRE3hRxG6uS4P5BEVvw==
X-CSE-MsgGUID: K2pQSSfrRaaxB0aoe9I9QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162347235"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2025 00:41:51 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugey4-000163-1p;
	Tue, 29 Jul 2025 07:41:48 +0000
Date: Tue, 29 Jul 2025 15:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 35/35] mm/shrinker.c:688:6: warning:
 no previous prototype for 'register_shrinker_prepared'
Message-ID: <202507291540.uMUxsjtb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f5139a8dd3c12cb0a4d854039d7c6ae10a89a87f
commit: 504ef1c9f57c863225587809ba9e1c29029c34c4 [35/35] mm: shrinker: remove old APIs
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250729/202507291540.uMUxsjtb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291540.uMUxsjtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291540.uMUxsjtb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_shrinker_prepared +688 mm/shrinker.c

af7c9c99bd63fc4 Qi Zheng 2023-09-11  687  
af7c9c99bd63fc4 Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
af7c9c99bd63fc4 Qi Zheng 2023-09-11  689  {
af7c9c99bd63fc4 Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
af7c9c99bd63fc4 Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
af7c9c99bd63fc4 Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
af7c9c99bd63fc4 Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
af7c9c99bd63fc4 Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
af7c9c99bd63fc4 Qi Zheng 2023-09-11  695  }
af7c9c99bd63fc4 Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: af7c9c99bd63fc40bba758503e56287d483c09a9 mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Qinyun Tan <qinyuntan@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
