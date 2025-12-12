Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F930CD95
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571309; cv=none; b=Az0+k51jHQaVTxUHJswgsuN5N0A648IqqOiuQXsffPkTmgPgkjAmFqNjeaHTumvuH1v5z1eN7TPLhP0gn1Lt06l9hXmznucw0QrcQp3TXiN2somfoIUw9XrbNjNpibNaZGoZWe1e2ckpoE9zf2lKfyS7ubF4k8nnXznuMqopA38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571309; c=relaxed/simple;
	bh=9cPae5aIaZM4NTyN5cBF73CK836u0gZmBmjkT4dWgek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vCqIEIisA05YViwJMdr/zML9c9M+I1t01jEFnZhuKL82KqFy93akES5GgN5rfs8s56aCV5cQxKwgZJJO9o/eqS920UvcwD3econscpcH1OQrqtU0QZg2e+wzvAeoLbn/LQvk+1kVgYxZ5opCA2G+t9mHmuFWAM5m3yD6IQ+19ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpoxGSwR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpoxGSwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571308; x=1797107308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9cPae5aIaZM4NTyN5cBF73CK836u0gZmBmjkT4dWgek=;
  b=NpoxGSwRBXOblJN9GUDJVjZISmaZ4MgXuDR+5hqt8upRYxOzDSlmPv9I
   dNVRQ8QtPnk4ICrpLyRD9mO0r2pSQG/Bm7njAWuLay+DjuqrBcZlSYqav
   N3XAiIzrxiIIPldmjTbGFJEb7+i3ddsS+i4KlmhwGLSa40UeipPL6Jnh/
   dRTRpz63l4jGxLU3g2qMFz83Q1MnHD/k7PI2Sgc9ZD/euWrL1bgZFbvQf
   y32z1mr3r4FtPB3EL7TnVFJObxZIrlD59Zv8tgYPRA+CjR0jrojO9Ux7w
   pA6rP2Aqb+osKRMfBNiqc8r8a+AR3EmZXl1iGwDjtTAq5nULFltaRnvbZ
   w==;
X-CSE-ConnectionGUID: vdsx5v2mQem4EGvKJ72pNA==
X-CSE-MsgGUID: uFwXZmnUSoCN3kalaDbOig==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78284895"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78284895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:28:27 -0800
X-CSE-ConnectionGUID: wdrgqm5bRUO1De1/2M2Jtw==
X-CSE-MsgGUID: SIfnm9GmT/+mhX0P6xkSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196250280"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 12:28:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9kW-000000006Zb-1dP2;
	Fri, 12 Dec 2025 20:28:24 +0000
Date: Sat, 13 Dec 2025 04:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 3/3] net/core/dev.c:6374:14: warning: no
 previous prototype for function '__netif_receive_skb_hook'
Message-ID: <202512130442.YYfHJu3T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux coroutine/base
head:   3d1468dcf813bc71d425b7ce656a6877d98684e9
commit: 3d1468dcf813bc71d425b7ce656a6877d98684e9 [3/3] Basic Rx integration
config: arm-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130442.YYfHJu3T-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130442.YYfHJu3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130442.YYfHJu3T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/dev.c:6374:14: warning: no previous prototype for function '__netif_receive_skb_hook' [-Wmissing-prototypes]
   noinline int __netif_receive_skb_hook(struct sk_buff *skb)
                ^
   net/core/dev.c:6374:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline int __netif_receive_skb_hook(struct sk_buff *skb)
            ^
            static 
   1 warning generated.


vim +/__netif_receive_skb_hook +6374 net/core/dev.c

  6373	
> 6374	noinline int __netif_receive_skb_hook(struct sk_buff *skb)
  6375	{
  6376		return 0;
  6377	}
  6378	ALLOW_ERROR_INJECTION(__netif_receive_skb_hook, ERRNO);
  6379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
