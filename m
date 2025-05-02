Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BD517B421
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170398; cv=none; b=cLx46m5iYxbrQIUtP4rGsIaBNR4UwNjUg5YdvTI9JP5JI8TUVQ56Ds6+ZVRS0kBxGQmk9WMc9tFRqj3E/5KY1eJFJ0bm5PIHqtMNzq09BEM70E9snSAv6++BanpcHWzPdSdrJhD9OlCvKGbQxs0QfpXJz1oyf67HrSMtBHH5Uzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170398; c=relaxed/simple;
	bh=7svvXKZyt3CpDllEutMwF7i7TxexA5q2cPidV80T7KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPW2Q/EcJlDOZnaAIbYmq4VtoXoEtt0fhgBBBOJw8seOKaORVztGYwm/G6sYJyqHnUO1UutCwp4mBV5VHYMQVJmTviSPjGSbNrXo2WvCFxTp4MkRzqiqPjF+kwzBHJgRDRXqRKwpz1LgaOu04myuobeULfQG4R9+fjheHCkh1Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EssGAf1Z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EssGAf1Z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso8824485e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 02 May 2025 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746170395; x=1746775195; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoAPJg2r5FlDefbebBm+I95ftEidF+IQG+sXrrq12+4=;
        b=EssGAf1ZAu1GSG1SI1r7W7qoyF+8+xnPLF2bX2xhPI2E9OeFLpkJfYMYTvAHs5uF0+
         7aPm6B/Hzf2ftluuWYB6KXIsxPfMc+650t4oNWn0m/ZqYCpy2WmjW4OS4hK5Ghs+hN95
         h+ixbkwSBqU+oPJgDr8ifPqC/zYxZUt9YVFkj7WFmR6Uxk3jHIkWdRktNIDJXdRYZzDQ
         TXv73gRUOhQVWD69/pwcon20NwdXUTRmvlj7JduVO0hfenr9EHOdqEphNUUOkTmA+Ew5
         iNPVQN1gpM7fG63jKyxH66qLxSAMOGDgwUkvgjAKfa7yUZqYqqFxQCOEfgVxejQhVQy3
         bRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170395; x=1746775195;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoAPJg2r5FlDefbebBm+I95ftEidF+IQG+sXrrq12+4=;
        b=dao5b+vlxmsUPpeuZ4TeZWfoKp/OB9c2kylWCsnEa01+l6s3lGv8BRwVn1JERChC39
         nQPSsZ4q6Oohv/S4cUklF/edehZiefeWcGAvHaG5/DbyZtDSpO3vfZF2P9vDKPJXtZEA
         ZCeNEfKYmz7M+EyIcyHurm5KFTtXfRGrP3VJK3pgfOPRcG+E5eR4Taf/MDjC25UI/wG8
         /laZmL9/FhBg38zLbPHCyD/4934N4Z/dVYaJ5IiLAnaTqZINCXtYaKhBMW/4ApNr/F9B
         6OQDNodF9n7+R+1AbEo24ZIhgYUHFMTo09Tf+YM8vuaW9/ClBPwqyvy9Sd2juOdMgKc/
         x8PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsmkOIUEFfZ5spZfAyz/g8u80VD89ERtpijBiyeI4vCAKauyJWmQN4r0n6K3i3oyxOH67uZZR9LjcJCAF5@lists.linux.dev
X-Gm-Message-State: AOJu0YzcYpT++ApBvnVgSOgRKKF/XuqzzlI1/MrTbGOD4C/x7GxumM9T
	tJIdEPVzxame+QwBwOJRKcZCm8fwh1W3w6b75PKrR2saDKyRKTSnBQQ+9bhnQwQ=
X-Gm-Gg: ASbGnct8BXXMG+3W7n9TWTRR0bATOPoUcxi42l1RxeNnhOxSpVQMJGPaWQXRWiPof8T
	oODNZqvvL4/T6498iV0gP/e6J0WVTGUpSWFunj2HPyKMQJ/mBVFLPK1pR87XMIevyqzSQxdnE9x
	me2zetYu78FkUCB1cXDQ9wBRhivFC2vyHbWeTkS7YcWQ/jb0B4RB16os1r7tilBYE+2fx4KdoL5
	JqBLSc3HjGA0GeLBAoiuuGOBok6iwnbgamOouhDXs91LOWFFfOb41xWVmn6ur4BmaxQUJYeryLF
	2xS1AaOOts/GX6feeA5ycCijwcVp0VUj4PN4/jw6bOocNg==
X-Google-Smtp-Source: AGHT+IGDXqkfe1u2yqMqpOu/6VDE/AYit1pb3gLMDmFZ8TpsxF7u4SMYespa5oXz9q5Gnr1AdFduxQ==
X-Received: by 2002:a05:600c:3495:b0:43d:585f:ebf5 with SMTP id 5b1f17b1804b1-441bbea0d60mr11313255e9.1.1746170395366;
        Fri, 02 May 2025 00:19:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a315c8sm34682415e9.35.2025.05.02.00.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:19:54 -0700 (PDT)
Date: Fri, 2 May 2025 10:19:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [isilence:tx-tstamp 5/8] io_uring/poll.c:713 io_arm_poll_handler()
 warn: if statement not indented
Message-ID: <202505021022.SUf8vLiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux tx-tstamp
head:   6f5b01cc66b200d99c494caaa62f429268923263
commit: 275ff22a8d4d1524bbf3b6514af8ab291d682a6b [5/8] io_uring/poll: introduce io_arm_apoll()
config: x86_64-randconfig-161-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021022.SUf8vLiH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505021022.SUf8vLiH-lkp@intel.com/

smatch warnings:
io_uring/poll.c:713 io_arm_poll_handler() warn: if statement not indented

vim +713 io_uring/poll.c

275ff22a8d4d15 Pavel Begunkov 2025-04-27  699  int io_arm_poll_handler(struct io_kiocb *req, unsigned issue_flags)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  700  {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  701  	const struct io_issue_def *def = &io_issue_defs[req->opcode];
275ff22a8d4d15 Pavel Begunkov 2025-04-27  702  	__poll_t mask = POLLPRI | POLLERR | EPOLLET;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  703  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  704  	if (!def->pollin && !def->pollout)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  705  		return IO_APOLL_ABORTED;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  706  	if (!io_file_can_poll(req))
275ff22a8d4d15 Pavel Begunkov 2025-04-27  707  		return IO_APOLL_ABORTED;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  708  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  709  	if (def->pollin) {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  710  		mask |= EPOLLIN | EPOLLRDNORM;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  711  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  712  		/* If reading from MSG_ERRQUEUE using recvmsg, ignore POLLIN */
275ff22a8d4d15 Pavel Begunkov 2025-04-27 @713  		if (req->flags & REQ_F_CLEAR_POLLIN)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  714  		mask &= ~EPOLLIN;

Missing tab.

275ff22a8d4d15 Pavel Begunkov 2025-04-27  715  	} else {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  716  		mask |= EPOLLOUT | EPOLLWRNORM;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  717  	}
275ff22a8d4d15 Pavel Begunkov 2025-04-27  718  	if (def->poll_exclusive)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  719  		mask |= EPOLLEXCLUSIVE;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  720  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  721  	return io_arm_apoll(req, issue_flags, mask);
275ff22a8d4d15 Pavel Begunkov 2025-04-27  722  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

