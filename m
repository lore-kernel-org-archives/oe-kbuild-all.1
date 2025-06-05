Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCA317548
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153927; cv=none; b=o1MG7wV/GZOQrU/tNnBSd1uUEgrH9LKwhVLIkaKRNxpGouLMA4Y1O+q5zh5WN/3ddBpCYyL7uSxbJvjcvzveux8oVdpDvlg7DQljTE8KDz1CHalOQkt50kHx07UlowwKY1sT6Ld4zOarJ6ekza33kr8Q0c6H69Zxld5syffKkl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153927; c=relaxed/simple;
	bh=biQmpqEqyBUdjwUuCghO4/L95Xe+CnmRrwn5yHxA5+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qtRKWaWZWB1LLEHgJSWrjwqlRDymYUU+fyxEKa4OubGIZyhytMh7Cs8gNT+Ohj+3y3HoXTBvgk+h1O5Qfjju5oldx5HSOiTLrBQAGx7Ip3Hde3YNPTqcPF/zPQK2mi3AgFIdBIeLL114YRVkKk4zcAB8e0aw24LAkM70LpM1Y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAxVy8Iv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAxVy8Iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749153925; x=1780689925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=biQmpqEqyBUdjwUuCghO4/L95Xe+CnmRrwn5yHxA5+E=;
  b=PAxVy8IvH1Fhbobvqq4krD13MNcAtDcs7E4GZTl5TkMG+FDU9Ckt5Var
   ApYU8edueF+7X+153LtKhybLCfqCCzq/lQAgN0aXS+mgV8pJoBxkLNiRa
   BKkRitGOuSTBjvOOYsCj1K515t3fkRMbwxm2xUq9qISIp/AlGSUFHLYbs
   zO2DSw5xXmVfgIn6LvLSP5grt7G9VFw/Cr9B1uqRlP4HVFUmhQcN0YFbN
   tho/+bKs2GAWTrr+ubhrTGW23G8+35teRUkUY1w+RjqEYb7nmL2lZi1Ti
   6PYnkzT8fcHF3qpyEb2r0Otst2v0YianWcQInmDk6kRp6iOoZJZutdm1F
   g==;
X-CSE-ConnectionGUID: WGWlJ8CxTey6nn/vUvZyPg==
X-CSE-MsgGUID: aZp8DVMFTSmp2RysL2il7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="76690367"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="76690367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 13:05:25 -0700
X-CSE-ConnectionGUID: W+emKcaUSbaSG7nA0TkVQQ==
X-CSE-MsgGUID: lR2pKbAESw+S81I7XuVGaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="146598635"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jun 2025 13:05:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNGq1-0004R9-1w;
	Thu, 05 Jun 2025 20:05:21 +0000
Date: Fri, 6 Jun 2025 04:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 14198/14443] net/bluetooth/mgmt.c:5400:59:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202506060347.ux2O1p7L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f27f06ec12190c7c62c722e99ab6243dea81a94
commit: 5db6a9a0d4444b3c213bddf0947ce3c60f25c760 [14198/14443] Bluetooth: MGMT: Fix UAF on mgmt_remove_adv_monitor_complete
config: i386-randconfig-061-20250605 (https://download.01.org/0day-ci/archive/20250606/202506060347.ux2O1p7L-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060347.ux2O1p7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060347.ux2O1p7L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/bluetooth/mgmt.c:5400:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] handle @@     got restricted __le16 [usertype] monitor_handle @@
   net/bluetooth/mgmt.c:5400:59: sparse:     expected unsigned short [usertype] handle
   net/bluetooth/mgmt.c:5400:59: sparse:     got restricted __le16 [usertype] monitor_handle

vim +5400 net/bluetooth/mgmt.c

  5382	
  5383	static void mgmt_remove_adv_monitor_complete(struct hci_dev *hdev,
  5384						     void *data, int status)
  5385	{
  5386		struct mgmt_rp_remove_adv_monitor rp;
  5387		struct mgmt_pending_cmd *cmd = data;
  5388		struct mgmt_cp_remove_adv_monitor *cp;
  5389	
  5390		if (status == -ECANCELED)
  5391			return;
  5392	
  5393		hci_dev_lock(hdev);
  5394	
  5395		cp = cmd->param;
  5396	
  5397		rp.monitor_handle = cp->monitor_handle;
  5398	
  5399		if (!status) {
> 5400			mgmt_adv_monitor_removed(cmd->sk, hdev, cp->monitor_handle);
  5401			hci_update_passive_scan(hdev);
  5402		}
  5403	
  5404		mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
  5405				  mgmt_status(status), &rp, sizeof(rp));
  5406		mgmt_pending_free(cmd);
  5407	
  5408		hci_dev_unlock(hdev);
  5409		bt_dev_dbg(hdev, "remove monitor %d complete, status %d",
  5410			   rp.monitor_handle, status);
  5411	}
  5412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
