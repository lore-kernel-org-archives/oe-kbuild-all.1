Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E598F48A2DD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082802; cv=none; b=lWVQUt3HZL5m3fbMyF5tFDw38S2SurePS+yBabJDCs1E47VaqxwnWfnBKZ+huDLqkJc/NyB++TlvkEZKMUCbPXBByV+8DtTs2ldmotjeG+hWvMFEAK6hX1CglOxpUEuC/NVK02WR9ccTJdl8VZ8zsMe5aYfKcj0Es7ItkBoQ+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082802; c=relaxed/simple;
	bh=4qw+GMxXr2VHCqCso67lwn8gSTDaAJCN23d6t0JJC+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VYZe52AdLWE38p9IGpt/LutaV4L5QTvtGZ4naULnt/yNYUZhD7AMA4emOFfIkmIbxHYYh64UzPCc5heE0YgAUofyhxv1p5d3jlGkFZT8+s9GKAvEvB9rqpE3LOgJtQNMGqQ8Px59Q6j0Rrl2ZVPSWvkWZpZzjRHZG/xwstzBG1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR6ePnbK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR6ePnbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778082799; x=1809618799;
  h=date:from:to:cc:subject:message-id;
  bh=4qw+GMxXr2VHCqCso67lwn8gSTDaAJCN23d6t0JJC+M=;
  b=lR6ePnbKjsfaYDKVDU1bmE/GHis6C0275UCpP3JdXId3g12mO9UKcQgN
   1YV5eQPmnwE8PpTSznHa1vCDBdgKzgQX44xGI1pgwh2vhjpvJ/hsMx9yI
   J/IuWV5sDAg0csUx/kAI7k/Jqa63N/6kq1XAaRwgq5psfymEFZRutW7/h
   fDPrau7blM4c90uiTh0DcDSrnLoSQEw8XRcPalLFC5ZatSC4PN2wDYPId
   2JW8xk7dFWVTB8sHGzkCgAk3dGbCB6mRNUtyOewiFW5bIOpdpx/fVIAS/
   u3omBvhBRrCZFM2X3ALY2Nqwp12QUeUujKtXoIsYuD8lC2iD9KO4lb1gU
   w==;
X-CSE-ConnectionGUID: WSo5wxhiQKyspSc8OQ3M7g==
X-CSE-MsgGUID: ccKS7fE7Tm+ang40o0EtRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78045741"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78045741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:53:16 -0700
X-CSE-ConnectionGUID: 6JJOb9qbRoaNMMRIPf0hwA==
X-CSE-MsgGUID: B4W3A275QFqQmUM9w4/RcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240521296"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 May 2026 08:53:14 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKeYi-0000000011p-1SrU;
	Wed, 06 May 2026 15:53:12 +0000
Date: Wed, 06 May 2026 23:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_transport_instance_handle_V1 5/5]
 drivers/firmware/arm_scmi/transports/optee.c:224:29: error: 'mutexname'
 undeclared here (not in a function); did you mean 'putname'?
Message-ID: <202605062352.W8s6RMdv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_transport_instance_handle_V1
head:   13190d4c752c9adc3184690ccf035795be170fb9
commit: 13190d4c752c9adc3184690ccf035795be170fb9 [5/5] firmware: arm_scmi: optee: Rework transport probe sequence
config: arm64-randconfig-001-20260506 (https://download.01.org/0day-ci/archive/20260506/202605062352.W8s6RMdv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605062352.W8s6RMdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605062352.W8s6RMdv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:20,
                    from include/linux/uprobes.h:19,
                    from include/linux/mm_types.h:16,
                    from include/linux/page-flags.h:13,
                    from arch/arm64/include/asm/mte.h:15,
                    from arch/arm64/include/asm/pgtable.h:12,
                    from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:12,
                    from drivers/firmware/arm_scmi/transports/optee.c:6:
>> drivers/firmware/arm_scmi/transports/optee.c:224:29: error: 'mutexname' undeclared here (not in a function); did you mean 'putname'?
     .mtx = __MUTEX_INITIALIZER(mutexname),
                                ^~~~~~~~~
   include/linux/mutex.h:40:14: note: in definition of macro '__DEBUG_MUTEX_INITIALIZER'
     , .magic = &lockname
                 ^~~~~~~~
   drivers/firmware/arm_scmi/transports/optee.c:224:9: note: in expansion of macro '__MUTEX_INITIALIZER'
     .mtx = __MUTEX_INITIALIZER(mutexname),
            ^~~~~~~~~~~~~~~~~~~


vim +224 drivers/firmware/arm_scmi/transports/optee.c

   222	
   223	static struct scmi_optee_suppliers scmi_transport_suppliers = {
 > 224		.mtx = __MUTEX_INITIALIZER(mutexname),
   225		.available = INIT_ERR_PTR(-EPROBE_DEFER),
   226		.th.supplier_get = scmi_optee_supplier_get,
   227		.th.supplier_put = scmi_optee_supplier_put,
   228	};
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
