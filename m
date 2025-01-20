Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380BE18E76F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 07:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357984; cv=none; b=Fazy+JgWWRmHAR69koLXdEUQGUVw9m3vzhcT4knaJlsmlPcw6oauhmxFe051Wx1GUCcbxB3TeX6d/L7y2UploO/LbuGa3B/rxgalYmomQtjDV8jU64o2WikR8Ie4nvTHp59jAdI2pxkjmFdZY6MiKuOfpAt6o3Mh3+87Wj16pCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357984; c=relaxed/simple;
	bh=NxrX+d+0FJm7uBeq9Nx21TS64oGqyY66R0wlt6V+wKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZuaDTzdt+HzZtJADDG3IkSKZ7MrPOMlxa8SIJ0A99hfRM8E9PVCAkjgzVOz8976ycypTQYMn5NBjlHlUxndg5AAl+ufajLNzeTAVVnjiYiHmQ1KuxEi3bNw2AB5/fXfZRfxJSuhFxVEjmWSa0ZgYx8AWuouijtJ9doRmoz144L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBNC5l53; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBNC5l53"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so40876405e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 23:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737357980; x=1737962780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NHSYRaPcEvsDMUedKc48IMCuOjSeAPTyPR3Rlj7XW8=;
        b=IBNC5l535xIzEWfOt2xie/XXbt40Tna0MJ5rGWlmGY3uv8Q0OBAcJWNe5ZIZBIQe6L
         +fbvbKLn13yxfZBekZDfhNFMAP9LJrerjR0qzZOZkKudi7jcFKbfV0//gnbVlV5PeM8L
         EzjmEc9gFWiR7BhSyjMYa3MLC6AYwF6Xi2mB928Ls+IMjXLGv6Ge0zI7TALm8PM6Y0TC
         slCQ0BhT9dVIWJevbrcYzNW4ZmgUmhG68e3Putv29IZT13PQvcifcLJWFiRk7QRVugFP
         4C0X14H8DLQeXS+ZcAorWaSjLX/jr9kpGWabgMhE+94zaubv03V0SImFXtMODA/BVcsg
         +7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737357980; x=1737962780;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NHSYRaPcEvsDMUedKc48IMCuOjSeAPTyPR3Rlj7XW8=;
        b=VMBFuoUVtpnaBdsBOQvwPAWTIbipM7uzHX00aQIJvkza7O7MEEUMjtfomtKYtvmckT
         BIhOVwcoYtfMU8FOz60AjB/QviYZmJH09r10hDqudK/erKCcD8x14bDZv3UUzXyXg6MY
         +w+S0p/73YGWieM/CRMoT0FiWKZR+oYY4mUqwj7leb+dbAgHQjtB4c0PoBgN/ysp1J7f
         dn0z3PqjotJk1pHkLTVoOQkDBLI+5ljl0ZyskoAp3sWTazb8e0lbErbwsZdPgY9UCHlE
         lMB4HA8QW5QEqi/9Q5vDwc9Pwhu61A50NwsO3CUPEkiTSfDcbnGqF8zt0R2ecLvfQkUV
         crmA==
X-Forwarded-Encrypted: i=1; AJvYcCWryaopxn8hjg3KCOaHbQ6/pMiiUkA2b/9X4cnP6Q50nPXt4v0c2wUCdFrhA0MZfOBCoPgXDX1Va0uKcXhm@lists.linux.dev
X-Gm-Message-State: AOJu0Yy91PtA4E6xB2tq6gp+drUpMqipOIgzNGa4Lk2RXSs4tv92qwG3
	HePoHPfnhwDnRQyzkBNMa+zEHTXVnKIa1OiiJ8YjhJ8PSyuDWJBwh1/U0kF75s8GNCL3wTsHE2M
	I
X-Gm-Gg: ASbGncvsX+KSPno9YmkGwBnjEka84JzA4Sg6co/iHuIz9z7agbkrU6hNYdO+aAAsYL5
	xykeGpLk0NlAsNZ+3q2VSfWCHavTwKHFa2+glpQHuuUSjqh4KSuZ6vgHXlCrmf4XNlq2xADU5z2
	0hQNG/6YD5IoOFEjQ0xIGzdGDAPq9rn8AEyTPo/ftnfrEJD6cNt/k+7SBQCTwXOLplG199T4Hkx
	99UDS4eCBT89j5ubKrj+PQg6dcszWp/5bEKFtkPM/OxSxIx/QtxuDAXvT6jTNbDkF6LBkMo98U=
X-Google-Smtp-Source: AGHT+IFOQ4n65F/+nmAYHyUgPJBiA7g98gePoOtSSWjEuNIrNEx2PNFqoffpLVNeYjrRxM2H4+qstg==
X-Received: by 2002:a05:6000:1a8b:b0:385:e9ba:acda with SMTP id ffacd0b85a97d-38bf56781a4mr10706340f8f.2.1737357980411;
        Sun, 19 Jan 2025 23:26:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278088sm9521175f8f.73.2025.01.19.23.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 23:26:20 -0800 (PST)
Date: Mon, 20 Jan 2025 10:26:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anna Schumaker <anna@kernel.org>,
	linux-nfs@vger.kernel.org, trond.myklebust@hammerspace.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, anna@kernel.org
