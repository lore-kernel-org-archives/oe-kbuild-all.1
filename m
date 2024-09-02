Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020661CB508
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725299054; cv=none; b=lX48PY3SkR3rH+fDJDIu2CYDfGkFB5I0arhzCRRG/sAi7c97QxUgBfJv21kLrfBp2iVJRK04wp5TsZu5SBBB23JyUO8b5FMrfJwFiV3XzsQVb8GJNl0fyIrI3piPVFGTefLE+DgfdsWbPy3GpnzZnywvKsXRVfLPazU1wGDrqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725299054; c=relaxed/simple;
	bh=a6ZHp+IyufSYwzjzHJeA1ODAPjWkXI60zT0IAcnn2Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i24/2AMJfjjgIvanE8dT38kQDJFEkvJy7tmiM+fcCiAlyRWOlecOvZhT93gypm/Js1YOsM84PXiX/x0YHqlKrZPkHfnGHD7+Tz6mvnfVMYq1u+d61Ypnqw6h3L5uMGfVm6DTzJT6wmUQQkLbnQu2gjSfgbRWQLkzE6Wz7vUMHHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ly1Ci2Er; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ly1Ci2Er"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725299052; x=1756835052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a6ZHp+IyufSYwzjzHJeA1ODAPjWkXI60zT0IAcnn2Uw=;
  b=ly1Ci2ErVzbDCgdQQ+/PHKsVaRcnsfzDSfAY6y4eAs6CvPWLEJlnYCS/
   LgSQ9rxmPtaH5+TjS134SV93TIoEzYl/Ki6vPFI/ZUQvATxE7wrCzjY5U
   USEuVfW+7NRIXvywvv7SWRS4a2j2FrvyaKy8+DdheIjUmy8CGhkjRBgtX
   22DBQgo1JNcQxBNZYhuQq68Kd+11B5x2sLlKOmihECAJrKjWoPHKLdWxN
   0NZpWaY5jD9iCV5pqoIJOGhzNFCqzVdGIiWQNYDsDTZQ4LlsFziyBdXw7
   gwj10johcw4acGRxqP0WbniXgq3skPTlFhEVhm//xWgdqNAHQq8PzWzXw
   g==;
X-CSE-ConnectionGUID: sZcuwfcIR5WE8Ug2NfiQSA==
X-CSE-MsgGUID: w77EneojQRWc4PCxWUO6zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35277600"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="35277600"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 10:44:12 -0700
X-CSE-ConnectionGUID: 3nawW4h8QA+DgL58xQD9Rw==
X-CSE-MsgGUID: EIKQzl5ZQm2vjQxweaeYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="64707287"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2024 10:44:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slB60-0005mg-27;
	Mon, 02 Sep 2024 17:44:08 +0000
Date: Tue, 3 Sep 2024 01:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 14/34] net/core/skbuff.c:81:10: fatal error:
 net/netmem_priv.h: No such file or directory
Message-ID: <202409030105.MG3IXKAw-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240903/202409030105.MG3IXKAw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030105.MG3IXKAw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030105.MG3IXKAw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/skbuff.c:81:10: fatal error: net/netmem_priv.h: No such file or directory
      81 | #include <net/netmem_priv.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from net/core/devmem.c:22:
>> include/net/page_pool/provider.h:7:10: fatal error: net/netmem_priv.h: No such file or directory
       7 | #include <net/netmem_priv.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


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
