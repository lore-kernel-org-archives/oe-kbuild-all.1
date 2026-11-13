Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570082;
	b=2kkrUcjityOGOszHV/9e8pBX47jGqygQUmvnUO3m5HPJUXAsB5NpiLAf8yq1WfY+85Ve
	 +6gr/W1i9ZsG36iAcCDShSwc8RuEjahE2Bg+eZkLpyGzFIxdK2rzczQjGLEL6e+bYxpjo
	 rL2dR4BOvBDF13ZBJH0MRhQF3u4KE+Ccsc3a7AvURf/YaEN1cLenjDR9Ct3niT1M0LxE1
	 aSkNOEtUWfK3ffpNvc92rmeePPvm+GM4fAiaIKxLOZfX3r5coJ3WInns5WFECcVXj1rCi
	 sWz8zj568cKUjB76YpkdhcenFBVeqSep/uxqplIjvm5klUCpcTUxSFJ1TlkJ0EO8u5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570082;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2t9xUbyoNZefFEzwi+PZNIwyOjCGejeP4QySB9GfJag=;
	b=qduQfBzqyXsZ8iqbeBuuS5cyYKHCVhUte8zyrxn/aScm2RNoOir4wQWY6m916kWsIEMG
	 LsQjaDYoGrEwURCn7cQCZfR+in0qeESnj9pQyEwTr6z/5KtToY13DXg+XR3iIGpVGhb9g
	 MGzQZgtzFZJw922IZ7DdJAM6K/NKALxJlyFlhcN4lHJ0YsCSwL3hAmlVObCoVP8S9se/q
	 5UN92Lot9qudjbplp9PlYnI1u4LqA54hdwJZxAwfu9C4G1BHUeuTj5RDGPbhThybKTsJR
	 QWxwbPE2cpeCv9qYLeod7UVtYM+YaUmIaWOuWILJvLsz9IxMoWMcOH7dXZIihFXu4uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFgBEw5W;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CDE606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 11:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFgBEw5W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794570082; x=1826106082;
  h=date:from:to:cc:subject:message-id;
  bh=RjwgMg9uWsizfbnkyBUjFkMg8nIlOXvmeuiW7wJEitM=;
  b=JFgBEw5W9OGYKPDqmQTyJ/Kyin8NOEa1lbyNDHoVXcy5DyU7uWXxGFU3
   iDuuQ+Qe177eFLNWV1S+UqM7fMmjghmkRV+/ToWSgfvI/uFWsfLegjmOz
   8b8XmGP3gefOwSrwmdcIUZW6zaBuFzwu7D8uyH34fxjtfvMnOH/d2p9WR
   3LHGQnDdDCi3iEzgyAuETust+UMqtL+4NKP5+5upptcBfCMBrryVc7qd8
   TOjT7+/wA6BQRiljjrG/Ctab7lOCtjjm06akLIqF2L1D5CFY9cUh51yxx
   KPAaVJvqPxXNtlIWcB/DaVV8XnaDlYb89MEa2vY03jZTKXEJ+W5l6CxzI
   Q==;
X-CSE-ConnectionGUID: 9Shll0vETrOvNjy3tc635w==
X-CSE-MsgGUID: pbqkralgQFOQwzRDuCzAOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3271468"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3271468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:41:21 -0800
X-CSE-ConnectionGUID: Dpp2nFv+TEK1SfGn8WDvlw==
X-CSE-MsgGUID: WcWKZO1uQDqvIKo+Hh5rXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9064675"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2026 03:41:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRpef-000000012jb-38vC;
	Fri, 13 Nov 2026 11:41:17 +0000
Date: Fri, 13 Nov 2026 19:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 drivers/remoteproc/qcom_q6v5_pas.c:86:6: warning: no previous prototype for
 'adsp_segment_dump'
Message-ID: <202611131918.uBQbA5Zi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   f93af2711dc1f87340c2c1e9b7708ea2b1978a58
commit: dfc82cefe7e475a84df64dcdc14ffa5da630921c [1/1] remoteproc: qcom: pas: Adjust the phys addr wrt the mem region
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261113/202611131918.uBQbA5Zi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131918.uBQbA5Zi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131918.uBQbA5Zi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/qcom_q6v5_pas.c:86:6: warning: no previous prototype for 'adsp_segment_dump' [-Wmissing-prototypes]
      86 | void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
         |      ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_CURVE25519_NEON
   Depends on [n]: CRYPTO [=y] && ARM_CRYPTO [=y] && KERNEL_MODE_NEON [=y] && !CPU_BIG_ENDIAN [=y]
   Selected by [y]:
   - WIREGUARD [=y] && NETDEVICES [=y] && NET_CORE [=y] && NET [=y] && INET [=y] && (IPV6 [=y] || !IPV6 [=y]) && ARM [=y] && KERNEL_MODE_NEON [=y]


vim +/adsp_segment_dump +86 drivers/remoteproc/qcom_q6v5_pas.c

    85	
  > 86	void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
    87			       void *dest, size_t offset, size_t size)
    88	{
    89		struct qcom_adsp *adsp = rproc->priv;
    90		int total_offset;
    91	
    92		total_offset = segment->da + segment->offset + offset - adsp->mem_phys;
    93		if (total_offset < 0 || total_offset + size > adsp->mem_size) {
    94			dev_err(adsp->dev,
    95				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
    96				&segment->da, offset, size);
    97			memset(dest, 0xff, size);
    98			return;
    99		}
   100	
   101		memcpy_fromio(dest, adsp->mem_region + total_offset, size);
   102	}
   103	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
