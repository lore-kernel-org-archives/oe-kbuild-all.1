Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304213F9C5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 04:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717649943; cv=none; b=tcAepTauoGV4z1G79wuSjOMaVsQxUp21TSbuD/ZEmKSPrp6s262uEMD6ImnEV2fxIeX7bf5pdc9AYaWxL/4jXFDcxNOwu50TLRLw4WzYRrXB8H99irVkPeW6MYA0vGb16hdK6SLS5uZ1gQOuVGuOdmE5mu4FHyXsL5Kec7h5hDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717649943; c=relaxed/simple;
	bh=qpANnTn8oRchJ8tLsF3t6oEgeDUgSsl3mlY9qRyjp4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UmlG65Qe4vaCRlhehqZ6klQmw7G4L5kwf/dg+Hl0wIuGcqikORukC2Ap5teGcYmUl4xRzq+5E8KNGdatkXvKaoiD6olluk8++Z/PAdQP63JgEGWEIfz2hRsxupDaHrlYYJ8IdxRZJs/uIoMBCL/afDTLbGLzQGVPJogwxzuMPOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZT3+8sfz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZT3+8sfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717649942; x=1749185942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpANnTn8oRchJ8tLsF3t6oEgeDUgSsl3mlY9qRyjp4k=;
  b=ZT3+8sfzHdich75GqYE964MNGqeDpqaKqZXNnh3hOU0jqZaEBDBEZiyT
   OMSCkMGFtDGAlKWaoUWbf5vdZLOpFM4mrV1Xfc/i2VF9SnRleWc9xwaG1
   wI5XTHnMI61brPObdSFXkb3EVpSPKsmluynpik3N14wEPMzLfa2jzidJC
   KHTECXM1Plcu+wM2ACv2jNOqUGXBaocQk3oM/7pSSSb5AIEGOSa6eCSF7
   ERxjoPvx/8zu4IjQ/klS7sG2AiRV+MnEVnSpXQQmNv7u+AV6+AhIP6zoZ
   60AGhDgCj7kSKkZPe3XcVu9BvrQY2BcGZ3sYAKNgCGp/uaJkS0xcIQmnX
   w==;
X-CSE-ConnectionGUID: 1cip+UIBS2STUd35tSK6TA==
X-CSE-MsgGUID: 4LHDe9vrTEiO7oDDGJSbwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25700035"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="25700035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 21:59:02 -0700
X-CSE-ConnectionGUID: wLvN9GAmRT+SSTZhczWmiQ==
X-CSE-MsgGUID: ckP0k+dwTSS2LAJ6fiJPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="38489240"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Jun 2024 21:59:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF5DG-0002gO-1s;
	Thu, 06 Jun 2024 04:58:58 +0000
Date: Thu, 6 Jun 2024 12:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-6.11 21/29] client.c:undefined reference to
 `nfs_local_disable'
Message-ID: <202406061256.vVmFiSNh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11
head:   252b0c685ae2eafa0ced0682a496e9eecf23d1ff
commit: 2a1ae8c2fc5b31814d28cc0be9e4843b07d2acfc [21/29] nfs_common: add NFS v3 LOCALIO protocol extension enablement
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240606/202406061256.vVmFiSNh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061256.vVmFiSNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061256.vVmFiSNh-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: fs/nfs/client.o: in function `nfs_free_client':
>> client.c:(.text+0xea4): undefined reference to `nfs_local_disable'
>> client.c:(.text+0xea4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_disable'
   or1k-linux-ld: fs/nfs/client.o: in function `nfs_get_client':
>> client.c:(.text+0x237c): undefined reference to `nfs_local_probe'
>> client.c:(.text+0x237c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_probe'
   or1k-linux-ld: fs/nfs/inode.o: in function `init_nfs_fs':
   inode.c:(.init.text+0x168): undefined reference to `nfs_local_init'
   inode.c:(.init.text+0x168): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_init'
   or1k-linux-ld: fs/nfs/pagelist.o: in function `nfs_initiate_pgio':
>> pagelist.c:(.text+0x4d0): undefined reference to `nfs_local_doio'
>> pagelist.c:(.text+0x4d0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_doio'
   or1k-linux-ld: fs/nfs/pagelist.o: in function `nfs_generic_pg_pgios':
>> pagelist.c:(.text+0x139c): undefined reference to `nfs_local_file_open'
>> pagelist.c:(.text+0x139c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_file_open'
   or1k-linux-ld: fs/nfs/write.o: in function `nfs_initiate_commit':
>> write.c:(.text+0x8ac): undefined reference to `nfs_local_commit'
>> write.c:(.text+0x8ac): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_commit'
   or1k-linux-ld: fs/nfs/write.o: in function `nfs_commit_list':
>> write.c:(.text+0x1bb0): undefined reference to `nfs_local_file_open'
>> write.c:(.text+0x1bb0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_file_open'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
