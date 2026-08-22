Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD9346774
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787377616; cv=none; b=Bu2dPCh7LRcWqwwulcKS5WsRURUfaj1AIfCCMh9wJMAVl9mROc31eC/4yKIbw1iheDiy2+P66bv9QLGrvxY1fDGRG+r9G2w3G6qXrcEVNay0iA+EWDH9vMhwDcE3WSSWurtu0L3AagGTBErDO5zbYjiD4bDMI+m9A0rheDOP/DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787377616; c=relaxed/simple;
	bh=sDBqIZxzMDzC42zJpOdgPyoIP/FHfpV8ZEptlS+cB+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uiLnuFGJOxGjXrHY7O6VhzBW8b8NGaM2isIOfBcQXp5eWA6b6ef6XhYRRK6+sISc9PPJdZf+cyQK42a8PU8VMnLQ8nDmmKFL6+y0Z+XBLNHGCBl3sdfcnzWoymjGbeoWSAXk3Lsy6/enbgBgkh9+PGCEAjJfW8YHEJ8hpdG2bhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krNTTjA0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krNTTjA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787377615; x=1818913615;
  h=date:from:to:cc:subject:message-id;
  bh=sDBqIZxzMDzC42zJpOdgPyoIP/FHfpV8ZEptlS+cB+Q=;
  b=krNTTjA0eHLDZcrcK/TbdpnwWs3d2FlkMSpX6Eml/g/9Zxo21OS6Msdz
   C/XdRgwwXCz0bJ/HOzTo+bYMEqj1yuuu3gdhynwc1fJ4hVcrH8QJembl6
   MGafMhzBVYfDxBO/kEkn39oglctJl9W71LRut4c8SsBCcu34VcXCr/elL
   AsonQLxR1QMA2ds/gRVSiGEvLBTavc6D9ytuWHGi2TKbCIqzds6E/cBNG
   XkGjyggagmTrKZjNHd2yisa5aVA+xAEX/1V665XGmXUSZPGGTPcl+K9JV
   l/VdkSQD2f4fblX+ihATCuVz5zKy4ZtvWM7gjGbgOLEXiXUZ9wU4kJM74
   A==;
X-CSE-ConnectionGUID: ZNMY4XNmQgCLv0B8w3KoYQ==
X-CSE-MsgGUID: qd6xp+BeSUCy8uOCkEcZcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87037240"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="87037240"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 22:46:54 -0700
X-CSE-ConnectionGUID: FmJIgTkdSMSt+IWGGeJeBA==
X-CSE-MsgGUID: gkL7NtNvT+aHZLD+Tt36CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="262810395"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2026 22:46:53 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxeZ8-000000007q9-3BF0;
	Sat, 22 Aug 2026 05:46:50 +0000
Date: Sat, 22 Aug 2026 07:46:24 +0200
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-31 140/161]
 fs/xfs/scrub/repair.h:241:42: error: void value not ignored as it ought to be
Message-ID: <202608220714.O8qjVxAF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-31
head:   99720b43a50e52830dacd44219a5f40dc8cab503
commit: 2e4dfa7b0b3e7bcac4c245421cf37c544e03a21e [140/161] xfs: always report inode repair setup failures
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260822/202608220714.O8qjVxAF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220714.O8qjVxAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220714.O8qjVxAF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/scrub/inode.c:28:
   fs/xfs/scrub/inode.c: In function 'xchk_setup_inode':
>> fs/xfs/scrub/repair.h:241:42: error: void value not ignored as it ought to be
     241 | #define xrep_setup_inode(sc, imap)      ((void)0)
         |                                         ~^~~~~~~~
   fs/xfs/scrub/inode.c:215:24: note: in expansion of macro 'xrep_setup_inode'
     215 |                 return xrep_setup_inode(sc, &imap);
         |                        ^~~~~~~~~~~~~~~~


vim +241 fs/xfs/scrub/repair.h

4bdfd7d15747b1 Darrick J. Wong 2023-12-15  240  
2d295fe65776d1 Darrick J. Wong 2023-12-15 @241  #define xrep_setup_inode(sc, imap)	((void)0)
2d295fe65776d1 Darrick J. Wong 2023-12-15  242  

:::::: The code at line 241 was first introduced by commit
:::::: 2d295fe65776d15c06d53dbe3064f62e036e7c46 xfs: repair inode records

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
