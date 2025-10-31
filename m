Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CBC2E4241
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 06:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761890794; cv=none; b=msVY+XRo/QaNb3/Cjmrtj8yHYYQb9fuXf0IXQP7lD5bHFgNYKPdkpksofzPVDmisNK5cJkKeAmSVFwYXmHqtuuAer7T/y+OTWex7DO/vHBy7US2nowPnnpgWIrXrGqelmvYC6fZWZOjhGgyertT+6i7DiOHJwLhK1RoDbW+Qzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761890794; c=relaxed/simple;
	bh=iUclcA8pqtFvelEx7dGTK/HeuthDZsLzc4T+Q29waF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIevi6OIu9TLLLwvnkp3H4ptHDbayQ+fA6ZVbQro6kVyJN/Ama90pwZQq/Mr51z6+ECNkBJplWwAHJQ0yybTtbCY9s2bZBnpf/HxBQHCXu2z1a8hTq6TYmoRf5MhieVyFgqRzEc7LzYWea0hTT6Zb/yVj1VOWnrLad0RVEUCwNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ScnhaF6s; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ScnhaF6s"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso9414385e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 23:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761890790; x=1762495590; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S31zW4tLYO2rvlue+0td7fEDl19l3Xhvs1w1BlBnWxw=;
        b=ScnhaF6ssM+k+VmDI6PhvR5lVRundUzH9eJ3OskHuTfjL8/WrBeKFGDXgYp1jssjgg
         WcTpwlVl0Ipp/uET+k08qMCdO+lMG2fxxfmZR1z68EQ4ihnz+9EiPYrkLocJUNmwoD9o
         iKYh9YOEmW5z60z42T6xgJ3XZgZgA1Q2w+IDVyWwtegXwS1aNPh/K22VGTghkaAchA8a
         yBqFUM5tVyzhAtVLckqlX9RJ4T7UodFVcvdQ1euKj7OaFhTdILSU3jzrLE3Jp/5ubf9a
         wY65dR3l7i2Vwp/PjxqtSc1cn2+VjhqPMQDXe11iA3CoNyUwLHUwXyg2uhZ5tjO4ULmR
         QWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761890790; x=1762495590;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S31zW4tLYO2rvlue+0td7fEDl19l3Xhvs1w1BlBnWxw=;
        b=K1T6M64otD5xfXUDzZ7aSGUdVwktsmudEU+i3xbqgUiu/N+iDQGRhfL29pNr6UIXz8
         mVegmpFDlWuvDX/QlqIrWVXIuoRku5DeQlqN9+aWiF1nFoHZ8+xHTWXtPD6c88r3r9wW
         Ixqn7QDs7pLB/ENBHxMbbbBmwla4kU32IhVz4S2Qw5xkfM30VMHjZ4d7ChHZKgQV9r7z
         F2rCzIWNOCjNUJg9+SXCSJ+mZyhilqkCF2rk1BQjWAmA0vacCHhB/P3pHrgLWOc8UqkF
         Fyr3jMnDswKZXfz8UhMHCjpRi4v+FreSzk93AZTa6vRcWsAFJKEqkmW//fBAmR6Lh+EM
         WHMg==
X-Forwarded-Encrypted: i=1; AJvYcCU8lxtcifWxY2doeKXaSlkOZGdCdXXEdPw5KgtmTf4KYBm7XOQz/vvxwg/diM5lqklS0U36ymTVAYxplafJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwLflYZIoC0Vee0giLXlVjh2ASk8V7r8vA83EvpH1SLr9gtNu6v
	cFt7dLJzk/0X5iDyTlYoOnHkk3Fwax2qgW/0n31R0MWKuPGB9vRS6xUxIQgk97g/5j0=
X-Gm-Gg: ASbGncs4DR+M0aVFOKo7UshwYBEpa+VhX2fm9oqWDg4W4aKzrdiTuUbQD9RaLM/oz62
	QUw+UIBDoQe9Y6FWqM9hR/ulq1ZBwpve5NLMwvaQb6TpLnYHlMqAntK3JTsiQrZs39NQVzUKa4O
	Ln+7i0mV81LzwInzaDrJxsBjI5HAlfUlGOKIW7ZXMccqU4l81bUjaVaFzplr3AJY4+k/epcXEum
	QTmqExKaF8h9aM9gbCRi2HqP0v8qn5R5rWG7sSQ51y7rVA+Z0GYQphm583GVyg6UpL+UuykQNLD
	Mb97+oHy5fbBbcPQj93s8nN7luZB5hn6d2UVB0ICOBdq8hYOlk1qNqEGHeGIvTBk37SW91FiOfH
	7PhKqUdYqzngyUCLjPwRquOrpGna+RpPobAXu2cjdJmKR912v19yQ1+WjiT0ARKYRcl/DiIqxCW
	jilMVAWQ==
X-Google-Smtp-Source: AGHT+IF7Pmn8/I1Uu0Ungi0yHkUbrEk6eWlkArnT6XIaKo7yTUkZRs1jtmhZ2JGungayyN3ZORNr7g==
X-Received: by 2002:a05:600c:3146:b0:477:fcb:225f with SMTP id 5b1f17b1804b1-477308912bbmr19027505e9.31.1761890789635;
        Thu, 30 Oct 2025 23:06:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47732ddd0a3sm14626895e9.5.2025.10.30.23.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 23:06:29 -0700 (PDT)
Date: Fri, 31 Oct 2025 09:06:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Avri Altman <avri.altman@sandisk.com>
Subject: [bvanassche:ufs-lrbp-as-priv-data 27/28]
 drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn:
 inconsistent returns '&hba->clk_scaling_lock'.
