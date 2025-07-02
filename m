Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D71DED52
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492868; cv=none; b=LEpOg60F40ipuK/s835zxEb9FFd0I3dmPGEqWxF9oA3tAQBwR1dq51YHxuzLFeg5lweTDtMupFr+G8cGhyHUlwp1VTvaBuLmbfHIIWS4Pp3Uj4Zi61hStjuzSww5jGeBoIUNthhLzvhwdBdkpAyYaHMiQ4Nyeiw9XTrGKlI16vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492868; c=relaxed/simple;
	bh=u5e7LN2hzkb8FCwXKPb2BSBOiXR8OIjgT8FU9LJZE+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWp/q2BD0F0nUmQttbvALxxxv3HoRMkE7GO1/gQaqdeJHZ+jSd1VU84Q7WHEsDUVfpjhZwZ1Jx7FmIHyft+i7+iaaWsrT5pA9QhLHufF8egV6WCJjhSrtvheNa8oeQeKkBbRnLFKsyRC8R1BQK1eKmDIR937pnxU7sPqpxUU1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cM7OGGmr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cM7OGGmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751492866; x=1783028866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5e7LN2hzkb8FCwXKPb2BSBOiXR8OIjgT8FU9LJZE+s=;
  b=cM7OGGmrCOlQWm9zhPZT0rBVVnBnWkqLJi+cFO6nhEpE15zTPfV0Rfn9
   o2a20JjLomI+TEKimxA9/8bzF2DC7ttVcQE2EikDkW46AENr6eIqBZdTe
   yLTfXnwOMvPDvxHfoFjPMGPgCzrzkJ+hFzDjq1yuL4ATLK1Fp596gFDIw
   2lf+1HrW/KAJyOJw0DZn9kav+DCExAIC1SEFN2sSyALZ2jJ5dVaIzuhC+
   372hvAbMuBLtpQZOodGr3BquSe5u5Z4yg/Vw6faog1KBjVuzReTmeuN3O
   MXfZ2o6j3m1CJ0pQxMg3D2FT21PfwqhQa2LS/OkSNFCRuNI0tjSGbyQvz
   A==;
X-CSE-ConnectionGUID: jlXEvoBVSHet1ihvY2TVqw==
X-CSE-MsgGUID: JW00h2DpRIitpKfzl1aiCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53773295"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="53773295"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 14:47:46 -0700
X-CSE-ConnectionGUID: ko1SFAudRPSNMAAhuvyI4Q==
X-CSE-MsgGUID: Z3Lxqj18RuuniNOhv2lHhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="159696966"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 14:47:45 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX5Is-0000LB-2a;
	Wed, 02 Jul 2025 21:47:42 +0000
Date: Wed, 2 Jul 2025 23:46:54 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] arch/x86/kernel/cpu/tsx.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202507022335.TNQz2BS2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 3115bfac2b92923e5d01eecc9b84ea7f499b1c5c [1605/1605] x86/cpu: Add a "tsx=" cmdline option with TSX disabled by default
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250702/202507022335.TNQz2BS2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022335.TNQz2BS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022335.TNQz2BS2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/tsx.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
