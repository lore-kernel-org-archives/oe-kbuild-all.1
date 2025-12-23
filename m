Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC71221546
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 21:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766526689; cv=none; b=nyyEVxYvbrGjPq2Jh7+TjDoMQbr/L9DCFRiPMHlLQemdMo0D+drFPnMOAgo857sxNVa633YtHZQDyszaNywqqpdieNCxVno4V3Nu1UFmptb3P/oXl5E5yJzjegek3v7E22ZEFb9TSiGfXpkcGrSawNL6pV3IJPrisCied1yPYDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766526689; c=relaxed/simple;
	bh=RtjcDtE3wdBuakgskK6Ap0GQAJmx8DwA+fMXVyDveYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jmcnvtAOCrMQQn6CJ6d6K/ybgzZszP7Z9gN/D9jbsOq5Y258L8ZP+f69kPBDRDDkCYLkCGSRC3KE0DX+WERUf0dKuoWz8m3s0OklbExLHHG2mx89hgLetY5Fa2tM3QxS2P/L930kuTwlJyEBwp60J5rvp2/fObapbsKYFrcPB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZZEA9m3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZZEA9m3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766526687; x=1798062687;
  h=date:from:to:cc:subject:message-id;
  bh=RtjcDtE3wdBuakgskK6Ap0GQAJmx8DwA+fMXVyDveYU=;
  b=LZZEA9m3Pv4OdNHE5epOQubyCQX6BuneYumfYUqidjjjPv9ZbG1qfWaX
   iKmE0L/lNNbS0c9rpj+SLFyjdCExfXqwqVbsvjlSFY6pUYViYIJRRt1zO
   1lpeuAjNCnz9bnksRZrWolmCE+5J10AAeOvhqWVBPv53DW/My39dzymyj
   E2Ow3YD4uUQP+LVwF817ed/bZw7745yjVfQ+YzkP9++CTv8g8RGGreu30
   t/H+ruta57i7hQf7SIVP3xhG84mStCGrFe/lo+G83ZBBAEehrNqEgP12h
   UcEHG16jzPUXj125F3rmvMiL0e4XE26ALEeHvPXw1iSJY3wsCY3vIlkeZ
   A==;
X-CSE-ConnectionGUID: vMrzBYFlRlOjVKjnVYjN/A==
X-CSE-MsgGUID: Nir7OL/cTmmY+gAyH2BdkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79827945"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79827945"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 13:51:27 -0800
X-CSE-ConnectionGUID: pelVV8bkRu6lN8y+k+u1/g==
X-CSE-MsgGUID: 5h2Aux+YSre7Mt0HR7CErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204408582"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 13:51:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYAHr-000000002PB-2HOh;
	Tue, 23 Dec 2025 21:51:23 +0000
Date: Wed, 24 Dec 2025 05:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 462/799]
 fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
Message-ID: <202512240611.wYkd2rF2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 30f7c327a5b2201012ff856bc95040e2ec3fad6b [462/799] bcachefs: move sb code to subdir
config: riscv-randconfig-r133-20251222 (https://download.01.org/0day-ci/archive/20251224/202512240611.wYkd2rF2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240611.wYkd2rF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240611.wYkd2rF2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   fs/bcachefs/sb/io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/sb/downgrade_format.h:14:52: sparse: sparse: array of flexible structures
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64

vim +582 fs/bcachefs/sb/io.c

1c6fdbd8f2465d fs/bcachefs/super-io.c Kent Overstreet 2017-03-16  577  
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  578  static unsigned long le_ulong_to_cpu(unsigned long v)
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  579  {
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  580  	return sizeof(unsigned long) == 8
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29 @581  		? le64_to_cpu(v)
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29 @582  		: le32_to_cpu(v);
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  583  }
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  584  

:::::: The code at line 582 was first introduced by commit
:::::: 8b16413cda7c46d47f8071165b3071f8a9369199 bcachefs: bch_sb.recovery_passes_required

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
