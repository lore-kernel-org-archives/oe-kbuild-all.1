Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7F938E5E7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806396; cv=none; b=IlpiWRNEa+epAlNEof7JiiKkFbQ9gkAIocx+MN4HH5/tYhe58e7zExfCIm99t2hSmQGyqUpIfoj2dfx6aZiDS8gmE3IbYrhcn6MzOJiDY2hOkAO1Tx1hOsAL4+6z6epvUv9vrLRgKPhDnJ/E+eQ/TJ4nIxN2XSSerlAQt8cMIP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806396; c=relaxed/simple;
	bh=YU0nCZB5g0/WFCrlPQAuqSrwJGmSQYF2jN6VbohiKP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8WtF/BT/h/L71cRx2QmN3N345HSIFNLv7+FYj+eqSTh7EEfkf4GjyPzwIaPG0jGbXqAmEi6Cj/+m07A7eOXuib1SpW5gQPYxY6TrUVy5iD5zCNtx/204ybV8d9lwwyrECqIBVWOs5CRi41NdVUoLjcuLNb2JW9/kc4xcbaquHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kEBWti04; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kEBWti04"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8ca01dc7d40so945201985a.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Mar 2026 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772806394; x=1773411194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbnMy2ZvQKv7XexDfnSiXXigerbMB6pNDzD5OW8JzmI=;
        b=kEBWti04xnPssKEenseXMGvaX3oLUML4LCFvyJF7VfulW/0BFGScC1OWAbxrt7KpQD
         g1/kd1m7fjLvpncz2uMzoRl76beKD+RL535agPXbYonSfIkjYzZkq+NvVtXMpnjtwirQ
         NJVxHuOXS3SvE+Xd3yYpxjMUrrsNjlYDYROlU+ssr1Up3zAMnz+FK0ZwUH0lnUUGDpDd
         gpHJIuY+soAbC8MmNdOLv2nvZqZWa5tPUIKtB2mFtOPk758koBNASg7gS8EI7bUaNr1X
         D0SaeJd8HfjLkd2GVit8fzw0S4ktn745Uo/alsjr7UbyBhvTh7bkDUHuR5ZWQ8soDkmG
         vAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806394; x=1773411194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbnMy2ZvQKv7XexDfnSiXXigerbMB6pNDzD5OW8JzmI=;
        b=ld112/qfYr7Pd589DuRdCb0K+jBN9viRmsuIkQ2+tEWZOL/O/0452z8fLdHSIz2qwQ
         +RbL+BNxGO5yBcA2TobFCEd4Zc8Zae4zbXY4FCs/Liq5gmxQtMdNahdEITdLVyf1UO8I
         ftFxCPYDVqhxie6PzjzWUOowCniAJLdMymnc7XzFEFPJR6zCQSjYq0+0qM8gLqtLbyRy
         LB5Rk2Q1bOopJXNDrgmpQExUEt3U3wwJlq/wuY1SpfDZNVtS4v3IdkEQgU92xRvQW0bH
         9J3iBQ8YpM/gJNFdmEmOjM5WdRhx4TvFUWE4/gsJRkV0bRRagOe0AgK/QcEsaOwLzP7K
         B4yA==
X-Forwarded-Encrypted: i=1; AJvYcCUSjJmKo18Chq3P6zS7xmvbFvdPH3RGDKQN3nD809OIwJyksRgvw82hZ2hSL2CRM0NdROj7SETpxhYRw+P/@lists.linux.dev
X-Gm-Message-State: AOJu0YwtrrKJEfFQ9MAP4DaiQornxiZwOGgo8UQUag046Em3V3l3NAH6
	QAiUEr+edJusAHWRFVT1R+sOuBT1IZ/cnqhXfDpsJJ3f2HhdSE2KzRAszGbAB4lrgR0=
X-Gm-Gg: ATEYQzwZZ9Q85CjrhG2Mzym4XUpXUzYFTx21HgqnQmww4aVQ19ClzD+n83pqgNSaoQa
	sOtvk1O5Qr/pFDjmuDgvK1HNzOH3nLRqiGOOAaa3Xd3jx47wUsSBPAtwKKUsJaPPRuN4yCie7TK
	k6a5VYqGJpq0A9ZfN87IMDQUlxWMfQ+u6r0uk1vLfl7u1UbUjPF3vwENVTwdCe24MK+3IGpOWyu
	cXppdXATSn/uBQDEFOUCQx9Rm8r1vwLuoH0PedJq0drBhiGv1WoVWvdB69s3Nd4TfX6AcpyH87V
	LGRCUzasLECx0UteDiyybZYKD9430k/qnQYPvuh6jrrX/ziN4LL1c3OPHaj/g/TAv2C4eS2ihDW
	U1bwp/i3PEOrEzB2hTisP8AwgDPKdTj1gYFGyTia6Mu1pGz7tqsTxWc70fx2qvEokPsM6j8I3zA
	H9MbxDzbkfbNkd4fgdcaC4NqqcrBhZlQEUUWs8baTIDsSBYCYbpRzuBHNhbVJ8GMIL2Np+MP44V
	Oqcaaom2HKjMXRGQ/E=
X-Received: by 2002:a05:620a:470b:b0:8a1:b5ab:bbd6 with SMTP id af79cd13be357-8cd6d4fb49fmr279334085a.71.1772806393751;
        Fri, 06 Mar 2026 06:13:13 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f53bd51sm136666685a.27.2026.03.06.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:13:13 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vyVvT-0000000Cx0p-4162;
	Fri, 06 Mar 2026 10:13:11 -0400
Date: Fri, 6 Mar 2026 10:13:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: kernel test robot <lkp@intel.com>
Cc: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
	oe-kbuild-all@lists.linux.dev, Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg+lists@ziepe.ca>, linux-rdma@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>
Subject: Re: [rdma:wip/jgg-for-next 18/19]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:3478:37: warning: variable 'cctx'
 set but not used
Message-ID: <20260306141311.GE1687929@ziepe.ca>
References: <202603060549.g4df8HXz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603060549.g4df8HXz-lkp@intel.com>

On Fri, Mar 06, 2026 at 05:52:07AM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/jgg-for-next
> head:   7f022cadde7e1fa6e5f7abac05e01bdcff5e19a3
> commit: 387f31e96d46cd6ba0cf6b2439c367440f60255f [18/19] RDMA/bnxt_re: Separate kernel and user CQ creation paths
> config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260306/202603060549.g4df8HXz-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060549.g4df8HXz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603060549.g4df8HXz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/infiniband/hw/bnxt_re/ib_verbs.c: In function 'bnxt_re_create_cq':
> >> drivers/infiniband/hw/bnxt_re/ib_verbs.c:3478:37: warning: variable 'cctx' set but not used [-Wunused-but-set-variable]
>     3478 |         struct bnxt_qplib_chip_ctx *cctx;
>          |                                     ^~~~

I fixed it

Jason
