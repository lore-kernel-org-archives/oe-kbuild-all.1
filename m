Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D22D7080D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 04:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773375495; cv=none; b=SsjsJCJg9zJcietPBDquiisR+/0Qs4Dy0kHuS/DBqCpmg+KO/C0CRhLe6ouQ+bEGZq6k/QcI6RmwUvvQanDSxMNk+Dog2/UMbRqb/cufVGNzlSeYI55YU51d+xdC3mw500/xUxmP/HTWXrL/yjxVEVtu2NToPDiwImPoaxg7DzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773375495; c=relaxed/simple;
	bh=2k/F0SZT7Xv6ggBApqTgD5cbWgwsRk0FUwBiPmm0rP8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f+mUBnQNMcpkzexs75AsJ8Nb6BZIqRXOGavTvnGFtUp503WNPMs3nX/GXHJ2TlP4mxw2b1q/mZjM3jEJrSG29XDaitJXdoDCCpiBEUGsuY5EPt3odqJ7fTX3fCMuZ0pda0d6lxm9621YJz60xHXCkciNp5KDPDAhMRybPKe2kcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmUNoRi6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmUNoRi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773375493; x=1804911493;
  h=date:from:to:cc:subject:message-id;
  bh=2k/F0SZT7Xv6ggBApqTgD5cbWgwsRk0FUwBiPmm0rP8=;
  b=NmUNoRi63c603N1inMDG6L49FHhJ0lRWzN4qXUcqOztJwUEptWm1iVEY
   +eBf4ItCQ3ZIwOklxYvsnXrRcvKOllZrl5wDqzc1ggWiThuoCmynwHXKA
   n4BceqjDOnhmVSddkl7eTls7GKGsErkkAEwDEJMCxUqgxKdqRTZi4n7bO
   fLA4K7OlPcYrb2spx4qok6b6JdhVvkqKwcvyncc6OUbvaBUPfTDkdOldp
   8+ZDOS3zTZgykKcOSSgH1hJx7Jqv+23LzYGxnSf/Zr+Juwik/HOn4fj/X
   zhjBijXzQJrXLGlB5upzGooHzuUtG2SjNr2T0qYRkoqABiG/Wt3gkYEkH
   w==;
X-CSE-ConnectionGUID: G6AxKQKKQN2eXF8G1a9wPw==
X-CSE-MsgGUID: LN8pquJYRZa6R5NklRZzsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78374316"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="78374316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 21:18:13 -0700
X-CSE-ConnectionGUID: rppWKp1nQWWSguyclS7gVQ==
X-CSE-MsgGUID: zlOdF+XhSOmoxNzuqNLAPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="221237166"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 12 Mar 2026 21:18:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0tyS-000000003d7-2LJs;
	Fri, 13 Mar 2026 04:18:08 +0000
Date: Fri, 13 Mar 2026 05:17:44 +0100
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-new 367/381] htmldocs:
 Documentation/filesystems/mmap_prepare.rst: WARNING: document isn't included
 in any toctree [toc.not_included]
Message-ID: <202603130548.Eq61ZQ3W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   593fab843afbd6800243552aebcc61d02d3cdcb2
commit: a6cdd3274e8a03e218fe6bf3ef711902adb76727 [367/381] mm: add documentation for the mmap_prepare file operation callback
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260313/202603130548.Eq61ZQ3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130548.Eq61ZQ3W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/core-api/percpu-counter-tree.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/filesystems/mmap_prepare.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/filesystems/mmap_prepare.rst:60: WARNING: Pygments lexer name 'Cw' is not known [misc.highlighting_failure]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