Subject: Re: [PATCH 3/3] sunrpc: Add a sysfs file for adding a new xprt
Message-ID: <8d0e2cd9-e47e-48f5-ae73-0e19d08ae807@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108213632.260498-4-anna@kernel.org>

Hi Anna,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Schumaker/NFS-Add-implid-to-sysfs/20250109-053732
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20250108213632.260498-4-anna%40kernel.org
patch subject: [PATCH 3/3] sunrpc: Add a sysfs file for adding a new xprt
config: x86_64-randconfig-r073-20250119 (https://download.01.org/0day-ci/archive/20250120/202501200000.40Rg2rc6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501200000.40Rg2rc6-lkp@intel.com/

New smatch warnings:
net/sunrpc/sysfs.c:288 rpc_sysfs_xprt_switch_add_xprt_store() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +288 net/sunrpc/sysfs.c

2b155d9a088aee Anna Schumaker 2025-01-08  260  static ssize_t rpc_sysfs_xprt_switch_add_xprt_store(struct kobject *kobj,
2b155d9a088aee Anna Schumaker 2025-01-08  261  						    struct kobj_attribute *attr,
2b155d9a088aee Anna Schumaker 2025-01-08  262  						    const char *buf, size_t count)
2b155d9a088aee Anna Schumaker 2025-01-08  263  {
2b155d9a088aee Anna Schumaker 2025-01-08  264  	struct rpc_xprt_switch *xprt_switch =
2b155d9a088aee Anna Schumaker 2025-01-08  265  		rpc_sysfs_xprt_switch_kobj_get_xprt(kobj);
2b155d9a088aee Anna Schumaker 2025-01-08  266  	struct xprt_create xprt_create_args;
2b155d9a088aee Anna Schumaker 2025-01-08  267  	struct rpc_xprt *xprt, *new;
2b155d9a088aee Anna Schumaker 2025-01-08  268  
2b155d9a088aee Anna Schumaker 2025-01-08  269  	if (!xprt_switch)
2b155d9a088aee Anna Schumaker 2025-01-08  270  		return 0;
2b155d9a088aee Anna Schumaker 2025-01-08  271  
2b155d9a088aee Anna Schumaker 2025-01-08  272  	xprt = rpc_xprt_switch_get_main_xprt(xprt_switch);
2b155d9a088aee Anna Schumaker 2025-01-08  273  	if (!xprt)
2b155d9a088aee Anna Schumaker 2025-01-08  274  		goto out;
2b155d9a088aee Anna Schumaker 2025-01-08  275  
2b155d9a088aee Anna Schumaker 2025-01-08  276  	xprt_create_args.ident = xprt->xprt_class->ident;
2b155d9a088aee Anna Schumaker 2025-01-08  277  	xprt_create_args.net = xprt->xprt_net;
2b155d9a088aee Anna Schumaker 2025-01-08  278  	xprt_create_args.dstaddr = (struct sockaddr *)&xprt->addr;
2b155d9a088aee Anna Schumaker 2025-01-08  279  	xprt_create_args.addrlen = xprt->addrlen;
2b155d9a088aee Anna Schumaker 2025-01-08  280  	xprt_create_args.servername = xprt->servername;
2b155d9a088aee Anna Schumaker 2025-01-08  281  	xprt_create_args.bc_xprt = xprt->bc_xprt;
2b155d9a088aee Anna Schumaker 2025-01-08  282  	xprt_create_args.xprtsec = xprt->xprtsec;
2b155d9a088aee Anna Schumaker 2025-01-08  283  	xprt_create_args.connect_timeout = xprt->connect_timeout;
2b155d9a088aee Anna Schumaker 2025-01-08  284  	xprt_create_args.reconnect_timeout = xprt->max_reconnect_timeout;
2b155d9a088aee Anna Schumaker 2025-01-08  285  
2b155d9a088aee Anna Schumaker 2025-01-08  286  	new = xprt_create_transport(&xprt_create_args);
2b155d9a088aee Anna Schumaker 2025-01-08  287  	if (IS_ERR_OR_NULL(new)) {

This should just be if (IS_ERR(new)) {, otherwise we end up with a
nonsense debate about whether impossible NULL returns should be handled
as a error or a success.

2b155d9a088aee Anna Schumaker 2025-01-08 @288  		count = PTR_ERR(new);
2b155d9a088aee Anna Schumaker 2025-01-08  289  		goto out_put_xprt;
2b155d9a088aee Anna Schumaker 2025-01-08  290  	}
2b155d9a088aee Anna Schumaker 2025-01-08  291  
2b155d9a088aee Anna Schumaker 2025-01-08  292  	rpc_xprt_switch_add_xprt(xprt_switch, new);
2b155d9a088aee Anna Schumaker 2025-01-08  293  	xprt_put(new);
2b155d9a088aee Anna Schumaker 2025-01-08  294  
2b155d9a088aee Anna Schumaker 2025-01-08  295  out_put_xprt:
2b155d9a088aee Anna Schumaker 2025-01-08  296  	xprt_put(xprt);
2b155d9a088aee Anna Schumaker 2025-01-08  297  out:
2b155d9a088aee Anna Schumaker 2025-01-08  298  	xprt_switch_put(xprt_switch);
2b155d9a088aee Anna Schumaker 2025-01-08  299  	return count;
2b155d9a088aee Anna Schumaker 2025-01-08  300  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

