Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945117BA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 03:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731036046; cv=none; b=OR+5t2aqCT84kGTvAk/GLL10Tjmx2BIDZX8zqYS68es/13kaQZacASQg77gS0BC0xe0kTEvynmHCP9geHNl2i2xyrlksFejHOYgK+sIIbs7p+04u2OC1vGw6wRc7J9b+VS7liUFNaN5XPH7IvMSKJVdwliF/LxEndJ9V52jQjx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731036046; c=relaxed/simple;
	bh=tdj6LyDhnDgrXGiPepVKKQjrK7nGotJCJqdEeoTcZx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zvtrj3AWXz9+BqCuELMkrRC3UBUHVLOA+55mXKSLOabqpMhTbl0jJqOkQSeZ0MBD0ouv/N37BYPosbt0mYYs4NejPOG6IIYlthCgZd8vzJVNq8yelz8yW9qCkJKPOFiJWkffwPAaUsd0b2uLgQ/hk0It97rQsKNQX3RR5YEJtvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDcSbIry; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDcSbIry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731036044; x=1762572044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tdj6LyDhnDgrXGiPepVKKQjrK7nGotJCJqdEeoTcZx8=;
  b=bDcSbIryLED8/xAs+yaz85nQaFsCkEEc9xsid2cLAh3GU36BNwKOmuYL
   AVPVkOirbZJkkZUg+4qz3iJN9TIWf86kN0RXm8H5Mk5Uf0+xvkF9wqRgp
   5D76uR2zsQ5cmi5JAwIXGVQS5I7h08hpbjXrrE88TgLYXK9uy7pDGGOou
   EfzduV86dPoV4r6HvPZGhCWCvSc/XQ6agu3iCalYU/QqTlz/Hw0jArrLc
   LNDOTSjBVYqT9hBfmNs1IvjUgYAZp3QcoS9tDIRTqdU9M9+wr8QOH4g5b
   /zOFabvuBZrGJz83xRrkZ3NrTs0sv7pGjGKBK1RPj1yr5i99T9WQGeokS
   w==;
X-CSE-ConnectionGUID: CopWBGjzSweAaNnqhG7Y4A==
X-CSE-MsgGUID: 9dVVMMGkQTq++7qefbRslg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42288835"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="42288835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 19:20:43 -0800
X-CSE-ConnectionGUID: 5iAT5ljUR3mhdAQD3zq67g==
X-CSE-MsgGUID: 1ti+I5RURKuAzMPIzAUf3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="85569173"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2024 19:18:46 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9FWG-000qxu-1w;
	Fri, 08 Nov 2024 03:18:44 +0000
Date: Fri, 8 Nov 2024 11:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Subject: [linux-nvme:nvme-6.13 7/7] drivers/nvme/target/pr.c:857:34: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202411081109.soCWJfGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.13
head:   4c0ce9416cd06e9ef0e049f7a9226707c3786b1a
commit: 4c0ce9416cd06e9ef0e049f7a9226707c3786b1a [7/7] nvmet: support reservation feature
config: x86_64-randconfig-121-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081109.soCWJfGT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081109.soCWJfGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081109.soCWJfGT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/pr.c:857:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cntlid @@     got int @@
   drivers/nvme/target/pr.c:857:34: sparse:     expected restricted __le16 [usertype] cntlid
   drivers/nvme/target/pr.c:857:34: sparse:     got int

vim +857 drivers/nvme/target/pr.c

   802	
   803	static void nvmet_execute_pr_report(struct nvmet_req *req)
   804	{
   805		u32 cdw11 = le32_to_cpu(req->cmd->common.cdw11);
   806		u32 cdw10 = le32_to_cpu(req->cmd->common.cdw10);
   807		u32 num_bytes = 4 * (cdw10 + 1); /* cdw10 is number of dwords */
   808		u8 eds = cdw11 & 1; /* Extended data structure, bit 00 */
   809		struct nvme_registered_ctrl_ext *ctrl_eds;
   810		struct nvme_reservation_status_ext *data;
   811		struct nvmet_pr *pr = &req->ns->pr;
   812		struct nvmet_pr_registrant *holder;
   813		struct nvmet_pr_registrant *reg;
   814		u16 num_ctrls = 0;
   815		u16 status;
   816		u8 rtype;
   817	
   818		/* nvmet hostid(uuid_t) is 128 bit. */
   819		if (!eds) {
   820			req->error_loc = offsetof(struct nvme_common_command, cdw11);
   821			status = NVME_SC_HOST_ID_INCONSIST | NVME_STATUS_DNR;
   822			goto out;
   823		}
   824	
   825		if (num_bytes < sizeof(struct nvme_reservation_status_ext)) {
   826			req->error_loc = offsetof(struct nvme_common_command, cdw10);
   827			status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
   828			goto out;
   829		}
   830	
   831		data = kmalloc(num_bytes, GFP_KERNEL);
   832		if (!data) {
   833			status = NVME_SC_INTERNAL;
   834			goto out;
   835		}
   836		memset(data, 0, num_bytes);
   837		data->gen = cpu_to_le32(atomic_read(&pr->generation));
   838		data->ptpls = 0;
   839		ctrl_eds = data->regctl_eds;
   840	
   841		rcu_read_lock();
   842		holder = rcu_dereference(pr->holder);
   843		rtype = holder ? holder->rtype : 0;
   844		data->rtype = rtype;
   845	
   846		list_for_each_entry_rcu(reg, &pr->registrant_list, entry) {
   847			num_ctrls++;
   848			/*
   849			 * continue to get the number of all registrans.
   850			 */
   851			if ((void *)(ctrl_eds + sizeof(*ctrl_eds)) >
   852				(void *)(data + num_bytes))
   853				continue;
   854			/*
   855			 * Dynamic controller, set cntlid to 0xffff.
   856			 */
 > 857			ctrl_eds->cntlid = NVME_CNTLID_DYNAMIC;
   858			if (rtype == NVME_PR_WRITE_EXCLUSIVE_ALL_REGS ||
   859			    rtype == NVME_PR_EXCLUSIVE_ACCESS_ALL_REGS)
   860				ctrl_eds->rcsts = 1;
   861			if (reg == holder)
   862				ctrl_eds->rcsts = 1;
   863			uuid_copy((uuid_t *)&ctrl_eds->hostid, &reg->hostid);
   864			ctrl_eds->rkey = cpu_to_le64(reg->rkey);
   865			ctrl_eds++;
   866		}
   867		rcu_read_unlock();
   868	
   869		put_unaligned_le16(num_ctrls, data->regctl);
   870		status = nvmet_copy_to_sgl(req, 0, data, num_bytes);
   871		kfree(data);
   872	out:
   873		nvmet_req_complete(req, status);
   874	}
   875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
