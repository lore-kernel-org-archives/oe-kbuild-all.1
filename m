Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BD21D619D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736169541; cv=none; b=jJ3hZ5Mp+ZsbhG5LGZpPudnzTtjAqPjsVh1i1wM0gB7bhjseNbEV5oN9Q3Ftms9D3TE2AkuRpozBz4dHn78/bQQc6STjLzXebNnObSvC7qCvBdpLtedkQPGFLhkykVP0CO2uu/wX+UEFXgeAzRcAmi6iiQUHpv7alabv4gPqEyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736169541; c=relaxed/simple;
	bh=iaklf9DEVwCNzEqO5KAmrRsD8cAqlpSDO2p7pKWRjwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCSHJp1EuNlgzzIiiEgvBgdZN5byzIsdbgmDtINpi/C34CbTAryN/1A/m7CRgvD1NXXjylmXxQVyJmaP3RK2fc1QUQeP+gmZEmWDsLpb3mtV7ULI+3svAHUpSkPJ6JZgRZZTVfMRsZwvy5/kx0KVgH9Na2zsj9Zm/XwMeH1XMBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/+1f13P; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/+1f13P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736169540; x=1767705540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaklf9DEVwCNzEqO5KAmrRsD8cAqlpSDO2p7pKWRjwc=;
  b=V/+1f13PRzzP/CnF1wYEeiYxDnwt9VprJR8LKOVPjoCbelrg0ZmzAxoh
   6u8sfFpvwj+SlZgmveNqpEWSxNVa+tiiQk0IPT7g+R4bRkytuxAZqq+d4
   m3NRtdQGn3vs0WoBMuSiifOQDEk0wz/pfnSvmUX4Nxbr0OhBW1scuVKK3
   Ogn/tKn4snPDzFAq4Ohi15BAkzs3NuP9p2iKPPQ3JRdrcI5TnVon95Ke8
   8eSIRRQw6QeGXd3JmYPQEvpagG1fPcR0ED9BdUSg+2hIFs0U/Hzqmh8T8
   9YIzb4bBsYGj4U1mju7XLu52OG1MT4huP81CvAkofen+Pa/p/vqAPFAFN
   Q==;
X-CSE-ConnectionGUID: T32JfP5ERKaB/+0rIM7QHQ==
X-CSE-MsgGUID: tXzXr2U2QC6RyJtiyfu6tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36475035"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36475035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 05:18:57 -0800
X-CSE-ConnectionGUID: 3dXtHLg1SxS2yEuEEVoLcw==
X-CSE-MsgGUID: WAcLNY+MR8WAtNiZOmH4cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102959409"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2025 05:18:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUn0P-000Ce5-1P;
	Mon, 06 Jan 2025 13:18:53 +0000
Date: Mon, 6 Jan 2025 21:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 23372/25291] fs/pstore/zone.c:1329:31:
 error: 'SECTOR_SIZE' undeclared; did you mean 'AT_VECTOR_SIZE'?
