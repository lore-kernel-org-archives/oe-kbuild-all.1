Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0462565
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 06:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXNrv+lH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700289231; x=1731825231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PgkRow0XuRLY/3wTItn028f6TPIAj9U8RvadRxFwet8=;
  b=NXNrv+lHsXsAKuccpI+vRpEgQLhx3KYUIFtG58AHMejTcrGaBVsrJiJZ
   bb/fG5lvOunZJXle7BS1xZHGwICYbsLOan4Sszt6tiXhn1rqonoehe5FM
   DamWhOy/5vb/SPiyh53J3jXC4C/8AwQ2100G+76mwkqfuLq41HBEBa+sE
   X3MT6Qw9LcFX/1MSDL4fsj3JeCOxEVRknTDu+xdUO/AQL4VAl+eklg3HC
   fnDMNN06uCP3/jENl0Zm1enL61dy0EGgIfCMo2F9GXXtj78zQqDJexEOC
   XhM4YratSDlBeAN+V5aZxr0Uid9uBLgccnhTEXOBbSVkZK+XrZQHhVOvc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12962293"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="12962293"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 22:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="742276572"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="742276572"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Nov 2023 22:33:48 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Etm-0003bX-0F;
	Sat, 18 Nov 2023 06:33:46 +0000
Date: Sat, 18 Nov 2023 14:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 18/51] ld: fs/afs/file.o:undefined reference
 to `fscache_begin_cache_operation'
Message-ID: <202311181410.7xCzjey8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   63aa4c69f32c9443f9e93ca8cbbdd692c5970119
commit: c2773e771d178fe02ce79fc623ba6c080996b8bf [18/51] fscache: Add a function to begin an cache op from a netfslib request
config: x86_64-randconfig-073-20231118 (https://download.01.org/0day-ci/archive/20231118/202311181410.7xCzjey8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181410.7xCzjey8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181410.7xCzjey8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: fs/afs/file.o:(.rodata+0x220): undefined reference to `fscache_begin_cache_operation'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
