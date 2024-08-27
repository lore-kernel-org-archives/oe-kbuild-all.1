Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523919DF60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764882; cv=none; b=M96i6FQuoDstGJuC8GI/arfcgv6cRMZECuTw1MhWlvrzLC9c284buK1FrpK69Yjb87AUryNAoKwJkLkdUA99VXOmCCJ0iZO1iGZ+YbKMO4maIZC07Udcfi1Afw4hj5ZiMpaG75l/FPCJD+ks2GtMlknuQWO0rG19Sy+0SOx26ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764882; c=relaxed/simple;
	bh=qFnxsNNv+SOeFbPn2srS+rVD2k0ThW8C3LrPOJdT0sM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+vUt0WGqYEbkkM4AgMvpY5Ev9C0GOBwnQOEcnv5NRhrQhNwNpAiXJ8hPGrM7fv1vHTAU2OBQ0axfNfFiZbj1mQ8hli63Wx5BigslRSiKP7kyEMEiVaMQ0RDG+Mqvufi42wgDp5X+QV2hczz+/xz3nOhVq7Y7wArVXuEC6s5JBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSrtMSUX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSrtMSUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724764882; x=1756300882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFnxsNNv+SOeFbPn2srS+rVD2k0ThW8C3LrPOJdT0sM=;
  b=GSrtMSUXDhT4Vlfq0YDUTddv06IcuA7W5ENjgt3xeQV4fLcNbgoAO6Uy
   ZaLB7CZ1VmX+cr5TIoyKuhOaYlwyEhCTT8tcQgRYiyxyzdiHKdOBQZ53I
   QO5rcrE8MTRYwZsC/v+/IpM/zaRGZqTGz4K3bmrn+dvQkm3M87QScRH+q
   YZ8bmY+udyrwj6QxAzSqLuZw65/vLrmI1CVld9CLeJCcV+s2FvlnnnYxp
   3DTtXDJhbqTZSrP0lmkBngCq72T0AhEg2HIxrqAJaDYsbmRx4FA8o3BBF
   Ru88LPG/iyGUfTTyPkDzJJ/TO/wyT9mcv7cLlQCUQUDfmB55L/FCTuPsV
   Q==;
X-CSE-ConnectionGUID: jkK7B4bmT+2DtjXDy8tbBw==
X-CSE-MsgGUID: cp/aodv6ShyDO3f1S0UfEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40713311"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="40713311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 06:20:22 -0700
X-CSE-ConnectionGUID: W5bc5yd0Ro2DRwBJuC8tZA==
X-CSE-MsgGUID: dX1V+q/+QCeQFeSi2duiNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67201788"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 06:20:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siw7O-000Ifq-11;
	Tue, 27 Aug 2024 13:20:18 +0000
Date: Tue, 27 Aug 2024 21:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13475/23564]
 net/can/j1939/.tmp_socket.o: warning: objtool:
 j1939_sk_queue_activate_next()+0x89: unreachable instruction
Message-ID: <202408272140.3C5OLBQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   73a86ad60aabf460a4c8a0f96a1b2ddb98522fd8
commit: e0c2ee9edcacfdda0e806166eaec1310cdf9e324 [13475/23564] can: add support of SAE J1939 protocol
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240827/202408272140.3C5OLBQP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408272140.3C5OLBQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408272140.3C5OLBQP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/.tmp_socket.o: warning: objtool: j1939_sk_queue_activate_next()+0x89: unreachable instruction
--
>> net/can/j1939/.tmp_transport.o: warning: objtool: j1939_xtp_abort_to_errno()+0xea: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
