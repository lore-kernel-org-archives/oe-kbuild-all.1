Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8EE1E3DC8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756727176; cv=none; b=cu46tkqHn6fabihgGv0ZKka6MPbIGlA1SWQG4/ew2PRGJFbwZGIRItiZBYYbFJzhSw1r3fGKh2n0zMZiVYo1PCLNL5wjA+AbftOs4lPdzVXa1tcCxgUwkeOk9+dR4ffrq4pWIJkYAeUYzfU/Fiz+QrCzykgZulghgA+H16JkM1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756727176; c=relaxed/simple;
	bh=oa8yFhR4MOVlIbCKi2lAbxZI5mMl7NxHerF/PDAor2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=S7O/0hJqpwvfOcoOQqJhXhgpyGjqt+2fTrJnSNg+mq+LQ6EhF6K5bWbe+x793dn8ti7kMvOFtzlpLM6+SBBQJVjYnWwUWbCii/7+6D3N6D0CCYzDnDgmHrpqS0FVpEchaSJtwqO3JQvA57D6w9X8rQPIDUBG39mVlVL3eU5OxgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x6r9VhPh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x6r9VhPh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso8022905e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Sep 2025 04:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756727172; x=1757331972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CXP5PchANxZqGp3Gssb1xnZMCk6ZZsq9Lr1RRv1yS0=;
        b=x6r9VhPhEWumT6f/2Dxf8C9f5s+WcsZfXBeDEV8w2mJ1/s8o9Ux2ACO6Z2zTqIKqg/
         nnWIc6M3xz94aQzFBs/V11TfCqk4DJFxRsoFu+s/C9UI7MA3gOxfVo3Boa3hElTg3bCk
         1+FynJl2k2GKvvUUhYbYVlpjawX/US8q2fBjs5eeSrJthpnLleTRyJgtr9Ahnan1KF4T
         SafQgCeRlI4lJAOBwxXfL7GxpgeY9GwZB8B0e6YG/22lkBFbynx6dQVlW4c3o0QlUoRJ
         2UGj3/bTwXXJ+y6di9ONj93xIbhWzhCMgEk2YMH5emABJWXwybijYYt0j5WJm9eDOtiS
         G+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756727172; x=1757331972;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CXP5PchANxZqGp3Gssb1xnZMCk6ZZsq9Lr1RRv1yS0=;
        b=PxH2J2cUNSs1EFh85+07BHhyiZv5MooVRH5iYRD0bxILUikfInrSgehAQGBLza2pR9
         XYPPs6LMQr/A6CHuuzAHZ5cbdWU6Ce3zrpf0ZzE9u3dFone8RZJjFpJP1jdLnToMzd8Z
         aEE+y3lS4BxLfpalmJ4Xe02zpw2zI+6tlgBJ7SIyzDv87O0l7HQMmZIfwcxIqiPgI0yK
         AygJVEYvnQmz5w4q1lb0amyKD4rwnYvHxe1imwwAUUkuU6mj5g+vm5Pw8T45kDl9S1+o
         tH3ICTuegtIl4B52ThWPVSIhx/godHBYD4KGDAI0WrsnuFQ0sjkyIvD7sZkI3gtw2xjH
         clDA==
X-Forwarded-Encrypted: i=1; AJvYcCVZUM3U3Hibl8k5qsnQLVeYW+O/3dueMexPhc3RoTxl9WE1vCm6gqC1ETJomEDTYjHRUqT4B14ADG4GppGW@lists.linux.dev
X-Gm-Message-State: AOJu0YxdR/gjUbTznTZh7zPIHXjUimPooM1MWKWXtS4FRTTURvjOvvNp
	9d3cd8hUq98JTwI0e62EcESp113/KD5bF3nLHTFqqcE+gkrNLMWwOLrtcB/Qtv3d/Ug=
X-Gm-Gg: ASbGncvKzHBNDav0invmDvM6iEDuK5CCp7pJQwjdACuWstNuOIGZpQxqkVijQLEfbl4
	qbkfDhT3o//dE4toJUc11zrz8XsdtboXbcaoQkZQjkaOiVcpk+x0cSQNtf15+IBYIDKKp81qG+i
	0YZonLAtKK/sr4jeX5hWlZGrEL9YQjKMivH9PevhnWWjtDx6cWK//fKr+QmvOPbRPLiyxyicCWT
	QEL3CSu5Hpz97PrBbrbdKcktFTryU6HX/aFHCrAK4dxHBcdrs/aLkSDvVTIVBwv5VtVStWSzVV2
	gmMqi5FgRTrMAC+X9hgUh16dMkoMJmWNK/hnid+uhg7Fie00u1q4Vwex0VxpWUtMdmD1N39PJmt
	vsRXefk1HrpdNYKV0At8rSH6QqqEUwxzAmd0U4g==
X-Google-Smtp-Source: AGHT+IHlqFyBokSnfRsgCUq7ALQSf4KtqVA34zcf/hmeCVs/UatcVoPMPEKEgVaN9VTTEzBEDFIuLA==
X-Received: by 2002:a05:6000:24c1:b0:3c8:95b0:945e with SMTP id ffacd0b85a97d-3d1e01d4c59mr5678053f8f.43.1756727171860;
        Mon, 01 Sep 2025 04:46:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf276d643dsm15226323f8f.26.2025.09.01.04.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:46:11 -0700 (PDT)
