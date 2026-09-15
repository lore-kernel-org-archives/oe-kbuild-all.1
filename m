Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46F23FC41
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462660; cv=none; b=K9Pi4+QTBuJJFIcQ9mglodiiOuG9FijezpTc6tjwzUxW+QiaR/qgKPTzYQo+1vYgNZuNcq7U+lVOBTGnYUDvqGF3/H7pqW6CS3REmjbgdqI2kdkH6ayvKHtLdE6jhninDq3mbZStkWMb/Q3OaLpKrhGx1q4ALIACxMPMNuvazOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462660; c=relaxed/simple;
	bh=CF5Bs+wKV69yK3Ed51spcuZrZ5cU8H8CwB//85I6Dek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWMQh09pDNeHZafWYIyEHuNcWcoazWaPdFgsmOcf94gfvwUmXSYdPMoIBauzeWnzlk0igNb+VG10ZQPpSEc4Jbi65TLNWX9kuTWIq9Ny2LMYoZr9E9l8aqLyw+tYdsqPYmIYLLoUwyH3xlBSwHJOkQlYqFa7RuC2c8crqqfVUrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HC+newlB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HC+newlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789462659; x=1820998659;
  h=date:from:to:cc:subject:message-id;
  bh=CF5Bs+wKV69yK3Ed51spcuZrZ5cU8H8CwB//85I6Dek=;
  b=HC+newlBz08bE1fF4KrJhPGqZj2OPvz7jzDgdjrSJHxXP/RJWZJZs0XF
   6wZ/l+CwW95fzwOnw6ulI6krd/NX2pf/P9PHkXJVM6ctB0zWXloCxWTLw
   uD/+8IYHpgWHsxGO5yNnMmiBoloqNtmv77tQ0FhA9tsHen6XTNKnzYcsj
   pTBkRCqJJpLsWJDnWxvnEyRO9Un/ZS6GYkRXRqjBvTHwS3NDqZnh123Yu
   0Un6rWGKAK4lgC5apfxn0dmbWSsmrktvQKaO1ePEAvabA25wECX6ZmmRY
   ZlIODrNXp6GvFdL2QFDoKi9uPXg7woDAQdrCwQsiHlAP4Cell4O5H18hw
   w==;
X-CSE-ConnectionGUID: 78JkNYZXQFuCVW7xtqxjsg==
X-CSE-MsgGUID: PoDnIxkTTMmOlLE/Lq8RoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90025887"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90025887"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:57:38 -0700
X-CSE-ConnectionGUID: vk01FnNFT+O22+l0wZPcAw==
X-CSE-MsgGUID: PYtGPWC5SlWOQ9EKuXjjCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273416168"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2026 01:57:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Oyq-000000004HJ-2gkd;
	Tue, 15 Sep 2026 08:57:32 +0000
Date: Tue, 15 Sep 2026 16:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 7/46]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c:1544:23: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202609151656.rfgSBOQm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   423344419b5ba83783b44e2531fe2b32de9e4f42
commit: 91d6478f886dacd50091412b60bffeca05aee012 [7/46] wifi: brcmfmac: Implement the H2D/D2H mailbox data commonring messages
config: x86_64-randconfig-123-20260915 (https://download.01.org/0day-ci/archive/20260915/202609151656.rfgSBOQm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151656.rfgSBOQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151656.rfgSBOQm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c:1544:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] data @@     got unsigned int [usertype] data @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c:1544:23: sparse:     expected restricted __le32 [usertype] data
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c:1544:23: sparse:     got unsigned int [usertype] data

vim +1544 drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c

  1520	
  1521	
  1522	int brcmf_msgbuf_h2d_mb_write(struct brcmf_pub *drvr, u32 data)
  1523	{
  1524		struct brcmf_msgbuf *msgbuf = (struct brcmf_msgbuf *)drvr->proto->pd;
  1525		struct brcmf_commonring *commonring;
  1526		struct msgbuf_h2d_mailbox_data *request;
  1527		void *ret_ptr;
  1528		int err;
  1529	
  1530		commonring = msgbuf->commonrings[BRCMF_H2D_MSGRING_CONTROL_SUBMIT];
  1531		brcmf_commonring_lock(commonring);
  1532		ret_ptr = brcmf_commonring_reserve_for_write(commonring);
  1533		if (!ret_ptr) {
  1534			bphy_err(drvr, "Failed to reserve space in commonring\n");
  1535			brcmf_commonring_unlock(commonring);
  1536			return -ENOMEM;
  1537		}
  1538	
  1539		request = (struct msgbuf_h2d_mailbox_data *)ret_ptr;
  1540		request->msg.msgtype = MSGBUF_TYPE_H2D_MAILBOX_DATA;
  1541		request->msg.ifidx = -1;
  1542		request->msg.flags = 0;
  1543		request->msg.request_id = 0;
> 1544		request->data = data;
  1545	
  1546		err = brcmf_commonring_write_complete(commonring);
  1547		brcmf_commonring_unlock(commonring);
  1548	
  1549		return err;
  1550	}
  1551	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
