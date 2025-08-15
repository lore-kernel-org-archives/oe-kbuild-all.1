Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ABB23D7F6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755239880; cv=none; b=UJOOk4selTFF05SwN7Q2hNLsD8lzuFGt0qEP9qtx3CNOy5URw1YOhoYdYw2Sq5rDj1xsObSky7WxTiBsMqfu4vv5ME6SwklwwMreyiQiWWy2aEbRRr+Gw8j+DSBLKFgvYNBi9890cWp2ls9WbDuEnzosSBLvvmnnMXNFHan9Flo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755239880; c=relaxed/simple;
	bh=/ZVgsKXSRSyobtTi9YT0Zs2HqjqFqBGe/PclV/ibYwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRtYqnTCuMSzG5AAQRKv/8RbvduTkyQwP49lQCcbOwhSscY6uC8RiYKL4dsA2erDBnWX6Jv6oBlE3VgjMrJtCVWTKlGV2ude4QQowFe65NTfJgk48m2AogmQRmpmCmbb7VhCUFqzDTKWL9SLCVAI/3OKi1RmKztqg5zzGl+r8Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aE0pyCN2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aE0pyCN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755239879; x=1786775879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ZVgsKXSRSyobtTi9YT0Zs2HqjqFqBGe/PclV/ibYwA=;
  b=aE0pyCN2p19EZTjY3eI2ZAD/o1MDS7O2PQKOe7qAv81/2x9t8iKfoEmt
   b4gbTi8MySLBf4Pzq6lnNAHp5LdzXA8yHcnWOlpXoyyI39mNEg8kcQuDT
   IccV+/mZsRfRPTvjOfJIzfbu7Pmdn/iHsKTM50t6kuAGBSjL0tn8Z+LAM
   ZOMQi8lbc6qGGPn/eLcUJyqG7bb5F1GyvSjhZkOKembHslZPRURQzjoa7
   5mmZ/pADfl1zvXuSn+FXklxiiCOvHsgeyXHRL3brWoEBy8/MK/qpbxskN
   BvZamznKG7Pr3gAfFW84qVznSx649RHzBB8tDlWzOFWiASEo2vN9glXK/
   Q==;
X-CSE-ConnectionGUID: VEDQ724eQru4BeXLbTJ4fw==
X-CSE-MsgGUID: wKeiyWZCRYOfXXDo5qsNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61195828"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61195828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:37:58 -0700
X-CSE-ConnectionGUID: 8znj3svlQjeL+nrbMCV4Aw==
X-CSE-MsgGUID: xXxf5FqbRVKOBVM1zr+0sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171192972"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2025 23:37:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umo4Z-000Be4-25;
	Fri, 15 Aug 2025 06:37:55 +0000
Date: Fri, 15 Aug 2025 14:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] mm/vmscan.c:4372:6:
 warning: no previous prototype for function 'isolate_folio'
Message-ID: <202508151434.U8fdug4a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bc369e4e2456396e99b80b3d33769263f3b611f4
commit: 0e47a7391b3e2e57c4769f14a7be0ba7b56b10ca [1/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: i386-randconfig-141-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151434.U8fdug4a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151434.U8fdug4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151434.U8fdug4a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4372:6: warning: no previous prototype for function 'isolate_folio' [-Wmissing-prototypes]
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^
   mm/vmscan.c:4372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         | ^
         | static 
   1 warning generated.


vim +/isolate_folio +4372 mm/vmscan.c

  4371	
> 4372	bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
  4373	{
  4374		bool success;
  4375	
  4376		/* swap constrained */
  4377		if (!(sc->gfp_mask & __GFP_IO) &&
  4378		    (folio_test_dirty(folio) ||
  4379		     (folio_test_anon(folio) && !folio_test_swapcache(folio))))
  4380			return false;
  4381	
  4382		/* raced with release_pages() */
  4383		if (!folio_try_get(folio))
  4384			return false;
  4385	
  4386		/* raced with another isolation */
  4387		if (!folio_test_clear_lru(folio)) {
  4388			folio_put(folio);
  4389			return false;
  4390		}
  4391	
  4392		/* see the comment on MAX_NR_TIERS */
  4393		if (!folio_test_referenced(folio))
  4394			set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS, 0);
  4395	
  4396		/* for shrink_folio_list() */
  4397		folio_clear_reclaim(folio);
  4398		folio_clear_referenced(folio);
  4399	
  4400		success = lru_gen_del_folio(lruvec, folio, true);
  4401		VM_WARN_ON_ONCE_FOLIO(!success, folio);
  4402	
  4403		return true;
  4404	}
  4405	EXPORT_SYMBOL_GPL(isolate_folio);
  4406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
