Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208018B47E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731949385; cv=none; b=MQe8LPfgZKpyFkB0AP8zaCGoK55ly9n8lD3HEQiEgAcg/G6Rm5NbEqYvzDgqlAHR8NqpL34HlG/4kmTcvX0tCXt14zEqE09Y/eErBM8W79RfW/jaoE9850qyQDygzRP2PPSnOuIdr3urHe75f0Ct5dcdIwqcgh3HmUcb507WXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731949385; c=relaxed/simple;
	bh=wfHumJzMNXFQYK23OsYm0Nxfu9VZgA1OxDkHqLUfb64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ERF6CaoivLypnDbQR9YoqcNU1jLsMg6YAryHrQ1Oqwi1D0kQcPXXkYTWeRNZtPBwbb/H1yKSL3jEL2Z9YivEmM/7cKbgUsx24yEjPiISiL6LUAgTyjqxrLUOzTOnyMh1esDEi+p9bdSanO2q80eG8ofU6h2MR2sEpOrYYo0d9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bl4ugz72; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bl4ugz72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731949384; x=1763485384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wfHumJzMNXFQYK23OsYm0Nxfu9VZgA1OxDkHqLUfb64=;
  b=Bl4ugz72djdbJANUxwD9MTHG7aP5e21QYsApU/hWENL9nQf9U7PZo434
   jHfKE9wPP4yjIdE4s/as6juGCE0lvPphnSS6cxyFHRIJrHzNuyKBNGHjx
   ECaZXXFYd0VDuwD5gsNklbTIevbls7j4WudpYZgiRYGGfGvay2r170o7y
   SUPTB6lbjj3oj04tSuUvMN5gyjxJ4qz7pmnEZMn2LehuHLj/jsmw2+COy
   IN+cJU41Jgqx8A1Qk2AV0/T2yU82L8tKqBFt2oOAIqyp5aWLdUEot9Ihe
   fVtzZqh1mW84fTTbp658dkBF9kDYo0XzyBU8veNWZU/KupcE5X8toxqka
   A==;
X-CSE-ConnectionGUID: YE+WpN7pQ6iYUG6AUQnP3Q==
X-CSE-MsgGUID: 3nOiFm56RD+uENok+V2ttQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31968850"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31968850"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 09:03:03 -0800
X-CSE-ConnectionGUID: Vo2MoGduRTe55rqFcsgz/Q==
X-CSE-MsgGUID: LJVKR/m5SXuUWEVOPO5Qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="94227310"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Nov 2024 09:03:02 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD59O-0002YX-2X;
	Mon, 18 Nov 2024 17:02:58 +0000
Date: Tue, 19 Nov 2024 01:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 7/48]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c:1544:23: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202411190020.etjEmDHz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   bae8b9b1d3b8c3fc9e9e35e1b0656cc5bcdae6ec
commit: 6ae91cffd5dfd4ecf2336d3992ff304dd750e9da [7/48] wifi: brcmfmac: Implement the H2D/D2H mailbox data commonring messages
config: riscv-randconfig-r113-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190020.etjEmDHz-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241119/202411190020.etjEmDHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190020.etjEmDHz-lkp@intel.com/

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
