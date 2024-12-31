Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9140118C03A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735634362; cv=none; b=Fg4uZdzpxcNO5/Dnu6+p29TMYJGRX54AmsJQtDrdwsa5mCXGqJ1ENakRrkFX2brmlCY1ANNauj+mgNgMsorT4OUCQWZv73Lva6WiFesL3HE6eW/g75JXX8eLIUSksxhdMDRXpTWhaJ+HyMIlc/35OWfNLP3v0XSFOtYy2jhC/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735634362; c=relaxed/simple;
	bh=hXDhCutZNqzvpuplyiodcasrJq1ND89FtQQ0BZb1Qls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8IInkHl2PvB0cd+bLRkVSPXU4Xq8zhe1uqtsChfm4d+nGHAxkYe7zdOsKp+nb2FECXqoSjkQ1+a38MR9UkYeD3glOxRWGtpci9cdov8NEyQqDyDlqcTQK65gqVYQSIg63UrRpe2B+bpSYrThqo6PjBEJCWBAN/GFYiwAGjO7qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmA6MjK/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmA6MjK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735634360; x=1767170360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXDhCutZNqzvpuplyiodcasrJq1ND89FtQQ0BZb1Qls=;
  b=dmA6MjK/GMMAxjKhj/Rn7e65Rha8CHRqsPk7+26OVwpHUocqHg1RAocc
   0tlKjd4w0HUabq38UMvrIcRih8zNK9fR0qozNf/h4MewFUd60taYhAW/S
   ++P7OdpoCH9wHYHrAjeazaehDZ5HVMFVwYbNbiDz96b0KmZoEjkPmBZxP
   HgeWvGZzq3VneNb3u00r1xrPX8RxUNQyHtP6/F6vS63uUG3SF4XJIyn3P
   jv2Cl+HfAgeqgnS9tnlHU1OPxxbmiM2KbPyx5kyLBw0T6kHQ4D69iv20J
   R3wYPjOKRsfv3NcP52nVGc2tTJU8YXhel7FoAwLQ47GNPwR5p1/rFRpSK
   g==;
X-CSE-ConnectionGUID: ItCObU2bSB+jmUjKTHiJ1g==
X-CSE-MsgGUID: NMoK5ZvhSMq9czw3y6LF8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36073934"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="36073934"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 00:39:19 -0800
X-CSE-ConnectionGUID: RwMwAs/PQVOLsyjGGx8vJA==
X-CSE-MsgGUID: AdeDQv5GQxWSLaXnBoO2Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101488570"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Dec 2024 00:39:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSXmV-0006zJ-2c;
	Tue, 31 Dec 2024 08:39:15 +0000
Date: Tue, 31 Dec 2024 16:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/mv_ctltables 3/4] kernel/trace/trace.c:142:5:
 sparse: sparse: symbol '__disable_trace_on_warning' was not declared. Should
 it be static?
Message-ID: <202412311602.RT9jrY5s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/mv_ctltables
head:   d065a4aec275d0bab083678e1330285bc50b1590
commit: 3e97d1a775c38faac60cd694b1274d94b525a942 [3/4] ftrace: Move trace sysctls into trace.c
config: um-randconfig-r122-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311602.RT9jrY5s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311602.RT9jrY5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311602.RT9jrY5s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace.c:142:5: sparse: sparse: symbol '__disable_trace_on_warning' was not declared. Should it be static?
   kernel/trace/trace.c:490:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:490:28: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:490:28: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:504:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:504:33: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:504:33: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:2822:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace.c:2822:38: sparse:     expected struct event_filter *filter
   kernel/trace/trace.c:2822:38: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace.c:444:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:444:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:444:9: sparse:    struct trace_export *
   kernel/trace/trace.c:459:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:459:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:459:9: sparse:    struct trace_export *

vim +/__disable_trace_on_warning +142 kernel/trace/trace.c

944ac4259e3980 Steven Rostedt           2008-10-23  140  
de7edd31457b62 Steven Rostedt (Red Hat  2013-06-14  141) /* When set, tracing will stop when a WARN*() is hit */
de7edd31457b62 Steven Rostedt (Red Hat  2013-06-14 @142) int __disable_trace_on_warning;
de7edd31457b62 Steven Rostedt (Red Hat  2013-06-14  143) 

:::::: The code at line 142 was first introduced by commit
:::::: de7edd31457b626e54a0b2a7e8ff4d65492f01ad tracing: Disable tracing on warning

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
