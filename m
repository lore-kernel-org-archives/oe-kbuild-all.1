Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F255B33BBD0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 05:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080705; cv=none; b=b4ESd1yjBAAFCuPTWGfClnfEWVqrf4h4elNJdJLCJD62289Tb+aFgOLP55QJ+D3CdZrFDPcSOPqQvAP+KrRbVU+VhEKRU3oxexj6aDtFQpgAE9GY4izNXbIU1yG03HXvLF+MEVRTjeOrvncl8uGKX3SStPliKbcVLMNDW1v6sLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080705; c=relaxed/simple;
	bh=4psL8+GeXk1WC2qi5mfnbdwsUCFjRWRHtfZOf/s9n9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dqe2pvLASg/FYHvEhU836IqZ8aqxf2BsUGHgyqv7G65v+lTO2XTlMPHURxT2rpu08+DQksHLJaZy3NZed6lGcbTk7NMKueWaWDVKNj4EJL6IEKkjew8PT8gbCWb40ZNM8Avoswlnkelxh1tzKcdMa9/gSuTjG1os7eMutIHdw74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbVAwasz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbVAwasz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso9906935e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 22:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080702; x=1779685502; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HZnk31N5kzSsttMZ0C8iHVgYBVwpdizhC6C5uXZVAuI=;
        b=YbVAwaszjuSg6gvy7B5RZsl//J8VlefXHLeFVtpMjdXcMI/FBB26RpziNJZIUqLiOT
         Ldyh0UuuwO4E9h909U1UR63RfgldmP28NGG4r7QOij4uza2K2wWHwiNVIQwN6BZIZoI3
         R+Xo2ulhdL7SgdbWBMARZNJ7NZ56YcxdFLNJtzz+mz6p2wKZPuIVesZXq/FH+7eMKi70
         IS8QypaCpxWVQGL8QhXZdyjHglkwyTvBbeY8rybz4wK6aPkwKXUA53Uoi4s3Gk92Ae5O
         IC/baI1P20LON+kaB8Byci1s25okdqVjO7sy/ShXVyndqj6Jmq6W8XAaJIdztSiR7Cbl
         lybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080702; x=1779685502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZnk31N5kzSsttMZ0C8iHVgYBVwpdizhC6C5uXZVAuI=;
        b=bkhrJUNQvuOmWXgXT7rxLKV0myyui/mpTIQmOtjKGLg023PlQ8+Um6tbt++uaC2pOP
         awWfePX4+nn6+FlIHILdE1/6/J/2UUauaw+OyIK8Kvp1jflylvHsh2LAR6p/l3hK3Zy1
         NXgajedi+f6xgcKNSjp4a85k2dNh5wz4h5RboSEBuSHU30mAucJ0fhniskiwW3NdlG4X
         mKveV/RMswQmGhZN0IXV1/AHdP48adiRQjwUbAkoMGf0YJ0/WQqE1MTjV5cnjhXLL5P5
         3m8bQk7NgTIDaEvyLvh1wATodeS3+JoWYUwx606+yIoY44u6KStUF1dgGy3UIa6ke/d4
         vaBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YA8yhyqebdwaeUexa3PTgKtk5BNXzKNsLsryRu5BxM7zodaFkyVlz8ttyg4U3kD7jyx3v9bf+yxcM8+cR@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0BOTcJokhhXEC3/wK9tGkDXi5aMmIuuqfJVB6Xutp0RKJ4Ypw
	rWBBLZc+wXKFhALgIGPnoikd21IOC5ljhBIcCN/SdZiLmKQeOGlFOgPX
X-Gm-Gg: Acq92OEQU+hTR38UNHSvVG9yinnXQuLO365a5GoMePD0ZiN/wTuqxQRjuj/eS6UjYhF
	+GjXFvfcxRaXQYy+HiAQBHthcnnLUXXnftKyiUq+b5k8ctFKViYn/2VETDWASENgkcRY9ZLOHZ7
	rNnirf8SyE1YjM1H5fQHABcbXJgmv+fX6r2p5vUIsBewpIcU8zz0d5RAtmQ5ho2n6WcWilsEbyK
	2rNwXnj2tklwWrH+WzQwYBW19tejMxJNwry75upldQGiGXX3Zav3l4XAXm7hGxfNPr6RrpVNg/+
	c2gzpt/hp5Hs08b+Mf/Aynbg1lZDhUsMdxPQNKJNFzyjqmnwyhwAjfjFe3Bjc5JZYDQbgXfBPYr
	p+bDNxJYnl3sC1Xe50XsKM3Fx2FZqX6iRQUM1HNnYDhwdlfiUHwJXV3xyk9QyX3aAZKdwWPcWoD
	JkSzefLbA1Hpoxlbs/hvQ=
