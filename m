Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D97AD29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liDVIbEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698314716; x=1729850716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+9RO7tRCcnTcL/EY0dbgvF+QnYTgHXHuVeIMbMEcB4=;
  b=liDVIbEO3/uJpzWe9xiVDGZ9XZTzuSTE0WqRFa6brWMQ/NNUbZ2EVLxf
   cbl20qp2ZAd+IhSdtbbmwABCf3uosCa15g4gum2y+MVR7BFgVpTbM0JQd
   NiV8ZfSWrBKpcoPLNI5qALCCF1q5OFJ5g6HJ4K5DiEfbySi6UeaRj0LUV
   indETrOSo48ZuJjPN9I2FU/nAVQJ7IdMoEPZbmkguLPykbDMITgz13y1E
   Dm2v/AHTgr0Rv7VZSf6S7aUUZKzO2sdOF+yMzTivA8c5Fn1JTUg9L/XvF
   Y5yCRXVvFjnvMSBhqIr02TYnheZ6elBdUe/d/o3U74GEGmLeDfIA+ooIN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377872495"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="377872495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 03:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="451796"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2023 03:05:03 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvxEm-0009h3-1T;
	Thu, 26 Oct 2023 10:05:12 +0000
Date: Thu, 26 Oct 2023 18:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/080-wifi 8/32]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c:1544:23: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202310261751.6T7hQ8Ts-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   2fac67e22f6cf7c8b1261e1bc9a33de738859b89
commit: 33c8a285704a8e1080e3e107f9bdc2c5778499f8 [8/32] wifi: brcmfmac: Implement the H2D/D2H mailbox data commonring messages
config: i386-randconfig-063-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261751.6T7hQ8Ts-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261751.6T7hQ8Ts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261751.6T7hQ8Ts-lkp@intel.com/

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
