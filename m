Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795752C029D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387051; cv=none; b=CfaPBB0AoKz/76QG771meDWuefUVdOwcSwJNC6W7+39zVMa0L1ev/jhs1eMylsal5rb4LtYUlQDHfMFAcTIBiLK518SCnnevakG+d8RYeYdpxwtqHsjxycuwNHK9ITaPBmWMExfbGap3MJqjbh+j2WP3EVumB1kYMsZMv1XX+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387051; c=relaxed/simple;
	bh=SM9SoC5DB28HT3fcQgSPk8n0t5oUlAQn8gL+/OHiVKA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lSKHIVgsRfNxus7dX/Bz3FIQ1980kUtgIKrksrCLCFFNuh/xipIuVIgpESTghp6GsZ6rlQDe+2ZKXY+VnejgL5GC9zpN4BBcPpVwZdt+CQ136f1tL60w535LypXSbcRM4aZWJ6RzA7QsgRpCwS6nZuAjTV412xdi0I4Isq0P948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnkFvknU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnkFvknU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387050; x=1811923050;
  h=date:from:to:cc:subject:message-id;
  bh=SM9SoC5DB28HT3fcQgSPk8n0t5oUlAQn8gL+/OHiVKA=;
  b=dnkFvknUzix7n3UMM6SndtM2WiyWcmzg/GCOZCV5AcuwG8VZ9UaYQ2v3
   CK83MNEaGJEpicNznXlASWrGXUuDnY7oxx6X+8dtD0wS3dDcqegs/jGyy
   BGQmBEIs/2l6ORslhbTdd7moi0Gz+irQ78ZOSBQpl4Nx/4+jqnB0X/IoY
   mjNjlwNXl7aUmZJHRX1jzu236YXqfKveuOzu3ogtnTHuHNRb0NRaUtX+u
   d7lFhPhaueXKwy8VCKUKUqjX2l2DkUOlg7C5AS2ng5UbANf3UBNhZdyWV
   +D2RGpCo/iZ3uJMzjA2MuVie77fihc8HnS0KwUYQv19bpbP3CuvcbIlbV
   Q==;
X-CSE-ConnectionGUID: jPfAtdQNQPW3JCijZ4EZdg==
X-CSE-MsgGUID: 8IZ3d2qgSaWGfIio0WqF8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106610991"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="106610991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 00:57:27 -0700
X-CSE-ConnectionGUID: UO4gzmMlSNe5aFJfl8FjYA==
X-CSE-MsgGUID: vkd13+qASjyGCnKjA3UDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243023365"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jun 2026 00:57:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUK02-00000000Bgo-3amr;
	Tue, 02 Jun 2026 07:57:22 +0000
Date: Tue, 02 Jun 2026 15:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Eliot Courtney <ecourtney@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Subject: [linux-next:master 8361/9733] vmlinux.o: error: objtool:
 _RNvMNtCsel4MriKkfEK_9nova_core2fbNtB2_11SysmemFlush8register+0xcf: can't
 find jump dest instruction at
 .text._RNvMNtCsel4MriKkfEK_9nova_core2fbNtB2_11SysmemFlush8register+0x15c
Message-ID: <202606021537.8A5qMiqj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: d8143c9e988be01c9471f1cf0551208992d49918 [8361/9733] gpu: nova-core: unregister sysmem flush page from Drop
config: x86_64-randconfig-r054-20260601 (https://download.01.org/0day-ci/archive/20260602/202606021537.8A5qMiqj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021537.8A5qMiqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021537.8A5qMiqj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: _RNvMNtCsel4MriKkfEK_9nova_core2fbNtB2_11SysmemFlush8register+0xcf: can't find jump dest instruction at .text._RNvMNtCsel4MriKkfEK_9nova_core2fbNtB2_11SysmemFlush8register+0x15c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
