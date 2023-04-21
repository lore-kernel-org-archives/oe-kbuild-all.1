Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463437A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 01:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682038810; x=1713574810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KVkRsYXBzcCl5xb1os4u3dArYIeuchscU+pSdB18zzE=;
  b=ZwON8NSYHsXUUNaakELDxUVEh4b8H1oiyoJVSWBr3XFOCaiPflsSAQXh
   gt/8hj1uGRYOhHUzoSBLgZXyZMzs8RI9FgvL/tg97/Qt3moRBr84sb2V8
   1sFFCQUOjhYlMQ/+PT6NnCcY5x+sZ08tnBzl/NWGws1fUGcbpY6jhPlS8
   9n2lXJ1wGkWBer2RqSCByyluO/hq0hUCADK0WlFJ2bIidz9uEbYTLUaxi
   A65S1zDqDx6Kw6CHTk2Adbo4I35Yu1LelN/alHdB8cOyhQ7o/UqIjKrzU
   Ph36HZp3ZJ7XvB53ZQuknOBwCAUWQ38uPZ8BTZ2HvI59OJqrh+l+PxDb1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326215030"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="326215030"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 18:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="722590495"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="722590495"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Apr 2023 17:59:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppf82-000gCq-1t;
	Fri, 21 Apr 2023 00:59:58 +0000
Date: Fri, 21 Apr 2023 08:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230413-module-alloc-opts 118/118]
 fs/kernel_read_file.c:175:1: sparse: sparse: symbol 'kread_dup_mutex' was
 not declared. Should it be static?
Message-ID: <202304210836.6TBfuRcR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230413-module-alloc-opts
head:   b40c1a39dfb04b688a41f60434d18da848d02cf3
commit: b40c1a39dfb04b688a41f60434d18da848d02cf3 [118/118] kread: avoid duplicates
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230421/202304210836.6TBfuRcR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=b40c1a39dfb04b688a41f60434d18da848d02cf3
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230413-module-alloc-opts
        git checkout b40c1a39dfb04b688a41f60434d18da848d02cf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210836.6TBfuRcR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/kernel_read_file.c:175:1: sparse: sparse: symbol 'kread_dup_mutex' was not declared. Should it be static?
>> fs/kernel_read_file.c:278:6: sparse: sparse: symbol 'kread_dup_request_announce' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
