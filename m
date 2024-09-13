Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5BD1D6C59
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216261; cv=none; b=Ox+IlV4PTqQBwws8gfuO4+hJI0CqrPuVMShphoCTQcUK7QgeQeYf+oYkojS7ulpvaleOpLAagq+0fD99n7hxfzEWSZMzclV55sUkmD9doLq/QUODu5sEh19NzUHGeuLKoe7O6/ujebPhRy0wL4YRyLDmE/tm5IPiGD5gXTH2lC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216261; c=relaxed/simple;
	bh=kxSMssNbiB4zufIky2UW7Kl0dC8eWyxvp3cDKhkp0rU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ge9O12d6Sr70hhb5GBSjbOTrHnPsyNinQmASSFIuyKrqoMJU1ZY+cW30zNNHXJf7YVK6ksrUEjfdHtntVCbxafUFh81wJ7fw6oZEbovoxguCe0yc2Bd1Y1kwXuYvQQPICH6hkSgTTJsZVhOtDVqfQsnLBt5ZdehsJzX2GHTrqPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcTukd3n; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcTukd3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726216259; x=1757752259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kxSMssNbiB4zufIky2UW7Kl0dC8eWyxvp3cDKhkp0rU=;
  b=jcTukd3nQHj+cA/7+ZXpc0RucE2EzxhUVjO/5/h6y8nvxLKh2MnRdJBz
   JKJx6EO3u+m98NLBjdn8TUaPiQmS4SrYO9qxJc/m3fq0nlR345KchTBuG
   JCqbCdi/2+iMFa10otU/TLhs1PrlYqpCz9mUWJR/2+5LLkqrPY/Ixz55/
   pn2JHz6x1wYi6WV8Zy2Mk80ybuhnoSz9VZr7l6TG3N1AYi9tUAreGpNQf
   IPSfqqSaDdJRDUdUii/CSRpLTwzYVykkrg8dxQQDC+TkbGtxwPP9J6umh
   PB5z5DVR7/7G/xIJ7rDkSG1/5xWX26/ogzNNGmFQD3FdtyoJ2y0DTKRt2
   Q==;
X-CSE-ConnectionGUID: BDd6xojFTVa/+q52zp/oPg==
X-CSE-MsgGUID: Wpj5hyc2RzKrx7ig5Ad9PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25259429"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25259429"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 01:30:43 -0700
X-CSE-ConnectionGUID: 8SpxuUXxRIawW0lj8AhQ/w==
X-CSE-MsgGUID: Q22+JEHVRyCrFD/1RSvU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68753890"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2024 01:30:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp1hQ-0006DC-0m;
	Fri, 13 Sep 2024 08:30:40 +0000
Date: Fri, 13 Sep 2024 16:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-6.12/io_uring-discard 1/7] powerpc64-linux-ld:
 fabrics.c:undefined reference to `nvme_tls_key_lookup'
Message-ID: <202409131616.bX29zeY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.12/io_uring-discard
head:   50c52250e2d74b098465841163c18f4b4e9ad430
commit: 318ad4283a6efea8ce5ec2b3c65b6cb19df6b07e [1/7] Merge branch 'for-6.12/block' into for-6.12/io_uring-discard
config: powerpc64-randconfig-r063-20240102 (https://download.01.org/0day-ci/archive/20240913/202409131616.bX29zeY7-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131616.bX29zeY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131616.bX29zeY7-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `nvme_tls_key_lookup'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_options':
   fabrics.c:(.text+0x33d8): undefined reference to `nvme_tls_key_lookup'
>> powerpc64-linux-ld: fabrics.c:(.text+0x3488): undefined reference to `nvme_tls_key_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
