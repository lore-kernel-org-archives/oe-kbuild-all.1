Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB51F7262B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789664; cv=none; b=tqBlRWB2elC/XQUVhs8y9l71hdXsTnar7D/NctA72Ref1W+UKBMO8dYCu8bYoulmx2EOVQ/lh/S3Al2S7LGn73cUyHmsbsOcXUo2JkRKSPvfAf3zThzirKXUUjC/ubnlAv3DnZfzgnkTJI9STm2A45+/wxLIJyobbOjb3pm5aqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789664; c=relaxed/simple;
	bh=7VkChpMIPotSOqpS4F2y5W4hmuTEm/QjuTuRnB0MZTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go6yZrVxjbRWo1ZfNmyiBX1VGkTCQerbGXkS2qETLDDebrEyjjUeF3UmZa1iNjcs1sWpbPsE/+04xAcRJoqgX1+WnSoSsX4+r/bJTh0yWzidgieywnLhG7TpDELO5ntxivjkvdWMvnUYaKRaersiwLh0lMEtgFdNdxRkFoOZl1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ml27vdPf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ml27vdPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755789662; x=1787325662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7VkChpMIPotSOqpS4F2y5W4hmuTEm/QjuTuRnB0MZTo=;
  b=Ml27vdPfVApzgP3eqihDHJRAT0TL/Z42uIrUDqCW+kgtFiy6uvKrKkgq
   WfiULbQLIa+vV944oYzZtMfx8CwpRQQ6SxoMY+OzGdC2d1JWHYN05CS91
   GwXO5csycW1jzU/06v7vEPDpT+O+ege+UsU+luMZE+fVAAemBzVVzCZ5L
   xWcbOe5thm+/C9QGaj1tO6hy8EkqxV4QaGgIeBh7+dzlNtms+8ab6yEEt
   xeVHGN4gOesVTFeOvDZC8RQu/sq4xY8juHlFOiy4G5x+jz+HF74Fg8jcH
   RJNYskDGNW9nlmia97yQESyQJ9Ckvb8EqshA6V7Gc2IyZSlzZk/tCtnhx
   g==;
X-CSE-ConnectionGUID: pFDXaNaHSIGNzTk/bCierA==
X-CSE-MsgGUID: AUmRV6RZSnaU1XuTZgpntA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68354715"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68354715"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 08:21:02 -0700
X-CSE-ConnectionGUID: uXOKOxNEQqSDeH5O5D5fEg==
X-CSE-MsgGUID: /y4ACJP8QqqToUDNtYcH3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168858152"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Aug 2025 08:21:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up75u-000KQZ-0o;
	Thu, 21 Aug 2025 15:20:53 +0000
Date: Thu, 21 Aug 2025 23:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nfsd: discard nfserr_dropit
Message-ID: <202508212317.KnaDxb8p-lkp@intel.com>
References: <175573864133.2234665.4220094746965657176@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175573864133.2234665.4220094746965657176@noble.neil.brown.name>

Hi NeilBrown,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.17-rc2 next-20250821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/nfsd-discard-nfserr_dropit/20250821-091759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/175573864133.2234665.4220094746965657176%40noble.neil.brown.name
patch subject: [PATCH] nfsd: discard nfserr_dropit
config: sh-randconfig-002-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212317.KnaDxb8p-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212317.KnaDxb8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212317.KnaDxb8p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/nfsfh.c:14:
>> fs/nfsd/nfsd.h:339:21: error: expected identifier before '=' token
     339 |         NFSERR_EOF, = NFS4ERR_FIRST_FREE,
         |                     ^
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/sh/include/uapi/asm/byteorder.h:8,
                    from arch/sh/include/asm/bitops.h:10,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/sunrpc/svcauth_gss.h:12,
                    from fs/nfsd/nfsfh.c:13:
   fs/nfsd/nfsfh.c: In function 'nfsd_mode_check':
