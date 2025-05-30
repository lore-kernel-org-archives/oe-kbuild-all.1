Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D8D2DCBE3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748607678; cv=none; b=aGO5zBT4KEf0AERg6aGyCV/m940EOZ+YaHrS18v4+5YlaAzcN2NlVg6fTPIUnKMMdzGVC7m2D/z9mYL5Ti5oUMS+Gz1HuOKWz+EZv7Hgl6l88v86ifJFYSHnCcdbOkep64qsz3SbPOV5f6HC0bp2WOTJT73d827PdgUIucyLE5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748607678; c=relaxed/simple;
	bh=vS5ZAlQ8IfjoQ/eqSnhsdtDBUv5mQMru8FVdA5oERVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqKtOU1Ra4UY73FPxst+87sVwbTZRCzQUh8G4VwX145VSxuZbJ51MDVhzoaxj4FPhoaq01CTc9ZHysWjJlEll6Pu3xaUNz2AtTbhz0DI3aKmUoMJMIvYEaImAQDwLg5i/HHpmuE0nLQ8n8O/3vth+gbxGrpdT6geGEgtTGrouoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaZusRX2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaZusRX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748607677; x=1780143677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vS5ZAlQ8IfjoQ/eqSnhsdtDBUv5mQMru8FVdA5oERVU=;
  b=BaZusRX2jiLdbpmExK4LmnG6+7CvC0tI/ni0IJXLBnGuB+6xN4w1A8b9
   jgkUJRSotY8NLL4FJzw7e8nnhzZ+pBy56kE6f2YdUv7kKdlrMPl2CmCbP
   qFzf6nH83YE11/O1NJkuSF1Io4cPzn0ZIXshgF0caApwRI4VFrQwjo4er
   FUyx02mlCgnQAS65jwl01bIRxumwhjNP4q1z1ubtYd0t1r5MWaseuTlob
   YQb+aADfq2LuOgu49xRB+yln11r8oJV//MHnhyLzE1BJp/2oBrNz0EW1m
   2bdzNiAvGWE/YDk2A3wHcbNZZ+g5AmVFgGlOir53mo3D38iVD2BEvWlkB
   A==;
X-CSE-ConnectionGUID: r4phB5JnQPSE+bWGX8tOlQ==
X-CSE-MsgGUID: 5gElUQZ9T7mnq+WXzjC0eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50848515"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50848515"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 05:21:15 -0700
X-CSE-ConnectionGUID: HsYgTR1wTUSPU9BlMePHAw==
X-CSE-MsgGUID: opOXCy6tQpKf3+Gfh8DeCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="144844577"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2025 05:21:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKyjX-000Xcq-2K;
	Fri, 30 May 2025 12:21:11 +0000
Date: Fri, 30 May 2025 20:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg-clnt 10/11] fs/nfs/nfs4xdr.c:2042:33: error:
 'NOTIFY4_REMOVE_ENTRY' undeclared
Message-ID: <202505302031.wHUsevsF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg-clnt
head:   ea15531aa828dc21ac17cc091ec2a178ec621a34
commit: 1168a584087801319341982a4de5d46b5c79e9c6 [10/11] nfs: allow client to request NOTIFY4_REMOVE_ENTRY
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250530/202505302031.wHUsevsF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505302031.wHUsevsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505302031.wHUsevsF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/segment.h:6,
                    from arch/x86/include/asm/ptrace.h:5,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from fs/nfs/nfs4xdr.c:39:
   fs/nfs/nfs4xdr.c: In function 'encode_get_dir_delegation':
>> fs/nfs/nfs4xdr.c:2042:33: error: 'NOTIFY4_REMOVE_ENTRY' undeclared (first use in this function)
    2042 |         u32 notifybm[1] = { BIT(NOTIFY4_REMOVE_ENTRY) };
         |                                 ^~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   fs/nfs/nfs4xdr.c:2042:33: note: each undeclared identifier is reported only once for each function it appears in
    2042 |         u32 notifybm[1] = { BIT(NOTIFY4_REMOVE_ENTRY) };
         |                                 ^~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~


vim +/NOTIFY4_REMOVE_ENTRY +2042 fs/nfs/nfs4xdr.c

  2035	
  2036	#ifdef CONFIG_NFS_V4_1
  2037	static void
  2038	encode_get_dir_delegation(struct xdr_stream *xdr, struct compound_hdr *hdr)
  2039	{
  2040		__be32 *p;
  2041		struct timespec64 ts = {};
> 2042		u32 notifybm[1] = { BIT(NOTIFY4_REMOVE_ENTRY) };
  2043		u32 zerobm[1] = {};
  2044	
  2045		encode_op_hdr(xdr, OP_GET_DIR_DELEGATION, decode_get_dir_delegation_maxsz, hdr);
  2046	
  2047		/* We can't handle CB_RECALLABLE_OBJ_AVAIL yet */
  2048		xdr_stream_encode_bool(xdr, false);
  2049	
  2050		xdr_encode_bitmap4(xdr, notifybm, ARRAY_SIZE(notifybm));
  2051	
  2052		/* Request no attribute updates */
  2053		p = reserve_space(xdr, 12 + 12);
  2054		p = xdr_encode_nfstime4(p, &ts);
  2055		xdr_encode_nfstime4(p, &ts);
  2056	
  2057		xdr_encode_bitmap4(xdr, zerobm, ARRAY_SIZE(zerobm));
  2058		xdr_encode_bitmap4(xdr, zerobm, ARRAY_SIZE(zerobm));
  2059	}
  2060	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
