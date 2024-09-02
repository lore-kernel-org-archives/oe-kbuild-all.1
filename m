Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769C19CC10
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725301515; cv=none; b=onoJzF+mqZVypHF5IJhVaAthCk0f3vBV7qUG5RnU8dQcV0wJBzL6qWqqR0PfWDMFHT8+NxDG07wVA6/HnUPWtOQhy1d+JpCqrEFX7dn61/C2dHgw6fNnnZ1sNIO1NThUJ5/+KkTHQUrFwSb+bxAYV3l6UzFDVqR36ZoPqPei1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725301515; c=relaxed/simple;
	bh=UQ05iO51YoxlTpyTuKqS6mDwe0OyBkABPOQSGEz4tQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSPxOjj97kTOG8wU6QUfihpResIypXPQUjEXU+FWFcom4AfvfBtkXJogl8V6E4FQ+AvP4tMFeAaRckNH9/KSfzpLeQG2VcD6pQYx9BGK9Zgpxy8etrFeZmIWwQBPf0Z1buHjJuTT4td6QhO54VRw9cy6RmrxbEPMiE/yngaav8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7W5NjQX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7W5NjQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725301514; x=1756837514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UQ05iO51YoxlTpyTuKqS6mDwe0OyBkABPOQSGEz4tQM=;
  b=W7W5NjQXTjB94XL+WKoP+qoIsUKplR8tpAKqHMIvvyvUJK0XZyJAPUAI
   6w0LPCYp3qNdhBx98SZKdrm+Bfmt5J/fHE1iloLq6U2jxaYSjI2115A42
   +w/xYBZAOZQhgptgRb+/8y/Tv1zxHtokDNh5tlQxswXfG+7teleXQc7s/
   YjaIUG3ee29THW3asoi8vs+OnI30Kpq5uH+zLe2zUjvv0cWZYoTCeMoWs
   rNsY/DVeI1aBMQBB/7JHS24zrmie/lEb16Y1cnZqSJvVkMmjWRXSAaofc
   r4f4BGRaAJW0TbFtJk/PrefrmHC7RI1ave9ToUag0nBK9OvfJitaUOiRm
   w==;
X-CSE-ConnectionGUID: Aop6E7mwTle4qFiyjfRGPg==
X-CSE-MsgGUID: j+FaIVd7SPaIfJmAY9roSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="13334942"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="13334942"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 11:25:13 -0700
X-CSE-ConnectionGUID: LkDY5EcnRlGazL6XDL7PAQ==
X-CSE-MsgGUID: /mXCwjoQQ1ybofndTD4vsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="64354764"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2024 11:25:12 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slBji-0005ob-0Y;
	Mon, 02 Sep 2024 18:25:10 +0000
Date: Tue, 3 Sep 2024 02:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 14/34] net/core/skbuff.c:81:10: fatal error:
 'net/netmem_priv.h' file not found
Message-ID: <202409030209.7LhF19MZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   9c5b4f5a3e4cca20d27cf400cf6d0baab121e8e6
commit: 34779aae71797d681bc2b875a615b61f81822f1e [14/34] net: split mem provider part of page_pool_priv.h
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240903/202409030209.7LhF19MZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030209.7LhF19MZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030209.7LhF19MZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/skbuff.c:81:10: fatal error: 'net/netmem_priv.h' file not found
      81 | #include <net/netmem_priv.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from net/core/devmem.c:22:
>> include/net/page_pool/provider.h:7:10: fatal error: 'net/netmem_priv.h' file not found
       7 | #include <net/netmem_priv.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +81 net/core/skbuff.c

    67	
    68	#include <net/protocol.h>
    69	#include <net/dst.h>
    70	#include <net/sock.h>
    71	#include <net/checksum.h>
    72	#include <net/gso.h>
    73	#include <net/hotdata.h>
    74	#include <net/ip6_checksum.h>
    75	#include <net/xfrm.h>
    76	#include <net/mpls.h>
    77	#include <net/mptcp.h>
    78	#include <net/mctp.h>
    79	#include <net/page_pool/helpers.h>
    80	#include <net/dropreason.h>
  > 81	#include <net/netmem_priv.h>
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
