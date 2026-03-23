Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AE435BDAA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254077; cv=none; b=FOFmf0NR6rZm4Ah8jH74nteq4ZI6239z8pDDGnJa7tW8eh03l1sjmhx8zt7fXFZUIUV86WdRVtGpt77KZ6wMAwi/+60DYZtAZAR1radBqkbxLEIUMqwo7LPFIqIhcdCuSU8Bj5P9iG6TeeeuqfFP9xuV09YfSwo9hJhPcthLTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254077; c=relaxed/simple;
	bh=GM8x3oyUxbRyQWgmKCxtMi8x5dV7Q4tnuubuBpQekp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=efFkG1u2X9rkX9ZCw5JDwP639QERa3FdkvbGGYQE4IjBHebGU9KWfwzHn6ar9xatQx94YPv2LPtgBtexqEjY+e/55a8zB7NadgHiWE6ihEipM1N0CihHzCcSnkq0rah2OrI7IVNHVNcK8eTp6tbCk46jcx6yygF0sfvsaaKaAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxnnQJjn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxnnQJjn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b9b1900bso1729102f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 01:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774254073; x=1774858873; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UY+UoW+/BMSdhh0KdbnqTpPp259N8c4v9xdTx5HyxAc=;
        b=NxnnQJjn72CvpDxtDDbZinVN/Z/9VVQFqIBzHjPG77xjI8cRGVeFeqoy9fJJLvGduK
         C1Cf07UFnTMGGuNRLUkddlr9J6/ioURRqKmq0wYTVkPDenMokcp84CSj/QTxPnlnhcwT
         /sc5Rj/DoHB2xMPufoa6QkEJ0YBMlobqKUX5PuigAuIRxwEjQoqvDdVhnkmsg9mOdEi7
         VuPX8pOOoWo7u6fqKEADP0QMyKO7H1nyvLfebWbSav6N5SydGkhDW+TFUWYnDt03xL/G
         TvIXeBVZh/0yF2lb+DYWRyunyn3jO7xpBnaPHexc7ONECizElndEe+uIYw/5Od7386a1
         QJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774254073; x=1774858873;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UY+UoW+/BMSdhh0KdbnqTpPp259N8c4v9xdTx5HyxAc=;
        b=Q7eyascTah9OpUxjVwu7tTdF2EPXKip/o56UOB2VDIyu4Ob7gOrQyDV7Ss+58n6GOz
         Gt472AnkVK0SEq7wXZsQS8f32Y2oBEt5SMF6rM9RrbHdwRYi+Sdkldr1GWeYXWutYwTD
         1cC8r1hPK2UjBE6yHNgzZDs/4w5p0FkuOdoofZJ0K9yJri9iRedgAahvDvuUZeDrhZNb
         XioICAI+di0ZOoCTWLg0IFuq+u+rj4UsGLV2qNNcJMZ6Li1WhWE1JM2DWcNgNsPjOh8p
         5SyD50dmVTvyGl52etWJv9uB/oqRQDAlGv8MQUKi/HoKQrSp3OG/Y7FrhemBqK5BdE0G
         6yWA==
X-Forwarded-Encrypted: i=1; AJvYcCU49Jae9e476i3RI40bltpN/F1UQXBVH8gFlYRqOoomsvC0/kyU14Vvo9Yb1+eHavbAxDQ14Z8AoTPij4CK@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1fEhxh6wcc2ixfrus/deyiK8KgnqTZ/MIWckkRUiXrCMaslnS
	/ZxReQP3Am0SjdY+lMkTQvmGswPULBDMja4sNhiCJaQG2fSE7nVd8LDNi99p5f5yNqw=
X-Gm-Gg: ATEYQzwjwaGWHXQyYu6w6bqiIRHjtsmMPHIZvDi7ZjPZ0Jupy8InwDLoyH0qofHOpO/
	0+M4Tn5JAt5qZAYA2yWvv1t0rcS6HRlfrTeoUf8DNFfbNXPEwgWuh2pavgGj2nGodZRHXeUsN74
	Pw2o5INks7a81YNmCwk5l1tNNS54wUYU0nqYv6IP7t4/PAs3sgCbwq/E/m4lW9hOEsyzSZu7eIi
	7pztQJByPK2NLqRquj1ItLcrRc/UjYnvDWG8DQOs08bgxFOnNvXG4w4mCbj5Pa/2JQv6wXz1w3n
	sYCcmUY2mg1tGfyJqq+2sfc9L6JYgxQfkW0/gwj1v0n9PJzlcKRn/IkzI5lQfGTxt3RHvftviF4
	hNElANsscgu1xacGEklOfOqyIMNusZl/8SzKFaKf8GLr77YzKy+L3uuo3aQlpBISOLk/cY/qNmj
	05JlCPn92UkWCtuzVvCwfv6U4qCiO+
X-Received: by 2002:a05:6000:2f84:b0:43b:4273:a6ce with SMTP id ffacd0b85a97d-43b6423ebe4mr15440452f8f.3.1774254073135;
        Mon, 23 Mar 2026 01:21:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd38bsm27723091f8f.10.2026.03.23.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:21:12 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:21:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anna Schumaker <anna.schumaker@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Benjamin Coddington <bcodding@redhat.com>
