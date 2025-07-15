Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93D45945
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 22:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620284; cv=none; b=RVd6udd4eRxYtefutdMPKOh1XBP0AjFglO/G9ORMWU4Txqgx2pPfjdscNnCcCy+NHNIYif/bX1tSc4SqvXZf+ClAxQDi33REwJBXsZLjMr4qnwYmKsiJDrQkNE0wUqj32msx0pSkePMo0Y/hRoCTHE+2EOeYsMtTUrs+bN+tL1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620284; c=relaxed/simple;
	bh=BqE+PG8+N3g9DDIlSYErTLVAsGDHGBL4o6EatQ2TqSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgUi2xD2f1G4oJFKXJfbAvUWFeiCw7RjLn70ZoHBynquswGJvZrhW2C8dSdXHZ3fxOHvx0a5j4Kl0wK0Vyp+3Ozs40sX8cXPsfQP9DU7brVFNlnrFl3I2ZC/JKCmZIZCFGjxCwqmh+8k0c8iX4h3xi3ozexhTfLg7QG+oeeEyQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWwUf6oA; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWwUf6oA"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60402c94319so2789302eaf.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 15:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620281; x=1753225081; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfY5cBx0k1AHv7x1wZF2fAoel8gONC7WneT/UbmB4Tw=;
        b=mWwUf6oAtCMKpoHXkMXI5f1QhCi7nFewCwAsybXWO6GaO6VsnM0lebktRMLFvk2+do
         BebRv5GwAL05zS4nzpKThwYUhxtTP7kXHqdV4DKmgIervWciHI67Gem1imBpzJGcisf5
         PUM0xW+u2oK0JPhSz1Xj3bnl41JgWOOAAh2B4Neehk+WEDZHJRC4GeuCmUyn7V3lSogM
         mfZOq9IilRkETqEdOIZerwjXI5LGksU4/fFfSHobM6sRNp/U4ETHbbfLdSqSZQDmk9Oz
         e2fq8+QrKeXnIXj/UePQj20YFX2xQ0FYvW/6oSlwcR/l0/OiT+cOVf5atmlj/wiuA1AD
         PPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620281; x=1753225081;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfY5cBx0k1AHv7x1wZF2fAoel8gONC7WneT/UbmB4Tw=;
        b=aRgnrJU1Ru1C4koP6xk6Bd7R5fr+rLSUezVFi2wD6XZs21TG5eIFz6w7Wd7Dby620p
         5T/pnrNtvW1axBpTrraUd03+tmPbyVJrt0058ctQNBThK2HTPVVb7O4HqMi3STMDG/f7
         zq6HUW+9DSz5hsfKzukpiM4+lcuqCfLRg9F6bY1DlgA3geORFyqstiBTQ3Jir+dZWSQC
         6TkOYLUvWl3GtUnh6i2TDivdbK65LXNhw9cLkdvSZnmA0s9/9GQ3rqyKgYUqxVwruNHF
         qNhjJ25sw4p8VhjA6Qxmh1XM2AM+m6pUjIWdEO0CSfuYnEqT9cqI8yOggJbKVJbzaU0m
         b++g==
X-Forwarded-Encrypted: i=1; AJvYcCXlGb+fOFX/mC1snOxtyeiI6SM07k/IOAgccLtKGePszMJ1Sc1NIgEoEIglrMq5AoSB1EBu0H8K/48Qc/QP@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/eJ6qp4GBc5uJn5DORH4R9IYvbq1COTDlQw9pvM8XtLzGU8Qm
	jQhiXNQ+Yj4IReTmwWpgrK60ki4/XU+9us74mv/wligaQOcXk17BX8goDo4qgusFz3J8WUgZci3
	7aM4F
X-Gm-Gg: ASbGncuu9ZmIn3Bw/nFgjzx91NwgHSXQcGcR0b5XX+NM+LmDldOoYqgoM/QVTS8bAMO
	ouvcVTnJpC9SoRzmW57Jfmzz/dgwEi4Om/CtCsoj6Z938ZHWSh9M9VMzKkVXmeRZThDcCpehJin
	v24R1okx4WalU5OOdiM/nQTfFkGYtR8yTyLQFUBm58SOGHMRTyfQnfssbsS68e6kmYLU9SoTGqh
	nebnZLokXkgrp7eL7DIz8f3Ep+BdDJizkTiUJ2RCAEVUVKBPD3pKPCb18xEyJUbIlEHiYoOYoxo
	Fu6jdSr3kVnLOgabhcCEi29JOLDUW6Yal6IAD/3RU09QfO/iTPe5oHwHU8hFB6h0sIaHtbUG3X0
	FRBVXsQroUY7C8kp1mmJnzBDsT16l
X-Google-Smtp-Source: AGHT+IFwSEpGsJ7tfHcgSefFVQbmfW7hG6zKm7wTMhA5TSlvA28syu1P7ZiVfRAojLJax9yJU7cu2Q==
X-Received: by 2002:a4a:ee10:0:b0:615:742d:513b with SMTP id 006d021491bc7-6159ff2eda4mr983765eaf.6.1752620281438;
        Tue, 15 Jul 2025 15:58:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a172:6205:b5e:43cb])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-613d9f0147dsm1913052eaf.26.2025.07.15.15.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:58:00 -0700 (PDT)
Date: Wed, 16 Jul 2025 01:57:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 71/79]
 drivers/firmware/riscv/riscv_sse.c:721 sse_ghes_handler() error: we
 previously assumed 'cb' could be null (see line 722)
Message-ID: <7212b331-7fe4-45e7-8cc6-38fa6a3ef43a@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   bbedafbba85a78dae84bbf5a5844aaab3934e316
commit: ae56cba8914ba82cf6b3318415e12a3795dcb5c9 [71/79] riscv: Add functions to register ghes having SSE notification
config: riscv-randconfig-r072-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151955.ROdqPmHz-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507151955.ROdqPmHz-lkp@intel.com/

New smatch warnings:
drivers/firmware/riscv/riscv_sse.c:721 sse_ghes_handler() error: we previously assumed 'cb' could be null (see line 722)

vim +/cb +721 drivers/firmware/riscv/riscv_sse.c

ae56cba8914ba8 Himanshu Chauhan 2025-02-27  716  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  717  {
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  718  	struct sse_ghes_event_data *ev_data = arg;
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  719  	struct sse_ghes_callback *cb = NULL;
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  720  
ae56cba8914ba8 Himanshu Chauhan 2025-02-27 @721  	list_for_each_entry(cb, &ev_data->callback_list, head) {
ae56cba8914ba8 Himanshu Chauhan 2025-02-27 @722  		if (cb && cb->ghes && cb->callback) {
                                                                    ^^
This NULL check can be removed.  The list iterator is never NULL.

ae56cba8914ba8 Himanshu Chauhan 2025-02-27  723  			cb->callback(ev_data->event_num, cb->ghes, regs);
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  724  		}
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  725  	}
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  726  
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  727  	return 0;
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  728  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

