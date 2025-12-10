Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4019B301705
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 23:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765408523; cv=none; b=h0bgwJra6kxHJ56I0tPnAPSPbkV+m5DLAxLfmgI+x1Uz/62s90ojPLDL0aBGYz7b6DjG1E/tipkF/zDJUs3Fw0aDUxnR+Hse08T528THppJFql8GRk6pivW47otWDswn29A3wKXOOP+q4Yb2lEKOZYUKwtYzF+JLh9yoCaG72CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765408523; c=relaxed/simple;
	bh=UZkcw2252dQSYYGkaK8hnzDSfptovDmVeAdEDWxolek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POn1HB816lleaAaYTIwNsc+Ry04MCCtm/aVOFimsPZvQELTAVRdCke43Da9eaBMksbkwgZ2n0B3Tw6iDEhIefXMaBodq/l5xJA6/nW8+XXhLPBS4u5eIBfRzvboa5+m108aainOdIR/z8QmWGklEt27ZOZSEGING6twp01wX5JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsQSG8MV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsQSG8MV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765408510; x=1796944510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZkcw2252dQSYYGkaK8hnzDSfptovDmVeAdEDWxolek=;
  b=bsQSG8MVD1kP5BkAbcTe7I7SJZ+doz5oF/vSrP649Q9iC7emYFwyICNW
   lfpAde7JPUwYiyWEe5fHfGuLTYwFVvbLtkDCm3GzyHoH/E4VDQXMbvjpJ
   E1OWr9ViRcwIOUc5Aw3zVcemRLGDU7LWTwsVhWNcYmGtgfKOX23rCMyLO
   RrrDTkRQR3V0XBIfuADKarBasYC3s9GAwOOBqrF3J2PcHejaLbWSoE9GG
   zJ115a+jO+UP2cj9tjohymyF6gnbLIC0kawADIe1KI76RWHvLtdKg7TPv
   Rs1hRvmsJo09c5sZbsesWHiCcPPcQzWuUPi4vaL3PpKYyUJiFYCoN9yMD
   g==;
X-CSE-ConnectionGUID: nNoxJtJaSSCZSjdU4m+T4Q==
X-CSE-MsgGUID: qBcas9LzTU+RPioj4PlPsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78087535"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78087535"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 15:15:05 -0800
X-CSE-ConnectionGUID: sCu+Hm6PQJ6/fpD6B+qZvQ==
X-CSE-MsgGUID: JEcDsJE2RPuCVzm9+Rg9Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196699016"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 15:15:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTTOf-000000003rf-2qLk;
	Wed, 10 Dec 2025 23:15:01 +0000
Date: Thu, 11 Dec 2025 07:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@oracle.com>
Subject: net/sunrpc/clnt.c:3332:9: sparse: sparse: cast removes address space
 '__rcu' of expression
Message-ID: <202512110700.lQgkw0Ep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: bb504321b96550f9a351920e169de141a3f4c6a1 SUNRPC: display total RPC tasks for RPC client
date:   11 months ago
config: x86_64-randconfig-121-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110700.lQgkw0Ep-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110700.lQgkw0Ep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110700.lQgkw0Ep-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/clnt.c:3332:9: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +3332 net/sunrpc/clnt.c

  3328	
  3329	#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)
  3330	static void rpc_show_header(struct rpc_clnt *clnt)
  3331	{
> 3332		printk(KERN_INFO "clnt[%pISpc] RPC tasks[%d]\n",
  3333		       (struct sockaddr *)&clnt->cl_xprt->addr,
  3334		       atomic_read(&clnt->cl_task_count));
  3335		printk(KERN_INFO "-pid- flgs status -client- --rqstp- "
  3336			"-timeout ---ops--\n");
  3337	}
  3338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
