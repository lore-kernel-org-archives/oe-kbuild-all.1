Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47BB79CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741769630; cv=none; b=MWbT0zVDA4d6OlCn8Jux05poKFOH3COHMjh1nMyTU+YGjqwV65KaTQOxjI99rH4NxkVg6eDxXdQdAmCBqzt8WaF/BQerR2H+vmhr/C240QwJUFp3L5eZKbqVceF9HnblJAbBTEPMZnHdvWHeZ8obLx3BrDae3h7Hjz9C7m5dDrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741769630; c=relaxed/simple;
	bh=aVSpVdwpO4EsiTuKqTE/O2zN8kKy8/gml47pA6tp1eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZQjFMQR7onK+EHcpoHggrVkI6h7VlitQQCzzwt45T5GKaHXq9Fl2yRlTxTyPvdWdM5nJIrHMe/6X8wIVQE3SPr56XRYIzF8L2FuoS3P7P/OlqiAUDkp5iGPHv78CYsHz5nrXtEB5m1yoimjWzAbjvX1WGr3aTTn42ET2B0LphM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYefBpFk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYefBpFk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso1465135e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741769627; x=1742374427; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmJJvmyKqSMDsjYNuguWv/pkoFC9sKnMgsKPz404xmg=;
        b=vYefBpFkhjtjlW7aH/ZaM61MLEiUIUCKJ/W1kbsbdVVMCRNBu6kN6pF1w+zXEkiyPF
         b9a2vbV2tDibJX9OYEWXmpW7sSE1NKlK9I1Mhr6VSXwyCC6AOQs70FpFhftSUM4PJE6/
         DgAFPTz/JM2j6HcqQUFA+tP3Rzcbg8IAiMwIk2jX5eAFgkOcBaCdieZegRExDF0a/DKl
         W72MjVf9OBNSQVuTvfmv1z5eTDL/mOHUvjg3h7yOfgiU5HbZXdXxkoTsdVGQadXoduD5
         z+xiDWi6JvnJZnpbkcHuWvyO58gpTqe9zl0LaxZqxp66qf0cKIqgF9nXma6vBMD42++J
         nyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741769627; x=1742374427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmJJvmyKqSMDsjYNuguWv/pkoFC9sKnMgsKPz404xmg=;
        b=JCjZl3i65yEP5EQv/KnAc1Egc3SPrDwZ6ZVX/cPLVUo0CNDal69Mhi1/VZYHFPgOfF
         fXYuO41t3nnC/9jCfRBX5LiRbnfN6eM3wpFiPW6Kt+jXePyKu5jOkG41flGuiBe00/6r
         lMJQyaXrcpJhVhXNAyZWJTJRuSw9B4dUsDRgAw/cf9b9BI5erA9qzAGXzNxPAPSw2psw
         D34e4wpZ4GhwUw9g+RBdn9l4/z+TigUUA+IJj16ApKDlcHnDfKR0vXXSRx+fNXqEk2FN
         muak3ZMuwn16kiAo8Qs3EaDZ1P6k7o/KssY3RCPzmNhKeHxfa7NMx48cvcOuIaHipJ+3
         pqCw==
X-Forwarded-Encrypted: i=1; AJvYcCWSd5ZBzLnG9IThUjpQl9RMTmYDDsIo/OAWUB/7Oq4mQLjYXUBG12LoNNicwsnPOeYPc7ozmogrexhynOoE@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx/Wnyr0Q6oK1W7jP+a/7Aake/DYU5FUkwKEoP6Jf23pbPM20N
	4dKkeGWM7EFnhiXjcDq9nsmFt8gmPnLaFn8hn3HxqkhI5WXXJGtyhwXM0MDheJg=
X-Gm-Gg: ASbGnctuT65KWQSNdBzNH/7Wjt0geYxWUVWKlOAKhnMZLA9SxjjDMS4OxfY7FZFADJb
	Q6rGWTj/IAj+1LB6rjajNT7/H0d5E840k3cRpKnsrzayiX685z8mz3LkgvpfJ8FuJoxUbVIqDPX
	BUqJMvy6+zXEZkTrKOh4UA2GcrE5sAMJibIarqeQ1GP8SbAZeClZV5E8WMEgRklvF5Fdcp4K4H5
	mceFvWfVPTRj/GhnyKp3+EIatzkQH6Yv4o6Y7e5KZe/hX3JN1gmm4OweXaxcOKTVyG9w9lehxcj
	m7u0Yerk0U5wBT0GUQ0B7ixA6Bb0T+T9oG2ao5AedwlTIN4b+Q==
X-Google-Smtp-Source: AGHT+IGIbocHwytQBW1FLGXDv0lAXbiOtLfunJALoBHcCKLvNfTgfhBYy6Dw8V/On4UAxDUPQ1fvDw==
X-Received: by 2002:a05:600c:5107:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43d01c3cc32mr69793875e9.17.1741769626949;
        Wed, 12 Mar 2025 01:53:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d0a75b290sm14476125e9.23.2025.03.12.01.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 01:53:46 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:53:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 drivers/usb/host/xhci-mem.c:2366 xhci_create_secondary_interrupter() error:
 uninitialized symbol 'i'.
