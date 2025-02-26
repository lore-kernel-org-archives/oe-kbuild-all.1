Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A176638DEC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740572661; cv=none; b=UyKF80elmOgN+vk1yJX4h0jFxD06s2Ihfhf9kfAgVTFg9QfHtwXV9eZZSPnUxYOlUvHVEXYX7Qv9TQnHvz+JDuNtnD0uHswe77ub0IS2mtCADL06TuCH/KGVRoq+imtAE3Rv7k+FG850qW6ALrPnFmO85pHNdA1r39wbJgAm/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740572661; c=relaxed/simple;
	bh=p4wskjtaUQalolk+YDzqMbSW/EUxw+55kjrNjPdln0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJ/iHm7qahpWCroBybrReU0jsGaTkEBC/+q0LJTaoo6XX+Uc4AYzlj9y7RqwB2Ed4wJvNLEbGdbWvrDMNWFe2ewzymy2ObpFtwfri7Ts8d+30v90cz32OJojcVMs1QIAmNzCiv81dxMfUXQq5Z7y09akkyfNM0AYRUU7qo6XDLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=th3uRBY9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="th3uRBY9"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb75200275so1066194766b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740572658; x=1741177458; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gapap2aBRf1h6cQe4xlskXBvL663hc92Uuk/zeFcE2I=;
        b=th3uRBY9tDT+2jP9+bB12an5dL4FSLk6LgOt1TqlTehThNA7ZTW+I6j1qckB1jp9cf
         205njH1qp17snLSW5cs+5sapEdid2Ye/NYDHNlD+99oQcBA56S5XjzYc0l97inBMjsnL
         qCbXu+NF3KP/SnuGQ/qd+lgghVx2h6XN/eNQ3FkQ5Fr6RN5y7fLHzaaUp/kodsHoilgQ
         oorbQlhB4re5neIPcC7hFcDjclf81d9zyqtbkFp8Q4k3ow+CTuJ6U8940RqO7R7kNnJo
         E67qdNRppZxuR9LXSyHrRfizDl4TjVkUpHgAizLK1F6IxDF9vmSMifbBAbRl/mCDy4qY
         PNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740572658; x=1741177458;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gapap2aBRf1h6cQe4xlskXBvL663hc92Uuk/zeFcE2I=;
        b=e2olnKOkmcnX4eLq7XWoNLn1VMFcGVXEfclb2X2xXh1BNqJApxWF1AmCkJ5epc1Wvf
         KWv3w+sV/tjQc04kTr3/Kzc2lYG0llQiDWPApXb+QSJWr87M6u181IzhO4uU/oTeC9wi
         Nsp4UPd15Z73m8B0KeuZYJ1w4zcR///jS74V9XFjlo+YBTSFowGKwzAuT/WYPHVpoo9N
         0nZ1CJZov7ifsKyZQ1jEXAC0bPpjWYeQXon29jV1Re8iYjBiL1SZQPZGmJLw9MV7+wqp
         RPL3Iap3eKq1/ZIJfLYo/2AmZg9oshulOEhNA/DdvA2nlCIIkd40PrAswMfdEnILAt8G
         T5sA==
X-Forwarded-Encrypted: i=1; AJvYcCXkG471R94F0t0xuHCyGfFW2NRHjHyQ/qjlr6NQpG9dSgh5QfRWh06v83Wj1CQNwky2ol4Q21npxlDdG4mv@lists.linux.dev
X-Gm-Message-State: AOJu0YwE1C4EX8nmj1qbgkkadcUZg3q2gc7ys+6HEOc/gfRtf7TeUMtQ
	iOV/2pMJPu0cb2WRm7ocNSEIq1dW9XYcTY0o9Etfq/ROdD+zsTEhKb/SXMfv8Lc=
X-Gm-Gg: ASbGnctqK4lk6Q7ZB2ZApb09mgR0seqHAII+O6ptZlPlrb0cG6JViTDpVX34F1Puy+M
	fnV18Yine+9t02ZOx9PJCJ6GoP8jSelRDw+eA6ky7LRnGhWvuCPRJr8utXh4SpaFQtTBJIkMTw+
	Nk2ifHHNTuoWedVeA96op49g8ky7z7B45uz5HDSKzLVSfBbg2LXrMByvbqg3cXi6C9W+sydO2sb
	dlgj+sit4Jy/Xknv2gCNvzMe8Stgngzo+WE/5sIm8Ooj+pDKUAjAQNsjkx2OSTQlROkAGR1IgH+
	nKEsfOn2x2ut9YskrDkc4FqhKZKHIdk=
