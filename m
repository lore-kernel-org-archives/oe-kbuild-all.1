Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941608;
	b=2Ky/7Mj0GoxZ+OCoL9i8t5W3mHp410pSQ7RCCGjmdnDln/ujoiXgwKH85XlTaBaLA2qr
	 K1pFEqjrHzs1ggVXkikUV0r/qhk2Zqx+OIO3Cjp+/re0C6WcnROsmwB0A8Xmr/ldzeLoE
	 liHX51p9I0dy5eSJ3GLTQ6vAB0sCVYJlKWWO/KBbviMd8SEVRJWuR31npxaouNbDcCET9
	 Mq9NO51m4rfEcDPb82lE0kKE4iutXwxt1OaUr29aGBJ01SSbhOsrMAK8rv6270pbfrYOY
	 PFowaL938F7pTW2gz2QF+oRg+lv4mSTLrKbWnrsw736H8CiZpWGJ+sSHTlGLD/Y3zxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=L+nkk/Z6dYHahYLqYnz/str0XrICAT9C2M+7AZPoEHw=;
	b=u1QO3cf50Ws7BZDzYHCAvxQO0Opo/0vDGzHb+OqBydXOaI6SHjBdhsUT6+npu31U9F5j
	 LCsQJsKtMXNNo0gWeTj0gKM/08apCEY49oYMcSrTaTMxyH/eJgqb5imTfXRqXTYYvT2Nu
	 Z3qlUGhGrtf6so9fm//TbbwdU4qeRj8Z0BiS+QCBa891KOYn63HmA7BqRba0XfZOcd46Z
	 6l3UVoezh7ePZeSXN2SWPMPSmYHc6RKdfEXzoq9UTkTxJikJyndnOaKOrFPqP/8JFMrjI
	 liWBTKiqFP9kTItyfzqAMi623mXXC+Bikv7DC0gd3VIM1r8k1jcHysz3jzRJ3sVntZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjEhndmI;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C8606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 05:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E37C8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjEhndmI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so1569995e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Nov 2026 21:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793941606; x=1794546406; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+nkk/Z6dYHahYLqYnz/str0XrICAT9C2M+7AZPoEHw=;
        b=VjEhndmIl98DvE5jxf+yStlIwT7qSbTlpVpPLBDM7pd/8Xu9Ru4T7KowNaWPloLnJP
         H2hLZu12geHYvG0f4DbV9dE3gMKCnfC7rIjVEpbBnFbyl+hmFaJfkbLNpFMaOVa3YffW
         /hzRrV3MvBr3VwkVOwQ9NJwtjt0rLmyXu1SKcZ9LDudWJkqS78jkBtG9IEJV9Z8Juaix
         WiVpbs1ce6/zD8H4ohVZZF437pR2u5jFIAMiyCxMSvJ245FcpBxSLrm4jbEAPNsDUl2Q
         K9Krfr2C+vUZgv1jUCcm88nmkANw5LEQXbRt9dMQpDhygQ/Q6klB8uDZvKehlNhnoIie
         OtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941606; x=1794546406;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+nkk/Z6dYHahYLqYnz/str0XrICAT9C2M+7AZPoEHw=;
        b=yAVYQTLFRbs+y/zN98/21dLLJxvrOB1hyvj5AdwqsHhNmaJa+Vojyobx303KhIkjzt
         Od0DAtZXHp1eN9vjN1hfWNl6N6OM6GdJv0t7whrQnAHNvdYALcryX+R4yO2I37DgYu18
         JwsrOh9CWXwVi4qcwuRCqmmJIdXHzl4xfvlCpLkbYi6L78StfzZi+Z6trGhEmt2o9dD6
         nLaJwR8x2/XUWq3UMMvDS74yy5hHhycCmsitqJjg/pGfT/mSmkpWbUyp0HKL2UZ8XrNM
         yC5Uy7obZ1i7+DfAgjTmrc5qiPPgDmTD7PENof48PqFfsVeQzPKfTi0QosYQg5O0UYXB
         LjZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzac7jDv6yQUBFQWfXT4+rG6ElimvfwgqxkNzzSNqw1XkP6mhSJViYKjq4/mqlgsMzyw7B4DuX6eEcpdNzI@lists.linux.dev
