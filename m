Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2040DFDB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 05:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775712299; cv=none; b=oqCgcJJ6DdI9DmjB8IsASWlEVwyg3UmunxnAEXcg5Fxte+LSFZ/ygA4ciNgQwsyEzwnDzllgl3nPNnDdzH5bYKZ/+wvauvLtE7vptjmvpbeyhFpiT9iKt3O3rNmzK+cVtNZZLo2dN7o/LgUctMm0K9fjiPVLDGL5OD12vnAMTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775712299; c=relaxed/simple;
	bh=rJRYkelNi+0zkRO7MPtEnrqKSPYbIYIS8+pI14nizFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jh+fWjHuUZm5XdmbWafvHSiID83GwammYFRCew/iZDaYB9ByzWR+0rd02A9czBExlA9DC2700r98lVeAwElQty7zavtcjD1s7XmQaqRlOP1cGPWdvifMyDOqwDG0+QUGG/bZU+voBCnl/irz4bYihJh6RUoUlVAfLgCM8w1ulag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSQZ9rWr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSQZ9rWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775712298; x=1807248298;
  h=date:from:to:cc:subject:message-id;
  bh=rJRYkelNi+0zkRO7MPtEnrqKSPYbIYIS8+pI14nizFA=;
  b=XSQZ9rWrkL6zo8Ao6XXdCM89lzbHkxL2y7Xyf0ql5BPnRnPusCq3Hlr4
   M9knMff2U4UXf/SCujgfVW2RZTfNdX32A5Ly5VMtAygL6nbocvKS2ZFpm
   xU+sZTOoPsjaSzsMNouGouUQUK2bqjNgSZ5a5D8ftmDs28lgPL8qhXOAw
   +/ohmygIP0rHwLnImxmOzgNHvBvhMJgZK8DHeftIe2Jenig/yXxyx7Wop
   ejPE3pu1NsovOPg5kR3xofndlZUkPAxapFDKyej3OBaIHqqh02IsUFHii
   9AlvM8Sh6Zgo/6pFQOJayViY3tTvT4u/VN9jMOnsDBpVBAKxgS5qDgD5k
   Q==;
X-CSE-ConnectionGUID: sYH4dcOOQWmq6yuNholsGg==
X-CSE-MsgGUID: SrKIzUgBQTClnHzfIPhT1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87331935"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="87331935"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 22:24:57 -0700
X-CSE-ConnectionGUID: 3Bi5R9VmRZmD7kPzOdGA2w==
X-CSE-MsgGUID: s1Dw/DZHQLOxhQH07RQ3Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="233045896"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Apr 2026 22:24:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAhsq-00000000AcT-2hL9;
	Thu, 09 Apr 2026 05:24:52 +0000
Date: Thu, 09 Apr 2026 07:24:47 +0200
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <technoboy85@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8662/12838] htmldocs: MAINTAINERS:40:
 WARNING: Inline strong start-string without end-string. [docutils]
Message-ID: <202604090741.1kUVXMoc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   db7efce4ae23ad5e42f5f55428f529ff62b86fab
commit: 420849332f9f9f1ce6ff142868ae2e6ae9f98f65 [8662/12838] get_maintainer: add ** glob pattern support
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260409/202604090741.1kUVXMoc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090741.1kUVXMoc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>> MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
   Documentation/userspace-api/landlock:480: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +40 MAINTAINERS

