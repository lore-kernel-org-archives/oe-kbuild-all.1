Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490F15AF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 00:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709945531; cv=none; b=O0sHecGo0z/vx6cAMRYpcHSishMJfZNxEI8hk9kOJt4SxVUvZQp1rkb6CYGmynqDXP0xO+rY/P7iLbC6nA+QZxwypEE84wONRxYmsogIsswooDoup6jWRQoqOk2H7LH+s4mba+c9s4BiZ7XbS7tkCkgCjakv4BH4vu8jGmQ7/os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709945531; c=relaxed/simple;
	bh=S5H3h0AorWfP9PzMyK8o9xcLl3VKXok2EHS3NrSppSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SqFdzkQ79KhEeuhdsNb9yUma47RGKzlSWP3MoJkx7I5gBnT0FdFPjlcwC1hc8auI34+N7a3uOGUfVDF/ohRm3bSDTsJoJQ04J39hP+HwlpShxkWWFvV8XQLDaSvXthWChVrRxGPw8vrvFdUMQ/PaeQ2k4e0cY+pptg45kmNfjRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n++H20PF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n++H20PF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709945530; x=1741481530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5H3h0AorWfP9PzMyK8o9xcLl3VKXok2EHS3NrSppSQ=;
  b=n++H20PFTJSVuGYCku5SzyHtRbqd0uDMeeitl0XgknSDSJAWb7xqTPRc
   ZGGsKfdnG6Af5QItGNNW9RrW3N5D40rX3szBg8HDDhsoX4Hlvk4qgj1ve
   3LcfXE1KpovFdOSPuiOlecHSsJ5jiWQ/RhLYJQQ6iRnLQT2gP3vjHCNBf
   gLTdGCpSjMHigEoHmnAxlyWc5iTBPvcg0kk6Jp0QoHaV9tOLJJ4Mg3L+h
   nOv4UC6ZRz//vMnEoYeYSWcclyJiFnVXVYIZhLTXcfppMiyNdP8KvQPSw
   2ATkpajT7nJAYoQTRimjTkAYsSXGWheOkDsGJ82Vh+LZXd5M25egZ9N6k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="15411340"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="15411340"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 16:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="15271389"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Mar 2024 16:52:08 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rikwX-0006q5-0w;
	Sat, 09 Mar 2024 00:52:05 +0000
Date: Sat, 9 Mar 2024 08:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [linux-next:master 1444/12944] /usr/bin/ld: cannot find
 ../lib/api/libapi.a: No such file or directory
Message-ID: <202403090834.EHWSv1gO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 3f3174996be6b4312c38f54d5969f5d5b75fec9e [1444/12944] RAS: Introduce AMD Address Translation Library
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090834.EHWSv1gO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090834.EHWSv1gO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
>> collect2: error: ld returned 1 exit status
   make[3]: *** [Makefile:22: page-types] Error 1
   make[3]: *** Waiting for unfinished jobs....
>> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
>> collect2: error: ld returned 1 exit status
   make[3]: *** [Makefile:22: slabinfo] Error 1
>> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
>> collect2: error: ld returned 1 exit status
   make[3]: *** [Makefile:22: page_owner_sort] Error 1
--
   In file included from commands.c:10:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
       6 | #include <netlink/netlink.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/commands.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   In file included from thermal_nl.c:9:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
       6 | #include <netlink/netlink.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/thermal_nl.o] Error 1
   In file included from events.c:10:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
       6 | #include <netlink/netlink.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/events.o] Error 1
   make[4]: *** [Makefile:105: tools/lib/thermal/libthermal-in.o] Error 2
   make[3]: *** [Makefile:120: all] Error 2
--
>> thermometer.c:21:10: fatal error: libconfig.h: No such file or directory
      21 | #include <libconfig.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [Makefile:23: thermometer] Error 1
--
>> Makefile:65: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:111: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
