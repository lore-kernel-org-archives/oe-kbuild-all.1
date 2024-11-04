Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43516190C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730706407; cv=none; b=RDvByDKn+VVUIh0euuNzmAzBtW1ymTwF+ocluEVnZByVHm1xgEYlMdnmDDDM5g/+5QPr+a50VhFyV2adW3cn8y/SsKw1OFncyzGWEpADjFeBbk5fb9I0XOVYUAe5MxrYXete/Cd5IZxPCxnel/Xs1Dpd6AYjdARjR+yLD+5op1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730706407; c=relaxed/simple;
	bh=hiXRMeLr0kPEQkESFGhihzoXXM9ez0Qh4OxdPWVov/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FnzB4YLTPKWIHEe/Je2hAeFx8VLJSQyZ2zqxmN7vvPB1kClTMCt1/lbekUhCExhvyAuNq4upHdzbG7r9asbl84V9KjOvdtEiBYxA0xJOwITYHyNoSdT0LR/NA7A82yJN0TOAdGX2JShrCIvQUm/1dtbOI3nJo006GMlUprKaf7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQo4QHwH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQo4QHwH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43169902057so30235935e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Nov 2024 23:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730706404; x=1731311204; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qr/lCdxGIpqmvtufyiNU1/AYfaJZPMmw3dUQfKN0wm4=;
        b=PQo4QHwH0pMa9BKCPaU6CN74tKWv+AgoEgVWnHQQhm0KMs08sF/0FE9AMQpOXFVYmp
         CvhKaHvsyAaM+D+NrULLFzKCjswhEj9vv8gFq2XxyewLX8z32Gej9XsquyvQcIljpmVX
         qsrKB9PlN7fPSBj6ELBu4bBm7Wu1VEw5leQJriA16dfSrMRJjBKMap6prpUH91t8vb/f
         qNScRCoIpjti3/8lNVJMIid2Pz57VHr0mw59jSZDoVvXsBBGDHBxgUbp40Vkv8yp9PjX
         KnBM5Xn8T8qGrq6y4YQ245/IJHCowRxfU6TGN3gvY8QPkGWpYG9hniRfY0OMaFfvXZnc
         iDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730706404; x=1731311204;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qr/lCdxGIpqmvtufyiNU1/AYfaJZPMmw3dUQfKN0wm4=;
        b=KQkP6xPz1G5h1CP64gzjy/+mKE/MKNUN9nxWxAHQdGR0emlwFwqWxDvJq2HsPlANTO
         lSl9zBFKAFSRMREVPdNr033TtVnKpQ1muwIOk4fIn+RMpf0tPJzhJpc6jelP129uM5Qo
         8uLVCrv7LREkE+XqZPGs2iDbthcX+2DeLdKkZwBbufJImgF+eu205Uu1YhkCOzE6n9u+
         2hMJgaC7tqxlm0R6ZZH/LaBkP9CtwSulKYngI8xGt/MbX4yQxMNhs/fyCSj7Y4wMoP91
         f0JBrJKaCfWwHVspHfF2FGqK/EJgftSwDHxZuAkzQDa4QSZJONk/02VMuw3ULj3/qF0v
         QzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZxeVhyU7uWEAKjSDWFmjaAXIew2aeqRyXukdLB175Z593je3KQyNKL87JKOmP4IwKht6We0zflPIPtBew@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdcb1l1q1NHYJ/p39HE5iflP320befP7Gt0BZKdeC8A2bT4Ceb
	+oT/cdSoLej2MHabX1063seV1AaEZadQL4Qodo3Oz7e7XuJ7fdK/6piN+6etxkg=
X-Google-Smtp-Source: AGHT+IEa/dItlBJ7to47HpA6zT+E5GAbRC7kdcM2n0VT107a2c9HBt8T0GTh6M5D3L/wFar0QjWT3A==
X-Received: by 2002:a05:600c:1d97:b0:431:5459:33c2 with SMTP id 5b1f17b1804b1-431bb99053bmr189790345e9.17.1730706403974;
        Sun, 03 Nov 2024 23:46:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8466sm175447525e9.2.2024.11.03.23.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 23:46:43 -0800 (PST)