X-Google-Smtp-Source: AGHT+IGG2LHMKCmF0Mh8CeDHMUqDHSPKYHZVp2iyb4eASid0jH+2rnwW5djy+auf94DhXE47zqxuCw==
X-Received: by 2002:a17:907:784e:b0:ab7:ec84:10af with SMTP id a640c23a62f3a-abc09a08e6fmr1813523466b.16.1740572656287;
        Wed, 26 Feb 2025 04:24:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed205398dsm319080166b.141.2025.02.26.04.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:24:15 -0800 (PST)
Date: Wed, 26 Feb 2025 15:24:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6012/6583] fs/namespace.c:4442
 __do_sys_move_mount() error: uninitialized symbol 'uflags'.
Message-ID: <3908ce12-4db7-4408-9d5e-98ad94c141dd@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: b1e9423d65e330346f9e80e819872ab66f1e35b6 [6012/6583] fs: support getname_maybe_null() in move_mount()
config: x86_64-randconfig-161-20250226 (https://download.01.org/0day-ci/archive/20250226/202502262044.uRrhoaDw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502262044.uRrhoaDw-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4442 __do_sys_move_mount() error: uninitialized symbol 'uflags'.
fs/namespace.c:4442 __do_sys_move_mount() error: uninitialized symbol 'uflags'.

vim +/uflags +4442 fs/namespace.c

2db154b3ea8e14 David Howells     2018-11-05  4412  SYSCALL_DEFINE5(move_mount,
2658ce095df583 Ben Dooks         2019-10-15  4413  		int, from_dfd, const char __user *, from_pathname,
2658ce095df583 Ben Dooks         2019-10-15  4414  		int, to_dfd, const char __user *, to_pathname,
2db154b3ea8e14 David Howells     2018-11-05  4415  		unsigned int, flags)
2db154b3ea8e14 David Howells     2018-11-05  4416  {
b1e9423d65e330 Christian Brauner 2025-02-21  4417  	struct path to_path __free(path_put) = {};
b1e9423d65e330 Christian Brauner 2025-02-21  4418  	struct path from_path __free(path_put) = {};
b1e9423d65e330 Christian Brauner 2025-02-21  4419  	struct filename *to_name __free(putname) = NULL;
b1e9423d65e330 Christian Brauner 2025-02-21  4420  	struct filename *from_name __free(putname) = NULL;
b1e9423d65e330 Christian Brauner 2025-02-21  4421  	unsigned int lflags, uflags;
b1e9423d65e330 Christian Brauner 2025-02-21  4422  	enum mnt_tree_flags_t mflags = 0;
2db154b3ea8e14 David Howells     2018-11-05  4423  	int ret = 0;
2db154b3ea8e14 David Howells     2018-11-05  4424  
2db154b3ea8e14 David Howells     2018-11-05  4425  	if (!may_mount())
2db154b3ea8e14 David Howells     2018-11-05  4426  		return -EPERM;
2db154b3ea8e14 David Howells     2018-11-05  4427  
2db154b3ea8e14 David Howells     2018-11-05  4428  	if (flags & ~MOVE_MOUNT__MASK)
2db154b3ea8e14 David Howells     2018-11-05  4429  		return -EINVAL;
2db154b3ea8e14 David Howells     2018-11-05  4430  
6ac392815628f3 Christian Brauner 2023-05-03  4431  	if ((flags & (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP)) ==
6ac392815628f3 Christian Brauner 2023-05-03  4432  	    (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP))
6ac392815628f3 Christian Brauner 2023-05-03  4433  		return -EINVAL;
6ac392815628f3 Christian Brauner 2023-05-03  4434  
b1e9423d65e330 Christian Brauner 2025-02-21  4435  	if (flags & MOVE_MOUNT_SET_GROUP)	mflags |= MNT_TREE_PROPAGATION;
b1e9423d65e330 Christian Brauner 2025-02-21  4436  	if (flags & MOVE_MOUNT_BENEATH)		mflags |= MNT_TREE_BENEATH;
b1e9423d65e330 Christian Brauner 2025-02-21  4437  
2db154b3ea8e14 David Howells     2018-11-05  4438  	lflags = 0;
2db154b3ea8e14 David Howells     2018-11-05  4439  	if (flags & MOVE_MOUNT_F_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
2db154b3ea8e14 David Howells     2018-11-05  4440  	if (flags & MOVE_MOUNT_F_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
b1e9423d65e330 Christian Brauner 2025-02-21  4441  	if (flags & MOVE_MOUNT_F_EMPTY_PATH)	uflags = AT_EMPTY_PATH;

uflags is uninitialized on the else path.

b1e9423d65e330 Christian Brauner 2025-02-21 @4442  	from_name = getname_maybe_null(from_pathname, uflags);
b1e9423d65e330 Christian Brauner 2025-02-21  4443  	if (IS_ERR(from_name))
b1e9423d65e330 Christian Brauner 2025-02-21  4444  		return PTR_ERR(from_name);
2db154b3ea8e14 David Howells     2018-11-05  4445  
2db154b3ea8e14 David Howells     2018-11-05  4446  	lflags = 0;
2db154b3ea8e14 David Howells     2018-11-05  4447  	if (flags & MOVE_MOUNT_T_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
2db154b3ea8e14 David Howells     2018-11-05  4448  	if (flags & MOVE_MOUNT_T_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
b1e9423d65e330 Christian Brauner 2025-02-21  4449  	if (flags & MOVE_MOUNT_T_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
b1e9423d65e330 Christian Brauner 2025-02-21  4450  	to_name = getname_maybe_null(to_pathname, uflags);
b1e9423d65e330 Christian Brauner 2025-02-21  4451  	if (IS_ERR(to_name))
b1e9423d65e330 Christian Brauner 2025-02-21  4452  		return PTR_ERR(to_name);
b1e9423d65e330 Christian Brauner 2025-02-21  4453  
b1e9423d65e330 Christian Brauner 2025-02-21  4454  	if (!to_name && to_dfd >= 0) {
b1e9423d65e330 Christian Brauner 2025-02-21  4455  		CLASS(fd_raw, f_to)(to_dfd);
b1e9423d65e330 Christian Brauner 2025-02-21  4456  		if (fd_empty(f_to))
b1e9423d65e330 Christian Brauner 2025-02-21  4457  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4458  
b1e9423d65e330 Christian Brauner 2025-02-21  4459  		to_path = fd_file(f_to)->f_path;
b1e9423d65e330 Christian Brauner 2025-02-21  4460  		path_get(&to_path);
b1e9423d65e330 Christian Brauner 2025-02-21  4461  	} else {
b1e9423d65e330 Christian Brauner 2025-02-21  4462  		ret = filename_lookup(to_dfd, to_name, lflags, &to_path, NULL);
b1e9423d65e330 Christian Brauner 2025-02-21  4463  		if (ret)
b1e9423d65e330 Christian Brauner 2025-02-21  4464  			return ret;
b1e9423d65e330 Christian Brauner 2025-02-21  4465  	}
2db154b3ea8e14 David Howells     2018-11-05  4466  
b1e9423d65e330 Christian Brauner 2025-02-21  4467  	if (!from_name && from_dfd >= 0) {
b1e9423d65e330 Christian Brauner 2025-02-21  4468  		CLASS(fd_raw, f_from)(from_dfd);
b1e9423d65e330 Christian Brauner 2025-02-21  4469  		if (fd_empty(f_from))
b1e9423d65e330 Christian Brauner 2025-02-21  4470  			return -EBADF;
2db154b3ea8e14 David Howells     2018-11-05  4471  
b1e9423d65e330 Christian Brauner 2025-02-21  4472  		return vfs_move_mount(&fd_file(f_from)->f_path, &to_path, mflags);
b1e9423d65e330 Christian Brauner 2025-02-21  4473  	}
2db154b3ea8e14 David Howells     2018-11-05  4474  
b1e9423d65e330 Christian Brauner 2025-02-21  4475  	ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
b1e9423d65e330 Christian Brauner 2025-02-21  4476  	if (ret)
2db154b3ea8e14 David Howells     2018-11-05  4477  		return ret;
b1e9423d65e330 Christian Brauner 2025-02-21  4478  
b1e9423d65e330 Christian Brauner 2025-02-21  4479  	return vfs_move_mount(&from_path, &to_path, mflags);
2db154b3ea8e14 David Howells     2018-11-05  4480  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

