Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79243C8EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748503785; cv=none; b=lW1IB61/NJMFCpygiwttcEUKcxQvunh1DO1u0ABoeoYubPAl3xxWirH6ZZgJpH9QXM5iHHdlfrWCrkgPHO1jnur6Cam/CeeO2Wo5qS8EoG/6ejX8iXiHoKQ4om3/JDEdz+bNHf2LCJhk2bHz3YgRWXSDwC/KyJ3uDIWa5d29vxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748503785; c=relaxed/simple;
	bh=80K2xmvN47BEAENQV7j6iSo8iupPg8RrLXiMCl25eVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNGQua7ItHOPV3MnL5BBnfW0l8DgRIlyHLhq4KPy5TWpWzZ0HUd/Bh5wJv9NlVXsOZkQZLe8guHjO+TSpcp6Ye1NJbzRbg2ubfr+Pat8NOxJGyFwnwtIrK7bOTx46g1UMmV/Zw7umUKdzUjasrpary9cxCQi9BtE1PvCpN8BN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1sdmaJj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1sdmaJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748503784; x=1780039784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80K2xmvN47BEAENQV7j6iSo8iupPg8RrLXiMCl25eVk=;
  b=D1sdmaJjIWeW3Ra61YFvuaVo/RRRBq3gm+DQ+fUUMoJpohxFfoI6y3ih
   yIng7+1bnYrl4dzrxrfDiy8FnFs5bIjpiumo3qbRbf+7NyNn4UEXibkRL
   dO6PMRtSr/kqHfNSmCgZkTisYoTReONygg9gldk4HqiYQo/AYBzfpX0Tk
   B+40FQwRRlty7RsZlr96GGLRrnsVVmBg1aY2mq51+kFreIzDLWgAI3PbU
   2pwnZnr/4gSKtHE5usUuA0BoqnPfjM2dJWUOPbzmDuOpQt7BYDqKCtXKU
   E9cgUcD0ieqkg/QNMKa4Btm0vgNdqluooIjcwgVIPQRPH3YJ6ZGWFG1mN
   A==;
X-CSE-ConnectionGUID: kzcZwseDSSGavKDLHm3UJA==
X-CSE-MsgGUID: cXV+Ub30TmywtSzRuWOioQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60813742"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="60813742"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 00:29:44 -0700
X-CSE-ConnectionGUID: OiKz5AjLQ1eC1iLPIP4Npw==
X-CSE-MsgGUID: PMnZAiA4SSqF0aCOYz31nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="143504663"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 May 2025 00:29:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKXhs-000WQq-09;
	Thu, 29 May 2025 07:29:40 +0000
Date: Thu, 29 May 2025 15:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:sk_storage.inline.v1 1/1] net/core/sock.c:
 net/bpf_sk_storage.h is included more than once.
Message-ID: <202505291532.AGLTUoUn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git sk_storage.inline.v1
head:   5b7437eee884fb452d5e1eaeefc648cccb39e0ef
commit: 5b7437eee884fb452d5e1eaeefc648cccb39e0ef [1/1] [DONT PUSH]: WIP bpf local storage reserve
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291532.AGLTUoUn-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> net/core/sock.c: net/bpf_sk_storage.h is included more than once.

vim +138 net/core/sock.c

   123	
   124	#include <linux/netdevice.h>
   125	#include <net/protocol.h>
   126	#include <linux/skbuff.h>
   127	#include <linux/skbuff_ref.h>
   128	#include <net/net_namespace.h>
   129	#include <net/request_sock.h>
   130	#include <net/sock.h>
   131	#include <net/proto_memory.h>
   132	#include <linux/net_tstamp.h>
   133	#include <net/xfrm.h>
   134	#include <linux/ipsec.h>
   135	#include <net/cls_cgroup.h>
   136	#include <net/netprio_cgroup.h>
   137	#include <linux/sock_diag.h>
 > 138	#include <net/bpf_sk_storage.h>
   139	
   140	#include <linux/filter.h>
   141	#include <net/sock_reuseport.h>
 > 142	#include <net/bpf_sk_storage.h>
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
