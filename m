Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103AA63B9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 02:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781405356; cv=none; b=F7srlkfz8eEL3kg24cZnvajYAy5cbysp/Il/ObgzyZbSC/QkFTODwpRVJasUEDARgfEB3yApQoRW0cauImV7QfqvC+mKhHMLRJsQ/+cVGwiFWcJJdKGzHAD6/Ly4yBWMnXih0tKtmR1v5f012IOyYJbUm2wPMUZEA9byRlGLhNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781405356; c=relaxed/simple;
	bh=J1gqQG5p3ETaeax1BFkd10vM2cOFowchotKspEJVwx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=poo8T3gg/nU1JleO2JN3kOAYZLLg0+s+lw9JLeBcncjhfoOLEsq1dSceZGMw32fKxrD8YvbOG1Si4Me2eJGZoOH4reKxPmDpkIhE6toQQ0oDIoE1/UBIFEa0oqXKVs/1E3ZJTlzAwCkDZtaXwfjjup+pHSOnLnxk6HBAKDFPdEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bqi0sRTt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bqi0sRTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781405354; x=1812941354;
  h=date:from:to:cc:subject:message-id;
  bh=J1gqQG5p3ETaeax1BFkd10vM2cOFowchotKspEJVwx4=;
  b=Bqi0sRTtzi8ZlVSOVhvXHPSe50zltG4EX8iXNV47TVDlvSP1VNryxoKJ
   BfwZeQH1y/D9vltZMxcjd9gKrzClBTRqp4n//cEzLwIIyUCUlwoWYIESz
   9MHKMLq7iZtLFDSQceaygnnufsox7VKvPPrBcL7jCjm4jFabaC9WEwvMf
   o6EFZMBrPcVi28dm8ZmYCwHUgpC7VGNQMrDyL/9FsFp8AUEiMpO7Kwbhw
   yS8gf3myAY6gAIOABfgGZN0gHmMxWpKDBJP/QpBbtyAH0mXmswfiB7XdC
   /QRdI60ePmgv31e5LHbo0WIieubKQg0W47WMKGzFHe4zuFXz+xw8qlFkv
   g==;
X-CSE-ConnectionGUID: O2AKYm7fQY+XF2UfGSMgQA==
X-CSE-MsgGUID: yZVHcYHJRBWyaqz9S2HvlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="92509971"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="92509971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 19:49:14 -0700
X-CSE-ConnectionGUID: djXEaZY1T0+cdwpKGvWY1w==
X-CSE-MsgGUID: bQKeEeLvRfWrBqcqDX2/3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="247033929"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jun 2026 19:49:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYauL-00000000QUo-1oIV;
	Sun, 14 Jun 2026 02:49:09 +0000
Date: Sun, 14 Jun 2026 10:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 1/24]
 drivers/nvme/target/bpf.h:15:44: warning: 'struct nvmet_subsys_link' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202606141021.yrSsgQIT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   65843faa046b6a3ff4953aba7319313104638535
commit: 95eeb6714114cd17d9c4c494a28cc11d86059eef [1/24] nvmet-bpf: eBPF struct_ops support for log pages
config: s390-randconfig-001-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141021.yrSsgQIT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141021.yrSsgQIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141021.yrSsgQIT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/nvmet.h:26,
                    from drivers/nvme/target/fabrics-cmd-auth.c:12:
