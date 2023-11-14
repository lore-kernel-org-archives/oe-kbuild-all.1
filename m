Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE4EBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 00:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2xo9sKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699921577; x=1731457577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mj5ljzRdz5/qdEdBaWgHu7/DQQ74dRNm6qt/B3iBNzM=;
  b=c2xo9sKOrWjkay3PFdKiOBYyO40E6LbGjSxEM2xOphn28TIsVdSZaNak
   hnATDCsw4Zw4hgbFfV5LcsKZ6pJcvV4qmzIroq4ELn3svoCKfzW30HiI0
   eavHf/DV45U7/1Snq/YnSCXB0Kub68TOp+MZUHrzN0v26cdd83vJrfyeC
   cJ9w8LhZeOW1+aM0vcC7S3hrD1V2iISjwFQ+xCYNTWWE5KvFiKF67O41k
   l+Tfo+o4aWtnMv9VSTx/MLYr2tSgxRbKSQsh9pe+BKzlLvzMrQeOIvMxb
   BX6sQpHA/93Bjf4FpFVAfeu66yaCCjBMQz+GCX6jFPXJcQ2J5FTPn6beM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394443929"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="394443929"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 16:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="830386310"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="830386310"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Nov 2023 16:26:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2hFq-000CeM-0O;
	Tue, 14 Nov 2023 00:26:10 +0000
Date: Tue, 14 Nov 2023 08:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Eckelmann <sven@narfation.org>
Cc: oe-kbuild-all@lists.linux.dev, Sven Eckelmann <sven@narfation.org>,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [batman:batadv/net-next 6/6] net/batman-adv/main.c:9:10: fatal
 error: linux/array_size.h: No such file or directory
Message-ID: <202311140834.pxv63Ngy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.open-mesh.org/linux-merge.git batadv/net-next
head:   b4219d78f2b71593b90647eeff01f6ea2e1560d4
commit: b4219d78f2b71593b90647eeff01f6ea2e1560d4 [6/6] batman-adv: Switch to linux/array_size.h
config: csky-randconfig-001-20231114 (https://download.01.org/0day-ci/archive/20231114/202311140834.pxv63Ngy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140834.pxv63Ngy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311140834.pxv63Ngy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/batman-adv/main.c:9:10: fatal error: linux/array_size.h: No such file or directory
       9 | #include <linux/array_size.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> net/batman-adv/netlink.c:10:10: fatal error: linux/array_size.h: No such file or directory
      10 | #include <linux/array_size.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 net/batman-adv/main.c

     8	
   > 9	#include <linux/array_size.h>
    10	#include <linux/atomic.h>
    11	#include <linux/build_bug.h>
    12	#include <linux/byteorder/generic.h>
    13	#include <linux/container_of.h>
    14	#include <linux/crc32c.h>
    15	#include <linux/device.h>
    16	#include <linux/errno.h>
    17	#include <linux/genetlink.h>
    18	#include <linux/gfp.h>
    19	#include <linux/if_ether.h>
    20	#include <linux/if_vlan.h>
    21	#include <linux/init.h>
    22	#include <linux/ip.h>
    23	#include <linux/ipv6.h>
    24	#include <linux/kobject.h>
    25	#include <linux/kref.h>
    26	#include <linux/list.h>
    27	#include <linux/minmax.h>
    28	#include <linux/module.h>
    29	#include <linux/netdevice.h>
    30	#include <linux/printk.h>
    31	#include <linux/rculist.h>
    32	#include <linux/rcupdate.h>
    33	#include <linux/skbuff.h>
    34	#include <linux/slab.h>
    35	#include <linux/spinlock.h>
    36	#include <linux/sprintf.h>
    37	#include <linux/stddef.h>
    38	#include <linux/string.h>
    39	#include <linux/workqueue.h>
    40	#include <net/dsfield.h>
    41	#include <net/rtnetlink.h>
    42	#include <uapi/linux/batadv_packet.h>
    43	#include <uapi/linux/batman_adv.h>
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
