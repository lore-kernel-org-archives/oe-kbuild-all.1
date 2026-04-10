Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E3F33D6E3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820936; cv=none; b=lIzLGuwE9wcJb2v4vDFQFmi1Zc0td2DAv2yKYinLlDQ9MKq/64Ggir8d9Om8wfILvwOVHUOmffrSrNc1x9GwDYfGKqw70QMN23DS7zG4pO0s8uxuzJ7dmuSfKPLy1/NM+YzqzRDahdpFo+SZ7E+CjIED8e3XhRz41oYFJZzqYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820936; c=relaxed/simple;
	bh=6WqKHYUFxAAFg8bcgtLUeK59ZS5JpdCYSO5l/bJ1h9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dJu31r8CRGjlOk7znzko5XA7sHajrANgxTTEnhyCGAxH8k2IYrTh6macFSlEsrLMo/yzdtC3z411DnlE/Ugug9jwd+sXUe2fYB2IzUKhEju5+HaczUPBSlB09gkvUv4ffYA9Kzl+EHm5RTifbvJnYyzN6SKflUXZYt0VRRvV1JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1EQRVhL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1EQRVhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775820934; x=1807356934;
  h=date:from:to:cc:subject:message-id;
  bh=6WqKHYUFxAAFg8bcgtLUeK59ZS5JpdCYSO5l/bJ1h9k=;
  b=O1EQRVhLyJIl5aadKZFsBLSdOzWxoa6nEvCZSb3mHdvQUKOlfONo2pDE
   oy3m9lVIiwJDoNpbEGYA0e6uZ9pM1I84b4IW8SrQQ+CMcp89WtcpyQAyZ
   diQcOoWydJV4cXVwnv2BBsTUcp60JtQO6cwtxG8Oo4ce52O1eZTRkRVTW
   1GKo72ohnPrJKLVbIAbGg2+FqooR3fsuHdQvRIHTUeduuJl/oWd0OU6mJ
   Fddc+NJCwgn+DMnUyZJIMrMYcUasUNp0Ag12pAKhqFB8wwTqsgSG5hJy1
   Ed3dQO2a7r3cOfosDhisszTAOUM1Lp/z2Vz+tc3EqfJ8ZsFClghNF/eFg
   A==;
X-CSE-ConnectionGUID: pMm5C+5GQ2K9l3jgu0BYHw==
X-CSE-MsgGUID: qjsr01GORbGO8Sy3RL5Pvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76008344"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76008344"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:35:33 -0700
X-CSE-ConnectionGUID: CnUeVbQHQZOIGFVJwYuI7A==
X-CSE-MsgGUID: V5YN50fBSaGfZisz8usKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233990218"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2026 04:35:32 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBA93-000000003f7-3t8f;
	Fri, 10 Apr 2026 11:35:29 +0000
Date: Fri, 10 Apr 2026 19:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 1571/1700] Warning:
 fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in
 'bch2_journal_flush_seq_async'
Message-ID: <202604101903.SKgL8wtj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   fb7dce73e6871585b0721da899e854c348902770
commit: a0168a474528cc64bf290cf20399e714161f4538 [1571/1700] bcachefs: Pass BCH_WATERMARK_reclaim when discards require journal flush
config: sparc-randconfig-002-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101903.SKgL8wtj-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101903.SKgL8wtj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101903.SKgL8wtj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in 'bch2_journal_flush_seq_async'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
