Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37988663A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709648457; cv=none; b=giV0R0ObfZLZzhwOP7MlkDnJH3gFEWNddvPqGFgXPcHIqbcdjGBLjASA6SsUnORApQ9c9AEYeZL/mM5qY/Dgh7fFxvXQd3OolGBbjTttUIaQO209sqZB69xox1qVIvcjMGnkIP1w9RtEoNpVPYeP0fGX7DdREiuOjFKs9f9FTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709648457; c=relaxed/simple;
	bh=kgnwWOD3SF7PNc2BeoWPCpqJssSQEV5w0PA5jviyKIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9ysrSThKHQqOxd4eEiSO/COkF59l5gclmYhjVWO3ynW3v3PN1O2UBpWFwDDSdrQ0DxCTjVc9tTHr8LrXdRstBn+g9LLEHya/jZI/PLp/AAcYcwyFfsHm7ZhXYmpAdJDS24hMgo8onMOy802h0nhGfycZaZvJJkw6D2Nad+t2S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSYDpc2x; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSYDpc2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709648455; x=1741184455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kgnwWOD3SF7PNc2BeoWPCpqJssSQEV5w0PA5jviyKIo=;
  b=LSYDpc2xPWvw+PDXpAvXYuF9EQNA5GYh+HxRgnifN/EGp8U3ZuAqyr7z
   m1iwaFal7GQ604+trtjbuxw8iSCEztp2WNz5P9vmZofKw/MTJtqyxkg1b
   kfMLP9NI2a37vtYj/mmf/dGu/mfDfrW3lv2STCK39/1BhHhNOzO53H7t+
   T9ySSqlRtAjy2FRplALQFvzpXdh9qOGKSLa3Wv0xBC9ko9Vr9DmXjRF0q
   dPL6bzSvG3t7rl/Gnjejo7zgZyF9BDUiRFL4+1/tds1wRyC/nH+O9raa8
   y9Kpsp41efeILMRQOUR6hI0Gykf8Sow17335GmUORDnYcDGqwlNHzy0NT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4326094"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4326094"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9246555"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2024 06:20:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhVes-0003Mb-39;
	Tue, 05 Mar 2024 14:20:42 +0000
Date: Tue, 5 Mar 2024 22:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [trondmy-nfs-2.6:testing 17/25] fs/nfs/client.c:79:17: sparse:
 sparse: symbol 'nfs_rpcstat' was not declared. Should it be static?
Message-ID: <202403052224.JVWKnlic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   7285dad0bccf26a41dff605f0437f2c6090dc972
commit: 4e5a299e9e79b9dc221a18752f7d5a324a12ead3 [17/25] nfs: make the rpc_stat per net namespace
config: x86_64-randconfig-123-20240305 (https://download.01.org/0day-ci/archive/20240305/202403052224.JVWKnlic-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052224.JVWKnlic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052224.JVWKnlic-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/client.c:79:17: sparse: sparse: symbol 'nfs_rpcstat' was not declared. Should it be static?
   fs/nfs/client.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:229:25: sparse: sparse: context imbalance in 'nfs_put_client' - unexpected unlock

vim +/nfs_rpcstat +79 fs/nfs/client.c

5006a76cca8f86 David Howells 2006-08-22  78  
5006a76cca8f86 David Howells 2006-08-22 @79  struct rpc_stat nfs_rpcstat = {
5006a76cca8f86 David Howells 2006-08-22  80  	.program		= &nfs_program
5006a76cca8f86 David Howells 2006-08-22  81  };
5006a76cca8f86 David Howells 2006-08-22  82  

:::::: The code at line 79 was first introduced by commit
:::::: 5006a76cca8f86c6975c16fcf67e83b8b0eee2b6 NFS: Eliminate client_sys in favour of cl_rpcclient

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
