Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDAE847E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711792838; cv=none; b=ogBc77nTkZNSKhX+9My6akJ5OHBprQ3fkabJa0WfjvcpI44Hx9ryUbS9M0e2C7jGfvADI0WNoG06AdH7iI6hI6X5wV2JSTjekDEkvrrW3HB/2cTAqCt/wOgTVV7Chn2lSU05Zitn2YT7m3so8onEpCLj3Kw0lTr5of6vMjOKx6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711792838; c=relaxed/simple;
	bh=3ZDrKJGnmkJoP+9D37DJi0Gq7qEipFVABfw7UlOYTnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIjBwDrVIXRbMmv4+KzgELcn2V3S7h49b0H5Ap0/StfToyR5Wd3JAu78c0Iezcx2d8ssFxbN9zm4aBr52IOHOluS/CE8gTHsq8xsfLlUtNlL12IV9dWnNTBWfM6jfU21T3kHwJI/Wwp6Rv15jryQKtIGxG4f7Kj3Nb7XQbmSU5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSI29qOR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSI29qOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711792835; x=1743328835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ZDrKJGnmkJoP+9D37DJi0Gq7qEipFVABfw7UlOYTnI=;
  b=mSI29qORjBML+mcpS9+63ZSkmhTOR2DWKLbxpqdRq0SzFAb5AqouReKo
   EhLcCVRP1AQv9TPPSdvJCVhDuNN8CMXgwcKRk4GR8j711Jztg5pBalMoN
   jFoMec8rKdIpBHyYtfkhZzjFUZ2QnIljqfDeCgzAuAoLiZbFSrJjf0/hR
   wGz7ORPMmyvGVs6CEwXxS/c9XQ6m+fMqRwOfmKXjQCGieZ0wiGiAYZC8J
   WyzVchdX1LpijDXJCdKi7V6lUOTprLUBVpv8lUvsNVCCEkZEhlwLZv3lR
   HFzGndCmYuyZq39KAie56wqUZM8wLGZSGWGD5sCIxX2cw5TDFCzUkGv9Y
   w==;
X-CSE-ConnectionGUID: x4J2VAwAQjWpSphRpLRtTQ==
X-CSE-MsgGUID: 8+2CNNg0SsGvJJMgqDtj9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="9924266"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="9924266"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 03:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="40348421"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Mar 2024 03:00:28 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqVVg-00048Q-1Q;
	Sat, 30 Mar 2024 10:00:24 +0000
Date: Sat, 30 Mar 2024 17:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhanglei <zhanglei48@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7031/7157]
 drivers/scsi/hisi_raid/hiraid_main.c:1832: warning: expecting prototype for
 hiraid_create_cq(). Prototype was for hiraid_create_complete_queue() instead
Message-ID: <202403301744.3A4FOOJB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   398d837363b6cac5548eda808de1dfd5269a960a
commit: fd8c1a2ddc2f28838e4a6a8be6a7d6dc95a678d3 [7031/7157] SCSI: hisi_raid: support SPxxx serial RAID/HBA controllers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240330/202403301744.3A4FOOJB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301744.3A4FOOJB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301744.3A4FOOJB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/hisi_raid/hiraid_main.c:1832: warning: Function parameter or member 'hdev' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1832: warning: Function parameter or member 'qid' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1832: warning: Function parameter or member 'hiraidq' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1832: warning: Function parameter or member 'cq_vector' not described in 'hiraid_create_complete_queue'
>> drivers/scsi/hisi_raid/hiraid_main.c:1832: warning: expecting prototype for hiraid_create_cq(). Prototype was for hiraid_create_complete_queue() instead
   drivers/scsi/hisi_raid/hiraid_main.c:1852: warning: Function parameter or member 'hdev' not described in 'hiraid_create_send_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1852: warning: Function parameter or member 'qid' not described in 'hiraid_create_send_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1852: warning: Function parameter or member 'hiraidq' not described in 'hiraid_create_send_queue'
>> drivers/scsi/hisi_raid/hiraid_main.c:1852: warning: expecting prototype for hiraid_create_sq(). Prototype was for hiraid_create_send_queue() instead


vim +1832 drivers/scsi/hisi_raid/hiraid_main.c

  1826	
  1827	/**
  1828	 * hiraid_create_cq - send cmd to controller for create controller cq
  1829	 */
  1830	static int hiraid_create_complete_queue(struct hiraid_dev *hdev, u16 qid,
  1831							struct hiraid_queue *hiraidq, u16 cq_vector)
> 1832	{
  1833		struct hiraid_admin_command admin_cmd;
  1834		int flags = HIRAID_QUEUE_PHYS_CONTIG | HIRAID_CQ_IRQ_ENABLED;
  1835	
  1836		memset(&admin_cmd, 0, sizeof(admin_cmd));
  1837		admin_cmd.create_cq.opcode = HIRAID_ADMIN_CREATE_CQ;
  1838		admin_cmd.create_cq.prp1 = cpu_to_le64(hiraidq->cq_buffer_phy);
  1839		admin_cmd.create_cq.cqid = cpu_to_le16(qid);
  1840		admin_cmd.create_cq.qsize = cpu_to_le16(hiraidq->q_depth - 1);
  1841		admin_cmd.create_cq.cq_flags = cpu_to_le16(flags);
  1842		admin_cmd.create_cq.irq_vector = cpu_to_le16(cq_vector);
  1843	
  1844		return hiraid_put_admin_sync_request(hdev, &admin_cmd, NULL, NULL, 0);
  1845	}
  1846	
  1847	/**
  1848	 * hiraid_create_sq - send cmd to controller for create controller sq
  1849	 */
  1850	static int hiraid_create_send_queue(struct hiraid_dev *hdev, u16 qid,
  1851						struct hiraid_queue *hiraidq)
> 1852	{
  1853		struct hiraid_admin_command admin_cmd;
  1854		int flags = HIRAID_QUEUE_PHYS_CONTIG;
  1855	
  1856		memset(&admin_cmd, 0, sizeof(admin_cmd));
  1857		admin_cmd.create_sq.opcode = HIRAID_ADMIN_CREATE_SQ;
  1858		admin_cmd.create_sq.prp1 = cpu_to_le64(hiraidq->sq_buffer_phy);
  1859		admin_cmd.create_sq.sqid = cpu_to_le16(qid);
  1860		admin_cmd.create_sq.qsize = cpu_to_le16(hiraidq->q_depth - 1);
  1861		admin_cmd.create_sq.sq_flags = cpu_to_le16(flags);
  1862		admin_cmd.create_sq.cqid = cpu_to_le16(qid);
  1863	
  1864		return hiraid_put_admin_sync_request(hdev, &admin_cmd, NULL, NULL, 0);
  1865	}
  1866	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
