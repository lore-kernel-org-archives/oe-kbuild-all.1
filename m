Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA7911187
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 03:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731036583; cv=none; b=U+W9MQ9J+DHMCQv+64iIPL11TJFLhshT8Cl3QIIU/P/MXU6jg9YSkO1C2+TmTSFWBRCJj7rsfz5ws+iNJAhj3eJAEckPWnW8Z05tDZQwTRZroUlbNZDDjdnENRPT3l9rugxM6EH5KsuwTpPwVV3mII5UHObCiLRUyeQ2ogCVzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731036583; c=relaxed/simple;
	bh=bMbka3p/Gpy/Gqsnq8qaDeb6MeKRGsA9QowxquJrHpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrvqWypgSys9rYWhRfChbsAitPQS77W0IniwMBZhGnJKjZ5JC6wS2mWzlAATI5gV7U4E6MObJ57DFm95BNlAwrzTCfaotD6XcWCRxK/WA9lN6ZGIHuchzvTmXGZgrc2lh5x9/5hbfwLoAjE3lVP8unEyQ6+wT7FJHmwO3JTAmjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Vxr0h+Rx; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Vxr0h+Rx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731036578; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=0vTwcqlNTxpupUm8LuR+47+qzjLW9Pak4HPOTiUsuuM=;
	b=Vxr0h+RxxGWqBQC+aYJ0CeOhBQfjMwq9WvxwtGKEPQqCvE/BZsN1byF8qH1P2MQATWr9SAGrVMiYHE7UzQbSy1itHk0E704hzR2Vn7T2CS1VSfgEEP8+97/v5wNvPfhFp5mNQ1TTJOCaUh7Z+Ox3OmZjAASixblZW8QzBqvDUEc=
Received: from 30.178.81.252(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WIxQktM_1731036575 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 08 Nov 2024 11:29:37 +0800
Message-ID: <c44c4ea6-ef4d-4152-ba21-9a76011dd75e@linux.alibaba.com>
Date: Fri, 8 Nov 2024 11:29:35 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [linux-nvme:nvme-6.13 7/7] drivers/nvme/target/pr.c:857:34:
 sparse: sparse: incorrect type in assignment (different base types)
To: kernel test robot <lkp@intel.com>, Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
 Keith Busch <kbusch@kernel.org>, Dmitry Bogdanov <d.bogdanov@yadro.com>,
 Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
References: <202411081109.soCWJfGT-lkp@intel.com>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <202411081109.soCWJfGT-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2024/11/8 11:18, kernel test robot 写道:
> tree:   git://git.infradead.org/nvme.git nvme-6.13
> head:   4c0ce9416cd06e9ef0e049f7a9226707c3786b1a
> commit: 4c0ce9416cd06e9ef0e049f7a9226707c3786b1a [7/7] nvmet: support reservation feature
> config: x86_64-randconfig-121-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081109.soCWJfGT-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081109.soCWJfGT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411081109.soCWJfGT-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> drivers/nvme/target/pr.c:857:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cntlid @@     got int @@
>     drivers/nvme/target/pr.c:857:34: sparse:     expected restricted __le16 [usertype] cntlid
>     drivers/nvme/target/pr.c:857:34: sparse:     got int
>
> vim +857 drivers/nvme/target/pr.c
>
>     802	
>     803	static void nvmet_execute_pr_report(struct nvmet_req *req)
>     804	{
>     805		u32 cdw11 = le32_to_cpu(req->cmd->common.cdw11);
>     806		u32 cdw10 = le32_to_cpu(req->cmd->common.cdw10);
>     807		u32 num_bytes = 4 * (cdw10 + 1); /* cdw10 is number of dwords */
>     808		u8 eds = cdw11 & 1; /* Extended data structure, bit 00 */
>     809		struct nvme_registered_ctrl_ext *ctrl_eds;
>     810		struct nvme_reservation_status_ext *data;
>     811		struct nvmet_pr *pr = &req->ns->pr;
>     812		struct nvmet_pr_registrant *holder;
>     813		struct nvmet_pr_registrant *reg;
>     814		u16 num_ctrls = 0;
>     815		u16 status;
>     816		u8 rtype;
>     817	
>     818		/* nvmet hostid(uuid_t) is 128 bit. */
>     819		if (!eds) {
>     820			req->error_loc = offsetof(struct nvme_common_command, cdw11);
>     821			status = NVME_SC_HOST_ID_INCONSIST | NVME_STATUS_DNR;
>     822			goto out;
>     823		}
>     824	
>     825		if (num_bytes < sizeof(struct nvme_reservation_status_ext)) {
>     826			req->error_loc = offsetof(struct nvme_common_command, cdw10);
>     827			status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
>     828			goto out;
>     829		}
>     830	
>     831		data = kmalloc(num_bytes, GFP_KERNEL);
>     832		if (!data) {
>     833			status = NVME_SC_INTERNAL;
>     834			goto out;
>     835		}
>     836		memset(data, 0, num_bytes);
>     837		data->gen = cpu_to_le32(atomic_read(&pr->generation));
>     838		data->ptpls = 0;
>     839		ctrl_eds = data->regctl_eds;
>     840	
>     841		rcu_read_lock();
>     842		holder = rcu_dereference(pr->holder);
>     843		rtype = holder ? holder->rtype : 0;
>     844		data->rtype = rtype;
>     845	
>     846		list_for_each_entry_rcu(reg, &pr->registrant_list, entry) {
>     847			num_ctrls++;
>     848			/*
>     849			 * continue to get the number of all registrans.
>     850			 */
>     851			if ((void *)(ctrl_eds + sizeof(*ctrl_eds)) >
>     852				(void *)(data + num_bytes))
>     853				continue;
>     854			/*
>     855			 * Dynamic controller, set cntlid to 0xffff.
>     856			 */
>   > 857			ctrl_eds->cntlid = NVME_CNTLID_DYNAMIC;

Hi Keith,

     I miss here should use cpu_to_le16, should I send a v20 to fix this?

Best Regards,

Guixin Liu

>     858			if (rtype == NVME_PR_WRITE_EXCLUSIVE_ALL_REGS ||
>     859			    rtype == NVME_PR_EXCLUSIVE_ACCESS_ALL_REGS)
>     860				ctrl_eds->rcsts = 1;
>     861			if (reg == holder)
>     862				ctrl_eds->rcsts = 1;
>     863			uuid_copy((uuid_t *)&ctrl_eds->hostid, &reg->hostid);
>     864			ctrl_eds->rkey = cpu_to_le64(reg->rkey);
>     865			ctrl_eds++;
>     866		}
>     867		rcu_read_unlock();
>     868	
>     869		put_unaligned_le16(num_ctrls, data->regctl);
>     870		status = nvmet_copy_to_sgl(req, 0, data, num_bytes);
>     871		kfree(data);
>     872	out:
>     873		nvmet_req_complete(req, status);
>     874	}
>     875	
>
