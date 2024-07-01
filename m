Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE1616D304
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jul 2024 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848692; cv=none; b=hnyWChb75sX4mlYK7bybXOwYnUq85/QN6i5hOFJpAQF9qoyKMz57VBhq+k63Hc84zfXgGwiAWhjiU/g53YSUr9Y2L6iGHLu7fv53N904gDsDpLlPkQjLvfaDZOUWb8Nf5wF9u3qKI4DGDlLSDpTXa3wkh+qh3PHFWsrQ6ceUbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848692; c=relaxed/simple;
	bh=VmhP/DqI3/DC+RCFnRY97vWoIPaKXNyGiWJICSA6kak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gd0nTQoqKURBDIbYF9INpIiKwuhE1FoJNwYIIuqGlr2vD1LR7s0Ojy0BXDNSPxmuZs+mHvCkWBLzwIFL40bObTniRj9IJWSz+dJqHW3Rw2tMSl0E/k1/F5szJa/Q0egNysPzmRQ+f0QPOAvvjkunTknxCC7axJSIXtb+GbzJyuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RVXQjbqI; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVXQjbqI"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so4692078e87.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Jul 2024 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719848689; x=1720453489; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mfut94CXDwmtEg0KE4qH64hQMu242J0CBA5kPfzN1CE=;
        b=RVXQjbqIfVBTXmrojbmng2YFKWebx7m5hfA7WUmVd+sR3yRJeywiNBBGv1q0/FoW94
         CJZwz/DzhU68xgYt3PGAnBtngR9XbKUc1SfMotODi0KmCZDItzz9g2FqZEHkYADn5ccP
         SM8kYi3NPfRXvD76dW8s7px8mKallaj6CDRQP6WLhWx2EQiGRiO4UyrAqaik/uMHjNpt
         PRGEvwq4wmoAORIw25GPNlm+t2Thcg4tLRfhtsX+q+C+JBOqaQPo9fm3WSLBZeGrE29O
         Vu6oF0uRpFlu/7nbDGcVx/32/2+WKs6jkC4zx/BaTWHTh6uVrTSDR44/0f3BG9PAesF7
         UD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848689; x=1720453489;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfut94CXDwmtEg0KE4qH64hQMu242J0CBA5kPfzN1CE=;
        b=ClEjfzf65VMA18EnCbOldGUgSphy1+SA7MLjT2vwCppWToBFJ5CdVo7WTP7gkBUA3g
         Wyap12cvJFfLuUBv5/uIFEWVBr5kUC4Znw7XeJqt/5feIqVBN7Akr47779HGbseGNyqk
         Mmb8YwC6CD1mb5dh0VpkfBIszml3ZUbjSOW0amqf18SpCzY8Z4RCFErgX2PAjV7Z81tj
         y+wZ1qUWCe03/p08r8yUJEv+rGTNou+an1xf/cDCRrwzE2OYgEwbQlWxNdt3d2tNrd/z
         3IYpVzvnfAylo7lqWK0FsjWQIIikOMceHU0unZNhfCdIiFGTKiitpxVfX+d8oMBp9Lip
         BayA==
X-Forwarded-Encrypted: i=1; AJvYcCWTFLlurQT9CjrMljZkaqzMiRSssvl+3VIGaLvxyvWBBOk+PAGvxppe1JnqGYRKnLOEsk1wJhUiOsM8iriBxZ8tR18H7oPGUm5BMd5BJQ==
X-Gm-Message-State: AOJu0YxOs2wS1wSG+RWqw3wLgcZlfsXW5affxbHV3rdkostCbdPHjg7I
	hwdKxfpDh9gIlmj/omOOSsDHb98HFpLvtMe9UY4aP+kw2ezAGkjv/nryQYB0OU4=
X-Google-Smtp-Source: AGHT+IGWCt/0JLV1k6alOnu00qU3v0Jv/qG1wNcZIWrTOsvizj5b7E6638LK4hM12opmwTLbJng0dw==
X-Received: by 2002:a05:6512:3f0b:b0:52c:de8f:2e6c with SMTP id 2adb3069b0e04-52e82727fc5mr3923687e87.57.1719848686523;
        Mon, 01 Jul 2024 08:44:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab27bdbsm1453262e87.171.2024.07.01.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:44:45 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:44:42 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 30/35] io_uring/zcrx.c:812
 io_zcrx_recv_skb() warn: check likely/unlikely parentheses
Message-ID: <75318c18-bf2a-427d-b9bb-aa54fa3e0a3c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: 217b71934ad9ee4fffd5eb975aae285911a16052 [30/35] io_uring/zcrx: prevent endless unresponsive execution
config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261243.sPJ6xyvQ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406261243.sPJ6xyvQ-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:812 io_zcrx_recv_skb() warn: check likely/unlikely parentheses

vim +812 io_uring/zcrx.c

f9ab1c1cb8fd3a David Wei      2024-03-05  800  static int
f9ab1c1cb8fd3a David Wei      2024-03-05  801  io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
f9ab1c1cb8fd3a David Wei      2024-03-05  802  		 unsigned int offset, size_t len)
f9ab1c1cb8fd3a David Wei      2024-03-05  803  {
f9ab1c1cb8fd3a David Wei      2024-03-05  804  	struct io_zcrx_args *args = desc->arg.data;
f9ab1c1cb8fd3a David Wei      2024-03-05  805  	struct io_zcrx_ifq *ifq = args->ifq;
f9ab1c1cb8fd3a David Wei      2024-03-05  806  	struct io_kiocb *req = args->req;
f9ab1c1cb8fd3a David Wei      2024-03-05  807  	struct sk_buff *frag_iter;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  808  	unsigned start, start_off = offset;
f9ab1c1cb8fd3a David Wei      2024-03-05  809  	int i, copy, end, off;
f9ab1c1cb8fd3a David Wei      2024-03-05  810  	int ret = 0;
f9ab1c1cb8fd3a David Wei      2024-03-05  811  
217b71934ad9ee Pavel Begunkov 2024-04-17 @812  	if (unlikely(args->nr_skbs++) > IO_SKBS_PER_CALL_LIMIT)
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^
unlikely() returns true/false.  Surprised checkpatch doesn't catch this.

217b71934ad9ee Pavel Begunkov 2024-04-17  813  		return -EAGAIN;
217b71934ad9ee Pavel Begunkov 2024-04-17  814  
4eb3e10e62f790 Pavel Begunkov 2024-03-05  815  	if (unlikely(offset < skb_headlen(skb))) {
4eb3e10e62f790 Pavel Begunkov 2024-03-05  816  		ssize_t copied;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

