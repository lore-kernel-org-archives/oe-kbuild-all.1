Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B822E3DD510
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747968; cv=none; b=adKlMvGpxmljeZ8n2crxHeSB8v+ljaxQfmO6mim9W+EEm1FYbdXNubJe743tpmt8M4wiWtpxvwov4k+Sr4y7Y/3xPwwJSVdB+yfu0fUSiHAX5J7XXETUtbwwG+uWs7UVAmbu9RnxdbxyqpJ/7nu5H8mT8N9IrlRkPS6nFsR8m6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747968; c=relaxed/simple;
	bh=WzcHQhZ4qPOOkIY3YB3an4/1zKli9DU0z1U/FoTmmIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAm1XhhKPD3zaG9sLtcRoW0vAz3dQzr5+I0u+bncV4A4RKpvZ7PombyR57gSvDmncOm2ErgcfHj8RW/a72otZNNiMWYCjJxVii2cwWgvayTmk5KbwoqWiel9hKyUuGLGACWbRozKtm6sg/1EQDN+6zLTeZP45ozJ7JgDKYIT4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC16mab3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC16mab3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so69845455e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778747965; x=1779352765; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TeqjFZTQmr6abOMDAj1gaaHoZNhaam6+6qaoXrnLQDE=;
        b=LC16mab3CLsQFbBOdGUeXF+EMw/G7lT7BQYtamnzQGa7Q7Csld9E9wCTKDWn2FK6xM
         0Lzlj7D8wYqH4qfFVkuoAaphqoxX3NY8bp+Y9ErCO8ODw8kfR+NIqErnhGJlD4HQiHMA
         NzS+WFgwB5goFPWs5NVymAo/k6xiM5XDGOA2Hv9qxsjdj8DrH7vES9/xnlyqdxxXJyMV
         /3PNsDIVH2QA7Rrwa5d8uRVLJGnY5+EqRt9Lc1AZdcg/amBkWlytPl7Wv8mtpHwfxj86
         jF5/sTc8ezaagPD0GFmqQIrKpW45o5H9PltPAoRWiPkaCO7+Cd9QozVrI50aexoiz/49
         Q4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778747965; x=1779352765;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeqjFZTQmr6abOMDAj1gaaHoZNhaam6+6qaoXrnLQDE=;
        b=EoEZJWmqsH09nxkNKVpBiEDzhIThD71SVdTvELH6pBMi3ct0hULA9dKqYPZtW8OOfb
         iBExx3zxZ6F8Ly5h7twvZbo0SljvpcjhmL0mCeNfzVqR4MRM+wRbRJ+hXXBE+vcaUp2x
         fXN/YFteJLmPSoY+ucazAPagTc3bJwk78Ja8N1HjXBmDdC6W5UKMJ3RqAmVE3KO8uZYQ
         Lk44mTFXwpwShK/udcooU07LK5aXYDfIL8qtDX+6VtENjFXxsqcnDCEduQdPlWd9zYSY
         RVV/S1Qpa+wx2a5/SdnOAmotxDM2Wsjegqyjt0kPyaWMw3i2agmHx85/togw5tPSjheb
         AfMA==
X-Forwarded-Encrypted: i=1; AFNElJ/X6XRVYu3Rr1SZPfNn/rqnsjMETOeFAp4+PNXhbua4gkcLagycXZcohlcsVpbWeOIoFRIH7hrz3Z7WXjbd@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw0IZlQKrxhobVW9uDI2rjBvDSrLMysc3UevAVEYQFJVWi5Kxi
	1yFnQixZ/ECAaWOEBJc6UA0xJLjMwKG9hX4NaUKcz+ilGGeec6WXYiDz
X-Gm-Gg: Acq92OFjifsBCoKTlsPhO0JmBXtU970g8DO5QqEMKkhJhna7PKOoTiqA3wrvL3Wa7PJ
	oGpdOZA3n6FvKOJtwggw1IxfQEdyz+JQH/CXT2fh3b8uL3Rm7KOB24Q4Lt4v6YX4x5jY+O4wtwk
	fL0/qftOhGZGS7JEM4CP5C7IqXtzZeJZH4WKARjeldSxrgzJw7EImmoUXIwjbJLLjtC3vAOzjoW
	l7mLzEVSRVjAc+ivpFh0XAZvJgUTdmr/tjfvKBjafCsNIi45NhrnykDFPeKuegmpM+5a/xSQcwj
	RMhujjIo1V+jqj+i+NkVzhS4ERQyI294T8LMNs5hbpUHai80Pshiqz+g+IElG+yt/Pv1w7XOtHX
	Wdz9WwpwLaBNzXidxfxXvjHbgHINBZFA6oKRE7GXd38XjkublvVEVTSLKNR/w77+biCNZsAs9Vf
	Xm53WEsL0Chfv9Sb2DQZdnn/Vx4MHWRw==
X-Received: by 2002:a05:600c:8887:b0:48f:e230:8cad with SMTP id 5b1f17b1804b1-48fe2308d62mr1142355e9.33.1778747965007;
        Thu, 14 May 2026 01:39:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd648a7e5sm49603305e9.3.2026.05.14.01.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:39:24 -0700 (PDT)
Date: Thu, 14 May 2026 11:39:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 481/799]
 fs/bcachefs/init/chardev.c:578 bch2_ioctl_query_accounting() warn: potential
 user controlled sizeof overflow 'arg.accounting_u64s * 8' '0-u32max * 8'
Message-ID: <202605141559.kX6o5Q6d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 29e05f82d6bdd4efef504f6f68922db28e2e4917 [481/799] bcachefs: bit more reorg
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141559.kX6o5Q6d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141559.kX6o5Q6d-lkp@intel.com/

smatch warnings:
fs/bcachefs/init/chardev.c:578 bch2_ioctl_query_accounting() warn: potential user controlled sizeof overflow 'arg.accounting_u64s * 8' '0-u32max * 8'

vim +578 fs/bcachefs/init/chardev.c

8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  567  static long bch2_ioctl_query_accounting(struct bch_fs *c,
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  568  			struct bch_ioctl_query_accounting __user *user_arg)
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  569  {
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  570  	struct bch_ioctl_query_accounting arg;
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet 2025-07-14  571  	CLASS(darray_char, accounting)();
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  572  
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  573  	if (!test_bit(BCH_FS_started, &c->flags))
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  574  		return -EINVAL;
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  575  
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet 2025-07-14  576  	int ret = copy_from_user_errcode(&arg, user_arg, sizeof(arg)) ?:
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  577  		bch2_fs_accounting_read(c, &accounting, arg.accounting_types_mask) ?:
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01 @578  		(arg.accounting_u64s * sizeof(u64) < accounting.nr ? -ERANGE : 0) ?:
                                                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This can have an integer overflow on i386.

8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  579  		copy_to_user_errcode(&user_arg->accounting, accounting.data, accounting.nr);
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  580  	if (ret)
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet 2025-07-14  581  		return ret;
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  582  
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  583  	arg.capacity		= c->capacity;
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  584  	arg.used		= bch2_fs_usage_read_short(c).used;
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  585  	arg.online_reserved	= percpu_u64_get(c->online_reserved);
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  586  	arg.accounting_u64s	= accounting.nr / sizeof(u64);
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  587  
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet 2025-07-14  588  	return copy_to_user_errcode(user_arg, &arg, sizeof(arg));
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  589  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

