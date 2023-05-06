Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC4139B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 02:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683339756; x=1714875756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rVO76IVghcCLntwOIA+886/mzKYFSTyg02zYaJiQieA=;
  b=PgHsJz4VdBFspu5wlDxBXBL4x9+esxftGFisNqrJPEiAr+KfTl/eS4l+
   KQQG4FAE0EaKqRSY+64Ro3iAi+SeGB3l8fF/mMEVDTrzXTxHEGph/s+q1
   pwlLQ/D/UnrhrPl1tbf22PjGX+YjtDsmBlRQzlXHD68+PGBJ6RG7nfl7m
   9eV0++6m9+fJ1RXjZP1gV6+/+TgDIdITDM9cVLYFg2gt6uFIT6RyQPfJz
   kZ5/VbZzRmw8mxYaeLjuOmJmC+6WIZMMSTlfIX3yO5iJT3nAhKdWCz/3H
   ZuHfrVgZbxtcLZwXrseOF8tr0yfs7GfSBw2PpgAUp2P9Znj1ZSDg4eiXN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="333764616"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="333764616"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 19:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="944126519"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="944126519"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 19:22:35 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv7ZC-000145-0h;
	Sat, 06 May 2023 02:22:34 +0000
Date: Sat, 6 May 2023 10:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx2 7/13] include/linux/bpf_mprog.h:193:30:
 warning: assignment to 'struct bpf_link *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202305061013.oUJZrFkN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx2
head:   94e6243273cf3f1e5e03c37288780f5b861fe555
commit: 3ba2eec83a93ca19cc31cdeae1ebc8d2cddd99c7 [7/13] bpf: Implement relative BPF link handling for tc BPF programs
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230506/202305061013.oUJZrFkN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/cilium/linux/commit/3ba2eec83a93ca19cc31cdeae1ebc8d2cddd99c7
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx2
        git checkout 3ba2eec83a93ca19cc31cdeae1ebc8d2cddd99c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061013.oUJZrFkN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/tcx.h:7,
                    from net/core/dev.c:110:
   include/linux/bpf_mprog.h: In function 'bpf_mprog_tuple_relative':
   include/linux/bpf_mprog.h:193:32: error: implicit declaration of function 'bpf_link_by_id'; did you mean 'bpf_prog_by_id'? [-Werror=implicit-function-declaration]
     193 |                         ltmp = bpf_link_by_id(relobj);
         |                                ^~~~~~~~~~~~~~
         |                                bpf_prog_by_id
>> include/linux/bpf_mprog.h:193:30: warning: assignment to 'struct bpf_link *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     193 |                         ltmp = bpf_link_by_id(relobj);
         |                              ^
   include/linux/bpf_mprog.h:197:32: error: implicit declaration of function 'bpf_link_get_from_fd' [-Werror=implicit-function-declaration]
     197 |                         ltmp = bpf_link_get_from_fd(relobj);
         |                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/bpf_mprog.h:197:30: warning: assignment to 'struct bpf_link *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     197 |                         ltmp = bpf_link_get_from_fd(relobj);
         |                              ^
   cc1: some warnings being treated as errors


vim +193 include/linux/bpf_mprog.h

   181	
   182	static inline int
   183	bpf_mprog_tuple_relative(struct bpf_tuple *tuple,
   184				 u32 relobj, u32 flags,
   185				 enum bpf_prog_type type)
   186	{
   187		struct bpf_prog *ptmp;
   188		struct bpf_link *ltmp;
   189	
   190		memset(tuple, 0, sizeof(*tuple));
   191		if (flags & BPF_F_LINK) {
   192			if (flags & BPF_F_ID) {
 > 193				ltmp = bpf_link_by_id(relobj);
   194			} else {
   195				if (!relobj)
   196					return -EINVAL;
   197				ltmp = bpf_link_get_from_fd(relobj);
   198			}
   199			if (IS_ERR(ltmp))
   200				return PTR_ERR(ltmp);
   201			if (ltmp->prog->type != type) {
   202				bpf_link_put(ltmp);
   203				return -EINVAL;
   204			}
   205			tuple->link = ltmp;
   206			tuple->prog = ltmp->prog;
   207		} else {
   208			if (flags & BPF_F_ID) {
   209				ptmp = bpf_prog_by_id(relobj);
   210			} else {
   211				if (!relobj)
   212					return 0;
   213				ptmp = bpf_prog_get(relobj);
   214			}
   215			if (IS_ERR(ptmp))
   216				return PTR_ERR(ptmp);
   217			if (ptmp->type != type) {
   218				bpf_prog_put(ptmp);
   219				return -EINVAL;
   220			}
   221			tuple->link = NULL;
   222			tuple->prog = ptmp;
   223		}
   224		return 0;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
