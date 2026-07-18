Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE6E221721
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381847; cv=none; b=ED+cgdi454hdaIePN+Q6ovIMirBShY7DcBt10AFMy6zdNAj5ydW++bDFERBgMJ6ystb04Ns/3TGV0nccdvTR0qAERtTZEaQ8hqYSmPjTEqrW7m8o02ntFqgFfQF1zn4hVOKGo/kmNpT8xRquLqJiNHFhZGupUFUm28//uxnkCgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381847; c=relaxed/simple;
	bh=wOGp812CyFLoI13Mw7gicJbppdsQ4lrPAgX3j2kZ/4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N1z1wvLQKzq0I9YAfQnlmm3wS9oRVjanak1QrexbzZfvTRLXy3TBjxn0EuBPm6KANwEr00zELQv4CTIATIrNzRs93PnAHaWTX1LrxOWRY4cxmS6xrS62ZO6ZKM+VzCPexHXNYfbOMiU5ni/BqkRNZ0HIv8OQ0SB71GKOMT/CVoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLXw/WMN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLXw/WMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784381845; x=1815917845;
  h=date:from:to:cc:subject:message-id;
  bh=wOGp812CyFLoI13Mw7gicJbppdsQ4lrPAgX3j2kZ/4o=;
  b=TLXw/WMNs07OoprEJhlcU7CkwFxcwIvLiQdTHBWb6FFgb5W6lQL4xOtD
   7Q+BfYHa8siZWKhVsEn/fuXvZZUN2hC/3J8MEi+H1eSf3lzTnm2T2JruI
   cpOJr/UIfCprj9jpl0S2Gtl0B/bz32UFaf7IsdIIuPAVqwuuIHq1BNMKj
   KemkEuRdm13IV00lh/6KRRcmZYBBIncwJIHWkeA+wor1v7A5D5fWXQ5YI
   iwuzE0MJfFot5dNxo8L9t5PaJ9DtRvB5iIqNHmeyA0+d5KZXkMfEk2R5w
   27O76LIJXzJ18eCkL//9Ta/ICF4dy7HIADYGTpja98LOAXb/uobChq5EM
   Q==;
X-CSE-ConnectionGUID: Ax/wEdaURYG3THruFDK3dA==
X-CSE-MsgGUID: +KraCXWESCSn3LkWcTyKlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85120246"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="85120246"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 06:37:25 -0700
X-CSE-ConnectionGUID: 1CBubtgPQtCrIs/Z2Bka0Q==
X-CSE-MsgGUID: z3eDOqzgS+6aRpsKjZgisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="252623792"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jul 2026 06:37:23 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl5EH-000000005pd-1pZi;
	Sat, 18 Jul 2026 13:37:21 +0000
Date: Sat, 18 Jul 2026 15:36:47 +0200
From: kernel test robot <lkp@intel.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/cxl/core/hdm.c:1187 function parameter
 'data' not described in 'cxl_reset_commit_end'
Message-ID: <202607181507.Vj751ChL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alison-Schofield/cxl-hdm-Reject-switch-decoder-interleave-ways-that-overflow-targets/20260718-054438
head:   6ded817798c7f4c48aa596e2fdeeb9ffe62cbd91
commit: 6ded817798c7f4c48aa596e2fdeeb9ffe62cbd91 cxl/hdm: Restore commit_end when decoder enumeration fails
date:   16 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260718/202607181507.Vj751ChL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181507.Vj751ChL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181507.Vj751ChL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cxl/core/hdm.c:1187 function parameter 'data' not described in 'cxl_reset_commit_end'
>> Warning: drivers/cxl/core/hdm.c:1187 expecting prototype for devm_cxl_enumerate_decoders(). Prototype was for cxl_reset_commit_end() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
