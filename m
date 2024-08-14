Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F51B141B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723642195; cv=none; b=sWm+SIW11PUnBTUYpA0hu1oWgMhCM5pkVOxc5OYp4xaKMWEvrDanPjjA0LRhvgD4ieQJTNL10hNmbMUbPI15DJ2/4MGeJySfkhCTE8lnNaKUjQGGj9OeYRBKd9f76PkFczcziKOh1ss5ANbbvkDuBCQWQ9xFe9kyYhrZ7N1LHmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723642195; c=relaxed/simple;
	bh=xbA1ft3QBTyRpxDjFUpI52+EUqihXxIXQspqDryJE8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nj8skfrhWRnLstWdHhzR+qLKHsO540fJ4OETDcKTnCWebh/PP30qHWvjntgSOZjc3tiWzN5mmZA+IK8G7BJcLbU+Mu0D9QrkuelzZh6A/wUikZ36DUEbDBMtqATsCu0HdAii6fNGkFn7C+g9OOdKzmDBzlgdjXkXuyLlv+ZAXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLT43Yzo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLT43Yzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723642193; x=1755178193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbA1ft3QBTyRpxDjFUpI52+EUqihXxIXQspqDryJE8o=;
  b=aLT43Yzog9Yzrkux0y/7pXO8VhbotTiHcZ5ENlO6jMtSlwS49PLUZQLg
   P/JQUAeUEKZuyonxfVg/4HmGqknFCfSdW3ymAKdEOsA8eYWHpprclLiNC
   +SmDaf719URBVp4qr0W0I5xj8BsBdMOMik2aTIW6AvxtSsPTzwYiQqjY8
   Y7RTAwn+F9R8ZsCa604G8W6K4YMWTMYG8vcPvnkvHuCNCzQKUmynGnYlB
   kTCRVOKtYVpCWjVFbR7PmgSbdZ+CDRH8fOqCAEXpG6mR0jgVwgyS3TT4L
   TIUVWmHsqA8TlzWpHKxGfjAU3H/uDocUDYFtataQZ0KBXVgYD1cqMEN+5
   A==;
X-CSE-ConnectionGUID: +Sg4ts6QRgSS7RmKyFVSZA==
X-CSE-MsgGUID: F5s9ITdGRbyLG/H/73dqbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21824710"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21824710"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:29:52 -0700
X-CSE-ConnectionGUID: HicEn7kYQfa+BNNBigJuWg==
X-CSE-MsgGUID: +RsA4yYKR7CmnXTS8He6gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59584557"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2024 06:29:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seE4T-0001h4-0R;
	Wed, 14 Aug 2024 13:29:49 +0000
Date: Wed, 14 Aug 2024 21:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 74/253] fs/xfs/scrub/bmap.c:320:17: error:
 implicit declaration of function 'xchk_rtgroup_init_existing'; did you mean
 'xchk_ag_init_existing'?
Message-ID: <202408142138.mm2VMcRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   dabb7872a6f25b04b590e544cc0f5f3ac560194e
commit: 28ae2dcb31232d44a72cc966cd4c4768eadd720d [74/253] xfs: move RT bitmap and summary information to the rtgroup
config: x86_64-randconfig-002-20240814 (https://download.01.org/0day-ci/archive/20240814/202408142138.mm2VMcRs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408142138.mm2VMcRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408142138.mm2VMcRs-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/bmap.c: In function 'xchk_bmap_rt_iextent_xref':
>> fs/xfs/scrub/bmap.c:320:17: error: implicit declaration of function 'xchk_rtgroup_init_existing'; did you mean 'xchk_ag_init_existing'? [-Werror=implicit-function-declaration]
     320 |         error = xchk_rtgroup_init_existing(info->sc,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 xchk_ag_init_existing
   cc1: some warnings being treated as errors


vim +320 fs/xfs/scrub/bmap.c

   310	
   311	/* Cross-reference a single rtdev extent record. */
   312	STATIC void
   313	xchk_bmap_rt_iextent_xref(
   314		struct xfs_inode	*ip,
   315		struct xchk_bmap_info	*info,
   316		struct xfs_bmbt_irec	*irec)
   317	{
   318		int			error;
   319	
 > 320		error = xchk_rtgroup_init_existing(info->sc,
   321				xfs_rtb_to_rgno(ip->i_mount, irec->br_startblock),
   322				&info->sc->sr);
   323		if (!xchk_fblock_process_error(info->sc, info->whichfork,
   324				irec->br_startoff, &error))
   325			return;
   326	
   327		xchk_rtgroup_lock(&info->sc->sr, XCHK_RTGLOCK_ALL);
   328		xchk_xref_is_used_rt_space(info->sc, irec->br_startblock,
   329				irec->br_blockcount);
   330	
   331		xchk_rtgroup_free(info->sc, &info->sc->sr);
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
