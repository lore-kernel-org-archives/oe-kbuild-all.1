Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605391;
	b=FXrvHVKJofJ0pLz3xr0XhjmEsfBqL33rXM8Eckm4XwAn+mg2bXRqLQV2W99WEOnbCxOJ
	 F1nIKrbsvJf8es2gLUv6KJtwvSG65qGbyzL/AOudX71YDDyN2q2qfswKm3WOjBtVn7sUt
	 wMz2ql5wZtyj5UKVcIoarlcRoQ2s9p17MKs8W3qr2ZxhYr4zya9+/rfyMccu6HvMzf3xt
	 Y26PZIsx3iKcRnvgMyHfFJwolvdjCqK6upAuULbwGZDZCnxxPPJLzKl+9yF3UvX7Y+g6I
	 zfFuK2ShG5ezZIYb2ZKBcQMnBWb5s9KmqctRxSSPBIB/+PRABlGkT+R/sKUBDZ6Xb4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605391;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=m3hCIMVpH2CqtH1OiZUYbwoS75YmFI3xfiCH2HPBDek=;
	b=Tw3vX9ZNrQoXzoa0JfnHxXcVo+jNWpkD6grzL4aWjpiyhwzW+LbSJxdIeedmXKiVMNNT
	 Kg7LpEjnSWYUciiWJ26xJxau/gSlYnC1aQ/nwwjUVFBr1bE3oDoQNNb4fFqH2l0Kt1jqd
	 mQ8ZBN4ntlifFEwWJvn4ktZdO2pjrgw6XxqgxVH5qURjrqxbJtEtAM/0PPXfk6iPrRtn0
	 hUPlgNrcvdfbkjhWGLFB7L+3/8/BaLwoU4QqM0NQ92uNNIi44kxsM+fasccxW6nz+mmCY
	 HXxovZVsXe3FTe9V9s2Btp6vlIdvhbmpz/GMlciy9+EcGV7Sr62cgP7At44YeWmo0ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRqTqUvb;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C312606A32D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 21:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C312606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRqTqUvb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794605390; x=1826141390;
  h=date:from:to:cc:subject:message-id;
  bh=qHBimaSGKoLY5F4AMbqun1bFh6UcK/zSNmEkmJutxlI=;
  b=kRqTqUvb9ikpTXcEmNyDfe/9/z30Ty1/ob8ZPXnOAmoDIJFrdbhiUUD+
   VOLX7MP7xoNLBHO3DEbn7fQ2ANTKN8gPTqjcdy5tg9fMfXvuNCY7ncIDC
   Li18K/atKLcT48Z6gFWipp3thSMofGM+pa1m35VlpXoehutueRe7yYepx
   9dQeOtWUe3aWm9fJ+Qo73Cjyi82VT5u2zaaa4Y/z2rUzrGBPbYIcotpwg
   kA5thgEIDLz98VOhHdEb7J6cC7hTZS2jWvIfmOheplapdXQXMLC3Xw+wF
   k5G6F6XvkO94HBoxAnEHFvcZYsYsRi88OxCjrI5lGyLAXMihAyqg4YezR
   Q==;
X-CSE-ConnectionGUID: 8EXJGpTtTkWo1S/uLhNEQw==
X-CSE-MsgGUID: AziwHUsxR2WThEMDK8dHGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3414782"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3414782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 13:29:49 -0800
X-CSE-ConnectionGUID: 0EVR7IVlT36jTU1KrLk92w==
X-CSE-MsgGUID: PNXXtcRDRUKAIzmBRLd6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9340358"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2026 13:29:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRyqA-000000001LH-24r2;
	Fri, 13 Nov 2026 21:29:46 +0000
Date: Fri, 13 Nov 2026 22:28:50 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 20/68]
 include/linux/ctlv_family.h:331:26: error: initializer element is not
 constant
