Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A9E86324
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 05:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742879440; cv=none; b=r6l2ZedPuqvoa9ia2S84ne4JQtARVMDGj/edq6qNF6SRstvL9xGa+BQZLtwa4zcTEdd1ll3pmIoolG+LUAS/iHTyixADiR2SHnEAhKsaaNbHP5SAat5tJo85dmt0OOQLy9solSDolpysRfvTJyuVqxwzm3+4K52f3BA4rRvSeGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742879440; c=relaxed/simple;
	bh=VnUA6qIlV4kct3J+c72cj1s/FHG99gtx+RYfaqOo84U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mLAV5W/HCJXuxhai3msFaQhonxRSrz7R00xOsDGdKmffF67KI42qntLbkc569Qkrpeaxzh23tuPvFjZ/INbpyv/33PGiTAffwJmFHupXe8s3aLLHQLOU9uPW/fVrjj2XTmuWqdhHG916kSyZYdI+X5qCNerEPuQoya1T6XEYzQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rw9jfZcg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rw9jfZcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742879439; x=1774415439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VnUA6qIlV4kct3J+c72cj1s/FHG99gtx+RYfaqOo84U=;
  b=Rw9jfZcg4IO/rtVXvI8OakvsyU75+W0k0etYbO0PbcTMs16YLaE8aXwE
   S7RpCVjmNuhDsHKOdRzXQ1doj9pa9pZRzkU1o9Tuxx8yomcK3CPkimd9y
   XVNLqoLVWkIUG9ayuvyEFZXkT9a6iT7uMjNb0kI2Htx5tNkCn91qBnzpk
   c3zfNGrP8Or0So++iAs1fJIyS98JahOqzEGofED1S2JhDhbKwezU9RNXQ
   yIvZYNS+jFRn0Gq9e7OVQBtDyvF0zS69lKlI+uiikyJZn/hNfHaZenZis
   gV1R//c+aeAd+Jd7Gp8YgHOlgk+UcG4O99UMFAEIrh5TsSCpxnq36YHHJ
   Q==;
X-CSE-ConnectionGUID: 7Fq5JMxGQBCZdUZIr9sMtQ==
X-CSE-MsgGUID: WdX/0IprRnKXBpM+wzTXYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43998740"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="43998740"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 22:10:38 -0700
X-CSE-ConnectionGUID: fzy5ybNoTC+n+S5BolDjpA==
X-CSE-MsgGUID: j1CQXVlFSXSuzYTDJ41ONw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="155276519"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Mar 2025 22:10:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twwYT-00049j-1s;
	Tue, 25 Mar 2025 05:10:27 +0000
Date: Tue, 25 Mar 2025 13:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: <stdin>:4:15: error: 'cmpxchg8b_emu' undeclared here (not in a
 function)
Message-ID: <202503251216.lE4t9Ikj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f2d529458523f6d889a926623f4ddc7de4df063
commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfksyms as an alternative to genksyms
date:   2 months ago
config: um-randconfig-r123-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251216.lE4t9Ikj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251216.lE4t9Ikj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251216.lE4t9Ikj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from <stdin>:1:
>> <stdin>:4:15: error: 'cmpxchg8b_emu' undeclared here (not in a function)
   include/linux/export.h:70:23: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   <stdin>:4:1: note: in expansion of macro 'EXPORT_SYMBOL'
--
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from <stdin>:1:
>> <stdin>:4:15: error: 'csum_partial' undeclared here (not in a function)
   include/linux/export.h:70:23: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   <stdin>:4:1: note: in expansion of macro 'EXPORT_SYMBOL'
>> <stdin>:5:15: error: 'csum_partial_copy_generic' undeclared here (not in a function)
   include/linux/export.h:70:23: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   <stdin>:5:1: note: in expansion of macro 'EXPORT_SYMBOL'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
