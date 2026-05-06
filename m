Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4483E3166
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055918; cv=none; b=MWkdnMkUSrV7Jjlv84nX7cHQNDCahWjw2alXNRRSIlzOghRI86Mn+O+hUJr7eecpULhYZ07n509rIC1euSUJD5AYpbjcm6TdY3zy/Bj4EXsDEPTRLIlg+lBdrIPwu81z2EwmnuJU0LiOnYuwb5Ldo0xxrDR42HEMQ0oBmldIEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055918; c=relaxed/simple;
	bh=N12nPZYf2u1yr3Ev14RSnFNpCOpeV7gF83ycOxTXIVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iCsejr2mYzL0FWDE7kBCM7dDdQzw5knoKwWNXebEjrmFvmy3OgR6ZAdI08ZGgHEgs0Lao910UFXKHqTEKhjaqECshUT32dXs9HA99pTXecc6KrV/z02NqkNhukV75lakYnDEdmIDbKe8/lO4CXy6lgLkqRF1TdJey117cULewM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geA+/hIq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geA+/hIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055916; x=1809591916;
  h=date:from:to:cc:subject:message-id;
  bh=N12nPZYf2u1yr3Ev14RSnFNpCOpeV7gF83ycOxTXIVQ=;
  b=geA+/hIqeFCr/SrEyVAhfplrD3FChHmwJ1fCi74+NAJ7lzwKWOmw8aLt
   gLJ+DG5IiJWYtWCXTDOA8iCUXUQgmNULsJM6KnUK6QAXw6rgKxf7oELVR
   D5caaR7eFQkM31+Ch5pdqCaSt480N2CxbEXBo6g8uy9BDlf0Ck2Tb5+N3
   bilN3flGkxGHqKYmq6oMRG7FFKlPhSATopU14KPj5tKrICh1HSdAzipdL
   6iWk6Z9B5g8tiM+Pvd1imbII0RMSJqa3HlNJwT/p2UtVdQOZyBq0EdziB
   WQJhWNzoVET1eJWnW38GHYRnB4Ui3Pfw139sqZQ5otu4JnHEGAnv4tLJ3
   A==;
X-CSE-ConnectionGUID: CcypJVlaRkGpIBNJL5uEDw==
X-CSE-MsgGUID: V715RnYXTG2z81+RB/zHeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66509680"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66509680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:25:15 -0700
X-CSE-ConnectionGUID: 1RWtM83CSPuH5Do7c+RBRA==
X-CSE-MsgGUID: xz4WsTfvQv+UAp2+qS7juw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2026 01:25:14 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKXZA-000000000on-05ct;
	Wed, 06 May 2026 08:25:12 +0000
Date: Wed, 06 May 2026 16:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_transport_instance_handle_V1 4/5]
 drivers/firmware/arm_scmi/transports/virtio.c:187:29: error: use of
 undeclared identifier 'mutexname'; did you mean 'putname'?
Message-ID: <202605061629.PXw0so2F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_transport_instance_handle_V1
head:   13190d4c752c9adc3184690ccf035795be170fb9
commit: 25da96b2ceb31392d167fcc5d252a1f26ccae5c4 [4/5] firmware: arm_scmi: virtio: Rework transport probe sequence
config: powerpc-randconfig-r073-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061629.PXw0so2F-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061629.PXw0so2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061629.PXw0so2F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/transports/virtio.c:187:29: error: use of undeclared identifier 'mutexname'; did you mean 'putname'?
     187 |         .mtx = __MUTEX_INITIALIZER(mutexname),
         |                                    ^~~~~~~~~
         |                                    putname
   include/linux/mutex.h:83:29: note: expanded from macro '__MUTEX_INITIALIZER'
      83 |                 __DEBUG_MUTEX_INITIALIZER(lockname) \
         |                                           ^~~~~~~~
   include/linux/mutex.h:40:14: note: expanded from macro '__DEBUG_MUTEX_INITIALIZER'
      40 |         , .magic = &lockname
         |                     ^~~~~~~~
   include/linux/fs.h:2539:13: note: 'putname' declared here
    2539 | extern void putname(struct filename *name);
         |             ^
   1 error generated.


vim +187 drivers/firmware/arm_scmi/transports/virtio.c

   185	
   186	static struct scmi_virtio_suppliers scmi_transport_suppliers = {
 > 187		.mtx = __MUTEX_INITIALIZER(mutexname),
   188		.available = INIT_ERR_PTR(-EPROBE_DEFER),
   189		.th.supplier_get = scmi_virtio_supplier_get,
   190		.th.supplier_put = scmi_virtio_supplier_put,
   191	};
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
