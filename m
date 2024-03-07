Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF804689
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 00:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709772642; cv=none; b=BXaxKGJFveWGVX16fvR+fTcn5uK4sV2hfWoCjfCQ2LV7qx32yTPGw++CoJsoi7k8N76CC6p/Mqj2Hr+7cf9hXs1gtFcBWWlsKGyfChFSFWEIJG48OxLlqWEvPQVC940dsIDhp/N0sxz3mMnSZ+UAWvci63GgxEAAlm+3GOJBxg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709772642; c=relaxed/simple;
	bh=WqsjR9f70FoH3lzgSU0Iifw0xcrOxdbT+rdMhADW1bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qtoMKeqEmrr8RT+awCNVTs4nzONr7hwUEOZ2kq78IX7UR1oOFOBmLejyE3uOheUT9GEeTydB0oaCyRr1e8zgGgzNXxfzjB2niHDZPDRiZ7SAKaXyOwkJhESbujVG6Dty19vR3R+CYUg4WP/7Ayyq2TUlHwvvVQ4hf8Cgh79IPA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTCO/JgW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTCO/JgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709772641; x=1741308641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WqsjR9f70FoH3lzgSU0Iifw0xcrOxdbT+rdMhADW1bg=;
  b=dTCO/JgW+LafY00OoIrAk9IoV1ubAKKsS1Cvleumg+YFd4IB5BM6nU88
   8NAKPfp+IZfERdS+K1PH0Xo60yr9lSm4u2eW1ErYY2EEwaj6+4vK6Onew
   AclWRT/0MLRKKVVMqqWHD22iJufJb6a+va0gsqVrWyR8h6AVScM8eWlAh
   JMdyQ4BqLbWx5HjZT8UoL9FZuUNhIPA171dqTtqb4KUsyEDBNc63jjZAV
   HDI3fMvYMn9abD93pGEiiqbTF+AO3hV6qTgpeaJFX/Fw62ZDpC3pJNwGz
   VLIQ3wsMOVfnPgCcC8oS5dkScT4+YHuh9/FuBLfsHoh56XObGjbdtNLsE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4587742"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4587742"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 16:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="10006600"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Mar 2024 16:50:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri1y0-0004ez-0n;
	Thu, 07 Mar 2024 00:50:36 +0000
Date: Thu, 7 Mar 2024 08:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [trondmy-nfs-2.6:testing 17/25] fs/nfs/client.c:79:17: sparse:
 sparse: symbol 'nfs_rpcstat' was not declared. Should it be static?
Message-ID: <202403070854.z5aUgF2x-lkp@intel.com>
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
config: x86_64-randconfig-123-20240305 (https://download.01.org/0day-ci/archive/20240307/202403070854.z5aUgF2x-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070854.z5aUgF2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070854.z5aUgF2x-lkp@intel.com/

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