Date: Mon, 4 Nov 2024 10:46:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_3 21/24]
 arch/x86/kernel/uprobes.c:1359 __arch_uprobe_optimize() error: uninitialized
 symbol 'ret'.
Message-ID: <2c7d0033-d30a-48ab-a83d-ce0c163052f8@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_3
head:   2e0575143d13814d04f02a33a4110989ccdbf3a3
commit: 0200936b03cfee067eb7db4b44079104b561b726 [21/24] uprobes/x86: Add support to optimize uprobes
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241103/202411032313.O65IxwCH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411032313.O65IxwCH-lkp@intel.com/

smatch warnings:
arch/x86/kernel/uprobes.c:1359 __arch_uprobe_optimize() error: uninitialized symbol 'ret'.

vim +/ret +1359 arch/x86/kernel/uprobes.c

0200936b03cfee Jiri Olsa 2024-10-23  1332  static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct *mm,
0200936b03cfee Jiri Olsa 2024-10-23  1333  				  unsigned long vaddr)
0200936b03cfee Jiri Olsa 2024-10-23  1334  {
0200936b03cfee Jiri Olsa 2024-10-23  1335  	struct tramp_area *area = NULL;
0200936b03cfee Jiri Olsa 2024-10-23  1336  	char call[5];
0200936b03cfee Jiri Olsa 2024-10-23  1337  	int ret;
0200936b03cfee Jiri Olsa 2024-10-23  1338  
0200936b03cfee Jiri Olsa 2024-10-23  1339  	/* We can't do cross page atomic writes yet. */
0200936b03cfee Jiri Olsa 2024-10-23  1340  	if (PAGE_SIZE - (vaddr & ~PAGE_MASK) < 5)
0200936b03cfee Jiri Olsa 2024-10-23  1341  		goto fail;

Needs error code

0200936b03cfee Jiri Olsa 2024-10-23  1342  
0200936b03cfee Jiri Olsa 2024-10-23  1343  	area = get_tramp_area(vaddr);
0200936b03cfee Jiri Olsa 2024-10-23  1344  	if (!area)
0200936b03cfee Jiri Olsa 2024-10-23  1345  		goto fail;

Here too

0200936b03cfee Jiri Olsa 2024-10-23  1346  
0200936b03cfee Jiri Olsa 2024-10-23  1347  	relative_call(call, (void *) vaddr, (void *) area->vaddr);
0200936b03cfee Jiri Olsa 2024-10-23  1348  	ret = uprobe_write_opcode(auprobe, mm, vaddr, call, 5, (void *) 1);
0200936b03cfee Jiri Olsa 2024-10-23  1349  	if (ret)
0200936b03cfee Jiri Olsa 2024-10-23  1350  		goto fail;
0200936b03cfee Jiri Olsa 2024-10-23  1351  
0200936b03cfee Jiri Olsa 2024-10-23  1352  	set_bit(ARCH_UPROBE_FLAG_OPTIMIZED, &auprobe->flags);
0200936b03cfee Jiri Olsa 2024-10-23  1353  	return 0;
0200936b03cfee Jiri Olsa 2024-10-23  1354  
0200936b03cfee Jiri Olsa 2024-10-23  1355  fail:
0200936b03cfee Jiri Olsa 2024-10-23  1356  	/* Once we fail we never try again. */
0200936b03cfee Jiri Olsa 2024-10-23  1357  	put_tramp_area(area);
0200936b03cfee Jiri Olsa 2024-10-23  1358  	clear_bit(ARCH_UPROBE_FLAG_CAN_OPTIMIZE, &auprobe->flags);
0200936b03cfee Jiri Olsa 2024-10-23 @1359  	return ret;
0200936b03cfee Jiri Olsa 2024-10-23  1360  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

