Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB036B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713198839; cv=none; b=HTWizIWidb44zk0TY5DpT//JJBvqQjc26kOoflicmhovL8CHylsVzVP8rCInicex3kAqtTHGKFvuiAHN/gCFL/FbM9q/pnQL5YLEOMl0DEFUhGxtJI6SQMObPRYjgEwNPPHaH3OM5aJ5LbKJw/G5viVsFgGGOHvd3vDqWd1Vaqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713198839; c=relaxed/simple;
	bh=/F2F7XCu/y/u3qWAawCMxQby6WVFbEUs/ZuwtccNn3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o3MoB8bXakFPlBEgZKmIw7DTDymtGwCDkGX66kxlHAigh7d9acWBr5KmfTngKSRDPEQZiVxQ1/KyucD49iZ2dSawTJLRv/hs3O3lDn/rQ6Q04qxzJ3mPed/GTnUlx4pPBZ0Y3xvMz6GwG/GHFVQ7CXf3dpuTWSQbrESNiw2+n/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3bvBCzg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3bvBCzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713198837; x=1744734837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/F2F7XCu/y/u3qWAawCMxQby6WVFbEUs/ZuwtccNn3M=;
  b=Q3bvBCzg0xWhDXYYcltNueaV0btGAd9A1PSTU9nlgQ3vEtTuHUIHzXAK
   1MPw00JlEgxGQtR7BegukVBYQEAv3FibLUgj3riqjqhSEalg7Vm6YZTe2
   s3j+SVRN9XcCaCsIaQtJH13bliIP+hzsH3/bM0OOUrAbNd/laUhQPw6M6
   2sHWaYHo9uoZvJ8pMvERXbdnONSYE8rfXigbVFmex1YJBlWV+qkv4T5zT
   SlsGxy4XZYSlusQp7IlDlnYWbtJrvz1EdxmP+uutQUh2F/X8BnjhTPY/b
   leW3DP+H/Vu8PVKlNK4kStge/JvEdLNZMSAl/oU/Y3bZvdZVvnNWpx5/k
   w==;
X-CSE-ConnectionGUID: nQSl50hsTAO9yhVPuvi16A==
X-CSE-MsgGUID: qLjo1xtkR8yTluyY3wOAGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26114668"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26114668"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 09:33:55 -0700
X-CSE-ConnectionGUID: hPIHBP9wRyCXhrg0tUie+w==
X-CSE-MsgGUID: Vg6eii4/SGWBXONe31iscQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26748964"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2024 09:33:53 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwPHB-0004P6-2c;
	Mon, 15 Apr 2024 16:33:49 +0000
Date: Tue, 16 Apr 2024 00:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] ld.lld: error: undefined symbol:
 inet_getname
Message-ID: <202404160032.Ys0QWhwJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c4c1ee7e260d136fea1d11049b198c97b26b45db
commit: 7384d821f268ce4c725e0f6649838794368ca071 [18/98] tkernel: net: add toa support
config: arm64-randconfig-003-20240415 (https://download.01.org/0day-ci/archive/20240416/202404160032.Ys0QWhwJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160032.Ys0QWhwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160032.Ys0QWhwJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: inet_getname
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(inet_getname_toa) in archive vmlinux.a
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_exit) in archive vmlinux.a
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_exit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tcp_v4_syn_recv_sock
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(tcp_v4_syn_recv_sock_toa) in archive vmlinux.a
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_exit) in archive vmlinux.a
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_exit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: inet_stream_ops
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_exit) in archive vmlinux.a
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_exit) in archive vmlinux.a
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_init) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: ipv4_specific
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_exit) in archive vmlinux.a
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_exit) in archive vmlinux.a
   >>> referenced by toa.c
   >>>               net/toa/toa.o:(toa_init) in archive vmlinux.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