X-Received: by 2002:a05:600c:858d:b0:48f:e230:80a2 with SMTP id 5b1f17b1804b1-48fe65148e1mr161591795e9.32.1779080702339;
        Sun, 17 May 2026 22:05:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2896bsm76467155e9.4.2026.05.17.22.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:05:00 -0700 (PDT)
Date: Mon, 18 May 2026 08:04:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2026.05.08a 39/43] kernel/rcu/tree_exp.h:822
 rcu_print_task_exp_stall() error: we previously assumed 'rnp->exp_tasks'
 could be null (see line 818)
Message-ID: <202605171129.6vsB2TG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2026.05.08a
head:   86ed69edce527e32495da86900fe50b9ca3266d9
commit: b32c53e658b25c6ed973a78b40bddc95e1948eac [39/43] rcu: Make rcu_print_task_exp_stall() dump ->dqs_blkd_tasks
config: parisc-randconfig-r071-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171129.6vsB2TG2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605171129.6vsB2TG2-lkp@intel.com/

smatch warnings:
kernel/rcu/tree_exp.h:822 rcu_print_task_exp_stall() error: we previously assumed 'rnp->exp_tasks' could be null (see line 818)

vim +822 kernel/rcu/tree_exp.h

d87cda5094585b Paul E. McKenney 2019-01-11  811  static int rcu_print_task_exp_stall(struct rcu_node *rnp)
d87cda5094585b Paul E. McKenney 2019-01-11  812  {
314eeb43e5f228 Paul E. McKenney 2020-01-03  813  	unsigned long flags;
d87cda5094585b Paul E. McKenney 2019-01-11  814  	int ndetected = 0;
314eeb43e5f228 Paul E. McKenney 2020-01-03  815  	struct task_struct *t;
d87cda5094585b Paul E. McKenney 2019-01-11  816  
314eeb43e5f228 Paul E. McKenney 2020-01-03  817  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
b32c53e658b25c Paul E. McKenney 2026-05-16 @818  	if (!rnp->exp_tasks && list_empty(&rnp->dqs_blkd_tasks)) {
                                                            ^^^^^^^^^^^^^^^
If rnp->exp_tasks is NULL

3c1566bca3f834 Zqiang           2022-12-24  819  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
3c1566bca3f834 Zqiang           2022-12-24  820  		return 0;
3c1566bca3f834 Zqiang           2022-12-24  821  	}
d87cda5094585b Paul E. McKenney 2019-01-11 @822  	t = list_entry(rnp->exp_tasks->prev,
                                                                       ^^^^^^^^^^^^^^^^^^^^
then this will crash.

d87cda5094585b Paul E. McKenney 2019-01-11  823  		       struct task_struct, rcu_node_entry);
d87cda5094585b Paul E. McKenney 2019-01-11  824  	list_for_each_entry_continue(t, &rnp->blkd_tasks, rcu_node_entry) {
d87cda5094585b Paul E. McKenney 2019-01-11  825  		pr_cont(" P%d", t->pid);
d87cda5094585b Paul E. McKenney 2019-01-11  826  		ndetected++;
d87cda5094585b Paul E. McKenney 2019-01-11  827  	}
b32c53e658b25c Paul E. McKenney 2026-05-16  828  	list_for_each_entry(t, &rnp->dqs_blkd_tasks, rcu_node_entry) {
b32c53e658b25c Paul E. McKenney 2026-05-16  829  		pr_cont(" Q%d", t->pid);
b32c53e658b25c Paul E. McKenney 2026-05-16  830  		ndetected++;
b32c53e658b25c Paul E. McKenney 2026-05-16  831  	}
314eeb43e5f228 Paul E. McKenney 2020-01-03  832  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
d87cda5094585b Paul E. McKenney 2019-01-11  833  	return ndetected;
d87cda5094585b Paul E. McKenney 2019-01-11  834  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

