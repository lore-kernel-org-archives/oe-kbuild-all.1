Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65B023EAA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 01:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775869698; cv=none; b=oO/qvAAnJbHr10VLlecyXW59kYKQZtbeH8EMxalvCwfe/M+MX0yqagiwGztzbNHpFk70iVKg2PYQz+WUkGL4KBY8oHw1SCeD7RYSUtm1Mb8e1as55bw2g5rOzIXhxvcFVYiPHbvJqOAuzYyQaJekHllnUA6CDpXhm2GOmgdgRnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775869698; c=relaxed/simple;
	bh=2LF5RdUBp1Tsc2oJO8VuKmpY+vCUdZBhzxJeuma3tXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pZ31wr8P48umZwwGnv5HLw84jZZHGNTRF5KStwvIupOXKSen1Yma2X26gClYvEESAR0cdaPokXvHrAd+55yl0e6XtHlIXr/aY+iJp6VhWiMKFZ471RvrKTUynmyDv7AVZ8jcbK2TERQdMaz7CP78HmJxyeLcUv3vk375D8OdVQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEpMnbS3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEpMnbS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775869696; x=1807405696;
  h=date:from:to:cc:subject:message-id;
  bh=2LF5RdUBp1Tsc2oJO8VuKmpY+vCUdZBhzxJeuma3tXQ=;
  b=YEpMnbS3WsZvW+KrUe4qh8wtkm0+vEF342SXcJrLBFIfhBI/vl4TJv+8
   xVQuWhs97Ety13yHejfcxu2+KOMI6uGK39py/B5VbFcgYFSxXTo6MZWZO
   eByQE3QqJuyVSsr/AJl+ldWpDI/5SH+Htjs/7c6BFwYNwrogjQkW2GAVt
   cwkSLp0nYGhKRqp9HwsBKIQgc+f+o35SA5Rn8JrGB1wOpwNvYViN+VYP7
   7v1qoflf1XvP9I6Rsb0PS8z24c6x6bi8CtXTjsO1pS9wJXmiQvmuKMr0+
   SaYRMBMfgjh4Rkc669QmbtKY+0kUv50uDCRPY4Gaz+Sl7nIhfQamh4dQb
   A==;
X-CSE-ConnectionGUID: glqlfRV/TiCP1pmm+qtPLw==
X-CSE-MsgGUID: AI7b4QNvQ8uIkjy+sDjR/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94285278"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="94285278"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:08:16 -0700
X-CSE-ConnectionGUID: Ixa4XDqXS2ylBLATj9EgwA==
X-CSE-MsgGUID: IhN7SNQoR/iA6tLyw12HNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="226531114"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 18:08:15 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBMpY-00000000Azx-3aLu;
	Sat, 11 Apr 2026 01:08:12 +0000
Date: Sat, 11 Apr 2026 03:07:52 +0200
From: kernel test robot <lkp@intel.com>
To: Olga Kornievskaia <okorniev@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 117/120] Warning: fs/nfsd/nfs4state.c:9657
 bad line:         and optionally other attributes (ie ATTR_ATIME).
Message-ID: <202604110311.NqwEcEw9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   1388f70447e3f27ea0e425ef172bf113d1071993
commit: a7f570141bae209189f05fdff295f67fe84dd183 [117/120] nfsd: update mtime/ctime on CLONE in presense of delegated attributes
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260411/202604110311.NqwEcEw9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110311.NqwEcEw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110311.NqwEcEw9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/nfs4state.c:9657 bad line:         and optionally other attributes (ie ATTR_ATIME).
>> Warning: fs/nfsd/nfs4state.c:9665 function parameter 'f' not described in 'nfsd_update_cmtime_attr'
>> Warning: fs/nfsd/nfs4state.c:9657 bad line:         and optionally other attributes (ie ATTR_ATIME).
>> Warning: fs/nfsd/nfs4state.c:9665 function parameter 'f' not described in 'nfsd_update_cmtime_attr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
