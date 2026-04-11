Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB511A6829
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775878982; cv=none; b=so+KGK6M9oFHoMPDSX1Z25Hm449t/Z9GvV4yOFAE3TEmyLJsE9cxHVXaOL8IV6MueZlLwFGq0AkKOAVQj0myGUtRLVdGrU/eE2fumd4ccVUNZ+bvkmcmKg8925/9vxDHVR9z817RAForXNOrR4MenFSj5y6ZZkYJ5gDh9y+gMUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775878982; c=relaxed/simple;
	bh=we0klAmo81To21/eQQywhUJ1JkqPaiZw0Yf5bXqac4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XNRgU1Hf9eTVjgkpChqW6wa3exzhToYm3n189RVGqpuDQOvc0FVZff8HRrp0E78qjEhRxmUHhT2oqfJs8jrhSyBrLU4Ae1+3+QPB0PjdXxoD7zOgCkURCbdoBL4fGQtwuUa85UJRc8M3lW5eIqdccc3tcyGL9zi1gOKmYRu+HRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lquAtGbf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lquAtGbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775878981; x=1807414981;
  h=date:from:to:cc:subject:message-id;
  bh=we0klAmo81To21/eQQywhUJ1JkqPaiZw0Yf5bXqac4A=;
  b=lquAtGbfvqnIsQ3JnU6CKfyds5d6aJUS7jukPSfnarQ5XkLbi6L19ETs
   bxE3tzAvoPVDfkFhQ0BVbBvYG2uptbN6auaOohagI+dDxw4lDrk5jkfYo
   p6eC/PexGM+RpFrKgJyC+kdz0GNBjYffWkYuZO0PP09t42UJJPMFYb7Z7
   NBkbYM6ZWsIc4NAkG5u+oi+pwUj1LGvNdtN70+/XKTrmvA4YzTtfK46D6
   AGxKRjHN46gQCqpx/wyHBnuOf6iNzUK5GnnKQKVM5HP4j6VWihaIjKqnp
   8xuB7TSJmRFSytCjYVCVL5/K4WTM0tzPwMFi8mdKRSNRobeSHxDfYxox7
   Q==;
X-CSE-ConnectionGUID: e3u4pvUnQuSHZtTbvuNJDQ==
X-CSE-MsgGUID: U+m6WkTQQxie6wjWVdr18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76615093"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76615093"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 20:43:00 -0700
X-CSE-ConnectionGUID: UIb4pwCxRs2+PsnF5A4EgA==
X-CSE-MsgGUID: nFfSkaT6QlOukABdTvDbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="226548612"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 20:42:58 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBPFH-000000000iT-3nDZ;
	Sat, 11 Apr 2026 03:42:55 +0000
Date: Sat, 11 Apr 2026 11:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Olga Kornievskaia <okorniev@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 117/120] Warning: fs/nfsd/nfs4state.c:9657
 bad line:         and optionally other attributes (ie ATTR_ATIME).
Message-ID: <202604111105.OoTETzA5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   1388f70447e3f27ea0e425ef172bf113d1071993
commit: a7f570141bae209189f05fdff295f67fe84dd183 [117/120] nfsd: update mtime/ctime on CLONE in presense of delegated attributes
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604111105.OoTETzA5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111105.OoTETzA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111105.OoTETzA5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/nfs4state.c:9657 bad line:         and optionally other attributes (ie ATTR_ATIME).
>> Warning: fs/nfsd/nfs4state.c:9665 function parameter 'f' not described in 'nfsd_update_cmtime_attr'
>> Warning: fs/nfsd/nfs4state.c:9657 bad line:         and optionally other attributes (ie ATTR_ATIME).
>> Warning: fs/nfsd/nfs4state.c:9665 function parameter 'f' not described in 'nfsd_update_cmtime_attr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
