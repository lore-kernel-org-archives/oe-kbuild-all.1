Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9C30F531
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 03:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775706177; cv=none; b=PL19PuWqxmkr5tCI578lSbCDRbaPJ6ajtS0CecJKcXpTAkfaSikPmlUaK8BpetwzrXN5fpXq0NZho8hxjHuA547xPHj1LeUpp6aoFXzve4B+/ZxXZGjpZwrooasyHN3ZCupDVlwiFYxCUwVa/Ko2KI3Z5po87KbUyXEBMYmf8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775706177; c=relaxed/simple;
	bh=DeCaNpx9LWTXLJ8GYOL9otbBb1VTCu8xHFz+X1EhymM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J3c6SNVdIGpsebhvS50TYbZUw00aNvx53N2tlHki6XrX3m59cc6hluCx87tQyVOEA7nfJt1Edz3h+eHoqka7atQlnQxuqYa50xecKAY4Jg5iKCs03S8e2j1sYaogrw4Qji2ZUn0Gs/UEyt4dsC67Oj5U7tzJrpNF52cGWIJcgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcQ3Rkny; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcQ3Rkny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775706177; x=1807242177;
  h=date:from:to:cc:subject:message-id;
  bh=DeCaNpx9LWTXLJ8GYOL9otbBb1VTCu8xHFz+X1EhymM=;
  b=OcQ3Rknyi5AQSvcjo3ujkiZ8W84Ny9eWuQ/1u3JKgy23WBBMlcIC0Y4o
   ULsqo/ETWh5eRJynoh7SUGNlXRVdAEupFfEnhXT+HYFMO/9vTKa3g80lb
   85+3r6gSAdphyY6xGDyLfuhcCWLW1jQxi6gY8XLYXNkJnOLMFDrzJO3xB
   lCIFXdMBII/TZ93y1mE7PVW/w6BI1PNHN2pw1piPK3JT1j60lKTyIUcRS
   XlWjBpx1ObvMizWL9iIzobfoC3eJiRL4N8gYiyvcS4QIbMv3LmB5DmFzS
   g1qXYufTggamt3l1mIldyHp1XErgPX5Q53ZhUg2yq1eYqBS2yKFDZQOdC
   Q==;
X-CSE-ConnectionGUID: 6BCLEFsHSFOc9IDRJxLm0g==
X-CSE-MsgGUID: e6bx6deRQ9SLpaD0FhJIuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94091913"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="94091913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 20:42:56 -0700
X-CSE-ConnectionGUID: gQRJZwZER4qS7LLvqfOhQg==
X-CSE-MsgGUID: /bof9UUMTPa53SrU4R+aBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="251803622"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2026 20:42:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAgI7-00000000Ab3-2626;
	Thu, 09 Apr 2026 03:42:51 +0000
Date: Thu, 09 Apr 2026 05:41:59 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 13/25] fs/nfsd/nfs4state.c:3472:17:
 error: implicit declaration of function 'nfsd4_run_cb_notify'; did you mean
 'nfsd4_run_cb'?
Message-ID: <202604090536.n2SxrAsO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   f46f4f860e384a5bc2c7a8f2fa64872ba4e303a5
commit: c82fe07f3cc730c342db68b5cb4cab81c8f6763c [13/25] nfsd: add data structures for handling CB_NOTIFY
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260409/202604090536.n2SxrAsO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090536.n2SxrAsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090536.n2SxrAsO-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfs4state.c: In function 'nfsd4_cb_notify_release':
>> fs/nfsd/nfs4state.c:3472:17: error: implicit declaration of function 'nfsd4_run_cb_notify'; did you mean 'nfsd4_run_cb'? [-Wimplicit-function-declaration]
    3472 |                 nfsd4_run_cb_notify(ncn);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 nfsd4_run_cb


vim +3472 fs/nfsd/nfs4state.c

  3461	
  3462	static void
  3463	nfsd4_cb_notify_release(struct nfsd4_callback *cb)
  3464	{
  3465		struct nfsd4_cb_notify *ncn =
  3466				container_of(cb, struct nfsd4_cb_notify, ncn_cb);
  3467		struct nfs4_delegation *dp =
  3468				container_of(ncn, struct nfs4_delegation, dl_cb_notify);
  3469	
  3470		/* Drain events that arrived while this callback was in flight */
  3471		if (ncn->ncn_evt_cnt > 0)
> 3472			nfsd4_run_cb_notify(ncn);
  3473		nfs4_put_stid(&dp->dl_stid);
  3474	}
  3475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
