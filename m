Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419621798F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732958619; cv=none; b=eb1l6E39aZld/dFxtdlQdxxoztkK2Q7+8bgF52rwOcdjeoJ6YrKMSDwhg2Lm3fzoy8lsDyhtcghpPIniJnm3VgJNgYLIdyJ1Huy2nSODEhpK2TdvR9DT0t/2wptBZ6UE8SKDMMPFiN8l7fzLbNOWfH4mZmQArdMSCKPwJSeKM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732958619; c=relaxed/simple;
	bh=2OUJ9SDYuxvrAszaGJx5goSgwzTBjfsfjjDOxlDI73o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oWqWs9jXs3k+4V8lFOxXUdPvy5SLL3p3Dhmnr9d0UmkTmvkah+8qdmd5J6fS7vk5oj6jXzh5wjvG5w8OTUbrWgYavbxLMf2cSKahM+w7LIkjevTQVV3zDPI1VAUpC8nT4e4D8JuT2HanYHnEUcQqAn5+/1tAC/MiLy3rh4mR+EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F079CVNE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F079CVNE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so2910800a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 01:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732958615; x=1733563415; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNn0N9jDq1p/ntWtIe2lUxsxzv49kXbS9L8bGEae5TY=;
        b=F079CVNEJF0bpBOoT2JEN6RXltfd59MC1taE2zHZRN7iU6V8sS3WvNrEGIcAyrX5Vr
         jSD51n+K4o1sJK18dwYKqFyMDCOHFvOHUg9PUA/eXsYFKjPPvVA4soYB/3wEn9pBw5X5
         EQr5UeVVCsgK4BV5dmXUAuPhEbgTrUBr65R05Kx4qtvdL8NbudOY4k5SVJJkbIX45zne
         SGWv+irVWnNdl4osW0dFbGXXKtVhj4tr6LT++XZE4Po2lgMKTOCjZOlH9iS8IEeaz1BE
         om/DM97H9Ui9wUMEwhQK5/AwxjaLzKsC2ZD0Ucf/PdU/mY/3gJBBEo7n5tge7Z2M3jfk
         v3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732958615; x=1733563415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNn0N9jDq1p/ntWtIe2lUxsxzv49kXbS9L8bGEae5TY=;
        b=ZPq0iLBdo2DFmoWwktup/cd1RfHILfD31iDOmwvkKlu6B+1jAfolM5frPSbvkpYyfr
         EKWlljAU/4G6xfX1OzVIIkS8nkuamk2SKbUvmhmcmP804AJcmNnOmprfgxvZnYMj9Wsr
         R7xpvlWmMhrwwyeAuMmKaapN4yBWNb8lXWi6kMng2jUxmigUcfPe8E8N1Wff28BuFAGM
         zcDuze3scQFRC/3tHzutrMxt8Jz3vCGvZ0QSHTjO1gaunp7JfQG1j7U9Zl4fWI+xkOqN
         x55n8PgqVFkdo38+FxWThyuLocgNdYYKTMJyloBdWe06vp/+sxvRCCWaC3G1uh1dvKNi
         AiwA==
X-Forwarded-Encrypted: i=1; AJvYcCX5duO8f+kCJjGhn4gy4BK9Cj3gEuLOzSZriiwHxQz9FHwjEyp6pkSrix5F+Yan3awHOnHjfiNFxfCyaE5V@lists.linux.dev
X-Gm-Message-State: AOJu0YyOtO10cJ1wP89j7m/uxDMZyZeeBhNSGaR6FU3i1jWg59Si/fFP
	gi91/wfAwsSl7tmpeZKoMYI0b9W9KnOSARrG9Oq3TrqKZC9Z+EbyIQOQE+EKptHKks4LA9ItC+r
	2TM+2tQ==
X-Gm-Gg: ASbGncsfY3wny4GsuxpwUSb17V2SJQ0dKydAMcHlzY9gGrWvZd+EsjTUheldREORRy9
	g2kGts3dlNBxYrx1W4/a18mtzVkqz6oOAhP3v/N/rkGl6EenZkhaXUSAiDk2XCGSaUY9pZyWgNQ
	BPCvZxbJIm2xyZPPEzIjASnEihv+id9iYsD5liPzj9FevubJ/PhhWLZbolmw4cJMmla3YlldDUu
	vSYaWKadpn+CWDY3evLeJSbgy53fW6lsMH+anemF2gZItq3Ros=
X-Google-Smtp-Source: AGHT+IExn+HuCRy5UB+VuKnRtU4BZvaKp3wYwlJ79i9R5J2BE7cmWFVMlJ7YAf6e6Ov5l7d8xM339Q==
X-Received: by 2002:a05:6402:43c9:b0:5d0:c649:b2ba with SMTP id 4fb4d7f45d1cf-5d0c649bb5bmr4090706a12.32.1732958615549;
        Sat, 30 Nov 2024 01:23:35 -0800 (PST)
