Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA319005D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737742696; cv=none; b=mD66uBOKs+KE8oxcyB22GBxOn59y5nGFYf0IOj6ckRS8qDWYy8lWXo7md5zvILKaVPECmcuaN99Z7R6LQ87NofDwaUgJnSG6HnOyO4GY418vqcNiKf/EOkoXnVNkQSCfoXMWXNsy6T9DAHsb4NvXryfOhIqb6d+w6EZhjLgMD3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737742696; c=relaxed/simple;
	bh=vidEi6dSzm6kWYfv5x8ApZW0zw8D9yv+MNRSsVKU+GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSWDKP8eIHg8EcR6V6F+OT6ssSYLD90LX2MlWft6isMQ+fpL1btM8zCcgP/0zl8gUcK+2Zs4lzlkHaNgIx4nMfO86yaY+dkaH28zmSFjqqehVCsThg5XEA5mEyB4/T3ZGAYHW817Pgw2NIQd841Bi15uX8hcctz5H+lDPqzBf4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoqH/FH4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoqH/FH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737742694; x=1769278694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vidEi6dSzm6kWYfv5x8ApZW0zw8D9yv+MNRSsVKU+GE=;
  b=YoqH/FH4CN1qBEpqjKCxsMff43X1hfBAb0jd94DZjUDaObwfm9Db+Tx8
   BgV2czWu27cfPDIp9hvenda2/S+hsSfmxUiiQ+NKpjiJ9GNqtCtt1PuQc
   0JZ01Zl7oGniOQLySVttZQwgzwijAkIaRgFEsX4Byeu+SeUmm8uuKpEl4
   tMR0d5rVrKMbxa1LmUsr06mkhiqnszWF1C9D78UI9I7lgOrf9g+D6IyyQ
   mj4IQ5ANTzQD/dNrvZlb55/OaHn4JcGxYdHutwac3lPH6hDqqutBc9LFC
   enTjTWFpUEChFJ5OncMkp+1QhCHUoPYgKadwCYS1FHTDMEJcXoJMaomdQ
   A==;
X-CSE-ConnectionGUID: a7M6/fy+R5Gyko0cCDIoBg==
X-CSE-MsgGUID: VEV3PFbZSd+Q/sCqyLcQaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38389426"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38389426"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 10:18:13 -0800
X-CSE-ConnectionGUID: LTSACMNFR2Crna7fDK2apg==
X-CSE-MsgGUID: koS2yVvQRKeM/GuprqilUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112976205"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jan 2025 10:18:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbOFu-000cxl-2L;
	Fri, 24 Jan 2025 18:18:10 +0000
Date: Sat, 25 Jan 2025 02:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1842/1842] include/net/tcp.h: linux/kabi.h is
 included more than once.
Message-ID: <202501250220.0DIDHdPf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6b6d5871437c4adda78a8fb495b923380a7f9d2e
commit: b809fb63adcda7223e4c19370fcc567128332e49 [1842/1842] kabi: reserve space for struct rate_sample
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250220.0DIDHdPf-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/net/tcp.h: linux/kabi.h is included more than once.

vim +29 include/net/tcp.h

    18	
    19	#include <linux/list.h>
    20	#include <linux/tcp.h>
    21	#include <linux/bug.h>
    22	#include <linux/slab.h>
    23	#include <linux/cache.h>
    24	#include <linux/percpu.h>
    25	#include <linux/skbuff.h>
    26	#include <linux/kref.h>
    27	#include <linux/ktime.h>
    28	#include <linux/indirect_call_wrapper.h>
  > 29	#include <linux/kabi.h>
    30	
    31	#include <net/inet_connection_sock.h>
    32	#include <net/inet_timewait_sock.h>
    33	#include <net/inet_hashtables.h>
    34	#include <net/checksum.h>
    35	#include <net/request_sock.h>
    36	#include <net/sock_reuseport.h>
    37	#include <net/sock.h>
    38	#include <net/snmp.h>
    39	#include <net/ip.h>
    40	#include <net/tcp_states.h>
    41	#include <net/inet_ecn.h>
    42	#include <net/dst.h>
    43	#include <net/mptcp.h>
    44	
    45	#include <linux/seq_file.h>
    46	#include <linux/memcontrol.h>
    47	#include <linux/bpf-cgroup.h>
    48	#include <linux/siphash.h>
  > 49	#include <linux/kabi.h>
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
