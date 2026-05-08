Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4493358D6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265026; cv=none; b=DbTHAJRlbpbGbIRne+CmCIgxTMcj7cTx7XMD6rb3mbuae8dHP4UGi0w5XJO6qP+9Zxf+JlxDk6MYq5bu71u+V0o05KtGONpJZfG9hluGml46gYnz41quQHqupSGC+3weQzuknnSJtM+bzuLfRqyvEvEh0D2SutT5luAxis2C9VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265026; c=relaxed/simple;
	bh=FX9A2iIpvnYQys+Pp+qzu5SWmkWzdHSZGw2vBdkfTV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KbRDSbkUSQBvdfIHZetfxXvrWgQnhENQD2yZT/scD2HJEZqFLfLAJ14GEJukhdDNCGYR9Y+FJTvcHTNNHGsZ9uPYifF7tUArkXRo0bex7a4nwWcFfXbXltAj69dgAEJJER8zVwp1Vc/50lmPkuE+iCigcdQYqkRsMkGjsjlUpvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1cjGSyY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1cjGSyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778265024; x=1809801024;
  h=date:from:to:cc:subject:message-id;
  bh=FX9A2iIpvnYQys+Pp+qzu5SWmkWzdHSZGw2vBdkfTV4=;
  b=g1cjGSyYyWQLITHjc5h/QjtdGPvLCtLakkUXGqIIyreJL9IJvm7DjV5c
   Ian7TfkVvhcI16IBLWXmVSLGNGmK4OYCUcdfz7n6RmK3kJLWc8Sah+I6X
   n8pJRxzd023lKn/0BGnn0vB+Ffzlf505gRsQbowG086dhROXNh2+pON+k
   29SCJE6v6E9IjEBmT2XYw2y8quUW6LTRDjngei+FmkgvniDyxNQrAWD7R
   3xUgzRdlHWIVHfbEo/df48rxk/Ky8uuRNfHx7QBFKmMLTlE/F2HtgdCaR
   Kkwgi3yE2/q8JuDrMeyJlCufeXzUCFX/U0Pm+GAT/fDPzQaPELDtYVWcK
   g==;
X-CSE-ConnectionGUID: ECmJ8SQFSxC1VTRotF+bLQ==
X-CSE-MsgGUID: VKMsFguPR66mtx5d7aMnaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79232895"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="79232895"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:30:24 -0700
X-CSE-ConnectionGUID: /Yro9efbRwyN5XKEz9p49g==
X-CSE-MsgGUID: os8NFpGYSTygpePD4LDZ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="236961045"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2026 11:30:22 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLPxr-000000000M5-1KYV;
	Fri, 08 May 2026 18:30:19 +0000
Date: Sat, 09 May 2026 02:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:configfs-ns 1/9] drivers/nvme/target/bpf.h:26:16:
 error: implicit declaration of function 'nvmet_bpf_req_complete'
