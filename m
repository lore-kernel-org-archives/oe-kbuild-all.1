Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61102153C3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738686207; cv=none; b=teCZAg/Z+4VIcl6/1TXdQY+JbxLPcUNo70JAnBxwbsQkOI8E/AEt53idVBg/tIfZq5AZ9YiJxzTuQR1qVx4kKyQ/bDSc4CF3tUQb4H8RecQPlNBeKt8ouPV81ELdSE3mt2wo2QN7UMZz0Yej9px11vLrwQ/eSeNRwcWhZgPkAB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738686207; c=relaxed/simple;
	bh=S4C0QqZWLHgglMOrouu/x/+TqIci/UMfaBES60VRCMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EKhPZduEw/FmMGQpmcEshma4GGtKDzvzJdK0Z9FZHbaP5+mRDoRyceWz7Yd5ezrhyOpdU6dbVfgTWrfn8J3wBJCn5MmEHtZw73kc4jmefS7pJoj5NEv+cHvRTKVMlZK/XbooJEkgfx92NR18qhQZM5YtTy30sY5weAKLMa6JL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipBafgA6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipBafgA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738686206; x=1770222206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4C0QqZWLHgglMOrouu/x/+TqIci/UMfaBES60VRCMU=;
  b=ipBafgA6EITEIFbDe/09KJhjA5CCh2+U1cOMC+GXTRIxlLVVu/1wEy/y
   o/mtYEDG7obLXX4uYVixeF7nrm4dc0ZRropb7T3qxEOl7NXetB71QBpmk
   DLHc1krVf67+1Jf4heVHCsuKXzciGlwABWEKexnTKBvEcKAIjB77Segjo
   rPw0tnUGEgTQY4KZTrD1Nfh/zQh5XxeUAgMF8DmZhjEDzS5a4iltZ36ua
   Um3G+qbE2arrDNRU8BJ463lIkrIrWuUugeWD+cauyV0/yUkrc6TfjGvvK
   NtylF0dXE1VnENj/iJWYb/Wp3D9wAeu7tBmx7IrUewxZQNkolCHba++Wd
   g==;
X-CSE-ConnectionGUID: 3xt6B5ggSuy/OTaSaiujCg==
X-CSE-MsgGUID: ha2DyWnLQRydEnq9aJ5MQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39483162"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39483162"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 08:23:24 -0800
X-CSE-ConnectionGUID: s2s8azD8Qw+7j9yYZfMUzQ==
X-CSE-MsgGUID: JZ9FPUN8S1GSZbNr4lkwpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111182764"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 08:23:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfLhp-000sgN-1w;
	Tue, 04 Feb 2025 16:23:21 +0000
Date: Wed, 5 Feb 2025 00:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 7/13] kernel/kexec_internal.h:48:46: warning: 'struct
 kexec_buf' declared inside parameter list will not be visible outside of
 this definition or declaration
Message-ID: <202502050020.KjWy81hn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: 4a9f36010eba44853b3c9bb721a4a5f4319dc370 [7/13] kexec: Add KHO support to kexec file loads
config: i386-buildonly-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050020.KjWy81hn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050020.KjWy81hn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050020.KjWy81hn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/crash_core.c:31:
>> kernel/kexec_internal.h:48:46: warning: 'struct kexec_buf' declared inside parameter list will not be visible outside of this definition or declaration
      48 | static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
         |                                              ^~~~~~~~~


vim +48 kernel/kexec_internal.h

    42	
    43	#ifdef CONFIG_KEXEC_HANDOVER
    44	int kho_locate_mem_hole(struct kexec_buf *kbuf,
    45				int (*func)(struct resource *, void *));
    46	int kho_fill_kimage(struct kimage *image);
    47	#else
  > 48	static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
    49					      int (*func)(struct resource *, void *))
    50	{
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