Message-ID: <202611132213.SiuW8n0a-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 11ccd174f61bea9b580fc1ce824d29d784c0489e [20/68] attestation: Add CTLV operation handling
config: alpha-randconfig-r2306-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132213.SiuW8n0a-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132213.SiuW8n0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132213.SiuW8n0a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/ctlv/ctlv_gen.c:11:
>> include/linux/ctlv_family.h:331:26: error: initializer element is not constant
     331 |  ((struct ctlv_op_schema){     \
         |                          ^
   lib/ctlv/ctlv_gen.c:120:2: note: in expansion of macro 'CTLV_OP_SCHEMA_QUERY'
     120 |  CTLV_OP_SCHEMA_QUERY(CTLV_OP_FAMILY_GET, CTLV_OP_FD_ACCESS_READ, CTLV_OP_AVAILABILITY_FIXED,
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/ctlv_family.h:331:26: note: (near initialization for 'ctlv_op_schemas')
     331 |  ((struct ctlv_op_schema){     \
         |                          ^
   lib/ctlv/ctlv_gen.c:120:2: note: in expansion of macro 'CTLV_OP_SCHEMA_QUERY'
     120 |  CTLV_OP_SCHEMA_QUERY(CTLV_OP_FAMILY_GET, CTLV_OP_FD_ACCESS_READ, CTLV_OP_AVAILABILITY_FIXED,
         |  ^~~~~~~~~~~~~~~~~~~~
--
   In file included from ctlv/ctlv_gen.c:11:
>> include/linux/ctlv_family.h:331:26: error: initializer element is not constant
     331 |  ((struct ctlv_op_schema){     \
         |                          ^
   ctlv/ctlv_gen.c:120:2: note: in expansion of macro 'CTLV_OP_SCHEMA_QUERY'
     120 |  CTLV_OP_SCHEMA_QUERY(CTLV_OP_FAMILY_GET, CTLV_OP_FD_ACCESS_READ, CTLV_OP_AVAILABILITY_FIXED,
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/ctlv_family.h:331:26: note: (near initialization for 'ctlv_op_schemas')
     331 |  ((struct ctlv_op_schema){     \
         |                          ^
   ctlv/ctlv_gen.c:120:2: note: in expansion of macro 'CTLV_OP_SCHEMA_QUERY'
     120 |  CTLV_OP_SCHEMA_QUERY(CTLV_OP_FAMILY_GET, CTLV_OP_FD_ACCESS_READ, CTLV_OP_AVAILABILITY_FIXED,
         |  ^~~~~~~~~~~~~~~~~~~~


vim +331 include/linux/ctlv_family.h

3258c36eb56c45 Jiri Pirko 2026-08-26  310  
3258c36eb56c45 Jiri Pirko 2026-08-26  311  /* An op run once per call, its reply at most _reply_len bytes. */
3258c36eb56c45 Jiri Pirko 2026-08-26  312  #define CTLV_OP_SCHEMA_ACTION(_op, _access, _availability, _request_len, _reply_len, \
3258c36eb56c45 Jiri Pirko 2026-08-26  313  			      _request, _reply, ...)			\
3258c36eb56c45 Jiri Pirko 2026-08-26  314  	((struct ctlv_op_schema){					\
3258c36eb56c45 Jiri Pirko 2026-08-26  315  		.op_id = (_op),						\
3258c36eb56c45 Jiri Pirko 2026-08-26  316  		.type = CTLV_OP_TYPE_ACTION,				\
3258c36eb56c45 Jiri Pirko 2026-08-26  317  		.fd_access = (_access),					\
3258c36eb56c45 Jiri Pirko 2026-08-26  318  		.availability = (_availability),			\
3258c36eb56c45 Jiri Pirko 2026-08-26  319  		.request = _request,					\
3258c36eb56c45 Jiri Pirko 2026-08-26  320  		.reply = _reply,					\
3258c36eb56c45 Jiri Pirko 2026-08-26  321  		.sizes = {						\
3258c36eb56c45 Jiri Pirko 2026-08-26  322  			.request_max_len = (_request_len),		\
3258c36eb56c45 Jiri Pirko 2026-08-26  323  			.action_reply_max_len = (_reply_len),		\
3258c36eb56c45 Jiri Pirko 2026-08-26  324  		},							\
3258c36eb56c45 Jiri Pirko 2026-08-26  325  		__VA_ARGS__						\
3258c36eb56c45 Jiri Pirko 2026-08-26  326  	})
3258c36eb56c45 Jiri Pirko 2026-08-26  327  
3258c36eb56c45 Jiri Pirko 2026-08-26  328  /* An op answered in fragments, each needing _reply_min bytes of room. */
3258c36eb56c45 Jiri Pirko 2026-08-26  329  #define CTLV_OP_SCHEMA_QUERY(_op, _access, _availability, _request_len, _reply_min, \
3258c36eb56c45 Jiri Pirko 2026-08-26  330  			     _reply_suggested, _request, _reply, ...)	\
3258c36eb56c45 Jiri Pirko 2026-08-26 @331  	((struct ctlv_op_schema){					\
3258c36eb56c45 Jiri Pirko 2026-08-26  332  		.op_id = (_op),						\
3258c36eb56c45 Jiri Pirko 2026-08-26  333  		.type = CTLV_OP_TYPE_QUERY,				\
3258c36eb56c45 Jiri Pirko 2026-08-26  334  		.fd_access = (_access),					\
3258c36eb56c45 Jiri Pirko 2026-08-26  335  		.availability = (_availability),			\
3258c36eb56c45 Jiri Pirko 2026-08-26  336  		.request = _request,					\
3258c36eb56c45 Jiri Pirko 2026-08-26  337  		.reply = _reply,					\
3258c36eb56c45 Jiri Pirko 2026-08-26  338  		.sizes = {						\
3258c36eb56c45 Jiri Pirko 2026-08-26  339  			.request_max_len = (_request_len),		\
3258c36eb56c45 Jiri Pirko 2026-08-26  340  			.query_reply_min_len = (_reply_min),		\
3258c36eb56c45 Jiri Pirko 2026-08-26  341  			.query_reply_suggested_len = (_reply_suggested), \
3258c36eb56c45 Jiri Pirko 2026-08-26  342  		},							\
3258c36eb56c45 Jiri Pirko 2026-08-26  343  		__VA_ARGS__						\
3258c36eb56c45 Jiri Pirko 2026-08-26  344  	})
3258c36eb56c45 Jiri Pirko 2026-08-26  345  

:::::: The code at line 331 was first introduced by commit
:::::: 3258c36eb56c45b49ac45532d9b92fcd0676e099 ctlv: Add the UAPI message format and family API

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
