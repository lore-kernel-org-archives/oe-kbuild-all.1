Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E706C360DE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691663469; x=1723199469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3ZJaffQtrJcnWTIX3eBuv/w6RQwnVnMmbTKoINB7uc=;
  b=jR8vKoZsZ4Z3Pynf2FM8BpQYirTr2iw+YwREswH5Hr9ddTof/mdeQxcu
   Ah7IiQmkCrG9rBELNlNw2VvsiHUk1lv2rnswqZkqEJxmC/+s2+3oOJQni
   5tHX0HR9PpWg5sPBb7j2cbjDWGcKcBurgZnj2S4sKETKLnzx+yNw8xx9X
   XvJwN9jPLs+qJvqBNNXBuZFr95Z2JCP4QUzQz+yr2L+D+QGWCVOVU0eZe
   V5nToK1fK56PGCdtmKinC7XqPkt8SADZdOaqN98KGRsuRC6xFOM3m34iu
   3EeVG1Ac1jMNQtLv8WSPH3L5xjBk3g2iJvNYhXBW6bcNhhboRpktjSGQA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375079296"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="375079296"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 03:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="732171551"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="732171551"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Aug 2023 03:31:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU2wd-0006vw-0l;
	Thu, 10 Aug 2023 10:31:07 +0000
Date: Thu, 10 Aug 2023 18:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:tmp 57/57] htmldocs: MAINTAINERS:4: WARNING:
 Title underline too short.
Message-ID: <202308101846.Hd6UCcC8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git tmp
head:   e5e1aa4f7c959667cbca59e5421a9519bd8f9e18
commit: e5e1aa4f7c959667cbca59e5421a9519bd8f9e18 [57/57] MAINTAINERS: f
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101846.Hd6UCcC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101846.Hd6UCcC8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> MAINTAINERS:4: WARNING: Title underline too short.

vim +4 MAINTAINERS

^1da177e4c3f41 Linus Torvalds   2005-04-16   3  
6680125ea5a2a5 Joe Perches      2020-04-06  @4  Descriptions of section entries and preferred order
6680125ea5a2a5 Joe Perches      2020-04-06   5  ---------------------------------------------------
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
4699c504e603e2 Dan Williams     2019-11-24  27  	P: Subsystem Profile document for more details submitting
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
679655daffdd27 Joe Perches      2009-04-07  38  	   One pattern per line.  Multiple F: lines acceptable.
6680125ea5a2a5 Joe Perches      2020-04-06  39  	X: *Excluded* files and directories that are NOT maintained, same
6680125ea5a2a5 Joe Perches      2020-04-06  40  	   rules as F:. Files exclusions are tested before file matches.
6680125ea5a2a5 Joe Perches      2020-04-06  41  	   Can be useful for excluding a specific subdirectory, for instance:
6680125ea5a2a5 Joe Perches      2020-04-06  42  	   F:	net/
6680125ea5a2a5 Joe Perches      2020-04-06  43  	   X:	net/ipv6/
6680125ea5a2a5 Joe Perches      2020-04-06  44  	   matches all files in and below net excluding net/ipv6/
aa204855281389 Kees Cook        2019-10-01  45  	N: Files and directories *Regex* patterns.
6680125ea5a2a5 Joe Perches      2020-04-06  46  	   N:	[^a-z]tegra	all files whose path contains tegra
6680125ea5a2a5 Joe Perches      2020-04-06  47  	                        (not including files like integrator)
bbbe96ed899e8e Stephen Warren   2013-04-29  48  	   One pattern per line.  Multiple N: lines acceptable.
6ab88e00704bde Joe Perches      2014-01-23  49  	   scripts/get_maintainer.pl has different behavior for files that
6ab88e00704bde Joe Perches      2014-01-23  50  	   match F: pattern and matches of N: patterns.  By default,
6ab88e00704bde Joe Perches      2014-01-23  51  	   get_maintainer will not look at git log history when an F: pattern
6ab88e00704bde Joe Perches      2014-01-23  52  	   match occurs.  When an N: match occurs, git log history is used
6ab88e00704bde Joe Perches      2014-01-23  53  	   to also notify the people that have git commit signatures.
aa204855281389 Kees Cook        2019-10-01  54  	K: *Content regex* (perl extended) pattern match in a patch or file.
aa204855281389 Kees Cook        2019-10-01  55  	   For instance:
c7c4fb18d0026b Joe Perches      2009-10-26  56  	   K: of_get_profile
bbbe96ed899e8e Stephen Warren   2013-04-29  57  	      matches patches or files that contain "of_get_profile"
c7c4fb18d0026b Joe Perches      2009-10-26  58  	   K: \b(printk|pr_(info|err))\b
bbbe96ed899e8e Stephen Warren   2013-04-29  59  	      matches patches or files that contain one or more of the words
bbbe96ed899e8e Stephen Warren   2013-04-29  60  	      printk, pr_info or pr_err
c7c4fb18d0026b Joe Perches      2009-10-26  61  	   One regex pattern per line.  Multiple K: lines acceptable.
c7c4fb18d0026b Joe Perches      2009-10-26  62  

:::::: The code at line 4 was first introduced by commit
:::::: 6680125ea5a2a5a69eeb8f7dcd89d0a1d23998ce MAINTAINERS: list the section entries in the preferred order

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