Message-ID: <202501062127.ZODA9aXN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 7fd72e0ffe7119a2c76785aa88ca99a3e9557ceb [23372/25291] mm: don't include <linux/blk-cgroup.h> in <linux/writeback.h>
config: x86_64-buildonly-randconfig-006-20250106 (https://download.01.org/0day-ci/archive/20250106/202501062127.ZODA9aXN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062127.ZODA9aXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062127.ZODA9aXN-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/pstore/zone.c: In function 'register_pstore_zone':
>> fs/pstore/zone.c:1329:31: error: 'SECTOR_SIZE' undeclared (first use in this function); did you mean 'AT_VECTOR_SIZE'?
    1329 |         check_size(kmsg_size, SECTOR_SIZE);
         |                               ^~~~~~~~~~~
   fs/pstore/zone.c:1317:53: note: in definition of macro 'check_size'
    1317 |                 if (info->name > 0 && info->name < (size)) {            \
         |                                                     ^~~~
   fs/pstore/zone.c:1329:31: note: each undeclared identifier is reported only once for each function it appears in
    1329 |         check_size(kmsg_size, SECTOR_SIZE);
         |                               ^~~~~~~~~~~
   fs/pstore/zone.c:1317:53: note: in definition of macro 'check_size'
    1317 |                 if (info->name > 0 && info->name < (size)) {            \
         |                                                     ^~~~


vim +1329 fs/pstore/zone.c

d26c3321fe18dc WeiXiong Liao     2020-03-25  1283  
d26c3321fe18dc WeiXiong Liao     2020-03-25  1284  /**
d26c3321fe18dc WeiXiong Liao     2020-03-25  1285   * register_pstore_zone() - register to pstore/zone
d26c3321fe18dc WeiXiong Liao     2020-03-25  1286   *
d26c3321fe18dc WeiXiong Liao     2020-03-25  1287   * @info: back-end driver information. See &struct pstore_zone_info.
d26c3321fe18dc WeiXiong Liao     2020-03-25  1288   *
d26c3321fe18dc WeiXiong Liao     2020-03-25  1289   * Only one back-end at one time.
d26c3321fe18dc WeiXiong Liao     2020-03-25  1290   *
d26c3321fe18dc WeiXiong Liao     2020-03-25  1291   * Return: 0 on success, others on failure.
d26c3321fe18dc WeiXiong Liao     2020-03-25  1292   */
d26c3321fe18dc WeiXiong Liao     2020-03-25  1293  int register_pstore_zone(struct pstore_zone_info *info)
d26c3321fe18dc WeiXiong Liao     2020-03-25  1294  {
d26c3321fe18dc WeiXiong Liao     2020-03-25  1295  	int err = -EINVAL;
d26c3321fe18dc WeiXiong Liao     2020-03-25  1296  	struct psz_context *cxt = &pstore_zone_cxt;
d26c3321fe18dc WeiXiong Liao     2020-03-25  1297  
d26c3321fe18dc WeiXiong Liao     2020-03-25  1298  	if (info->total_size < 4096) {
d26c3321fe18dc WeiXiong Liao     2020-03-25  1299  		pr_warn("total_size must be >= 4096\n");
d26c3321fe18dc WeiXiong Liao     2020-03-25  1300  		return -EINVAL;
d26c3321fe18dc WeiXiong Liao     2020-03-25  1301  	}
cbf82e35031b13 Christoph Hellwig 2020-10-16  1302  	if (info->total_size > SZ_128M) {
cbf82e35031b13 Christoph Hellwig 2020-10-16  1303  		pr_warn("capping size to 128MiB\n");
cbf82e35031b13 Christoph Hellwig 2020-10-16  1304  		info->total_size = SZ_128M;
cbf82e35031b13 Christoph Hellwig 2020-10-16  1305  	}
d26c3321fe18dc WeiXiong Liao     2020-03-25  1306  
34327e9fd21341 WeiXiong Liao     2020-03-25  1307  	if (!info->kmsg_size && !info->pmsg_size && !info->console_size &&
34327e9fd21341 WeiXiong Liao     2020-03-25  1308  	    !info->ftrace_size) {
d26c3321fe18dc WeiXiong Liao     2020-03-25  1309  		pr_warn("at least one record size must be non-zero\n");
d26c3321fe18dc WeiXiong Liao     2020-03-25  1310  		return -EINVAL;
d26c3321fe18dc WeiXiong Liao     2020-03-25  1311  	}
d26c3321fe18dc WeiXiong Liao     2020-03-25  1312  
d26c3321fe18dc WeiXiong Liao     2020-03-25  1313  	if (!info->name || !info->name[0])
d26c3321fe18dc WeiXiong Liao     2020-03-25  1314  		return -EINVAL;
d26c3321fe18dc WeiXiong Liao     2020-03-25  1315  
d26c3321fe18dc WeiXiong Liao     2020-03-25  1316  #define check_size(name, size) {					\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1317  		if (info->name > 0 && info->name < (size)) {		\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1318  			pr_err(#name " must be over %d\n", (size));	\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1319  			return -EINVAL;					\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1320  		}							\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1321  		if (info->name & (size - 1)) {				\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1322  			pr_err(#name " must be a multiple of %d\n",	\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1323  					(size));			\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1324  			return -EINVAL;					\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1325  		}							\
d26c3321fe18dc WeiXiong Liao     2020-03-25  1326  	}
d26c3321fe18dc WeiXiong Liao     2020-03-25  1327  
d26c3321fe18dc WeiXiong Liao     2020-03-25  1328  	check_size(total_size, 4096);
d26c3321fe18dc WeiXiong Liao     2020-03-25 @1329  	check_size(kmsg_size, SECTOR_SIZE);
0dc068265a1c59 WeiXiong Liao     2020-03-25  1330  	check_size(pmsg_size, SECTOR_SIZE);
cc9c4d1b559716 WeiXiong Liao     2020-03-25  1331  	check_size(console_size, SECTOR_SIZE);
34327e9fd21341 WeiXiong Liao     2020-03-25  1332  	check_size(ftrace_size, SECTOR_SIZE);
d26c3321fe18dc WeiXiong Liao     2020-03-25  1333  

:::::: The code at line 1329 was first introduced by commit
:::::: d26c3321fe18dc74517dc1f518d584aa33b0a851 pstore/zone: Introduce common layer to manage storage zones

:::::: TO: WeiXiong Liao <liaoweixiong@allwinnertech.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
