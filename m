Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D6D29A1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765025455; cv=none; b=hzeb03V0C5BgP7Qg3l8hh8ZK2TnnmjmmjpIfRjivLuouWTUlRlR65qk3Wq6J7NWAfJ+z7qLbi3phu+H3DiFTDoxda1UA4u9XzXkCMTresJVT1Ar/viO0GB9DRkYya6dvW61c3lsbmruiqICp3IJZJdEH7Kfni0It+2bUXPotX3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765025455; c=relaxed/simple;
	bh=qp30uvm0i+buYaPpzkQlg9hSQ+SvVOJz6g511Th2DWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQSYGZzNdoduCI0C6yV4kLedtG9302YQEk8aupUjehSRj5voR2MnObBvKvVv76xCStJdS36IYldOX9G5RlvcDeyVwL0Z8sUyVS3Pa4ovjIqBZ7lmeFt0UPU6YxvW8IWsm6w0zuQIBL/z1oyumjIEFH7o5xXNT1hE9u4lX7r/fzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN6BfCOl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN6BfCOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765025454; x=1796561454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qp30uvm0i+buYaPpzkQlg9hSQ+SvVOJz6g511Th2DWg=;
  b=iN6BfCOlq4v1pm9x7ol2n8enXcZqZ08BBVLKZPWcIVxDdzrYB1YEmjeQ
   jdMIhgIk65eVW27b9IZsWT6FALvfrvzAn7LB5Fcpv24ayqUdhmp80zxmQ
   jdvCnSTVgnInTpi4o4eZoxYLfL5Pmqj6BFDqAEOobpxCj0qoAtrt1OsH9
   /G+Sj2LtHfBenXyeDXZdZJ/J7+b+P904QNsWO5au5q5AVSzR7Q/98RGjc
   T0sEb8NK8G/YbOzEk8S/GpTpmuKWNiuY7SGzu/eGZjlX6ChRzup+3RoaT
   cxduVe6akjU6oUbrCe08E2/hjVy3sP1A/z0t7ZfwfxZXrYJlGAXDg1nm1
   g==;
X-CSE-ConnectionGUID: u2FthwBJQD6cIvEkdGhfnA==
X-CSE-MsgGUID: D5Xsn036RVWHp14l9QVsGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66936902"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66936902"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 04:50:54 -0800
X-CSE-ConnectionGUID: x+Le7A2sQa+jtVJ+eISpuw==
X-CSE-MsgGUID: 63qwpAaLTVC5gQyAfSVMZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="199699505"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Dec 2025 04:50:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRrkQ-00000000IAn-1n7V;
	Sat, 06 Dec 2025 12:50:50 +0000
Date: Sat, 6 Dec 2025 20:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	David Wei <dw@davidwei.uk>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring7 2/12] net/core/netdev_queues.c:75:35:
 warning: passing argument 1 of 'xsk_get_pool_from_qid' discards 'const'
 qualifier from pointer target type
Message-ID: <202512062040.dwBR0zfP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring7
head:   49e30646c2932aa37daeb4edc45b82d3e0c72bf3
commit: 3064e035c5cf344cbcc324173a049f464cd6e69e [2/12] net: Implement netdev_nl_queue_create_doit
config: x86_64-randconfig-161-20251206 (https://download.01.org/0day-ci/archive/20251206/202512062040.dwBR0zfP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512062040.dwBR0zfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512062040.dwBR0zfP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/netdev_queues.c: In function 'netdev_queue_busy':
>> net/core/netdev_queues.c:75:35: warning: passing argument 1 of 'xsk_get_pool_from_qid' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      75 |         if (xsk_get_pool_from_qid(dev, idx)) {
         |                                   ^~~
   In file included from net/core/netdev_queues.c:5:
   include/net/xdp_sock_drv.h:299:42: note: expected 'struct net_device *' but argument is of type 'const struct net_device *'
     299 | xsk_get_pool_from_qid(struct net_device *dev, u16 queue_id)
         |                       ~~~~~~~~~~~~~~~~~~~^~~


vim +75 net/core/netdev_queues.c

    67	
    68	bool netdev_queue_busy(const struct net_device *dev, int idx,
    69			       struct netlink_ext_ack *extack)
    70	{
    71		if (netdev_rx_queue_leased(dev, idx)) {
    72			NL_SET_ERR_MSG(extack, "Lease device queue is already leased");
    73			return true;
    74		}
  > 75		if (xsk_get_pool_from_qid(dev, idx)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
