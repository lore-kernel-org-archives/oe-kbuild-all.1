Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C02571A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755616156; cv=none; b=kQQpNj6PXYCzo9zLGn/jXZoRGx4trMph+sgKJ+2vWmGf0Ek8YQAesA1r0MonpHktveHxocNsqzev7jrByXK10VgtPueOgkqdd0WtIyy1z/YQiO73jC+Af2XXQNuUQOYLrGEkbt8l+RG1t6Qi8iiyC0h4WXdf0OZdKxY5KcVwGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755616156; c=relaxed/simple;
	bh=1KPpiQ8hagVxzaGyCUhCv9U4Ry9vUGyyrlz8+xXpZfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4CNZSBJnBu/M0TihSRT/tjmJLmRiKX1sx3/Gr2TH93XmpBZsrJzBMeHXLTNwb/MfV+TyxHdJzJMrw8k/Qg1srGUeZMCk77/TLS1tIggIIsKH5ZRMu9QRtgELLRTQ0oHCSFSrOLW6c9af/9MjUIpbH0e92BocD4ScVqvbn3GE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NnW6mdcQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NnW6mdcQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3bea24519c0so1252882f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755616152; x=1756220952; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7UPGoC7p7M4ZyxE/iJKUZfCO9/xK4vTK1yfysENQ4=;
        b=NnW6mdcQNFduupO1TAoMfsoCnQDpZloIn8Jz6lr4ofCo7ZcT4ty+Y6zMXTrA4OkAE2
         IafyT9bHz7tv6dTENP6nxuffGLKZrC5QqFQUddZ0eao+fIWmVZoRqRUeBk+tWO9VTRM6
         39CttkVWNm+xkcpqyutL2Rd5Tti6MMVP3DzIcrMgreysEXLINb/WYDRjG+1AwWaPd16m
         pPCHqE0Ln/Awu0/lV2Nh/0E5YaiNvkFfMtHLH5vAjZynv7/ILvc+XAhud+L8Rln7hH0d
         dOJT/lNqiwHUDefgitDfPVp2kFnlMP8NMsAufyjM1pWAK2Pmdb6JMOWf2nxpW81YEjOa
         LE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755616152; x=1756220952;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b7UPGoC7p7M4ZyxE/iJKUZfCO9/xK4vTK1yfysENQ4=;
        b=DPkLvxIt2QNYL0ijoV+CJMr7mx6FdliWv6PThOnDgDKtf6uR/johM6krLMkU0NtNF4
         J/FnAW5lDkhEWRlc7bzyt1OPJdb7tLXhkJDTiu10Dg09xvbGC/7gtjbTmedLIdipyTAa
         UFuFAFQzx71TllNWm/U7PCuke0pjqRQ6gtGKX4XKVT7uBGYG2E1VnGg6o1jB60rwQatT
         Q760Ioq09cytDXR7ySPv88wkS1gieKudjRuSh8mn5jk1jho0+PWJJW+7iBufUJKwkT+v
         Bl8UuZ6KJq00rx8vxg8Vq7odPV9Zf8bxZcP+kKiQ5rJUzsxVSKHCVR1RI9YxThs0zGHg
         fw/g==
X-Forwarded-Encrypted: i=1; AJvYcCU8XH6p7LrdAMokUyziwwBy6ClsRDHnDz011o3spkrfa1xB4cvVz192ujH+8l003u/DmzjI+TKQvV0OcBN2@lists.linux.dev
X-Gm-Message-State: AOJu0YyUwHJMKfoIXbVw2qnSVMnv5aU0cpXsU6gIc1PrghcBGRxfV/Cv
	WEdtumVfZf2n52nqAj5D9VvUJmAf4pTqQuMg5uqV+YfeM4nxZTfTh8b1OXvPtAE4MW8=
X-Gm-Gg: ASbGncv3El3dA4Nw+ypJ5VDOhR4KXKInh+bQxuo2YckAUG7tXyqlEeJL19iyxSgdSQV
	HOUU5D+7znzosKRsBtC9jW7PzfSfExS/0L/oHmv/rBF14b94NmbyNJc6TqzPyV684YaFEEmqVC3
	mV08v4sbSGiFoUzdVJUuWwQDqsR69JB7Al88O3xSgpyKPoPWjRef7o+uK4BtX2QdY+xqoI9j7XX
	D4NlDlPzLXcmaGS12hPS6FuAIxmG8y0HT5F8iqqQ7Ub5qXp0NJOpMOTQAw8FHW0Fgh1fjXVrANW
	4yBz88BkFPq3YZ8qcGDLyqJy3pcaYImR4k4dfb3hVgpqCQFl4NuYPbsPeqZiPdalE3zr0mNu0Hn
	CkAoB0/mHkt0dGhTx1Icou7yGGhjnfqvOwudajVKKFt0=