Subject: net/sunrpc/sysfs.c:343 rpc_sysfs_xprt_switch_add_xprt_store() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202603230618.haJICSqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ Zero day bot is going through old warnings and resending.  It looks like
  a valid issue to me? -dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec69c9e88315c4be70c283f18c2ff130da6320b5
commit: df210d9b0951d714c1668c511ca5c8ff38cf6916 sunrpc: Add a sysfs file for adding a new xprt
config: x86_64-randconfig-161-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230618.haJICSqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603230618.haJICSqp-lkp@intel.com/

New smatch warnings:
net/sunrpc/sysfs.c:343 rpc_sysfs_xprt_switch_add_xprt_store() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +343 net/sunrpc/sysfs.c

df210d9b0951d7 Anna Schumaker 2025-02-07  315  static ssize_t rpc_sysfs_xprt_switch_add_xprt_store(struct kobject *kobj,
df210d9b0951d7 Anna Schumaker 2025-02-07  316  						    struct kobj_attribute *attr,
df210d9b0951d7 Anna Schumaker 2025-02-07  317  						    const char *buf, size_t count)
df210d9b0951d7 Anna Schumaker 2025-02-07  318  {
df210d9b0951d7 Anna Schumaker 2025-02-07  319  	struct rpc_xprt_switch *xprt_switch =
df210d9b0951d7 Anna Schumaker 2025-02-07  320  		rpc_sysfs_xprt_switch_kobj_get_xprt(kobj);
df210d9b0951d7 Anna Schumaker 2025-02-07  321  	struct xprt_create xprt_create_args;
df210d9b0951d7 Anna Schumaker 2025-02-07  322  	struct rpc_xprt *xprt, *new;
df210d9b0951d7 Anna Schumaker 2025-02-07  323  
df210d9b0951d7 Anna Schumaker 2025-02-07  324  	if (!xprt_switch)
df210d9b0951d7 Anna Schumaker 2025-02-07  325  		return 0;
df210d9b0951d7 Anna Schumaker 2025-02-07  326  
df210d9b0951d7 Anna Schumaker 2025-02-07  327  	xprt = rpc_xprt_switch_get_main_xprt(xprt_switch);
df210d9b0951d7 Anna Schumaker 2025-02-07  328  	if (!xprt)
df210d9b0951d7 Anna Schumaker 2025-02-07  329  		goto out;

Shouldn't we set "count = -EINVAL;" or something here?

df210d9b0951d7 Anna Schumaker 2025-02-07  330  
df210d9b0951d7 Anna Schumaker 2025-02-07  331  	xprt_create_args.ident = xprt->xprt_class->ident;
df210d9b0951d7 Anna Schumaker 2025-02-07  332  	xprt_create_args.net = xprt->xprt_net;
df210d9b0951d7 Anna Schumaker 2025-02-07  333  	xprt_create_args.dstaddr = (struct sockaddr *)&xprt->addr;
df210d9b0951d7 Anna Schumaker 2025-02-07  334  	xprt_create_args.addrlen = xprt->addrlen;
df210d9b0951d7 Anna Schumaker 2025-02-07  335  	xprt_create_args.servername = xprt->servername;
df210d9b0951d7 Anna Schumaker 2025-02-07  336  	xprt_create_args.bc_xprt = xprt->bc_xprt;
df210d9b0951d7 Anna Schumaker 2025-02-07  337  	xprt_create_args.xprtsec = xprt->xprtsec;
df210d9b0951d7 Anna Schumaker 2025-02-07  338  	xprt_create_args.connect_timeout = xprt->connect_timeout;
df210d9b0951d7 Anna Schumaker 2025-02-07  339  	xprt_create_args.reconnect_timeout = xprt->max_reconnect_timeout;
df210d9b0951d7 Anna Schumaker 2025-02-07  340  
df210d9b0951d7 Anna Schumaker 2025-02-07  341  	new = xprt_create_transport(&xprt_create_args);
df210d9b0951d7 Anna Schumaker 2025-02-07  342  	if (IS_ERR_OR_NULL(new)) {

This should just be if (IS_ERR(new)) { since xprt_create_transport()
can't return NULL.  Returning count = 0 indicates EOF which would
be strange.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

df210d9b0951d7 Anna Schumaker 2025-02-07 @343  		count = PTR_ERR(new);
df210d9b0951d7 Anna Schumaker 2025-02-07  344  		goto out_put_xprt;
df210d9b0951d7 Anna Schumaker 2025-02-07  345  	}
df210d9b0951d7 Anna Schumaker 2025-02-07  346  
df210d9b0951d7 Anna Schumaker 2025-02-07  347  	rpc_xprt_switch_add_xprt(xprt_switch, new);
df210d9b0951d7 Anna Schumaker 2025-02-07  348  	xprt_put(new);
df210d9b0951d7 Anna Schumaker 2025-02-07  349  
df210d9b0951d7 Anna Schumaker 2025-02-07  350  out_put_xprt:
df210d9b0951d7 Anna Schumaker 2025-02-07  351  	xprt_put(xprt);
df210d9b0951d7 Anna Schumaker 2025-02-07  352  out:
df210d9b0951d7 Anna Schumaker 2025-02-07  353  	xprt_switch_put(xprt_switch);
df210d9b0951d7 Anna Schumaker 2025-02-07  354  	return count;
df210d9b0951d7 Anna Schumaker 2025-02-07  355  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

