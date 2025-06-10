Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B9481CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547901; cv=none; b=rp8BxNwnCmSpB0he47aRSMNseuPnEniGBT3WRhkaLW/MkGUmEHPomn7n5nYGCJVdWCxdoFnyioLh+RKlizCcYL6HRNWPNEuVkjF0V7psDmcCt3DxFupXHbUigXD5i2JR8E7hG28YmDwbczmKvbzYRy4iSyHcdGsmZ6p9e1bMLgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547901; c=relaxed/simple;
	bh=JjbHD2phY8KlGPS0WX77CAnJphdtY5wlrsTzFvbYvVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uQ2QVyOv8m/sxM89CZleFxY+9GWRRhg+2dcOimDw1A6prEOL7hcK7DCzPV23v16kq3Fci3TujjTCTBZGrtgjDE42ZDoBI6BB81CyBJ3W5M2uAeiaSps9FttO3p55hX9NFC1NP7iwI2JsbJZEGoC84B6XKc8eknsd/KM087sBNTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xiTqe10N; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xiTqe10N"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-607fbc13725so2489157a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749547897; x=1750152697; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDc/79+RuAdlSY4uZ7KWYfQD+mg4JnBPNq2hVHtFBD4=;
        b=xiTqe10NER2uCOQcerBEqOpdnvfBHzUQTMfv8nlXXX4IrJUcIrsQELde/fc3rcZHWv
         1r8ky+2zK7FcPGUa6e5ml1OL78wGUV0wwQuMkXIcsaVZaf55ZbNgyYhCo6YqXmKKdeYF
         kcxh1Q9/OSnwmm1vhHkXGdqh7zG7HqroK0Buyht40RkkCZCX22ELE12ySNs5jkdpNpBf
         /sJJiC9YPLOw5AzJgZFzkXRsNz4niXpj2jnkZTX74ZZM2xeplOOzdEjiJFI/ye6D/WNq
         UlOQtUctAyVwpFHgiIE5SDt3pT3al6k9T39+89oHR6yyn1CZL/807w/q2sWHikJ4OrRh
         2qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547897; x=1750152697;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDc/79+RuAdlSY4uZ7KWYfQD+mg4JnBPNq2hVHtFBD4=;
        b=G37MnmF/TmI5qIGETnEi57DI7j60AqA9mH7+Hy3lCfX0ATnD2uEMxNDZU9NZzPS3lR
         JR+sFbUaDMSxX6nHvw35dl9Nr815LIpD+oDwfSjajtg9hzw3l9e6i+zJSLo/Qxgqj7Ik
         d7o3qRzQ4mSimd+A7OxF4ZM4ot69Jpgd49k2DWr/kT94lQ/4ho7hUGp2OBYkRSa7VEdm
         pOIbz31hdivpp4lYcUdaiHG1l3qwft6p10DSXF3GSS692EUQgnnyMjpIYbTTWiSEhX92
         M+RHbzw23yv/1b+bfrG46B+47Qfwev9bjuFjk8O+AqlkE+sEPil/Y/tnbvUmFezyL1ij
         1sYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqC1xSCJINyAPWdpZOKnt4+9kdidsvhlcVWXdt0PsW8Qm7g3dl80AWlM0Pc1doidYmFBKhfUHeTuux7xM9@lists.linux.dev
X-Gm-Message-State: AOJu0YwdJMIJEQt+fV0mezXQ+9Wfvw6BF43u1YA/KCUDSxnj1gFCMhzM
	K09vjZIkaATE0k/KuD8Pc/fFktsK8I2AEQlbIvcR3tOxxj5z2oWFOClyVIeDeP282QQSQ7KBEsM
	H5vB3
