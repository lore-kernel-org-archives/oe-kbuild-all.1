Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FEE288D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 11:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773746214; cv=none; b=c9/2+SFkq7u3/ojyw2vvBXDN6mule+j9c1L9xBwHTDNPHo7jd5qmLeahhbPx2X/NiZQA7fZ1hp5KGdHeMngCvxTe1n6uXdvNs80MffY7XViyAxRdxEWn3kn3fCyzlGOd4geGZ8hYAL2aNmJr0HTJlOSSrqlZ8A4aXPxcECaC5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773746214; c=relaxed/simple;
	bh=vLM74iFx9HbvlOWWYGVbOmyxL3IJjQvLzKQrOB83Igk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U0RtD423+Z1uGb171SXCcsQ+ICj4o4fNXUzn+W8Ddf8dTnHDNzvxI2RcyHrt3ed8prBwEequCwexLG4Lx/7vOTWLXZ/O3dplqRqL/Clx2RDkE9gGdIgRxLUSQNNjen+xxGXmonX/66sHq11fsKu4bqIKyhRGAQa+Zs9o67LNjns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCkKjSrB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCkKjSrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773746213; x=1805282213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLM74iFx9HbvlOWWYGVbOmyxL3IJjQvLzKQrOB83Igk=;
  b=nCkKjSrBKYyX75gRf6Y48MACv11eDVoxC+77L3txpNp25NM+VARd2e4I
   XYT8mNHHavzM/SctDvBC6Pys+6OcCgyH9MisYKcl5KXNlE8IohQ/btnW5
   885SZVyBNwJXExALWIoQWi8NdZ3I+L4zcBdpwc5rBQIH6UKcdPIuAv8On
   5pm/WKXet625GRjjiTqLEOyMOhbPgKqAsVBr9trpeeqlFBKJsxaYxRjS4
   Vo3ujiEJqXgrmgW/WID4DBTuG9rAhwU9/NEY2YqfO648/fNmX/OIPe7qy
   HVlBsSn862W9rRlBQ02T/lsmSHeOuTLSU5LHs5wrBd73lk/oHyPqYaBC1
   w==;
X-CSE-ConnectionGUID: Zr1qPBUKQouh3XybplKyLg==
X-CSE-MsgGUID: w6lCgYroT66M86ClBhdrAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73793976"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73793976"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:16:50 -0700
X-CSE-ConnectionGUID: kFimtVaHRnmEoCm1izyDlQ==
X-CSE-MsgGUID: Q6t+qAOsTvewe+p+feQfbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222462739"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 04:16:49 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2SPm-000000000Ip-0ddt;
	Tue, 17 Mar 2026 11:16:46 +0000
Date: Tue, 17 Mar 2026 19:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5908/6556] ERROR: modpost:
 "rdma_destroy_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
Message-ID: <202603171901.r66SjVrH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95c541ddfb0815a0ea8477af778bb13bb075079a
commit: 314794b19fb4b08aba87ff06d650a1d38c86c094 [5908/6556] drbd: remove BROKEN for DRBD
config: x86_64-randconfig-075-20250826 (https://download.01.org/0day-ci/archive/20260317/202603171901.r66SjVrH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171901.r66SjVrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171901.r66SjVrH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rdma_destroy_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_create_qp" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "__rdma_create_kernel_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_bind_addr" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_listen" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_destroy_qp" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_resolve_addr" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_disconnect" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_connect" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_reject" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