Date: Mon, 1 Sep 2025 14:46:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Daniel Wagner <wagi@kernel.org>,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
Subject: Re: [PATCH v3 2/4] nvme-fc: reorganize ctrl ref-counting and cleanup
 code
Message-ID: <202508310442.lBWBZ5AC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-nvme-fc-sync-v3-2-d69c87e63aee@kernel.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvme-fabrics-introduce-ref-counting-for-nvmf_ctrl_options/20250829-234513
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250829-nvme-fc-sync-v3-2-d69c87e63aee%40kernel.org
patch subject: [PATCH v3 2/4] nvme-fc: reorganize ctrl ref-counting and cleanup code
config: x86_64-randconfig-161-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310442.lBWBZ5AC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508310442.lBWBZ5AC-lkp@intel.com/

New smatch warnings:
drivers/nvme/host/fc.c:1492 nvme_fc_match_disconn_ls() warn: iterator used outside loop: 'ctrl'

Old smatch warnings:
drivers/nvme/host/fc.c:3180 nvme_fc_delete_association() warn: mixing irqsave and irq

vim +/ctrl +1492 drivers/nvme/host/fc.c

14fd1e98afafc0 James Smart 2020-03-31  1465  static struct nvme_fc_ctrl *
14fd1e98afafc0 James Smart 2020-03-31  1466  nvme_fc_match_disconn_ls(struct nvme_fc_rport *rport,
14fd1e98afafc0 James Smart 2020-03-31  1467  		      struct nvmefc_ls_rcv_op *lsop)
14fd1e98afafc0 James Smart 2020-03-31  1468  {
14fd1e98afafc0 James Smart 2020-03-31  1469  	struct fcnvme_ls_disconnect_assoc_rqst *rqst =
14fd1e98afafc0 James Smart 2020-03-31  1470  					&lsop->rqstbuf->rq_dis_assoc;
14fd1e98afafc0 James Smart 2020-03-31  1471  	struct nvme_fc_ctrl *ctrl, *ret = NULL;
14fd1e98afafc0 James Smart 2020-03-31  1472  	struct nvmefc_ls_rcv_op *oldls = NULL;
14fd1e98afafc0 James Smart 2020-03-31  1473  	u64 association_id = be64_to_cpu(rqst->associd.association_id);
14fd1e98afafc0 James Smart 2020-03-31  1474  	unsigned long flags;
14fd1e98afafc0 James Smart 2020-03-31  1475  
14fd1e98afafc0 James Smart 2020-03-31  1476  	spin_lock_irqsave(&rport->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1477  
14fd1e98afafc0 James Smart 2020-03-31  1478  	list_for_each_entry(ctrl, &rport->ctrl_list, ctrl_list) {
14fd1e98afafc0 James Smart 2020-03-31  1479  		spin_lock(&ctrl->lock);
14fd1e98afafc0 James Smart 2020-03-31  1480  		if (association_id == ctrl->association_id) {
14fd1e98afafc0 James Smart 2020-03-31  1481  			oldls = ctrl->rcv_disconn;
14fd1e98afafc0 James Smart 2020-03-31  1482  			ctrl->rcv_disconn = lsop;
14fd1e98afafc0 James Smart 2020-03-31  1483  			ret = ctrl;

There should maybe be a break statement here?

14fd1e98afafc0 James Smart 2020-03-31  1484  		}
14fd1e98afafc0 James Smart 2020-03-31  1485  		spin_unlock(&ctrl->lock);
14fd1e98afafc0 James Smart 2020-03-31  1486  	}
14fd1e98afafc0 James Smart 2020-03-31  1487  
14fd1e98afafc0 James Smart 2020-03-31  1488  	spin_unlock_irqrestore(&rport->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1489  
14fd1e98afafc0 James Smart 2020-03-31  1490  	/* transmit a response for anything that was pending */
14fd1e98afafc0 James Smart 2020-03-31  1491  	if (oldls) {
14fd1e98afafc0 James Smart 2020-03-31 @1492  		dev_info(rport->lport->dev,
14fd1e98afafc0 James Smart 2020-03-31  1493  			"NVME-FC{%d}: Multiple Disconnect Association "
14fd1e98afafc0 James Smart 2020-03-31  1494  			"LS's received\n", ctrl->cnum);

ctrl->cnum is always an invalid pointer on this line.  Another
option would be to print ret->cnum instead ctrl->nmum.

14fd1e98afafc0 James Smart 2020-03-31  1495  		/* overwrite good response with bogus failure */
14fd1e98afafc0 James Smart 2020-03-31  1496  		oldls->lsrsp->rsplen = nvme_fc_format_rjt(oldls->rspbuf,
14fd1e98afafc0 James Smart 2020-03-31  1497  						sizeof(*oldls->rspbuf),
14fd1e98afafc0 James Smart 2020-03-31  1498  						rqst->w0.ls_cmd,
14fd1e98afafc0 James Smart 2020-03-31  1499  						FCNVME_RJT_RC_UNAB,
14fd1e98afafc0 James Smart 2020-03-31  1500  						FCNVME_RJT_EXP_NONE, 0);
14fd1e98afafc0 James Smart 2020-03-31  1501  		nvme_fc_xmt_ls_rsp(oldls);
14fd1e98afafc0 James Smart 2020-03-31  1502  	}
14fd1e98afafc0 James Smart 2020-03-31  1503  
14fd1e98afafc0 James Smart 2020-03-31  1504  	return ret;
14fd1e98afafc0 James Smart 2020-03-31  1505  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