Message-ID: <228ce3c7-a2bc-4c61-b9c4-4460bb7765f5@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   501e3c4dad2caa7d89416bbca980b0b803316a2e
commit: cca9824fd10fa5cf91be0a83f71a9ced6adc7c2a [2/2] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: i386-randconfig-141-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121547.DVzP1C7e-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503121547.DVzP1C7e-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci-mem.c:2366 xhci_create_secondary_interrupter() error: uninitialized symbol 'i'.

vim +/i +2366 drivers/usb/host/xhci-mem.c

c99b38c41234305 Mathias Nyman  2024-01-02  2325  struct xhci_interrupter *
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2326  xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
cca9824fd10fa5c Wesley Cheng   2023-05-09  2327  				  u32 imod_interval, unsigned int intr_num)
c99b38c41234305 Mathias Nyman  2024-01-02  2328  {
c99b38c41234305 Mathias Nyman  2024-01-02  2329  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
c99b38c41234305 Mathias Nyman  2024-01-02  2330  	struct xhci_interrupter *ir;
c99b38c41234305 Mathias Nyman  2024-01-02  2331  	unsigned int i;
c99b38c41234305 Mathias Nyman  2024-01-02  2332  	int err = -ENOSPC;
c99b38c41234305 Mathias Nyman  2024-01-02  2333  
cca9824fd10fa5c Wesley Cheng   2023-05-09  2334  	if (!xhci->interrupters || xhci->max_interrupters <= 1 ||
cca9824fd10fa5c Wesley Cheng   2023-05-09  2335  	    intr_num >= xhci->max_interrupters)
c99b38c41234305 Mathias Nyman  2024-01-02  2336  		return NULL;
c99b38c41234305 Mathias Nyman  2024-01-02  2337  
db4460b6ecf0757 Niklas Neronin 2024-04-29  2338  	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
c99b38c41234305 Mathias Nyman  2024-01-02  2339  	if (!ir)
c99b38c41234305 Mathias Nyman  2024-01-02  2340  		return NULL;
c99b38c41234305 Mathias Nyman  2024-01-02  2341  
c99b38c41234305 Mathias Nyman  2024-01-02  2342  	spin_lock_irq(&xhci->lock);
cca9824fd10fa5c Wesley Cheng   2023-05-09  2343  	if (!intr_num) {
c99b38c41234305 Mathias Nyman  2024-01-02  2344  		/* Find available secondary interrupter, interrupter 0 is reserved for primary */
c99b38c41234305 Mathias Nyman  2024-01-02  2345  		for (i = 1; i < xhci->max_interrupters; i++) {
cca9824fd10fa5c Wesley Cheng   2023-05-09  2346  			if (!xhci->interrupters[i]) {
c99b38c41234305 Mathias Nyman  2024-01-02  2347  				err = xhci_add_interrupter(xhci, ir, i);
c99b38c41234305 Mathias Nyman  2024-01-02  2348  				break;
c99b38c41234305 Mathias Nyman  2024-01-02  2349  			}
c99b38c41234305 Mathias Nyman  2024-01-02  2350  		}
cca9824fd10fa5c Wesley Cheng   2023-05-09  2351  	} else {
cca9824fd10fa5c Wesley Cheng   2023-05-09  2352  		if (!xhci->interrupters[intr_num])
cca9824fd10fa5c Wesley Cheng   2023-05-09  2353  			err = xhci_add_interrupter(xhci, ir, intr_num);

i isn't initialized on this side

cca9824fd10fa5c Wesley Cheng   2023-05-09  2354  	}
c99b38c41234305 Mathias Nyman  2024-01-02  2355  	spin_unlock_irq(&xhci->lock);
c99b38c41234305 Mathias Nyman  2024-01-02  2356  
c99b38c41234305 Mathias Nyman  2024-01-02  2357  	if (err) {
c99b38c41234305 Mathias Nyman  2024-01-02  2358  		xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
c99b38c41234305 Mathias Nyman  2024-01-02  2359  			  xhci->max_interrupters);
c99b38c41234305 Mathias Nyman  2024-01-02  2360  		xhci_free_interrupter(xhci, ir);
c99b38c41234305 Mathias Nyman  2024-01-02  2361  		return NULL;
c99b38c41234305 Mathias Nyman  2024-01-02  2362  	}
c99b38c41234305 Mathias Nyman  2024-01-02  2363  
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2364  	err = xhci_set_interrupter_moderation(ir, imod_interval);
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2365  	if (err)
9c0c11bb87b09a8 Mathias Nyman  2024-09-05 @2366  		xhci_warn(xhci, "Failed to set interrupter %d moderation to %uns\n",
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2367  			  i, imod_interval);
                                                                          ^
uninitialized

9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2368  
c99b38c41234305 Mathias Nyman  2024-01-02  2369  	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
cca9824fd10fa5c Wesley Cheng   2023-05-09  2370  		 ir->intr_num, xhci->max_interrupters);
c99b38c41234305 Mathias Nyman  2024-01-02  2371  
c99b38c41234305 Mathias Nyman  2024-01-02  2372  	return ir;
c99b38c41234305 Mathias Nyman  2024-01-02  2373  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

