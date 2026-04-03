Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80F737F72E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205843; cv=none; b=NaGogoxIWGYMMMjdMjZwNzbNlNrEJBNVnzJxhl1yCrRPHEUZ0VUg1b+ja7LEH5YiyZcgbJtSgMtCHOUnERiF3sCiUNstCqhkowLQe/JEGleOGcMjHqdsbIiEQ8c7CepT5cn3DalJ58vEgoT51FpD6l2bNpHE/Z4LCo7479mK4Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205843; c=relaxed/simple;
	bh=XTGAz++OoB+5aMOxS9s0MPXRRAzjDobMcubgaAqn49Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dowGDRefDQNWUorxHH+g8xLZaYzqQxa56tx2ZlX2i9JT32jxXRtEU46yo/fvyEztEAepr/6Spp9XBCoO6Y5uVlEADoH4PPEs/EDshRKqZ4+UxaZz/LnnQ+QveHFx3/SBx8mDMCCWrBhY6BCQS/oKmkQHywTGfK+yFurCFecGVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMYux0ze; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMYux0ze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205841; x=1806741841;
  h=date:from:to:cc:subject:message-id;
  bh=XTGAz++OoB+5aMOxS9s0MPXRRAzjDobMcubgaAqn49Q=;
  b=EMYux0zejZjNFYSmFJPBKJAlKQhMcT//RsX7t/IM9ojlEpl6W2GuHfOG
   xRIWrtDkqSdl4ssN62k6wPhxDcuSRsP6VKr/2n+sDYWj7ZD1vIzDFG3v4
   i7lUa2YpRTqod5KIn+siEzHpao/xwPQsw6eUOqr36OdfPs5zdV906/PlD
   8YjQ6JPQUq3D/sl8mKxC8JCe84T+uka/sD3qBUsiiyDpaVavIyDx+kVcp
   qSSQE/Hw1Lcl8LpfCXsohHe4RNNbeSVn5/YxZC61k3/VrGvx/LbW3zUiX
   vwUI/SThi/NADFJC+f3wzpQ9Ei7+krfJtRCsPluj8f4ba4e/PGfErbbKm
   w==;
X-CSE-ConnectionGUID: CVUcpxsmSgaZaIU30bMIlQ==
X-CSE-MsgGUID: oag/MGHHRw65vDvjRBuhaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852234"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852234"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:43:59 -0700
X-CSE-ConnectionGUID: +YFybqocRW6XwfpGK+w/3w==
X-CSE-MsgGUID: jg+3vCrlSNK3IDlzjd0ooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943422"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8B-0000000014N-3FS6;
	Fri, 03 Apr 2026 08:43:55 +0000
Date: Fri, 03 Apr 2026 16:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 28/28]
 mm/workingset.c:198:6: warning: no previous prototype for 'unpack_shadow'
Message-ID: <202604030116.BbExJ5AH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   a106900ad13546acde0a828d15c9e6513e6b5f62
commit: 1a3bbc191000a8382db034c86dd4eef905327197 [28/28] ANDROID: mm: export unpack_shadow
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260403/202604030116.BbExJ5AH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030116.BbExJ5AH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030116.BbExJ5AH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:198:6: warning: no previous prototype for 'unpack_shadow' [-Wmissing-prototypes]
     198 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         |      ^~~~~~~~~~~~~


vim +/unpack_shadow +198 mm/workingset.c

   197	
 > 198	void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
   199				  unsigned long *evictionp, bool *workingsetp)
   200	{
   201		unsigned long entry = xa_to_value(shadow);
   202		int memcgid, nid;
   203		bool workingset;
   204	
   205		workingset = entry & ((1UL << WORKINGSET_SHIFT) - 1);
   206		entry >>= WORKINGSET_SHIFT;
   207		nid = entry & ((1UL << NODES_SHIFT) - 1);
   208		entry >>= NODES_SHIFT;
   209		memcgid = entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
   210		entry >>= MEM_CGROUP_ID_SHIFT;
   211	
   212		*memcgidp = memcgid;
   213		*pgdat = NODE_DATA(nid);
   214		*evictionp = entry;
   215		*workingsetp = workingset;
   216	}
   217	EXPORT_SYMBOL_GPL(unpack_shadow);
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
