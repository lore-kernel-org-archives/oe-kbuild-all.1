Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA171B3725
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 23:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731627861; cv=none; b=DPX8bMIC2ltoTX4CpderPlLwBCsV51Me+tTepqaEmWbciuwoo5iW+Z8U/VA66rrcpInVVU9leS3qz6BAOZ5wkd7RqYd5i/FDd41hyL9u1HgVJ/tf5Cl1fDe2wOUjq6QbXTa6Jq88pqJ61ENBhr4IorrB/ctbJMhEko1diN8Qp18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731627861; c=relaxed/simple;
	bh=cCKYlcxH1GD8cheEIn/gQwmX8onP6/k9V3U3anXfZus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJsAe80uBUaS9YWL4fFvTmDE+7bc1f+EHXgsB82SffeYHksKSOvWKXbS6HF4xQFTQJRw/hWF+fEq8zI0X+ioNL8BBravUuxtpa6DLm3mQoXjORJwEwD0HnwS5tA5/prDeDg8DHyRbPGT5fvIfQhMQCFjSsn3NKy4XBKjtLK9qaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLcux+t5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLcux+t5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731627859; x=1763163859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cCKYlcxH1GD8cheEIn/gQwmX8onP6/k9V3U3anXfZus=;
  b=ZLcux+t5T8f01HNFPk/35wuDukPmXZAZAnicHGprgr5efM+frv8WHLhP
   np3RNf/+EwepAZD6MKGu39zC9WgOzO1fmzd+wyaYMhBfD6BRm+EhsT8zs
   a8p4I8t1M3Mq5s17ccpspQh/Aazt43g1mvaDKYwAT1QuGkJNTf15z08m3
   fcY82pNPtV+opntvHzhFyiC76mBVAHUyuBmv1XTRFPnVegyy1RwD2/My9
   ehppiBbofLmTHNblXdeIjgrqOXKGo6N4wLRA2UbiAUTPrDcXea71Jo0BB
   Mpy2LVAOr0OmQQOOFEckfHBq4koNRYFVQDPWEpyv2/xAYTfaDt3vSt76H
   A==;
X-CSE-ConnectionGUID: NTY+xNw+QIWIScdMzGGaCw==
X-CSE-MsgGUID: VMahO3ftTc+QrZNt7kbcxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42231418"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="42231418"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 15:44:18 -0800
X-CSE-ConnectionGUID: qZx8ZmwwTlO7DMPznom+ow==
X-CSE-MsgGUID: 9HPjh95mStmC+yKo2uRbcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="125885034"
Received: from lkp-server02.sh.intel.com (HELO f5eddd9a323a) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2024 15:44:16 -0800
Received: from kbuild by f5eddd9a323a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBjUq-00007J-0i;
	Thu, 14 Nov 2024 23:43:44 +0000
Date: Fri, 15 Nov 2024 07:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Subject: [linux-next:master 10347/11726] drivers/nvme/target/pr.c:831:8-15:
 WARNING: kzalloc should be used for data, instead of kmalloc/memset
Message-ID: <202411150724.fTjNka1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37c5695cb37a20403947062be8cb7e00f6bed353
commit: 5a47c2080a7316f184107464e4f76737c0c05186 [10347/11726] nvmet: support reservation feature
config: x86_64-randconfig-104-20241115 (https://download.01.org/0day-ci/archive/20241115/202411150724.fTjNka1w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150724.fTjNka1w-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/target/pr.c:831:8-15: WARNING: kzalloc should be used for data, instead of kmalloc/memset

vim +831 drivers/nvme/target/pr.c

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
 > 831		data = kmalloc(num_bytes, GFP_KERNEL);
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
   851			if (((void *)ctrl_eds + sizeof(*ctrl_eds)) >
   852			    ((void *)data + num_bytes))
   853				continue;
   854			/*
   855			 * Dynamic controller, set cntlid to 0xffff.
   856			 */
   857			ctrl_eds->cntlid = cpu_to_le16(NVME_CNTLID_DYNAMIC);
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