Message-ID: <202605090256.DqwKeYNq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git configfs-ns
head:   509cbb083b05db0f02a3ceea68bb093f8725a6a5
commit: 94040dcdf8d7b146f62dfb3e0156d93a9713880d [1/9] nvmet-bpf: eBPF struct_ops support for log pages
config: x86_64-buildonly-randconfig-001-20260508 (https://download.01.org/0day-ci/archive/20260509/202605090256.DqwKeYNq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090256.DqwKeYNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090256.DqwKeYNq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/nvmet.h:26,
                    from drivers/nvme/target/loop.c:12:
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
>> drivers/nvme/target/bpf.h:26:16: error: implicit declaration of function 'nvmet_bpf_req_complete' [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:26:68: error: 'NVME_SC_DNR' undeclared (first use in this function); did you mean 'NVME_SC_MASK'?
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
         |                                                                    NVME_SC_MASK
   drivers/nvme/target/bpf.h:26:68: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/target/bpf.h:26:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
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
>> drivers/nvme/target/bpf.h:26:16: error: implicit declaration of function 'nvmet_bpf_req_complete' [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:26:68: error: 'NVME_SC_DNR' undeclared (first use in this function); did you mean 'NVME_SC_MASK'?
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
         |                                                                    NVME_SC_MASK
   drivers/nvme/target/bpf.h:26:68: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/target/bpf.h:26:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf.h:24:20: note: declared here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/admin-cmd.c: In function 'nvmet_execute_get_supported_log_pages':
>> drivers/nvme/target/admin-cmd.c:224:37: error: passing argument 1 of 'nvmet_bpf_supported' from incompatible pointer type [-Wincompatible-pointer-types]
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
>> drivers/nvme/target/admin-cmd.c:228:58: error: passing argument 1 of 'nvmet_bpf_log_page_supported' from incompatible pointer type [-Wincompatible-pointer-types]
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
>> drivers/nvme/target/admin-cmd.c:628:51: error: passing argument 1 of 'nvmet_bpf_get_log_page' from incompatible pointer type [-Wincompatible-pointer-types]
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
>> drivers/nvme/target/bpf.h:26:16: error: implicit declaration of function 'nvmet_bpf_req_complete' [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/target/bpf.h:26:68: error: 'NVME_SC_DNR' undeclared (first use in this function); did you mean 'NVME_SC_MASK'?
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
         |                                                                    NVME_SC_MASK
   drivers/nvme/target/bpf.h:26:68: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/target/bpf.h:26:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf.h:24:20: note: declared here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/configfs.c: In function 'nvmet_port_subsys_drop_link':
>> drivers/nvme/target/configfs.c:1114:26: error: passing argument 1 of 'nvmet_bpf_detach' from incompatible pointer type [-Wincompatible-pointer-types]
    1114 |         nvmet_bpf_detach(p);
         |                          ^
         |                          |
         |                          struct nvmet_subsys_link *
   drivers/nvme/target/bpf.h:15:63: note: expected 'struct nvmet_subsys_link *' but argument is of type 'struct nvmet_subsys_link *'
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~^
--
   In file included from drivers/nvme/target/../target/nvmet.h:26,
                    from drivers/nvme/target/fcloop.c:11:
>> drivers/nvme/target/../target/bpf.h:15:44: warning: 'struct nvmet_subsys_link' declared inside parameter list will not be visible outside of this definition or declaration
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                            ^~~~~~~~~~~~~~~~~
>> drivers/nvme/target/../target/bpf.h:16:76: warning: 'struct nvmet_port' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                            ^~~~~~~~~~
>> drivers/nvme/target/../target/bpf.h:16:47: warning: 'struct nvmet_subsys' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                               ^~~~~~~~~~~~
>> drivers/nvme/target/../target/bpf.h:20:56: warning: 'struct nvmet_req' declared inside parameter list will not be visible outside of this definition or declaration
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                        ^~~~~~~~~
   drivers/nvme/target/../target/bpf.h:24:79: warning: 'struct nvmet_req' declared inside parameter list will not be visible outside of this definition or declaration
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                               ^~~~~~~~~
   drivers/nvme/target/../target/bpf.h:24:50: warning: 'struct nvmet_subsys' declared inside parameter list will not be visible outside of this definition or declaration
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                  ^~~~~~~~~~~~
   drivers/nvme/target/../target/bpf.h: In function 'nvmet_bpf_get_log_page':
>> drivers/nvme/target/../target/bpf.h:26:16: error: implicit declaration of function 'nvmet_bpf_req_complete' [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/target/../target/bpf.h:26:68: error: 'NVME_SC_DNR' undeclared (first use in this function); did you mean 'NVME_SC_MASK'?
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
         |                                                                    NVME_SC_MASK
   drivers/nvme/target/../target/bpf.h:26:68: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/target/../target/bpf.h:26:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/../target/bpf.h:24:20: note: declared here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/nvmet_bpf_req_complete +26 drivers/nvme/target/bpf.h

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
    21	{
    22		return false;
    23	}
    24	static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
    25	{
  > 26		return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
