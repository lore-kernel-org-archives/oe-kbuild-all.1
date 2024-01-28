Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C954D50F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706429544; cv=none; b=g6q3iOO5+ZWz/goIFEPW6sh4+heaw4+i8fBwk5ma/vz/TfzHOaTVQarn4HXrG2nJklxTDkeHAjvgDRo3QdSzN23ZIrx+Eb/mt9Qjg5cXWMKnBsJy4v1/nf/JbOWyKGS2V3vtXi123Hp9l2Nn4ze1hTH7jy0z3QEuyl8OnwRgEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706429544; c=relaxed/simple;
	bh=tGELzaHmhka77syXYmDsQkPGSueLjDMHrTJ9PNOiZbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+wQ3j2d/GRPnTzgt0O8+Zl6GbX3DjDVlVf56uy2Qw9J5l7JWSNAp9tT7Z9Y3vBX8fJSPiTGP70qHskqR2edMVcnxgdq+8XWo33QFwZGxdhCe7nlSxuZRZeLQ2IIqHlC74FdEcR+b7ZgOw5lhy3leL/95h9967YadzNnsYGpffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/SOvgzQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/SOvgzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706429543; x=1737965543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGELzaHmhka77syXYmDsQkPGSueLjDMHrTJ9PNOiZbk=;
  b=G/SOvgzQ0H+wGI6RaTph1JvXNtYX/VYE4+TLSk7C8koBnnUKJgZ5a77e
   M2yQrF/ZvJfy+H5BUpAOEv9J1WEtPeMM/aPzsgIH16IWul0dPqmLfeTB1
   Vc1r+znEv3eFu/vnveaw8HWzWsyHRNfPKRXNN1eWMAPR4JOiRviuUWecS
   0YVOm9a9IA9Us/GQnCMfXB+xzD/uMb1iGdSVb7qXkDAW/6Wj7FzZsjSPj
   j1bWPjv4LckINzcwyoLvmgCuJrbGTsJJVgbfHGQqko5UkpDuR9sgqRXuw
   6dDnaHFPJs9rDU7x2Q3HEMf77DIN2yCS5TjdaVzXjovjdCCjRi9r4VKNe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2617084"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2617084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 00:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3159740"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2024 00:12:20 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU0H4-0003Ek-06;
	Sun, 28 Jan 2024 08:12:18 +0000
Date: Sun, 28 Jan 2024 16:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 2/10] ld: kernel/bpf/syscall.o:undefined reference
 to `arena_map_ops'
Message-ID: <202401281652.xxQorBuq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   7ec22ac2adbc15f8ea20c1189b2dd95558ae3bcf
commit: d206ce01ebb5f2a692aeb44b109a625c9d8ac0a8 [2/10] bpf: Introduce bpf arena.
config: i386-randconfig-012-20240128 (https://download.01.org/0day-ci/archive/20240128/202401281652.xxQorBuq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281652.xxQorBuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281652.xxQorBuq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: kernel/bpf/syscall.o:(.rodata+0x624): undefined reference to `arena_map_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
