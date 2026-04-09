Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D71423D2B1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 05:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711097; cv=none; b=CaYD+1rVoLk1FHogcZb4NN8XtxlQNZsnvyEFC9vlHfhdgbHfL3pJjcWowgMLkzlZftdJSvpmoe7mu1j4hA7rZA2WmW7fhaUglPtL9MVLKUHx2oWkE9UJEf0urPYuulIRCRCAtQUxhJa1N0hle6nJqIyL3qO2dC4iCB0AgOJ247Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711097; c=relaxed/simple;
	bh=2CgnQ3Set/fTMJX7yVoXzC3BVtaxXcoyvDrxsDPPDrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DpsXWnwmVfqggdjwc3M2z9m/66LRJ31jQBYctp5uMutbxSUUSgeMf1W02YQ3zKMXAWAJ6Pvv0z9J9MEiZzlKgTu3SQqXjdXwkyf9X/XN1g8exRP5cFIkFhDHoN6S70fSjP47yTOHpKqn+jEOHF3bWpj1Iw9kLEn1mxXJ7CX/BBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kgk86bas; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kgk86bas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775711096; x=1807247096;
  h=date:from:to:cc:subject:message-id;
  bh=2CgnQ3Set/fTMJX7yVoXzC3BVtaxXcoyvDrxsDPPDrI=;
  b=Kgk86basVLKAkbqzP/zjngmbR/V4646xB59KfLCzmmm00GjyTOmQaqCj
   geR7Iqbq8cho5hZSUTjco+ZClsmqgDb8TRghv6crbB+W0tf+u+5vjpMZq
   x7hLgmDGyNgEHralnmbrQCGLF2M23f/5JzCfwfsCyIQ2PHMgFPlS1qUDl
   xmlfK/tEsYmD1Q+Z6vGazlSWpbD2j0BVFJyEowaTOn/WwcMRrkHNMNDAR
   rhKJpH/+Xc/NgOrWZUwng+FXYVkcKGud6p5zEpM+cO4qdcrrAEZsuu2Xj
   fJ+0qgWK3aMANAkbZVd1b8ivpoYqcZ7KjOxxCgPVTk0GCe27UKt2hiKSA
   w==;
X-CSE-ConnectionGUID: DkTsquD9SXmnr/bX+MgY+Q==
X-CSE-MsgGUID: c0ZQmo+CQ8uZLWPMM4XCnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75742844"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="75742844"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 22:04:56 -0700
X-CSE-ConnectionGUID: EQbXFmfoQ7+KZO0Uf6oipA==
X-CSE-MsgGUID: K4RgWxRoRjyTjIjIWMxSag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="227808483"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Apr 2026 22:04:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAhZU-00000000Abf-0O5q;
	Thu, 09 Apr 2026 05:04:52 +0000
Date: Thu, 09 Apr 2026 07:04:13 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 14/25] fs/nfsd/nfs4state.c:9911:1: error:
 static declaration of 'nfsd4_run_cb_notify' follows non-static declaration
Message-ID: <202604090659.FEeo1UdB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   f46f4f860e384a5bc2c7a8f2fa64872ba4e303a5
commit: 748b5689ecabe0a80846c79cc0b468005b4d7e19 [14/25] nfsd: add notification handlers for dir events
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260409/202604090659.FEeo1UdB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090659.FEeo1UdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090659.FEeo1UdB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nfsd/nfs4state.c: In function 'nfsd4_cb_notify_release':
   fs/nfsd/nfs4state.c:3583:17: error: implicit declaration of function 'nfsd4_run_cb_notify'; did you mean 'nfsd4_run_cb'? [-Wimplicit-function-declaration]
    3583 |                 nfsd4_run_cb_notify(ncn);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 nfsd4_run_cb
   fs/nfsd/nfs4state.c: At top level:
>> fs/nfsd/nfs4state.c:9911:1: warning: conflicting types for 'nfsd4_run_cb_notify'; have 'void(struct nfsd4_cb_notify *)'
    9911 | nfsd4_run_cb_notify(struct nfsd4_cb_notify *ncn)
         | ^~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfs4state.c:9911:1: error: static declaration of 'nfsd4_run_cb_notify' follows non-static declaration
   fs/nfsd/nfs4state.c:3583:17: note: previous implicit declaration of 'nfsd4_run_cb_notify' with type 'void(struct nfsd4_cb_notify *)'
    3583 |                 nfsd4_run_cb_notify(ncn);
         |                 ^~~~~~~~~~~~~~~~~~~


vim +/nfsd4_run_cb_notify +9911 fs/nfsd/nfs4state.c

  9909	
  9910	static void
> 9911	nfsd4_run_cb_notify(struct nfsd4_cb_notify *ncn)
  9912	{
  9913		struct nfs4_delegation *dp = container_of(ncn, struct nfs4_delegation, dl_cb_notify);
  9914	
  9915		if (test_and_set_bit(NFSD4_CALLBACK_RUNNING, &ncn->ncn_cb.cb_flags))
  9916			return;
  9917	
  9918		if (!refcount_inc_not_zero(&dp->dl_stid.sc_count))
  9919			clear_bit(NFSD4_CALLBACK_RUNNING, &ncn->ncn_cb.cb_flags);
  9920		else
  9921			nfsd4_run_cb(&ncn->ncn_cb);
  9922	}
  9923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
