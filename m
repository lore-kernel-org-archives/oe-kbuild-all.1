Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C67E184F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 06:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732860497; cv=none; b=B56EqiTQR7zkwXHMrC2lT8YWaPhVWVtX8go1qpbgcwygREoFb5R/oKBhBNV+zoHQup3283xC8aoFKghNFqFpFZ8r7zHYkTdK6LW4CdAuQ1gBzljz11JxuubTTgz7LuTTlUebyebZHL/4VSCXLe/ZfXNL+iYXGpOc/Zs2mT6JR/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732860497; c=relaxed/simple;
	bh=8X8S4MUS6qisxBkugtLzsoeRV1KbCN8eWdJCe+wHnE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gsjkIrc3k/YyjUCT2+Z4gFg0rZlo3WhZo6CMSdwQCiUxMEGwGMp+qnQWTfGTe8qdzQbvf4ZKlMYYli2+Wk3rRaH0Z9uojbG1MyiVS7SPx94hYyys/E3iStqWBboZHipoLFrvCpnj6kqk2n3+NsOU4bkzF4G+lTR+d/iT5uvjpKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnnUkwS4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnnUkwS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732860495; x=1764396495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8X8S4MUS6qisxBkugtLzsoeRV1KbCN8eWdJCe+wHnE8=;
  b=jnnUkwS4a+mQAEOR/K6utwCWWADgdtVGl65w3pXZd0FOM8o5yO/Mq048
   B09QXCZnt/GF70NWhzfHQIQQuqGudqlvpNfQj1raWr0CrnWpRBrpDp2/2
   c+FqESD69ysmkA0lj5wA/W+XaO5WZ9MVKHR0FkoC/9cW4yYJu0ZwAMf2J
   cTlcEFE4N7e4UjYlycw3R23BXaBsDhICxS7i819cM9riHFPtiLTVukEjK
   Ym7l87rmOy3+VZC62AePQKNLZ+6ACGEZ6GHlKQu8edtN3wYQdqf1XU1il
   N+2aqogI+pepiWxvKQ2uY2G24CeTxveDKr95ES0tsyyKhoS0M/fvM4VqF
   g==;
X-CSE-ConnectionGUID: D9J6uhX3R/+mc/UNYQaqnA==
X-CSE-MsgGUID: NPrrgdvvSZiVAN5/1MaoMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="35957276"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="35957276"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:08:14 -0800
X-CSE-ConnectionGUID: zRfUw+wKSImIhZsw5KiceA==
X-CSE-MsgGUID: MdoxnoqoT8+dqoSOARBUmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="96487709"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Nov 2024 22:08:12 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGuAk-00002p-1k;
	Fri, 29 Nov 2024 06:08:10 +0000
Date: Fri, 29 Nov 2024 14:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 7/48]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c:1544:23: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202411291432.Wog5QISk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   382efbf95f1c08b2ecc4061963a61db6538d9724
commit: 6ae91cffd5dfd4ecf2336d3992ff304dd750e9da [7/48] wifi: brcmfmac: Implement the H2D/D2H mailbox data commonring messages
config: riscv-randconfig-r113-20241118 (https://download.01.org/0day-ci/archive/20241129/202411291432.Wog5QISk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241129/202411291432.Wog5QISk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291432.Wog5QISk-lkp@intel.com/

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
