Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793573797;
	b=LSgxTjuAFocjEwk5tT46ZCt7s/BNX9aNUoHukqIRbYQipxHZpFthMIE/9a4KIUKgyY2k
	 0XnC2gGe8FAywNhxuYnPuRzYfmQ5qgg5I7xtKiQPHrXlBdHyK58iFRxe3+is9YfESwk4b
	 NL6m3Z2V2VKbc5S/qoc1F7eZu3CyteUOl09L+EVk0uOnGX/f3r4dqekaoL5Ax/Ni6l/DE
	 12GVBbvNdWLSdQ9FCMLkv++9x3Vp3C+aBUehBxJIWhkyIB2G80FLK4PoiDEq+CI5eHRY3
	 YBjK4dhQcJbt4hqICMDyUdbb6+ExeZq3QAYpOlql8Jroh1XHcPqexQmtYk/kOiNa3KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793573797;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JU9JbM1my+A2+vemSgwJKgge0O5iOnRk5zh7Yg7Jt7A=;
	b=zAWjRyBwtAzQJ2kl2yVTtL3DiD0A6HT6dqVko30FjLqTe8wh2IXPLsyutYrzSKVCypva
	 UBr78++JM/Biz+wfrf2fHj8lPsVRQZgEYRLPTjT06QQRORwxHyjEebrMxGyf0/lYURVRL
	 iuYRaeZSehjsg3MVUyx/w+jv+ElJQMCof9CjA4likOaAmZ9nuLA8MbeeJ+M8i//lnhfzH
	 WXsqpxBYLZwswjRZIi5cMIhTxy758g/icIYkw57lCnLxZ7aSrUYKOR7AoszjJOYf0s0oc
	 y9vB4JWWEeWi/bznKGHJMhmLHijTKrp1e9E4T8DJybZPI24rkrkBrXVUZPdhlq8Hdzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gyOkMB1y;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073E606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 22:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F073E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gyOkMB1y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793573794; x=1825109794;
  h=date:from:to:cc:subject:message-id;
  bh=GzoeqgwDcDQX7uFOl+KiRcD1I7Ofgwnn/IldQGa9KIM=;
  b=gyOkMB1y32zGiPpIoFgtq/StyN/IW4ECKlM0lFKuN8jnfQMceI+YLOg5
   iceIIHoT/wkGWn2+jziTrokjc6uVwZttdCPZbdPIUs36OSGHLUyfd+O+n
   pEcpQjlwBGeBLtuVEIlezLG1pDn9pEFCW7bUVS6ltWXFq44hZFaJU2KbM
   hw6XmlLOxwDrFvd0hcXR9zn5WUR1R2BrPAiO50Ow5A2fSSRAfg6zKJpSs
   XLxxDyTzwLXu/zL03ozoCJl8xUyjAN/UGgmn0rESLU4llH4CEvMj016g4
   bp3r221r3gLfUMrXGYFK+OlVmypQCRZ+E5Ci0cWHc7/KK316xWHeIDGIs
   Q==;
X-CSE-ConnectionGUID: SYsR0WnaR1y+R531A21qiQ==
X-CSE-MsgGUID: XlmQTwCZRZag9COycFvt+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2290201"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2290201"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 14:56:33 -0800
X-CSE-ConnectionGUID: Nafh+cDkQcyxtRh12PCPJQ==
X-CSE-MsgGUID: GrTp7Ca/QLKTUxurYfhcTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="7729514"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 01 Nov 2026 14:56:33 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNeTW-0000000086V-0Aov;
	Sun, 01 Nov 2026 22:56:30 +0000
Date: Sun, 01 Nov 2026 23:55:54 +0100
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/fsl-ifc-nand-irq 5/9]
 drivers/firmware/stratix10-svc.c:1447:6-25: WARNING: atomic_dec_and_test
 variation before object free at line 1448.
Message-ID: <202611012312.2Cd7csQh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/krzk/linux n/fsl-ifc-nand-irq
head:   1f3c66d983cd5d1133af173b361d86613477beb6
commit: b1984dd53b497be17d49ec9607bc35c481f4c3d7 [5/9] firmware: stratix10-svc: Use proper atomic to fix possible double free
config: arm64-randconfig-r2108-20261101 (https://download.01.org/0day-ci/archive/20261101/202611012312.2Cd7csQh-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611012312.2Cd7csQh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/stratix10-svc.c:1447:6-25: WARNING: atomic_dec_and_test variation before object free at line 1448.

vim +1447 drivers/firmware/stratix10-svc.c

  1408	
  1409	/**
  1410	 * stratix10_svc_remove_async_client - Remove an asynchronous client
  1411	 *                                     from the Stratix10 service
  1412	 *                                     channel.
  1413	 * @chan: Pointer to the Stratix10 service channel structure.
  1414	 *
  1415	 * This function removes an asynchronous client associated with the
  1416	 * given service channel. It checks if the channel and the
  1417	 * asynchronous channel are valid, and then proceeds to decrement
  1418	 * the reference count for the common asynchronous channel if
  1419	 * applicable. If the reference count reaches zero, it destroys the
  1420	 * job ID pool and deallocates the asynchronous client ID. For
  1421	 * non-common asynchronous channels, it directly destroys the job ID
  1422	 * pool, deallocates the asynchronous client ID, and frees the
  1423	 * memory allocated for the asynchronous channel.
  1424	 *
  1425	 * Return: 0 on success, -EINVAL if the channel or asynchronous
  1426	 *         channel is invalid.
  1427	 */
  1428	int stratix10_svc_remove_async_client(struct stratix10_svc_chan *chan)
  1429	{
  1430		struct stratix10_svc_controller *ctrl;
  1431		struct stratix10_async_ctrl *actrl;
  1432		struct stratix10_async_chan *achan;
  1433	
  1434		if (!chan)
  1435			return -EINVAL;
  1436	
  1437		ctrl = chan->ctrl;
  1438		actrl = &ctrl->actrl;
  1439		achan = chan->async_chan;
  1440	
  1441		if (!achan) {
  1442			dev_err(ctrl->dev, "async channel not allocated\n");
  1443			return -EINVAL;
  1444		}
  1445	
  1446		if (achan == actrl->common_async_chan) {
> 1447			if (atomic_dec_and_test(&actrl->common_achan_refcount)) {
> 1448				ida_destroy(&achan->job_id_pool);
  1449				ida_free(&actrl->async_id_pool,
  1450					 achan->async_client_id);
  1451				kfree(achan);
  1452				actrl->common_async_chan = NULL;
  1453			}
  1454		} else {
  1455			ida_destroy(&achan->job_id_pool);
  1456			ida_free(&actrl->async_id_pool, achan->async_client_id);
  1457			kfree(achan);
  1458		}
  1459		chan->async_chan = NULL;
  1460	
  1461		return 0;
  1462	}
  1463	EXPORT_SYMBOL_GPL(stratix10_svc_remove_async_client);
  1464	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
