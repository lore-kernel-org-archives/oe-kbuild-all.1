Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D5173
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753976718; cv=none; b=odUts8a5SqArLzhvsH2G2/IU2T0vq+VnTdmSOcCESxrTPUNH80GI0pdCJeM+Ds5/8LhJK/5bANMz9wjH4g1w9yPUjv6y1FOSc8xuWUFzmtxY+lKaaix/Ioh9xLLz3oFkOjDTdNTfVhNqV7gq/H4xmwd1ScCBRRJXemkEeJk8bjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753976718; c=relaxed/simple;
	bh=jZlOt1YZkVCFwV07TI+TAfO2Qv0hXeA8f+UU9YjpSgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sAsBXQdvyQE4Qjp2aq+i7k3ve7nAk8JkTc7UbiuS4zzh7mFGlpcwujkVg7xDspQRHlo40Fs5IsFKPpFqoiAxJaTGJo0I6l06PypM1LymQgwb4qLQKKMw0PfxpLYLoCh4NREyHTqVtqEqWvWfTjsK7Y3ebMJ9VMwaogCdHoqxeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sgPqSbwz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sgPqSbwz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b7961cf660so871597f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753976715; x=1754581515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ja/Or7TtQWbgvEBjUvVLczjO5A/ZgQzAqJjlnzQL2m4=;
        b=sgPqSbwzDpl3wup8GJ7vy2frO65IfIyhUpLLivrh+DgL9FCvY/Yt5OHGOqm0p15Kdu
         25wE9AVUGNZpF3Wr3FWhFbpo520S9oWnjVGKzUBPQ63s9M1kkWxd7Le1HF+vmBCoeWtF
         6NlKjqVZP+n6rIvWjSUuzhSrL8jgWH0ByuhvgSE4C/uya7mO7dsoNlw8BBZElnhpo0FK
         r1wOAz3nWyRwcHvxm5t4Yrg41OEGv1Y4BzEYmcR9OriZq0BXd911HM3TVxqFbxUbWvY3
         AUXPNITwcHp7l2LFQmzhQ8cJXpnLnSPdRhLlKAU5R7HfdP4qGlRXwaveNNf3NUsisVlN
         Nqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976715; x=1754581515;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ja/Or7TtQWbgvEBjUvVLczjO5A/ZgQzAqJjlnzQL2m4=;
        b=N1hU9UdRcsgoWM0z264WXPTHdRskhZRvucGcZWnaao3XPB3xFevYpbsLej1eFWhVYV
         T7riKT54AJt6RR3/DPV9UIlthx4szs7xfgVnlPyweC4kiSDpFXYEJyWg+5XUaUkgUXn5
         0d/r5GZp7ljGFb2c4jUxTJ7uTgRxbDvcl3Y7Ib4pgUxmlIF01RgxaQZ2mIJT0RX/n3eF
         3ErlcZfkI9mx/oNr9bQQI5l8Dq/BZA/0C9KBI2AGGGaiLWacGOL9UxwibHpZnMM8Q0tc
         FQOtu1m1X2I47YIQZjaQ+Ffchtrejx+LJb44xmD409uUGcJho/28x7wIxgOoSr7D279E
         Poug==
X-Forwarded-Encrypted: i=1; AJvYcCXG7XuGccM5Y5ak4yT0mfZVzmx7emZBxvbiK8EIcjUMPZA9xLknVFtSLORN9GlCEw+zaA7Vy1DTmoAJEhAE@lists.linux.dev
X-Gm-Message-State: AOJu0YwS8a6icQXmogHW+SoEls0nToCFjHW9S/lKBI8PV+ihLvSfxqCb
	w4AD+j+x8zXfWdvbU1k1yVrA5fk3kAcREOoVcu98YCckRnXvsY2QpxTjtsyUgozS8QI=
X-Gm-Gg: ASbGncuIQyjI4trTTd7JAY//mlCFfAMxT6aZAFxhrRyPQyruvtOkqaLuPyHr8nBRvPe
	puB527VSr6hvYitOCTOc2aUi3laPrQExWF5/Mu7b4xWmvqskVYyBkGgC/RgCMHolUWCsp0GKiSd
	rEdPLPfqAwCAySu/e/6onfKXUXca2KQqGi3Ftu+a98oNRU82HZsRMfVrdFZqDaEQFDRY6s0V2nH
	SCRCq36r0GkETOCqPFlavYunSlseo7cNgBJCeTHYPdiHAD0Firlo+1prGKfD/bYzW+8n8OUEipZ
	lU0bvd03lm4+EFiQHqHhwMEf9lGbrsuqviAD1sp9IdXGk/R/+2gO/S3cgHort2fMwkFwtp23Xdf
	1kUm44nU/MvWt4U/gqdaR0zNwOIQ=
X-Google-Smtp-Source: AGHT+IHhJG3LfxP6KYv87rmvm8BnH4eV9UZ3r9hVeSwsBncQIEv9CMsfvZuSXXuKKKjdvWf4dmJKKg==
X-Received: by 2002:a05:6000:188c:b0:3b7:9dde:2a8 with SMTP id ffacd0b85a97d-3b79dde085cmr2503864f8f.35.1753976714859;
        Thu, 31 Jul 2025 08:45:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453d6esm2803852f8f.37.2025.07.31.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:45:14 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:45:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Salomon Dushimirimana <salomondush@google.com>, bvanassche@acm.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	James.Bottomley@hansenpartnership.com, kashyap.desai@broadcom.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, mpi3mr-linuxdrv.pdl@broadcom.com,
	salomondush@google.com, sathya.prakash@broadcom.com,
	sreekanth.reddy@broadcom.com, sumit.saxena@broadcom.com
Subject: Re: [PATCH v2] scsi: mpi3mr: Emit uevent on controller diagnostic
 fault
Message-ID: <ba460132-50b0-4b77-b12a-4b9097b93fd9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717194025.3218107-1-salomondush@google.com>

Hi Salomon,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Salomon-Dushimirimana/scsi-mpi3mr-Emit-uevent-on-controller-diagnostic-fault/20250718-034234
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250717194025.3218107-1-salomondush%40google.com
patch subject: [PATCH v2] scsi: mpi3mr: Emit uevent on controller diagnostic fault
config: x86_64-randconfig-161-20250720 (https://download.01.org/0day-ci/archive/20250721/202507211423.eXWSnhP5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507211423.eXWSnhP5-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1639 mpi3mr_fault_uevent_emit() error: uninitialized symbol 'env'.

vim +/env +1639 drivers/scsi/mpi3mr/mpi3mr_fw.c

8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1636  static void mpi3mr_fault_uevent_emit(struct mpi3mr_ioc *mrioc, u16 reset_type,
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1637  	u16 reset_reason)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1638  {
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17 @1639  	struct kobj_uevent_env *env __free(kfree);

This has to be initialized before we return

8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1640  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1641  	if (reset_type != MPI3_SYSIF_HOST_DIAG_RESET_ACTION_DIAG_FAULT)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1642  		return;

otherwise this is an uninitialized variable at this return.

8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1643  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1644  	env = kzalloc(sizeof(*env), GFP_KERNEL);
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1645  	if (!env)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1646  		return;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

