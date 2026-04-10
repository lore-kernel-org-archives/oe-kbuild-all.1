Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C777397E89
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819620; cv=none; b=XXgLpBJ3sZNpj8GsfhoYG39qGyaLbsUdyshOY1tiZGxPeHn31P3TJZYKB+2yQ07FcuVngXs+XvPwoA0B03nuRq1RP6oUY8yDDKTDUi1h2vdO990JsLceultzVHLN44pazJv+zqu4h2YCMMp58fDQ5/NcuZGVGxW4mLSm1Op2KSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819620; c=relaxed/simple;
	bh=i9Q06B3Q3aOqZMsBGsN+GibqC1AkxbXAjXZJLqFzHBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sBIyMD4hSWbw5xOEI4h/FP+zM0nMQRkb63xDpEcgfWRhm7dEvzm32LusaTsz5W1x9yiPLYPLtS3DdKi/PtfIStYVFgQF9MhjwAXD5sWyuz+IuvTNt39REmx4Fowab8RGLXoGSV5zVMx6oYcWDox0We6mocIawDjDbSQfLE3eMxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtouUzxN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtouUzxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775819619; x=1807355619;
  h=date:from:to:cc:subject:message-id;
  bh=i9Q06B3Q3aOqZMsBGsN+GibqC1AkxbXAjXZJLqFzHBU=;
  b=XtouUzxNF+K0BE3yNG4NZJhiJtCzksmE4RuG2MYXZ+2v2nzEqSrd8sC4
   WmuaohEwc+KS7UHPwpjKwoyDFRzXYmKXbkYcvmrG7M4llML5O1qlFJ7hB
   2RSesdV+LKaL7rT4ykujl3h2bv52MTzgERYzLTWmGSNuhFXwBRh6klSnM
   Xp02WXhbmWHmSmvR90vvjBqse7BlsgJvk27YX6jYjejrKLg0whitAQ+Dp
   1clB7BJ7z3GSSsBiVqRXb6QMGKbTZDwZucFrliEyowd2HV8RnSu5mWT+O
   uBl/1ZEsx+ik09VDQtI7k9tf3cCL0Qnjm5IJn7pUuzCliYDZXBqWmyqf4
   g==;
X-CSE-ConnectionGUID: SEqA8TesTiuRDRuS5v5ryg==
X-CSE-MsgGUID: CqvtMBoGTka9yONVJ/5oaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76554020"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76554020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:13:33 -0700
X-CSE-ConnectionGUID: R5nrYjadQNWZ9DGZT6bi0Q==
X-CSE-MsgGUID: ECHRuRIsTjCNsyUtd9TUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228939925"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Apr 2026 04:13:32 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB9nl-000000003dv-1712;
	Fri, 10 Apr 2026 11:13:29 +0000
Date: Fri, 10 Apr 2026 19:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 mm/page_size_compat.c:101:28: error: 'bpf_map_fops' undeclared; did you mean
 'bpf_map_ops'?
Message-ID: <202604101926.OKjH07Zg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   08e21ebff803243bccd5e6cd4a8253ffebf74c64
commit: 156b58543560782fded68ccebbf252314d2d9ba7 [2/2] ANDROID: 16K: Adjust bpf ringbuffer pgoffset on 16K x86 emulation
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260410/202604101926.OKjH07Zg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101926.OKjH07Zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101926.OKjH07Zg-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_size_compat.c: In function 'bpf_is_ringbuf_file':
>> mm/page_size_compat.c:101:28: error: 'bpf_map_fops' undeclared (first use in this function); did you mean 'bpf_map_ops'?
     101 |         if (file->f_op != &bpf_map_fops)
         |                            ^~~~~~~~~~~~
         |                            bpf_map_ops
   mm/page_size_compat.c:101:28: note: each undeclared identifier is reported only once for each function it appears in


vim +101 mm/page_size_compat.c

    98	
    99	bool bpf_is_ringbuf_file(struct file *file)
   100	{
 > 101		if (file->f_op != &bpf_map_fops)
   102			return false;
   103	
   104		struct bpf_map *map = file->private_data;
   105	
   106		return map->map_type == BPF_MAP_TYPE_RINGBUF ||
   107			map->map_type == BPF_MAP_TYPE_USER_RINGBUF;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