^1da177e4c3f41 Linus Torvalds   2005-04-16   6  
aa204855281389 Kees Cook        2019-10-01   7  	M: *Mail* patches to: FullName <address@domain>
aa204855281389 Kees Cook        2019-10-01   8  	R: Designated *Reviewer*: FullName <address@domain>
eafbaac3093760 Paul E. McKenney 2014-06-02   9  	   These reviewers should be CCed on patches.
aa204855281389 Kees Cook        2019-10-01  10  	L: *Mailing list* that is relevant to this area
aa204855281389 Kees Cook        2019-10-01  11  	S: *Status*, one of the following:
^1da177e4c3f41 Linus Torvalds   2005-04-16  12  	   Supported:	Someone is actually paid to look after this.
^1da177e4c3f41 Linus Torvalds   2005-04-16  13  	   Maintained:	Someone actually looks after it.
^1da177e4c3f41 Linus Torvalds   2005-04-16  14  	   Odd Fixes:	It has a maintainer but they don't have time to do
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  			much other than throw the odd patch in. See below..
^1da177e4c3f41 Linus Torvalds   2005-04-16  16  	   Orphan:	No current maintainer [but maybe you could take the
^1da177e4c3f41 Linus Torvalds   2005-04-16  17  			role as you write your new code].
^1da177e4c3f41 Linus Torvalds   2005-04-16  18  	   Obsolete:	Old code. Something tagged obsolete generally means
^1da177e4c3f41 Linus Torvalds   2005-04-16  19  			it has been replaced by a better system and you
^1da177e4c3f41 Linus Torvalds   2005-04-16  20  			should be using that.
6680125ea5a2a5 Joe Perches      2020-04-06  21  	W: *Web-page* with status/info
6680125ea5a2a5 Joe Perches      2020-04-06  22  	Q: *Patchwork* web based patch tracking system site
6680125ea5a2a5 Joe Perches      2020-04-06  23  	B: URI for where to file *bugs*. A web-page with detailed bug
6680125ea5a2a5 Joe Perches      2020-04-06  24  	   filing info, a direct bug tracker link, or a mailto: URI.
6680125ea5a2a5 Joe Perches      2020-04-06  25  	C: URI for *chat* protocol, server and channel where developers
6680125ea5a2a5 Joe Perches      2020-04-06  26  	   usually hang out, for example irc://server/channel.
bf667efc5672df SeongJae Park    2024-02-16  27  	P: *Subsystem Profile* document for more details submitting
4699c504e603e2 Dan Williams     2019-11-24  28  	   patches to the given subsystem. This is either an in-tree file,
4699c504e603e2 Dan Williams     2019-11-24  29  	   or a URI. See Documentation/maintainer/maintainer-entry-profile.rst
4699c504e603e2 Dan Williams     2019-11-24  30  	   for details.
6680125ea5a2a5 Joe Perches      2020-04-06  31  	T: *SCM* tree type and location.
6680125ea5a2a5 Joe Perches      2020-04-06  32  	   Type is one of: git, hg, quilt, stgit, topgit
aa204855281389 Kees Cook        2019-10-01  33  	F: *Files* and directories wildcard patterns.
679655daffdd27 Joe Perches      2009-04-07  34  	   A trailing slash includes all files and subdirectory files.
679655daffdd27 Joe Perches      2009-04-07  35  	   F:	drivers/net/	all files in and below drivers/net
679655daffdd27 Joe Perches      2009-04-07  36  	   F:	drivers/net/*	all files in drivers/net, but not below
679655daffdd27 Joe Perches      2009-04-07  37  	   F:	*/net/*		all files in "any top level directory"/net
420849332f9f9f Matteo Croce     2026-03-02  38  	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs
679655daffdd27 Joe Perches      2009-04-07  39  	   One pattern per line.  Multiple F: lines acceptable.
6680125ea5a2a5 Joe Perches      2020-04-06 @40  	X: *Excluded* files and directories that are NOT maintained, same
6680125ea5a2a5 Joe Perches      2020-04-06  41  	   rules as F:. Files exclusions are tested before file matches.
6680125ea5a2a5 Joe Perches      2020-04-06  42  	   Can be useful for excluding a specific subdirectory, for instance:
6680125ea5a2a5 Joe Perches      2020-04-06  43  	   F:	net/
6680125ea5a2a5 Joe Perches      2020-04-06  44  	   X:	net/ipv6/
6680125ea5a2a5 Joe Perches      2020-04-06  45  	   matches all files in and below net excluding net/ipv6/
aa204855281389 Kees Cook        2019-10-01  46  	N: Files and directories *Regex* patterns.
6680125ea5a2a5 Joe Perches      2020-04-06  47  	   N:	[^a-z]tegra	all files whose path contains tegra
6680125ea5a2a5 Joe Perches      2020-04-06  48  	                        (not including files like integrator)
bbbe96ed899e8e Stephen Warren   2013-04-29  49  	   One pattern per line.  Multiple N: lines acceptable.
6ab88e00704bde Joe Perches      2014-01-23  50  	   scripts/get_maintainer.pl has different behavior for files that
6ab88e00704bde Joe Perches      2014-01-23  51  	   match F: pattern and matches of N: patterns.  By default,
6ab88e00704bde Joe Perches      2014-01-23  52  	   get_maintainer will not look at git log history when an F: pattern
6ab88e00704bde Joe Perches      2014-01-23  53  	   match occurs.  When an N: match occurs, git log history is used
6ab88e00704bde Joe Perches      2014-01-23  54  	   to also notify the people that have git commit signatures.
aa204855281389 Kees Cook        2019-10-01  55  	K: *Content regex* (perl extended) pattern match in a patch or file.
aa204855281389 Kees Cook        2019-10-01  56  	   For instance:
c7c4fb18d0026b Joe Perches      2009-10-26  57  	   K: of_get_profile
bbbe96ed899e8e Stephen Warren   2013-04-29  58  	      matches patches or files that contain "of_get_profile"
c7c4fb18d0026b Joe Perches      2009-10-26  59  	   K: \b(printk|pr_(info|err))\b
bbbe96ed899e8e Stephen Warren   2013-04-29  60  	      matches patches or files that contain one or more of the words
bbbe96ed899e8e Stephen Warren   2013-04-29  61  	      printk, pr_info or pr_err
c7c4fb18d0026b Joe Perches      2009-10-26  62  	   One regex pattern per line.  Multiple K: lines acceptable.
c7c4fb18d0026b Joe Perches      2009-10-26  63  

:::::: The code at line 40 was first introduced by commit
:::::: 6680125ea5a2a5a69eeb8f7dcd89d0a1d23998ce MAINTAINERS: list the section entries in the preferred order

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
