Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A5637204E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124781; cv=none; b=A3tOUrRqnRHA52Z9lY/vsN8RZ2UaGxA5WpBeP+tCV8PGlKUFcc9kMHNVrpaw7WYDM4oDdpcmtpHDV+GfMLbpL9hADLQ/IAjo3dLSbVhcJm+mphZWCALtu8uhlG9mVb83lZq9Zl7Hjk1XIuKpvUioj1c13nvxnGpneknLdJqLuds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124781; c=relaxed/simple;
	bh=S44OMaJifkD70Y1ueHWLBD5onPeYV3OqrhC0z+Ioz+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A++sAz3hO5vd8lsQCyX0l1gUBuJO+7JLnehjBJeV/NHKT7MEKlOLADven3hiZ1+DWn6dn984HdYGtQcP8nGNz4EETW34xrKACH+fXFR+hm05GFOCxxnvX+cuULsNqbClqXAkzb0c7HdsSXR4oUsQRdAnj28zkAtJjyG66iBD488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/ohrZ9C; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/ohrZ9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782124779; x=1813660779;
  h=date:from:to:cc:subject:message-id;
  bh=S44OMaJifkD70Y1ueHWLBD5onPeYV3OqrhC0z+Ioz+Q=;
  b=h/ohrZ9C3Od83yMtlqS2wdttXfKcQcLx6J02JfPnq2XuheNkg7PqboRN
   +5ga6eL6fOVB4dZwZBmqtSrpSHvcE0YKM8aqU7u89bQGwVoQfJTZDNKET
   2fwsLfIfhpbdaVlTgyxV90GGIV3ID3CSkF0zRb8uxye051mTqIGhGC6zU
   p0HKJH/8sJBp4+wA2QUkYvh2GQrccmzwP8H4Zp9gtruVutIl1zSTVxrTz
   zBs/MdtDO0ZBj2ckgjlYXmQ/QAjsNQzMnjsB8jxHHjGxmonaCpLSiIexv
   0bNXr7DbxqChVV9t2LoU6Lr2rZD5VqISwVQXNSr6pXJQ9n7iK7PH4+k2q
   w==;
X-CSE-ConnectionGUID: XyZ+zH3kTwmAOB5RiRY2xw==
X-CSE-MsgGUID: eehynjF0ThO5wSi9grKGgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="105645707"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="105645707"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:39:37 -0700
X-CSE-ConnectionGUID: 5WAWhcafSviG17NIA9XJpg==
X-CSE-MsgGUID: 2Hx050DEQfu17fYaXD4+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="273265731"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 03:39:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbc3w-00000000101-3TIO;
	Mon, 22 Jun 2026 10:39:32 +0000
Date: Mon, 22 Jun 2026 18:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] mm/vmscan.c:4372:6:
 warning: no previous prototype for 'isolate_folio'
Message-ID: <202606221823.Qfd5T6WA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   74c43557c8aed4002d058c4e88c768a6086df9c2
commit: 0e47a7391b3e2e57c4769f14a7be0ba7b56b10ca [0/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: x86_64-randconfig-071-20260622 (https://download.01.org/0day-ci/archive/20260622/202606221823.Qfd5T6WA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221823.Qfd5T6WA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221823.Qfd5T6WA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4372:6: warning: no previous prototype for 'isolate_folio' [-Wmissing-prototypes]
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]


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