X-Gm-Message-State: APuU4Z8Z4ytvGfaeAwrCTTIqvfVaUhR159Il2jSjDU8btBSlDKDXGJgX
	Kw6FKuwjsFjnuqOsBlI8KUO3lT+Kje9eVN7l5QR7Cyi445la09tUAS9v
X-Gm-Gg: AYBFou3KaE/7u2MZxOYcOcpyW5D0Ck4mEevmKnFukQPCyqrLu66+j9vQlR9/hHkzuhP
	wokWVMSbyJZQ2Pqm8DgGqEL9mh2ZB3DIY5tWcjr6yVMz27hmbPC+XX4v/f501ORNfs+az5DFdBb
	sh5DcLsgsCyw7TY2cYsaCBNl5g7+78rBeDzz/FPgv/88gGFbaAnVdpf1f7UsmRZl1LOZB1X8YjU
	VBoPw9ERle03ecPgp1t3ZrlDjdru9OA8j27k42hma+eqc0eZM/IkteWxuoJ09yZ7/pr/Dn7LDXp
	3FEs3kqjNgL+QsltEYt7Y9qBFOp7qgPZz3oW41tevUgki9Hfq8xZjqxbjVL1L8wtlB1f8ED8tBZ
	9vJBQkbepn3TZrIaKI3iqFLj/DIjWh/dzixR/0r/zvYuoUlDsprYD1TRXXBFqH91PH6UqjcJfOa
	RnT3lRM4cmSw9bxuH+FAWGPeyXq7de7h5LjeiW0E8OddDJwZsiSkIY7a4/Cm34v+KeanqDYV8dU
	eZTkSZpIKN/ik0hOu4jwWRsUgfO2Ou7GWMIW4ESRLELdMv5Gp6490T5UPXlM7YxNORjirCFIi80
	9UPwO871lQ40N3B3H6mC0rqyyTqhaYeAqoQPH/Se0VOOBydy5DiWzBZTRcA45gH0p/e1In3ziNE
	a+moBHZA86Eo3/QtS+ajV7AovKQbrVVR6PqVo7HZHsHU30MANGTpZ/RPaaVJ6DnlYgAepVqh9y7
	0pAxwy3HjRwyA=
X-Received: by 2002:a05:600c:4f13:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4b6de1c645dmr18639845e9.20.1793941606054;
        Thu, 05 Nov 2026 21:06:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b75ff3a19esm4223885e9.0.2026.11.05.21.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:06:45 -0800 (PST)
Date: Fri, 6 Nov 2026 08:06:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_apei_v5 51/55]
 drivers/firmware/riscv/riscv_sbi_sse.c:1253 sse_ghes_handler() error: we
 previously assumed 'cb' could be null (see line 1254)
Message-ID: <202611060143.FmE9sikJ-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_apei_v5
head:   14cf6b25f78f759a54f0f4b4c2a62b8de4d67549
commit: 08384c64ea14c3dc8f269ae07c9ac14f339b5d7c [51/55] riscv: Add functions to register ghes having SSE notification
config: riscv-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060143.FmE9sikJ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060143.FmE9sikJ-lkp@intel.com/

smatch warnings:
drivers/firmware/riscv/riscv_sbi_sse.c:1253 sse_ghes_handler() error: we previously assumed 'cb' could be null (see line 1254)

vim +/cb +1253 drivers/firmware/riscv/riscv_sbi_sse.c

08384c64ea14c3 Himanshu Chauhan 2026-09-24  1248  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1249  {
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1250  	struct sse_ghes_event_data *ev_data = arg;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1251  	struct sse_ghes_callback *cb = NULL;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1252  
08384c64ea14c3 Himanshu Chauhan 2026-09-24 @1253  	list_for_each_entry(cb, &ev_data->callback_list, head) {
08384c64ea14c3 Himanshu Chauhan 2026-09-24 @1254  		if (cb && cb->ghes && cb->callback)
                                                                    ^^
Delete this unnecessary NULL check

08384c64ea14c3 Himanshu Chauhan 2026-09-24  1255  			cb->callback(ev_data->event_num, cb->ghes, regs);
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1256  	}
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1257  
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1258  	return 0;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1259  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

