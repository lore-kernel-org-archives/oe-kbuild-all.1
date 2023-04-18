Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDADA816
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 06:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681799424; x=1713335424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIuKT51daF6r1yeu/WBOipslukulLKEb1GMhpUQzm+U=;
  b=SMdh/26JiQF+ZmZyKnhg3ku+mjXK1BXqN9pMuDGHwgJlYgH5pgCnSx75
   LITjV+6WmD0WaEMTVUvn0tdeJqokSvEdTkManbklWwjUIeWn9VTLfAiPh
   nJl9b6lGDa8HyVO17X8FKiLNlyRTCK2BfxCfYtQ+HvQitRO4rBSbmQfGp
   IJgB47MBFht8uaEjLH8BFQYDppty4B9+XWpB/m3CpwpDuL8VUjH+FfGUD
   Y8pj8g0xQcisXZnBu0PD5Xel3Jkqhow/05595ciJ5/VY7ZWuCai18rDSv
   e3Ix5suF8oIIwkyOWipCvOsXx4ZgHHMaEaoKNmK0uhTA9catUza16EeG/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="431377240"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="431377240"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 23:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="937130953"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="937130953"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Apr 2023 23:30:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poer8-000d3b-2v;
	Tue, 18 Apr 2023 06:30:22 +0000
Date: Tue, 18 Apr 2023 14:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie 14/19] /tmp/ccndMBEp.s:27: Error: junk
 `(__x86_call_count)' after expression
Message-ID: <202304181426.UQypXFkq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie
head:   cbb240e84019a588e1e6bdb5f205db22b5f20bb5
commit: a50f560acb27e3bfa2c6fe62dea47b6e30ec4f0e [14/19] x86: percpu: Use RIP-relative symbol references for per-CPU variables
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304181426.UQypXFkq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=a50f560acb27e3bfa2c6fe62dea47b6e30ec4f0e
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-pie
        git checkout a50f560acb27e3bfa2c6fe62dea47b6e30ec4f0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181426.UQypXFkq-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccndMBEp.s: Assembler messages:
>> /tmp/ccndMBEp.s:27: Error: junk `(__x86_call_count)' after expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
