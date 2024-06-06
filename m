Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2501754B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 05:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717651204; cv=none; b=ogPWa7odXMqbmU4jy9w1Ilt15bVF++nlj96TtemCxvAvnQ9TagWNkSk4Xetm56Xp+Oa7sPBH+iKFV94kg6b/4fufo2my68YcgEQBWMAm8nVGYU4EisT7ZWIFXAhu6MEXIqW5YeSO3WKxp/o6EVF3VOc3GXEMP/0N+PGiSK72KeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717651204; c=relaxed/simple;
	bh=jC9WxeFM0s9co0wMnwlRxWK/sL6VuIa1DCrDC9DA4xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwYfCVZRsFaVAOOtU2hnb9SSPUvSAD2RPqFoi4nux0goQF98uaMgWeGGoJIVoXpfNb1Nl80sXAFYZh3VmWULmR3bizpWP+tFyJVcjcK4RUzXW3hhTgu56hK9hsWG0pN0b03DT78YGiFhIVwn/zivhiuJRi4DNVXJtMe21gwl4Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIqbLhAj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIqbLhAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717651203; x=1749187203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jC9WxeFM0s9co0wMnwlRxWK/sL6VuIa1DCrDC9DA4xk=;
  b=kIqbLhAjN7Td7MisCNgB9GisfIqsvVhfmD7+0qT9sDIpzM9Zkpi+LiW7
   y+j0U6LVLGBuCLqQGhVLm5/9I3gQC2KXBlBGedhjf4MPsuyYlkKUmdKJy
   u63ctDVLCL3da58pYfTmFFHVhz1/IHizjCVOgMwkUOqUfZVZbx4fMz4YR
   tv1G5JsE7wPzm6EQ00j0hUO8ath6kXK8FliwN5WPi3d4mcDyaL9PR0VIk
   /cCd6X4J0GUbTqjYaIc6bOWllDOs+h6X+w0+r5Y87oxp4wCEMOUo9VWmY
   u/zZT2H2wwoWCbB66u7OayH4gt1oFpqxxMxSx1QHY+AuFG5Iw0jeqmzh/
   g==;
X-CSE-ConnectionGUID: DhqHnd+dTkWNp+HCKjFCcQ==
X-CSE-MsgGUID: FH0NlCiVQY+76AQEcsp6PA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24865239"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="24865239"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 22:20:02 -0700
X-CSE-ConnectionGUID: cj9tNOCAR+24dnw/+nWe5A==
X-CSE-MsgGUID: +fLcoxiyQMmqe+ucsz1FAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37939598"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2024 22:20:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF5Xb-0002hQ-0N;
	Thu, 06 Jun 2024 05:19:59 +0000
Date: Thu, 6 Jun 2024 13:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-6.11 25/29] sparc-linux-ld:
 fs/nfs/nfs3proc.o:undefined reference to `nfs3_init_localioclient'
Message-ID: <202406061318.mKh2NtD9-lkp@intel.com>
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
commit: 51975d922764190b4745b87458026ad1303c4ec4 [25/29] nfs: implement v4 client support for NFS_LOCALIO_PROGRAM
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20240606/202406061318.mKh2NtD9-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061318.mKh2NtD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061318.mKh2NtD9-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: fs/nfs/client.o: in function `nfs_free_client':
   client.c:(.text+0xc18): undefined reference to `nfs_local_disable'
   sparc-linux-ld: fs/nfs/client.o: in function `nfs_get_client':
   client.c:(.text+0x1e50): undefined reference to `nfs_local_probe'
   sparc-linux-ld: fs/nfs/inode.o: in function `init_nfs_fs':
   inode.c:(.init.text+0x144): undefined reference to `nfs_local_init'
   sparc-linux-ld: fs/nfs/pagelist.o: in function `nfs_initiate_pgio':
   pagelist.c:(.text+0x35c): undefined reference to `nfs_local_doio'
   sparc-linux-ld: fs/nfs/pagelist.o: in function `nfs_generic_pg_pgios':
   pagelist.c:(.text+0xf28): undefined reference to `nfs_local_file_open'
   sparc-linux-ld: fs/nfs/write.o: in function `nfs_initiate_commit':
   write.c:(.text+0x494): undefined reference to `nfs_local_commit'
   sparc-linux-ld: fs/nfs/write.o: in function `nfs_commit_list':
   write.c:(.text+0x17c8): undefined reference to `nfs_local_file_open'
>> sparc-linux-ld: fs/nfs/nfs3proc.o:(.rodata+0xe0): undefined reference to `nfs3_init_localioclient'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