Message-ID: <202510311328.Is1wMfkq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux ufs-lrbp-as-priv-data
head:   f5ce986a0b77ce2944bf8314554d60eec17968e8
commit: 226979e4eb8a5844be9fb6047a1d042bf2cd72ab [27/28] ufs: core: Move code out of ufshcd_wait_for_dev_cmd()
config: x86_64-randconfig-r071-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311328.Is1wMfkq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510311328.Is1wMfkq-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn: inconsistent returns '&hba->clk_scaling_lock'.
drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn: inconsistent returns '&hba->dev_cmd.lock'.

vim +7594 drivers/ufs/core/ufshcd.c

6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7528  int ufshcd_advanced_rpmb_req_handler(struct ufs_hba *hba, struct utp_upiu_req *req_upiu,
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7529  			 struct utp_upiu_req *rsp_upiu, struct ufs_ehs *req_ehs,
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7530  			 struct ufs_ehs *rsp_ehs, int sg_cnt, struct scatterlist *sg_list,
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7531  			 enum dma_data_direction dir)
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7532  {
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7533  	const u32 tag = hba->reserved_slot;
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7534  	struct scsi_cmnd *cmd = ufshcd_tag_to_cmd(hba, tag);
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7535  	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7536  	int err = 0;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7537  	int result;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7538  	u8 upiu_flags;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7539  	u8 *ehs_data;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7540  	u16 ehs_len;
996a24b99d63df drivers/ufs/core/ufshcd.c Avri Altman     2024-03-09  7541  	int ehs = (hba->capabilities & MASK_EHSLUTRD_SUPPORTED) ? 2 : 0;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7542  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7543  	/* Protects use of hba->reserved_slot. */
ddfd7f051f4e14 drivers/ufs/core/ufshcd.c Avri Altman     2024-03-09  7544  	ufshcd_dev_man_lock(hba);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7545  
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7546  	ufshcd_setup_dev_cmd(hba, cmd, DEV_CMD_TYPE_RPMB, UFS_UPIU_RPMB_WLUN,
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7547  			     tag);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7548  
a33a502d50fddc drivers/ufs/core/ufshcd.c Avri Altman     2024-04-10  7549  	ufshcd_prepare_req_desc_hdr(hba, lrbp, &upiu_flags, DMA_NONE, ehs);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7550  
9f6fec65661381 drivers/ufs/core/ufshcd.c Bean Huo        2023-08-09  7551  	/* update the task tag */
617bfaa8dd50d6 drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  7552  	req_upiu->header.task_tag = tag;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7553  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7554  	/* copy the UPIU(contains CDB) request as it is */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7555  	memcpy(lrbp->ucd_req_ptr, req_upiu, sizeof(*lrbp->ucd_req_ptr));
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7556  	/* Copy EHS, starting with byte32, immediately after the CDB package */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7557  	memcpy(lrbp->ucd_req_ptr + 1, req_ehs, sizeof(*req_ehs));
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7558  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7559  	if (dir != DMA_NONE && sg_list)
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7560  		ufshcd_sgl_to_prdt(hba, lrbp, sg_cnt, sg_list);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7561  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7562  	memset(lrbp->ucd_rsp_ptr, 0, sizeof(struct utp_upiu_rsp));
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7563  
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7564  	err = ufshcd_issue_dev_cmd(hba, cmd, tag, ADVANCED_RPMB_REQ_TIMEOUT);
226979e4eb8a58 drivers/ufs/core/ufshcd.c Bart Van Assche 2025-09-09  7565  	if (err)
226979e4eb8a58 drivers/ufs/core/ufshcd.c Bart Van Assche 2025-09-09  7566  		return err;

ufshcd_dev_man_unlock(hba) before returning.

6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7567  
226979e4eb8a58 drivers/ufs/core/ufshcd.c Bart Van Assche 2025-09-09  7568  	err = ufshcd_dev_cmd_completion(hba, lrbp);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7569  	if (!err) {
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7570  		/* Just copy the upiu response as it is */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7571  		memcpy(rsp_upiu, lrbp->ucd_rsp_ptr, sizeof(*rsp_upiu));
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7572  		/* Get the response UPIU result */
617bfaa8dd50d6 drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  7573  		result = (lrbp->ucd_rsp_ptr->header.response << 8) |
617bfaa8dd50d6 drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  7574  			lrbp->ucd_rsp_ptr->header.status;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7575  
617bfaa8dd50d6 drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  7576  		ehs_len = lrbp->ucd_rsp_ptr->header.ehs_length;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7577  		/*
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7578  		 * Since the bLength in EHS indicates the total size of the EHS Header and EHS Data
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7579  		 * in 32 Byte units, the value of the bLength Request/Response for Advanced RPMB
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7580  		 * Message is 02h
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7581  		 */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7582  		if (ehs_len == 2 && rsp_ehs) {
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7583  			/*
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7584  			 * ucd_rsp_ptr points to a buffer with a length of 512 bytes
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7585  			 * (ALIGNED_UPIU_SIZE = 512), and the EHS data just starts from byte32
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7586  			 */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7587  			ehs_data = (u8 *)lrbp->ucd_rsp_ptr + EHS_OFFSET_IN_RESPONSE;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7588  			memcpy(rsp_ehs, ehs_data, ehs_len * 32);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7589  		}
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7590  	}
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7591  
ddfd7f051f4e14 drivers/ufs/core/ufshcd.c Avri Altman     2024-03-09  7592  	ufshcd_dev_man_unlock(hba);
ddfd7f051f4e14 drivers/ufs/core/ufshcd.c Avri Altman     2024-03-09  7593  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01 @7594  	return err ? : result;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7595  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

