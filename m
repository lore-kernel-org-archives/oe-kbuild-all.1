Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8B314B6E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313396; cv=none; b=clQsDpVjqHGDGMZC9sJ3fcBs++3SfXO5WCGt2ztxpzH8zjjP0y7Qkywwf4vlFgtWg4IuKu01HGU61Ycg4O7gAPRKv8AuQsVWfNit8I7QKDx84f6s8HpIZztF8uGvb2qWhOTAD3kYpR43u3CrzimotsPP/jQyRoxOlhiW5bxAVF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313396; c=relaxed/simple;
	bh=qqfsdbMCocLpTRGmymLCw3GCVccM6NODLtvje/7k5ng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cjxxYsJU3y3oTI73ByP15+/ZdQTivrLuwKYXwXhnwV/7rhBwwjPgieStjmb1ygIo6x6HkcRTPnk9etKWBgAq7X4HVgAb7SwfMPYWfxZCczmhYCVaIH37BBizZ/D+7A/cP6GScGFAMaNHMoeE+qakyCFiQ/14e+PlezIUSTXy7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2UoDrCP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2UoDrCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787313395; x=1818849395;
  h=date:from:to:cc:subject:message-id;
  bh=qqfsdbMCocLpTRGmymLCw3GCVccM6NODLtvje/7k5ng=;
  b=a2UoDrCPQOuqd4fczeHpIkJvA2SaWM17oJzGlAHCBzD4KNZWvQ2NJYRN
   E9IMPsu08J6b87IT1ibWka+HxZvzjhCrypMb5mG4xJrKbgbaYADeiL/O6
   PgddjXbqpkcNz2U4ImZEP0SU5aatp5KGTL+g7YUfUsUkO+vkDt/a+dPzE
   WAPBrV4vASGYNuS2KXmnllaDoZXXHJd38rpjzafJ3bQCeiQgCvT4OZ4KX
   mHo+Qc7YzV9tW4hnjGoy23xkAkmrzy4diy56Ct8piciMJLiwZAuJaLBh/
   BTh5IuWDkuUqPdejPtwPQevFhKFGzma22HBkjQj/4h8gqFQklx74MRHas
   A==;
X-CSE-ConnectionGUID: BUOIPnx5RhKmxPPTTmXxuw==
X-CSE-MsgGUID: LnBBvMTzR2CbqoIyDqwG8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989752"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989752"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:56:34 -0700
X-CSE-ConnectionGUID: CNRxDubRSnKXmgWoru/GOw==
X-CSE-MsgGUID: ZUx4JOwpQXSSt2+e/l30dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291174488"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 04:56:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxNrK-00000000ppR-2Szb;
	Fri, 21 Aug 2026 11:56:30 +0000
Date: Fri, 21 Aug 2026 19:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/node_features_v6
 36/44] Warning: kernel/dma/contiguous.c:248 Incorrect use of kernel-doc
 format:  * dma_contiguous_owns_node - is a DMA-owned CMA area hosted by this
 node?
Message-ID: <202608211926.kB0GrtrC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/node_features_v6
head:   38c7f48162aa282dc6a9edfb7011378594057c10
commit: ee74567d3e72b82b307fe5704b4ceec6af0f44bc [36/44] dma-contiguous: add dma_contiguous_owns_node()
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260821/202608211926.kB0GrtrC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211926.kB0GrtrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211926.kB0GrtrC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/dma/contiguous.c:248 Incorrect use of kernel-doc format:  * dma_contiguous_owns_node - is a DMA-owned CMA area hosted by this node?
>> Warning: kernel/dma/contiguous.c:259 function parameter 'nid' not described in 'dma_contiguous_owns_node'
>> Warning: kernel/dma/contiguous.c:259 expecting prototype for dma_contiguous_reserve(). Prototype was for dma_contiguous_owns_node() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