X-Gm-Gg: ASbGnct3C6ZoTAnRmYRGlZIYBDm5Bh09Rgn21U+N6K/QOir2bQqmjNyN4uv2mKqOOGy
	fDs3FpiuM6ZKwFkxy9wAqcBNxt5395XkawHcoKdpGmSLmBBLngh57YBfFQpCbl7E8AkYc36vfvZ
	AnEwJA31PaG8BRvd3cKeeMmExWBKQFTbJ3rZukKoPvPH4V8Kc/Bkgu9m+TK8ukkqYPIM+0Jgr/t
	xZFjpe1ACPf/oaRa8FsreMM8Rf8ygjARbqttC9SqOUZ3ZJInmOrm5kb+73Vv4Kuepznxk6hn+MF
	Pyf73A2OaY+QZUoYFAWv0Wuvaxa/8vO0CSi7AZVrmYDlrODSfgbkdjVLUto2x6ehup8n9zSwvCN
	eWA==
X-Google-Smtp-Source: AGHT+IGzuWpLJuvNNJ5G9B9m8QYKEPNmPDW9ChoxRm2mznTfjw5Y68DUVnNnmXJLDm0ZXKwRPdzcYw==
X-Received: by 2002:a05:600c:64c3:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-4520143721amr196461635e9.10.1749547479396;
        Tue, 10 Jun 2025 02:24:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4530f7ed8cfsm63035915e9.11.2025.06.10.02.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:24:38 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:24:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] tracing: Fix regression of filter waiting a long time on
 RCU synchronization
Message-ID: <202506070424.lCiNreTI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605161701.35f7989a@gandalf.local.home>

Hi Steven,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Fix-regression-of-filter-waiting-a-long-time-on-RCU-synchronization/20250606-041722
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250605161701.35f7989a%40gandalf.local.home
patch subject: [PATCH] tracing: Fix regression of filter waiting a long time on RCU synchronization
config: riscv-randconfig-r072-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070424.lCiNreTI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506070424.lCiNreTI-lkp@intel.com/

smatch warnings:
kernel/trace/trace_events_filter.c:1452 filter_free_subsystem_filters() warn: 'head' double freed

vim +/head +1452 kernel/trace/trace_events_filter.c

7967b3e0c40ff7 Steven Rostedt (Red Hat  2015-05-13  1412) static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1413  					  struct trace_array *tr,
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1414  					  struct event_filter *filter)
f306cc82a93d6b Tom Zanussi              2013-10-24  1415  {
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  1416) 	struct trace_event_file *file;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1417  	struct filter_head *head;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1418  	struct filter_list *item;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1419  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1420  	head = kmalloc(sizeof(*head), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1421  	if (!head)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1422  		goto free_now;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1423  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1424  	INIT_LIST_HEAD(&head->list);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1425  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1426  	item = kmalloc(sizeof(*item), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1427  	if (!item) {
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1428  		kfree(head);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1429  		goto free_now;


head is freed.

b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1430  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1431  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1432  	item->filter = filter;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1433  	list_add_tail(&item->list, &head->list);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1434  
f306cc82a93d6b Tom Zanussi              2013-10-24  1435  	list_for_each_entry(file, &tr->events, list) {
bb9ef1cb7d8668 Oleg Nesterov            2014-07-15  1436  		if (file->system != dir)
8e254c1d183f02 Li Zefan                 2009-08-31  1437  			continue;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1438  		item = kmalloc(sizeof(*item), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1439  		if (!item)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1440  			goto free_now;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1441  		item->filter = file->filter;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1442  		list_add_tail(&item->list, &head->list);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1443  		file->filter = NULL;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1444  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1445  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1446  	delay_free_filter(head);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1447  	return;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1448   free_now:
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1449  	tracepoint_synchronize_unregister();
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1450  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1451  	if (head)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05 @1452  		free_filter_list(&head->rcu);

This is a use after free.  Smatch calls is a "double free" because
free_filter_list() has "free" in the name, but Smatch is wrong.
However, still a bug.

b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1453  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1454  	list_for_each_entry(file, &tr->events, list) {
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1455  		if (file->system != dir || !file->filter)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1456  			continue;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1457  		__free_filter(file->filter);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1458  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1459  	__free_filter(filter);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1460  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

