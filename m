Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7A438B127
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404320; cv=none; b=lv1OL41YOjyC13hwHtvR6AtPIb3DA7f8ebl7emfU1mBr7e5QOeXOis1hhkiG18Gr+sHoHnuQAlhVdSGH1syv/cObonQgFaZ/Z9gEdNoGeB3aka0gqwAifn5if57CV3QNhZXREi4g8xxOqueRjqJ370aMjdMnOSh8DU3G1+bQDko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404320; c=relaxed/simple;
	bh=lol4p56G0lg7EalNZ0Rkf24SBgpx8IlAtpTsX5Ba/hE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RjPWm3vRCtxcmdtlRaRPWjbmFfsbIbjS/V9ZL/crFmzK8bfrPH8hu1lzGAqpK2X5foaTNo39LRR24193bvq0Ty5RD4ncZNv6R5Su1pchWRrJtbBNUx5lVx0OX6dEmrBE+GLSJ7z6c6lBZVUHd7bcpAub9qxEKBKOpmYbHVryUgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAz0mnqu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAz0mnqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790404318; x=1821940318;
  h=date:from:to:cc:subject:message-id;
  bh=lol4p56G0lg7EalNZ0Rkf24SBgpx8IlAtpTsX5Ba/hE=;
  b=PAz0mnquuBgrsyVUZIljLSKANdQJvkIOdDQfq93aTQLdIY/lVhKgtfYY
   I9W+k+OKBydL1JfeH4Z8MFNJ8tQhYDMa5zEn8/AawrhLf8bWxbEfFPN4K
   zEiuilUovvXU+UY3BrdlTLbVM3lWn5ODFA1xRv9kFzG/kVAvmL0jBRx66
   1+D0kDf2k5lJTUMaFozJWf01K7wkR3Q3r/HR9BEI57iYlDAsfRcE+poBu
   7jZ0LMC8+L9n42fyRrkVQ9oTObYSq69SnN2+604aDszKCKhNrI8b83/Px
   OP5x/rdykf2gd3DtLZyNrSSAi06N+s9dyfrtR0Z1N53VvV9aQhVWWSyb0
   w==;
X-CSE-ConnectionGUID: mKRz5vPURqeNjSKTeF+tBg==
X-CSE-MsgGUID: i15IRIT+SPesIOvsMgBPWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="94999232"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="94999232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 23:31:56 -0700
X-CSE-ConnectionGUID: 8Ua+oinCRLOPJuDT8pC6BA==
X-CSE-MsgGUID: 6DaFeBcmStG00p/Ny/kBQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="271001830"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Sep 2026 23:31:55 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xALwv-000000000RL-1zH9;
	Sat, 26 Sep 2026 06:31:53 +0000
Date: Sat, 26 Sep 2026 08:31:21 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 555/673] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202609260854.VAsMqwPd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: a7a9731f5a0ae2c1f5b2da79117a51ed502c9554 [555/673] no abit change
reproduce: (https://download.01.org/0day-ci/archive/20260926/202609260854.VAsMqwPd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6158: FILE: include/uapi/linux/mptcp.h:139:
+	__u16 :16;				 /* sizeof(mptcp_full_info) needs to be padded to
+						 * 64 bits, but the mptcp_info member on m68k is

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