Received: from localhost ([41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d098330dd2sm2680751a12.14.2024.11.30.01.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 01:23:35 -0800 (PST)
Date: Sat, 30 Nov 2024 12:23:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 89/98] fs/xfs/xfs_fsops.c:346 xfs_growfs_data()
 warn: inconsistent returns '&mp->m_growlock'.
Message-ID: <3d59369c-6c9f-4e95-b754-1c9998c96097@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   1d218c27f2f5a8c87669b49292f1fd3432112426
commit: a37a349d7a21f1c61dc54c5771a81aee04a265cd [89/98] xfs: don't allow growfs of the data device with internal RT device
config: x86_64-randconfig-161-20241123 (https://download.01.org/0day-ci/archive/20241123/202411232011.Zes6bDSz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411232011.Zes6bDSz-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_fsops.c:346 xfs_growfs_data() warn: inconsistent returns '&mp->m_growlock'.

vim +346 fs/xfs/xfs_fsops.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  298  int
^1da177e4c3f41 Linus Torvalds      2005-04-16  299  xfs_growfs_data(
87444b8c267a5c Dave Chinner        2018-05-13  300  	struct xfs_mount	*mp,
87444b8c267a5c Dave Chinner        2018-05-13  301  	struct xfs_growfs_data	*in)
^1da177e4c3f41 Linus Torvalds      2005-04-16  302  {
87444b8c267a5c Dave Chinner        2018-05-13  303  	int			error = 0;
743bb4650da9e2 sandeen@sandeen.net 2008-11-25  304  
743bb4650da9e2 sandeen@sandeen.net 2008-11-25  305  	if (!capable(CAP_SYS_ADMIN))
2451337dd04390 Dave Chinner        2014-06-25  306  		return -EPERM;
cc92e7ac8d9641 Christoph Hellwig   2007-08-30  307  	if (!mutex_trylock(&mp->m_growlock))
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

2451337dd04390 Dave Chinner        2014-06-25  308  		return -EWOULDBLOCK;
87444b8c267a5c Dave Chinner        2018-05-13  309  
a37a349d7a21f1 Christoph Hellwig   2024-11-22  310  	/* we can't grow the data section when an internal RT section exists */
a37a349d7a21f1 Christoph Hellwig   2024-11-22  311  	if (in->newblocks != mp->m_sb.sb_dblocks && mp->m_sb.sb_rtstart)
a37a349d7a21f1 Christoph Hellwig   2024-11-22  312  		return -EINVAL;

Needs to unlock before returning.

a37a349d7a21f1 Christoph Hellwig   2024-11-22  313  
87444b8c267a5c Dave Chinner        2018-05-13  314  	/* update imaxpct separately to the physical grow of the filesystem */
87444b8c267a5c Dave Chinner        2018-05-13  315  	if (in->imaxpct != mp->m_sb.sb_imax_pct) {
87444b8c267a5c Dave Chinner        2018-05-13  316  		error = xfs_growfs_imaxpct(mp, in->imaxpct);
87444b8c267a5c Dave Chinner        2018-05-13  317  		if (error)
87444b8c267a5c Dave Chinner        2018-05-13  318  			goto out_error;
87444b8c267a5c Dave Chinner        2018-05-13  319  	}
87444b8c267a5c Dave Chinner        2018-05-13  320  
87444b8c267a5c Dave Chinner        2018-05-13  321  	if (in->newblocks != mp->m_sb.sb_dblocks) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  322  		error = xfs_growfs_data_private(mp, in);
87444b8c267a5c Dave Chinner        2018-05-13  323  		if (error)
87444b8c267a5c Dave Chinner        2018-05-13  324  			goto out_error;
87444b8c267a5c Dave Chinner        2018-05-13  325  	}
87444b8c267a5c Dave Chinner        2018-05-13  326  
87444b8c267a5c Dave Chinner        2018-05-13  327  	/* Post growfs calculations needed to reflect new state in operations */
87444b8c267a5c Dave Chinner        2018-05-13  328  	if (mp->m_sb.sb_imax_pct) {
87444b8c267a5c Dave Chinner        2018-05-13  329  		uint64_t icount = mp->m_sb.sb_dblocks * mp->m_sb.sb_imax_pct;
87444b8c267a5c Dave Chinner        2018-05-13  330  		do_div(icount, 100);
ef325959993edd Darrick J. Wong     2019-06-05  331  		M_IGEO(mp)->maxicount = XFS_FSB_TO_INO(mp, icount);
87444b8c267a5c Dave Chinner        2018-05-13  332  	} else
ef325959993edd Darrick J. Wong     2019-06-05  333  		M_IGEO(mp)->maxicount = 0;
87444b8c267a5c Dave Chinner        2018-05-13  334  
83a7f86e39ff5d Dave Chinner        2018-05-13  335  	/* Update secondary superblocks now the physical grow has completed */
b16817b66b6c97 Dave Chinner        2018-05-13  336  	error = xfs_update_secondary_sbs(mp);
83a7f86e39ff5d Dave Chinner        2018-05-13  337  
87444b8c267a5c Dave Chinner        2018-05-13  338  out_error:
527851124d10f9 Christoph Hellwig   2015-02-16  339  	/*
527851124d10f9 Christoph Hellwig   2015-02-16  340  	 * Increment the generation unconditionally, the error could be from
527851124d10f9 Christoph Hellwig   2015-02-16  341  	 * updating the secondary superblocks, in which case the new size
527851124d10f9 Christoph Hellwig   2015-02-16  342  	 * is live already.
527851124d10f9 Christoph Hellwig   2015-02-16  343  	 */
527851124d10f9 Christoph Hellwig   2015-02-16  344  	mp->m_generation++;
cc92e7ac8d9641 Christoph Hellwig   2007-08-30  345  	mutex_unlock(&mp->m_growlock);
^1da177e4c3f41 Linus Torvalds      2005-04-16 @346  	return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  347  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

