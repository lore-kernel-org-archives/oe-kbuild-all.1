Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19818EFD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 04:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749702192; cv=none; b=Lwz+uaLegotCqRajLqvz8PIs39I18D5l9I+/ezsIgH4K5cR/rH6KLNM8CKosp3EQeKbDIFoDfgNYI+dhQ0TEHcBWRyTNjruvBrgnd2F54bB4WMkoktBtAsJPS033tawquUYTBUJXrR3od57VJvXNIzwyX8IaF96+gWi0SdFXbiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749702192; c=relaxed/simple;
	bh=oOnqbit7PLWnNQqJ+SdC969l/aGitLsliVWrB8hBFeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGDHNMPI/vYJsVW1+wlbtT38hPushb7E/Wa3v3LTLcTxes/iLwyWGgrTfSuucJr1QYBajOrszt5/02t373soa+qhB/kFG0UJysLaSM3MdKtDpYFqRuDgd//NlOAEtTk5tOSqJIHkaf9+HVcUhq6+2swfDuXgAZPzGdBsCfy9yBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzJJ1SkR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzJJ1SkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749702191; x=1781238191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oOnqbit7PLWnNQqJ+SdC969l/aGitLsliVWrB8hBFeE=;
  b=bzJJ1SkRuUbuV8f+2YewBEtDEL7wjOvGVgMmFfvvvBdgd6cpMoMTE0G1
   5amCkzIe52QBpUYP3yCJop9RJ+gVpMXHjmognXzvLvPDOcXxNxZee73y5
   i6DLD8XdxaBpafcKKFrQMoj85pZ7f002dHwy/Uf59TrndXNoy+864JgpL
   eBTBqjC+znYCC41OQjBfU8/AEqKzzpRW8zrkdmyfSozz2EwBZMosMj8yN
   ELAYi55mkAMmv+k79mngJsBjP4Sh2yNoXBYduGio3+4+IGtu1fdOTbO6I
   HKqBZ4dUpeygkI5EtVea40cFB/ddq03DOchCZZSFdEAPntHd86JMNkpaq
   w==;
X-CSE-ConnectionGUID: C//UgTVyS6KXHjedBUfE0g==
X-CSE-MsgGUID: sx0jSoTYRCmY/vjTPTLTyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51741331"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51741331"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 21:23:11 -0700
X-CSE-ConnectionGUID: VJkkEXWMR3enRbka0HdaVQ==
X-CSE-MsgGUID: 1AytRtOETxa1lNZHVXUn7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147386769"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 21:23:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPZT1-000B7E-1b;
	Thu, 12 Jun 2025 04:23:07 +0000
Date: Thu, 12 Jun 2025 12:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/141] mm/swapfile.c:102:26:
 warning: no previous prototype for function 'swap_type_to_swap_info'
Message-ID: <202506121241.Bv53Ohb5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   b185a6ede2f07a9c35a68b13b3ba9d3abf114a5d
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [0/141] ANDROID: mm: export swap_type_to_swap_info
config: x86_64-buildonly-randconfig-002-20250612 (https://download.01.org/0day-ci/archive/20250612/202506121241.Bv53Ohb5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121241.Bv53Ohb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121241.Bv53Ohb5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         | ^
         | static 
   1 warning generated.


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
