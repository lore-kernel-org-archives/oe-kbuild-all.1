Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8C221DB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 22:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713004; cv=none; b=GQzdZijsw9Fy3B+vqEB2Mqx/LJKFElsXfVbKUMoffb45154yGNhbldXo0x0ZZGdVPJRa5VhkZIFMqxe8FhAXtrePlYuDjGI/Ropyuv1KTyykJpOie1ccBzT08pmWd+P7zbJJ5VjhyqoqLM5A5tHumXiCHSP9ZPA2rYbGJL2XuWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713004; c=relaxed/simple;
	bh=JPeWIk0eR6fJe+aqVlYRl4BBY6AHtPrtKKEVbai5McA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ccBli/7jxMXZlnfbMZau1/9SoX4CfqqbKm6UGnf2cJkWifGpxZVGlM4FMgSksOnMpe/HsJ3DHApXapzdonFH4MrImyKmnSC0aLAM9/itoRF1zRUvqJZrprEBGZUcTpZ2Jvmvt5CQzwCWkJXnyTr37eXRyfHa5qxvXmCuTAfh7bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvHD7RDw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvHD7RDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778713001; x=1810249001;
  h=date:from:to:cc:subject:message-id;
  bh=JPeWIk0eR6fJe+aqVlYRl4BBY6AHtPrtKKEVbai5McA=;
  b=hvHD7RDwBMKV9YjJLQnMi3sNzqOOTgI+5nXgreLNurzz+jJtUC5CHF3U
   U3oNC4Ci4y5cyuTkWeY3f7E7KmPlYRmGaM3sJxd92wb6xnXT8DRPs4IXh
   JrGWPYwRElT4KxEOz5N9PJotkIoMAtRopUUJchYV5yI3SusgbSzcuC39z
   w7AK33lDEU0AqbdeeRRV4XFqRqvsym4INPDC3UsS3aGAt14pHCDqLZmoV
   U8BZCAZBTxL2SgFpWb0LyiR1OtHkmdpI1fO9lCMnch9gqLuASxDm4HSZp
   TdRcDOIKo0Evef7Q3TsPUOgRYSIDhQcv6RXmchftsum1kQjfivF0ntUhP
   A==;
X-CSE-ConnectionGUID: zP00EWuGQ7WikrB1UCbLUg==
X-CSE-MsgGUID: 829+qwTwS2eFRP1+FQ/4Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78795716"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="78795716"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 15:56:41 -0700
X-CSE-ConnectionGUID: EBZRdRcYRrSA2s4XdqxKBg==
X-CSE-MsgGUID: s4YIcRloRcOmdOQqYPgibw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238104226"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2026 15:56:39 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNIVI-000000005GH-3MSt;
	Wed, 13 May 2026 22:56:36 +0000
Date: Thu, 14 May 2026 06:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 7/11]
 security/hornet/hornet_lsm.c:51:25: error: 'struct bpf_prog_aux' has no
 member named 'security'
Message-ID: <202605140655.YX9jzufG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8
commit: c62310df81899f7e14d632271aba08d0a55e2318 [7/11] lsm: introduce the Hornet LSM
config: csky-randconfig-r071-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140655.YX9jzufG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140655.YX9jzufG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140655.YX9jzufG-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/hornet/hornet_lsm.c: In function 'hornet_bpf_prog_security':
>> security/hornet/hornet_lsm.c:51:25: error: 'struct bpf_prog_aux' has no member named 'security'
      51 |         return prog->aux->security + hornet_blob_sizes.lbs_bpf_prog;
         |                         ^~


vim +51 security/hornet/hornet_lsm.c

    47	
    48	static inline struct hornet_prog_security_struct *
    49	hornet_bpf_prog_security(struct bpf_prog *prog)
    50	{
  > 51		return prog->aux->security + hornet_blob_sizes.lbs_bpf_prog;
    52	}
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