X-Google-Smtp-Source: AGHT+IE1viNjLGpD+HAtjEJG/zvJFF7kbam/xqYb7DdBJ1k+xCzcfb4DF0qP9aBktmah9XbwoOkVFQ==
X-Received: by 2002:a05:6000:18a5:b0:3b8:d8d1:1e72 with SMTP id ffacd0b85a97d-3c147fbe074mr2435307f8f.19.1755616152531;
        Tue, 19 Aug 2025 08:09:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074d43c77sm4218240f8f.23.2025.08.19.08.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:09:12 -0700 (PDT)
Date: Tue, 19 Aug 2025 18:09:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?utf-8?B?xaBlcmlm?= Rami <ramiserifpersia@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 17/18] sound/usb/usx2y/us144mkii_midi.c:65
 tascam_midi_in_urb_complete() error: we previously assumed 'tascam' could be
 null (see line 54)
Message-ID: <202508192109.lcMrINK1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   d9f0633867711cff87c5604a4f90daa8ab986e4f
commit: 0ec417aa85467c6fad0563621b74868be0faf00d [17/18] ALSA: usb-audio: Add infrastructure for TASCAM US-144MKII
config: powerpc64-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192109.lcMrINK1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508192109.lcMrINK1-lkp@intel.com/

smatch warnings:
sound/usb/usx2y/us144mkii_midi.c:65 tascam_midi_in_urb_complete() error: we previously assumed 'tascam' could be null (see line 54)

vim +/tascam +65 sound/usb/usx2y/us144mkii_midi.c

67afec157fe63d Šerif Rami 2025-08-14  38  
67afec157fe63d Šerif Rami 2025-08-14  39  void tascam_midi_in_urb_complete(struct urb *urb)
67afec157fe63d Šerif Rami 2025-08-14  40  {
67afec157fe63d Šerif Rami 2025-08-14  41  	struct tascam_card *tascam = urb->context;
67afec157fe63d Šerif Rami 2025-08-14  42  	int ret;
67afec157fe63d Šerif Rami 2025-08-14  43  
67afec157fe63d Šerif Rami 2025-08-14  44  	if (urb->status) {
67afec157fe63d Šerif Rami 2025-08-14  45  		if (urb->status != -ENOENT && urb->status != -ECONNRESET &&
67afec157fe63d Šerif Rami 2025-08-14  46  		    urb->status != -ESHUTDOWN && urb->status != -EPROTO) {
67afec157fe63d Šerif Rami 2025-08-14  47  			dev_err_ratelimited(tascam->card->dev,
                                                                                    ^^^^^^^^^^^^
Unchecked dereference.

67afec157fe63d Šerif Rami 2025-08-14  48  					    "MIDI IN URB failed: status %d\n",
67afec157fe63d Šerif Rami 2025-08-14  49  					    urb->status);
67afec157fe63d Šerif Rami 2025-08-14  50  		}
67afec157fe63d Šerif Rami 2025-08-14  51  		goto out;
67afec157fe63d Šerif Rami 2025-08-14  52  	}
67afec157fe63d Šerif Rami 2025-08-14  53  
67afec157fe63d Šerif Rami 2025-08-14 @54  	if (tascam && atomic_read(&tascam->midi_in_active) &&
                                                    ^^^^^^
Is this required?

67afec157fe63d Šerif Rami 2025-08-14  55  	    urb->actual_length > 0) {
67afec157fe63d Šerif Rami 2025-08-14  56  		kfifo_in_spinlocked(&tascam->midi_in_fifo, urb->transfer_buffer,
67afec157fe63d Šerif Rami 2025-08-14  57  				    urb->actual_length, &tascam->midi_in_lock);
67afec157fe63d Šerif Rami 2025-08-14  58  		schedule_work(&tascam->midi_in_work);
67afec157fe63d Šerif Rami 2025-08-14  59  	}
67afec157fe63d Šerif Rami 2025-08-14  60  
67afec157fe63d Šerif Rami 2025-08-14  61  	usb_get_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  62  	usb_anchor_urb(urb, &tascam->midi_in_anchor);
                                                                     ^^^^^^^^
Unchecked dereference.

67afec157fe63d Šerif Rami 2025-08-14  63  	ret = usb_submit_urb(urb, GFP_ATOMIC);
67afec157fe63d Šerif Rami 2025-08-14  64  	if (ret < 0) {
67afec157fe63d Šerif Rami 2025-08-14 @65  		dev_err(tascam->card->dev,
67afec157fe63d Šerif Rami 2025-08-14  66  			"Failed to resubmit MIDI IN URB: error %d\n", ret);
67afec157fe63d Šerif Rami 2025-08-14  67  		usb_unanchor_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  68  		usb_put_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  69  	}
67afec157fe63d Šerif Rami 2025-08-14  70  out:
67afec157fe63d Šerif Rami 2025-08-14  71  	usb_put_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  72  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