>> drivers/nvme/target/bpf.h:15:44: warning: 'struct nvmet_subsys_link' declared inside parameter list will not be visible outside of this definition or declaration
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                            ^~~~~~~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:16:76: warning: 'struct nvmet_port' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                            ^~~~~~~~~~
>> drivers/nvme/target/bpf.h:16:47: warning: 'struct nvmet_subsys' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                               ^~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:20:56: warning: 'struct nvmet_req' declared inside parameter list will not be visible outside of this definition or declaration
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                        ^~~~~~~~~
   drivers/nvme/target/bpf.h:24:79: warning: 'struct nvmet_req' declared inside parameter list will not be visible outside of this definition or declaration
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                               ^~~~~~~~~
   drivers/nvme/target/bpf.h:24:50: warning: 'struct nvmet_subsys' declared inside parameter list will not be visible outside of this definition or declaration
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                  ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h: In function 'nvmet_bpf_get_log_page':
   drivers/nvme/target/bpf.h:26:16: error: implicit declaration of function 'nvmet_bpf_req_complete' [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf.h:26:68: error: 'NVME_SC_DNR' undeclared (first use in this function); did you mean 'NVME_SC_MASK'?
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
         |                                                                    NVME_SC_MASK
   drivers/nvme/target/bpf.h:26:68: note: each undeclared identifier is reported only once for each function it appears in
   drivers/nvme/target/bpf.h:26:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf.h:24:20: note: declared here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/nvme/target/nvmet.h:26,
                    from drivers/nvme/target/admin-cmd.c:13:
>> drivers/nvme/target/bpf.h:15:44: warning: 'struct nvmet_subsys_link' declared inside parameter list will not be visible outside of this definition or declaration
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                            ^~~~~~~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:16:76: warning: 'struct nvmet_port' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                            ^~~~~~~~~~
>> drivers/nvme/target/bpf.h:16:47: warning: 'struct nvmet_subsys' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                               ^~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:20:56: warning: 'struct nvmet_req' declared inside parameter list will not be visible outside of this definition or declaration
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                        ^~~~~~~~~
   drivers/nvme/target/bpf.h:24:79: warning: 'struct nvmet_req' declared inside parameter list will not be visible outside of this definition or declaration
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                               ^~~~~~~~~
   drivers/nvme/target/bpf.h:24:50: warning: 'struct nvmet_subsys' declared inside parameter list will not be visible outside of this definition or declaration
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                  ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h: In function 'nvmet_bpf_get_log_page':
   drivers/nvme/target/bpf.h:26:16: error: implicit declaration of function 'nvmet_bpf_req_complete' [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf.h:26:68: error: 'NVME_SC_DNR' undeclared (first use in this function); did you mean 'NVME_SC_MASK'?
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
         |                                                                    NVME_SC_MASK
   drivers/nvme/target/bpf.h:26:68: note: each undeclared identifier is reported only once for each function it appears in
   drivers/nvme/target/bpf.h:26:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf.h:24:20: note: declared here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/admin-cmd.c: In function 'nvmet_execute_get_supported_log_pages':
   drivers/nvme/target/admin-cmd.c:224:37: error: passing argument 1 of 'nvmet_bpf_supported' from incompatible pointer type [-Wincompatible-pointer-types]
     224 |         if (nvmet_bpf_supported(ctrl->subsys, req->port)) {
         |                                 ~~~~^~~~~~~~
         |                                     |
         |                                     struct nvmet_subsys *
   drivers/nvme/target/bpf.h:16:61: note: expected 'struct nvmet_subsys *' but argument is of type 'struct nvmet_subsys *'
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                        ~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/nvme/target/admin-cmd.c:224:50: error: passing argument 2 of 'nvmet_bpf_supported' from incompatible pointer type [-Wincompatible-pointer-types]
     224 |         if (nvmet_bpf_supported(ctrl->subsys, req->port)) {
         |                                               ~~~^~~~~~
         |                                                  |
         |                                                  struct nvmet_port *
   drivers/nvme/target/bpf.h:16:88: note: expected 'struct nvmet_port *' but argument is of type 'struct nvmet_port *'
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                     ~~~~~~~~~~~~~~~~~~~^~~~
   drivers/nvme/target/admin-cmd.c:228:58: error: passing argument 1 of 'nvmet_bpf_log_page_supported' from incompatible pointer type [-Wincompatible-pointer-types]
     228 |                         if (nvmet_bpf_log_page_supported(req, i))
         |                                                          ^~~
         |                                                          |
         |                                                          struct nvmet_req *
   drivers/nvme/target/bpf.h:20:67: note: expected 'struct nvmet_req *' but argument is of type 'struct nvmet_req *'
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                 ~~~~~~~~~~~~~~~~~~^~~
   drivers/nvme/target/admin-cmd.c: In function 'nvmet_execute_get_log_page':
   drivers/nvme/target/admin-cmd.c:626:37: error: passing argument 1 of 'nvmet_bpf_supported' from incompatible pointer type [-Wincompatible-pointer-types]
     626 |         if (nvmet_bpf_supported(ctrl->subsys, req->port) &&
         |                                 ~~~~^~~~~~~~
         |                                     |
         |                                     struct nvmet_subsys *
   drivers/nvme/target/bpf.h:16:61: note: expected 'struct nvmet_subsys *' but argument is of type 'struct nvmet_subsys *'
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                        ~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/nvme/target/admin-cmd.c:626:50: error: passing argument 2 of 'nvmet_bpf_supported' from incompatible pointer type [-Wincompatible-pointer-types]
     626 |         if (nvmet_bpf_supported(ctrl->subsys, req->port) &&
         |                                               ~~~^~~~~~
         |                                                  |
         |                                                  struct nvmet_port *
   drivers/nvme/target/bpf.h:16:88: note: expected 'struct nvmet_port *' but argument is of type 'struct nvmet_port *'
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                     ~~~~~~~~~~~~~~~~~~~^~~~
   drivers/nvme/target/admin-cmd.c:627:42: error: passing argument 1 of 'nvmet_bpf_log_page_supported' from incompatible pointer type [-Wincompatible-pointer-types]
     627 |             nvmet_bpf_log_page_supported(req, lid))
         |                                          ^~~
         |                                          |
         |                                          struct nvmet_req *
   drivers/nvme/target/bpf.h:20:67: note: expected 'struct nvmet_req *' but argument is of type 'struct nvmet_req *'
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                 ~~~~~~~~~~~~~~~~~~^~~
   drivers/nvme/target/admin-cmd.c:628:51: error: passing argument 1 of 'nvmet_bpf_get_log_page' from incompatible pointer type [-Wincompatible-pointer-types]
     628 |                 return nvmet_bpf_get_log_page(ctrl->subsys, req);
         |                                               ~~~~^~~~~~~~
         |                                                   |
         |                                                   struct nvmet_subsys *
   drivers/nvme/target/bpf.h:24:64: note: expected 'struct nvmet_subsys *' but argument is of type 'struct nvmet_subsys *'
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                           ~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/nvme/target/admin-cmd.c:628:61: error: passing argument 2 of 'nvmet_bpf_get_log_page' from incompatible pointer type [-Wincompatible-pointer-types]
     628 |                 return nvmet_bpf_get_log_page(ctrl->subsys, req);
         |                                                             ^~~
         |                                                             |
         |                                                             struct nvmet_req *
   drivers/nvme/target/bpf.h:24:90: note: expected 'struct nvmet_req *' but argument is of type 'struct nvmet_req *'
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                        ~~~~~~~~~~~~~~~~~~^~~
--
   In file included from drivers/nvme/target/nvmet.h:26,
                    from drivers/nvme/target/configfs.c:23:
>> drivers/nvme/target/bpf.h:15:44: warning: 'struct nvmet_subsys_link' declared inside parameter list will not be visible outside of this definition or declaration
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                            ^~~~~~~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:16:76: warning: 'struct nvmet_port' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                            ^~~~~~~~~~
>> drivers/nvme/target/bpf.h:16:47: warning: 'struct nvmet_subsys' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                               ^~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:20:56: warning: 'struct nvmet_req' declared inside parameter list will not be visible outside of this definition or declaration
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                        ^~~~~~~~~
   drivers/nvme/target/bpf.h:24:79: warning: 'struct nvmet_req' declared inside parameter list will not be visible outside of this definition or declaration
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                               ^~~~~~~~~
   drivers/nvme/target/bpf.h:24:50: warning: 'struct nvmet_subsys' declared inside parameter list will not be visible outside of this definition or declaration
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                  ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h: In function 'nvmet_bpf_get_log_page':
   drivers/nvme/target/bpf.h:26:16: error: implicit declaration of function 'nvmet_bpf_req_complete' [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf.h:26:68: error: 'NVME_SC_DNR' undeclared (first use in this function); did you mean 'NVME_SC_MASK'?
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
         |                                                                    NVME_SC_MASK
   drivers/nvme/target/bpf.h:26:68: note: each undeclared identifier is reported only once for each function it appears in
   drivers/nvme/target/bpf.h:26:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf.h:24:20: note: declared here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/configfs.c: In function 'nvmet_port_subsys_drop_link':
   drivers/nvme/target/configfs.c:1114:26: error: passing argument 1 of 'nvmet_bpf_detach' from incompatible pointer type [-Wincompatible-pointer-types]
    1114 |         nvmet_bpf_detach(p);
         |                          ^
         |                          |
         |                          struct nvmet_subsys_link *
   drivers/nvme/target/bpf.h:15:63: note: expected 'struct nvmet_subsys_link *' but argument is of type 'struct nvmet_subsys_link *'
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~^


vim +15 drivers/nvme/target/bpf.h

     8	
     9	void nvmet_bpf_detach(struct nvmet_subsys_link *s);
    10	bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port);
    11	bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid);
    12	void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req);
    13	int __init nvmet_bpf_struct_ops_init(void);
    14	#else
  > 15	static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
  > 16	static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
    17	{
    18		return false;
    19	}
  > 20	static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
