Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253413E1231
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989391; cv=none; b=q3IEHwiqPOgvA1jnGe1sAdWo4V9ZjlYE3nWMAQ3uhehNZpWmXnnyEL9BvJMd1yZWIc2Mx2KxKbRP480zbVU+SI5baguanI2zIDutcOtm9c1dDZ1J96bjgqaE6pt3pR+/c0ZkMOv+vuqrd6T3YfpNdQufvMtINuaxwTSIaXJayE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989391; c=relaxed/simple;
	bh=h0bxtmB/0k33k7fRxkEP2MkAG2VNDrBYStPpXFS40Pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nh3ELRw2EzyxY6IbuYSD2j9kbxDj7hYq3D/kxF/Xxg5PmSw3/3ckzmR1OGd6r/xQiuQzL0fCN1IZaD5TmVVV6flef1XLP95PIcI5ltT2s8sDeJyUFTV/pXocPfWSmFrJloBqHmNzUjmV0PzBVIagAwQb9DB/HRxuRQC9drM3XRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfGdQ18w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfGdQ18w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779989390; x=1811525390;
  h=date:from:to:cc:subject:message-id;
  bh=h0bxtmB/0k33k7fRxkEP2MkAG2VNDrBYStPpXFS40Pw=;
  b=VfGdQ18wx+PL/1aWbaP7CUxgCbXVvZEFO1fIyc/FaY9N3NsvunfUCVfB
   KGfSoXg94NHfBrib/wVEpHKnIse3gPg6bJCgZClE1D81iDN7xggRG4VH+
   TsZ1kGcqaG0Z/wr/mmLSz+ZyWQ18xjuoITNphjJPYZuyY2+jGUn/gI0en
   SdSAMMLV7M1SiZ/OxvwLZKc8ccmhEAu8EkGclWxxMtnSIApancaflRJrK
   KPgoasYhbdtJXrkm9bjWqvCqWE4BJ++acKHrtmRqaR3153+5J2iVwjL8N
   GZk8/BjAMmVv2BdK3/bfE/uXkfw46dQvMRE7hyl8NwbKbMtPs8UE312I2
   Q==;
X-CSE-ConnectionGUID: 74pmd1yuT/6M5ku7Iuxkpg==
X-CSE-MsgGUID: v/eo4e3IQEStTdKOVI5+YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80690278"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80690278"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:29:48 -0700
X-CSE-ConnectionGUID: Oh7K2lJDRzmRnNcFbZerKg==
X-CSE-MsgGUID: 1777NcH5R+WwHo2rr1b/6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="247555714"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2026 10:29:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSeYC-000000006E6-2Sjs;
	Thu, 28 May 2026 17:29:44 +0000
Date: Fri, 29 May 2026 01:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 15/23] <stdin>:1633:2: warning:
 #warning syscall rootns_wait not implemented
Message-ID: <202605290136.MKeyx7nr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   0026164101f5eaeb1e2394b381d1c3863faeb79d
commit: c33122882bc50e01504936c20aefc86b1dc1bfb5 [15/23] rootns: Implement rootns_wait()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260529/202605290136.MKeyx7nr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290136.MKeyx7nr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290136.MKeyx7nr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
>> <stdin>:1633:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