>> fs/nfsd/nfsd.h:354:45: error: 'NFSERR_SYMLINK_NOT_DIR' undeclared (first use in this function); did you mean 'NFSERR_SYMLINK'?
     354 | #define nfserr_symlink_not_dir  cpu_to_be32(NFSERR_SYMLINK_NOT_DIR)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__cpu_to_be32'
      40 | #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
         |                                                   ^
   fs/nfsd/nfsfh.c:80:32: note: in expansion of macro 'nfserr_symlink_not_dir'
      80 |                         return nfserr_symlink_not_dir;
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsd.h:354:45: note: each undeclared identifier is reported only once for each function it appears in
     354 | #define nfserr_symlink_not_dir  cpu_to_be32(NFSERR_SYMLINK_NOT_DIR)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__cpu_to_be32'
      40 | #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
         |                                                   ^
   fs/nfsd/nfsfh.c:80:32: note: in expansion of macro 'nfserr_symlink_not_dir'
      80 |                         return nfserr_symlink_not_dir;
         |                                ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/nfsd/xdr.h:8,
                    from fs/nfsd/xdr3.h:11,
                    from fs/nfsd/vfs.c:36:
>> fs/nfsd/nfsd.h:339:21: error: expected identifier before '=' token
     339 |         NFSERR_EOF, = NFS4ERR_FIRST_FREE,
         |                     ^
--
   In file included from fs/nfsd/cache.h:13,
                    from fs/nfsd/nfs3proc.c:13:
>> fs/nfsd/nfsd.h:339:21: error: expected identifier before '=' token
     339 |         NFSERR_EOF, = NFS4ERR_FIRST_FREE,
         |                     ^
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/sh/include/uapi/asm/byteorder.h:8,
                    from arch/sh/include/asm/bitops.h:10,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/nfsd/nfs3proc.c:8:
   fs/nfsd/nfs3proc.c: In function 'nfsd3_map_status':
>> fs/nfsd/nfsd.h:354:45: error: 'NFSERR_SYMLINK_NOT_DIR' undeclared (first use in this function); did you mean 'NFSERR_SYMLINK'?
     354 | #define nfserr_symlink_not_dir  cpu_to_be32(NFSERR_SYMLINK_NOT_DIR)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__cpu_to_be32'
      40 | #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
         |                                                   ^
   fs/nfsd/nfs3proc.c:44:14: note: in expansion of macro 'nfserr_symlink_not_dir'
      44 |         case nfserr_symlink_not_dir:
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsd.h:354:45: note: each undeclared identifier is reported only once for each function it appears in
     354 | #define nfserr_symlink_not_dir  cpu_to_be32(NFSERR_SYMLINK_NOT_DIR)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__cpu_to_be32'
      40 | #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
         |                                                   ^
   fs/nfsd/nfs3proc.c:44:14: note: in expansion of macro 'nfserr_symlink_not_dir'
      44 |         case nfserr_symlink_not_dir:
         |              ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/nfsd/export.c:21:
>> fs/nfsd/nfsd.h:339:21: error: expected identifier before '=' token
     339 |         NFSERR_EOF, = NFS4ERR_FIRST_FREE,
         |                     ^
   fs/nfsd/export.c: In function 'exp_rootfh':
   fs/nfsd/export.c:1027:34: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
    1027 |         struct inode            *inode;
         |                                  ^~~~~


vim +339 fs/nfsd/nfsd.h

   331	
   332	/*
   333	 * Error codes for internal use.  We use enum to choose numbers that are
   334	 * not already assigned, then covert to be32 resulting in a number that
   335	 * cannot conflict with any existing be32 nfserr value.
   336	 */
   337	enum {
   338	/* end-of-file indicator in readdir */
 > 339		NFSERR_EOF, = NFS4ERR_FIRST_FREE,
   340	#define	nfserr_eof		cpu_to_be32(NFSERR_EOF)
   341	
   342	/* replay detected */
   343		NFSERR_REPLAY_ME,
   344	#define	nfserr_replay_me	cpu_to_be32(NFSERR_REPLAY_ME)
   345	
   346	/* nfs41 replay detected */
   347		NFSERR_REPLAY_CACHE,
   348	#define	nfserr_replay_cache	cpu_to_be32(NFSERR_REPLAY_CACHE)
   349	
   350	/* symlink found where dir expected - handled differently to
   351	 * other symlink found errors by NFSv3.
   352	 */
   353		NFSERR_SYMLINK_NOT_DIR,
 > 354	#define	nfserr_symlink_not_dir	cpu_to_be32(NFSERR_SYMLINK_NOT_DIR)
   355	};
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
