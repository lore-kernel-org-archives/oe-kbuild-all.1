Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1D18C039
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732531668; cv=none; b=N/vHnapqFhgw4CmYmZFp6Yn28iax+uKI1UQHMYSFLI7PVREdSr9uzXTYILHf2L0MR1mnbNX/7yp3qeaTc0yTMITSxf9fU6ALAODAhVCLffEgVS5mlhSOieiDrHeozk6reELVog2NROOYWEeAg78Yrf3Tlp3H9FwsTj0bfTFUNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732531668; c=relaxed/simple;
	bh=BzPY20WpQQa0iK1mkqeUHkM5fZ+GTT1ovXd5K2mmnOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qszd8E1T8dMnyx7exAUvlHJKNDmVXSpqB58jau2429fEEZq1h6R+1PFaUl/NK1AX+NldY7RzqldFUZInKniNXyyW4PUosVxTISRCtJXylBhsIOae+VbANbNYMI6gXYJz5hPZDMU+FG2CAIwscNbMD0LwVpDnCldwRWU1oFqR1B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IepvO2Gt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IepvO2Gt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732531666; x=1764067666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzPY20WpQQa0iK1mkqeUHkM5fZ+GTT1ovXd5K2mmnOI=;
  b=IepvO2GtpvdLRwAEYROOhEX4SJMw7/2VQvpwOb7Tz3128dJ+QDbt2cph
   7Q7wC+ptp/0jpqxLEXu/lsdkdc/4ztkixJpw34vlgdNJrUPcV2Z9lpqoT
   gcqReg+Qg0jP+pEocmaB6nItb17T3W8DlQlpXskHkZM8xrtkHXe15nANc
   fyRvyEE6f4CWXjgisKniD/x0DnSNhPUkW0oDK528V1VEet99eIMMyc3UK
   P5NptE11h9lKAMOBDiqu9+9JqUnumNaNAyrQJLeW37d5yhsXHw1MuBZ76
   o9XUhrfJzDUxzv/5hmKSfia2Ws3NdcQHKzks1JMRoHS82bMgmFR39+bUy
   Q==;
X-CSE-ConnectionGUID: m1mZ2XqSQfqvlusmQDfV5w==
X-CSE-MsgGUID: TGKVHak+TO+nSncjUzzQjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43289039"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43289039"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 02:47:46 -0800
X-CSE-ConnectionGUID: 4MJTNTyZSjaOdAfyXc4RzA==
X-CSE-MsgGUID: 7dGBq6NDQmKEUFyfT3mvrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96285526"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 02:47:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFWd4-0006At-21;
	Mon, 25 Nov 2024 10:47:42 +0000
Date: Mon, 25 Nov 2024 18:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Zijian Zhang <zijianzhang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Cong Wang <cong.wang@bytedance.com>
Subject: [congwang:bpf-next 3/5] net/core/skmsg.c:1263:25: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202411251813.08Ldnj7z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git bpf-next
head:   562edf3ed3c0faa669f709bb4266a64dcbd6db45
commit: 8c55ea4b2a55101e73f58a10025db899f02c9efa [3/5] skmsg: implement slab allocator cache for sk_msg
config: i386-randconfig-062-20241125 (https://download.01.org/0day-ci/archive/20241125/202411251813.08Ldnj7z-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251813.08Ldnj7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251813.08Ldnj7z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/skmsg.c:1263:25: sparse: sparse: Using plain integer as NULL pointer

vim +1263 net/core/skmsg.c

  1260	
  1261	static int __init sk_msg_cachep_init(void)
  1262	{
> 1263		sk_msg_cachep = kmem_cache_create("sk_msg_cachep",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
