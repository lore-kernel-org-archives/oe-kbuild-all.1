Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB201F936
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 00:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763080169; cv=none; b=atYGHusflH9U7l2ezR9VKUkk5cS0pulrc8o4gmcGd8Lan1pbJjmeiV4YR5NOGxGYCRnDAQxvOgLIC3DHHQ+Ys5SsA8NqKKw8nvXk1gum2vtbF3+8mZ9tpmbgxPmn2CC9WLh7snmBYaclEWB44AShqrjpJU20myXSt6rV//V5jzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763080169; c=relaxed/simple;
	bh=/SS7OBO9ebI64BEKIbcnp0+vWINhAoKzJ0y1VMXxxVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=br04krn1Z/PEzph3o+dUikDLiyT+j0dkdZNMDgPEIvg874eeMaw5jxcGw/mC+hJNJSfzq5Mj7Y5rQXo3x4aKrRXm1m4g0PadXPxshzjRUgag9wINZn0CWtFCWDCvptMhrNkDgCki12Q//JYEQ/IU0ikLeyXejebAW37CgAB6FiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOJyN8p1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOJyN8p1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763080167; x=1794616167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/SS7OBO9ebI64BEKIbcnp0+vWINhAoKzJ0y1VMXxxVE=;
  b=ZOJyN8p1NiDHaH1qBU9rl2xSsCydFu9K52VrBJCO3adW3zWLtjDED6mV
   jiWYRM5D6v6JSNnwda6pRxefdsGrw+/96VTMuaAQz9tTLet9RmsDxLNkA
   q1CuTfTHESNNjU+eMXAsvE/ZlJRRuGHgLqz8As9eg1Oq/Wiag9P6UQwul
   NXfFbwsFG+Rt4ekuKOw/9IDiyx95QEBaRX3M6fyghibYpFQoOpX9bHwhX
   cGA+5iXBgeUSqHCEqdDIJjKI48NheCeKPzZo7A0e4HNn4K2RxEjePX95c
   TSQyGhcMLnFCQzIljeEGDbeFbTNTVoqK1+5w6GGtAVPBP3l+xpMIGWcfs
   Q==;
X-CSE-ConnectionGUID: /mfdXw2LSzSOxdXcIL6F/Q==
X-CSE-MsgGUID: KMhSvmDLRZu47xUCKFze+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="67774337"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="67774337"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 16:29:27 -0800
X-CSE-ConnectionGUID: sgwbx42lRE66dLOlFDCsdA==
X-CSE-MsgGUID: XPJG68mlR8elIzefYTL/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190064798"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 16:29:26 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJhgq-000619-01;
	Fri, 14 Nov 2025 00:29:24 +0000
Date: Fri, 14 Nov 2025 08:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 84/106]
 kernel/liveupdate/luo_session.c:101:3: sparse: sparse: symbol
 'luo_session_global' was not declared. Should it be static?
Message-ID: <202511140809.4JN2GCxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   c3e0350a1f9934c5e56d859a26bf37a15ab7bb25
commit: 877409d046405d44ba7e15e19345239c1affa4a5 [84/106] liveupdate: luo_session: add sessions support
config: x86_64-randconfig-123-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140809.4JN2GCxV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140809.4JN2GCxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140809.4JN2GCxV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/liveupdate/luo_session.c:101:3: sparse: sparse: symbol 'luo_session_global' was not declared. Should it be static?

vim +/luo_session_global +101 kernel/liveupdate/luo_session.c

    89	
    90	/**
    91	 * struct luo_session_global - Global container for managing LUO sessions.
    92	 * @incoming:     The sessions passed from the previous kernel.
    93	 * @outgoing:     The sessions that are going to be passed to the next kernel.
    94	 * @deserialized: The sessions have been deserialized once /dev/liveupdate
    95	 *                has been opened.
    96	 */
    97	struct luo_session_global {
    98		struct luo_session_head incoming;
    99		struct luo_session_head outgoing;
   100		bool deserialized;
 > 101	} luo_session_global;
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
