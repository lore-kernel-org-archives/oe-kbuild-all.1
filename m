Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793B5231829
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389379; cv=none; b=q08CL2RldQv9J0XHi7xugdwTUlldxbJcGcximXrGHvtO8BSBw6btjcyAcX5NUBUiWRrBmnpZmyR/jgu7aZ6nV+bZXQWyZaVL0AV+ajSsPwlFZ7sbQO0r6AWpJ1GFPuMTTV6ck85Vt2rxWKq77Fke3wrr/5VQvNCmIHOHwyB8QmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389379; c=relaxed/simple;
	bh=YikUcAy44bVLKmJ4NKM/SGL3QQ3h1L6+b7Kk/rbMnwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6kugp/CVyKKilw9RWX6ivN8E891hLkXjZVOsnDke1wsZnFzKz0lwKb+mvtRWZ8EoLX8YOaGpRo7oTsgOIpHIHqCiwrsYim0uLoo/8hzKg1Vaero2zGua3k8UkvjZXil1vLik2jMUD/j3ccZ28WDophKd9BkhNEHbJ2NVYHqUoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pBEouPzw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBEouPzw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so1248966f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747389375; x=1747994175; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35iuGSg19HNEf/U+dvDwmkcAkhrHkl1GiGSFAGoPNXY=;
        b=pBEouPzw+3dVL9c4NQldjXifyFUVeskXEORrfElv6Eg366eKKFAlBTTcrAKB8OGRyL
         CxXZikllk5qELnK49Ivp3O5mHc7Cv2kVOqMtAJWwCbBMZJ1OOsRHH1NoPQm0op2G8ZPc
         JTv9G24BcJ0PsiXEOvnhPKyTiJxO7eAcLgeK5KwkuceODInZOjtynmTObom3j7b6Ddcm
         Y/0aApI/tuJGCZMyC1HQG0SZ1Uk/KIJwFWHddYGSccrsrHYM9ZwHeDTBznyX3PbBFbo+
         9xYd6vD82HWs65Ylv4/iRhn29DHbgaQtmuud2e04ukkSOgJkeJRivrDMyopPv/WOJiJM
         v1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389375; x=1747994175;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35iuGSg19HNEf/U+dvDwmkcAkhrHkl1GiGSFAGoPNXY=;
        b=WuTlDjfnLSX0XDG5Cbho1q7Que5gXMgypJ2E414ri7pCpx1NDm+XQJ083EmgbGqg+v
         qD9FUSMZn+07vv4PlQthRFaQnP2vjdY63KmF/Txs6r2uDrMA9HPwGU9umwT9eHza7E0u
         8+jGKCk5bzoykxxULjisqMBDrETa5NSGSdXvEZcUPgj3Qs+aGAQG4voPf61KV728/7Al
         Vt0zQMDvz9skLgZ9YGhMlvBJtb91xjB0WVnGfuZnjxS3y2fpBsHxPqe/xA/jeQtKEaXZ
         pkq+QXzcc06U3HRRBoWm2h4flrPzFvkKxXS7IhNEQ6ttSbtn73RfaB7EPzrzPgZNlaJa
         5FGw==
X-Forwarded-Encrypted: i=1; AJvYcCVVqup9Zj9FjQ7HgoFExUZ/hYURKf46bvow4MUlvWa0qh3DC5XiAQWUpQbBZOt4i7092FgPpX71zwlcMYiY@lists.linux.dev
X-Gm-Message-State: AOJu0YzKqCN+hUqQ2lov8W1C/Mc4MH8TtcHJfCh3KWh0rVlfpyz8Ezln
	iIk0f6J21jQIP032zmMKnapMt202mjKppud/FZuKAtQEj4pPmW/rxG9SmAJwIWZQZAU=
X-Gm-Gg: ASbGncvM7kEW6o52gzj0Y+1CMuHozFTQhvuK3ts1VBDqgDyumfPVrXEwFN828Z00AXu
	XntVm9qICqORpFdY2K4Pu4/XBLmn5B2NfvrM/rs9tWfBf+NOYfvU1aciRfHy2PmhugB3EUlBTeE
	wX+pPN/5FiX3OVSlIeyiiY4RUAXGYm1EMrvzjmKJp26duA0CqPx2/1fmCP/8lgyvHxtSEZzRBsz
	7XOXDYWApjBIGFpIx5BmSvxILAI6u+hezMJ6GKj3T798nG4g33wxL0pG91X5AdNC2+lynTcMLlk
	LlIVh0h900p/ozyjJP6FfDmQZAUCNmp8M+IxNxSQaZYZetIdjsyNesMA2mUftP0uuZ02AEhOAXX
	vSJIFo4UVBNHrBJ8e
X-Google-Smtp-Source: AGHT+IEACVWcPM/40CEX74K+kwkoPGzVs9ttaJUL8etUJoESajJD4/e7H2ZVUTxnLFX0e9j2VAI7cQ==
X-Received: by 2002:a05:6000:2dc5:b0:38d:d701:419c with SMTP id ffacd0b85a97d-3a35c84bdf9mr2371964f8f.41.1747389374999;
        Fri, 16 May 2025 02:56:14 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef832sm99363455e9.40.2025.05.16.02.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:56:14 -0700 (PDT)
Date: Fri, 16 May 2025 12:56:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hongbo Li <lihongbo22@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Sandeen <sandeen@redhat.com>,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 187/191] fs/f2fs/super.c:858
 f2fs_parse_param() warn: impossible condition '(result.int_32 > ((~0 >> 1)))
 => (s32min-s32max > s32max)'
Message-ID: <2f16981b-0e13-4c64-83a8-d0e0b4297348@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   869734b9a4ef9440e80dba629c688ed3277a7779
commit: 33c0363d5e5bbd712480e048a1ff67a3bca84ba1 [187/191] f2fs: introduce fs_context_operation structure
config: x86_64-randconfig-161-20250515 (https://download.01.org/0day-ci/archive/20250516/202505161519.EW2OO7Cw-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505161519.EW2OO7Cw-lkp@intel.com/

smatch warnings:
fs/f2fs/super.c:858 f2fs_parse_param() warn: impossible condition '(result.int_32 > ((~0 >> 1))) => (s32min-s32max > s32max)'

vim +858 fs/f2fs/super.c

7c2e59632b846a Jaegeuk Kim      2018-01-04   848  	case Opt_resgid:
419819cc34ee43 Hongbo Li        2025-04-23   849  		F2FS_CTX_INFO(ctx).s_resgid = result.gid;
419819cc34ee43 Hongbo Li        2025-04-23   850  		ctx->spec_mask |= F2FS_SPEC_resgid;
7c2e59632b846a Jaegeuk Kim      2018-01-04   851  		break;
36abef4e796d38 Jaegeuk Kim      2016-06-03   852  	case Opt_mode:
419819cc34ee43 Hongbo Li        2025-04-23   853  		F2FS_CTX_INFO(ctx).fs_mode = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23   854  		ctx->spec_mask |= F2FS_SPEC_mode;
36abef4e796d38 Jaegeuk Kim      2016-06-03   855  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   856  #ifdef CONFIG_F2FS_FAULT_INJECTION
73faec4d99358b Jaegeuk Kim      2016-04-29   857  	case Opt_fault_injection:
5cefc0eae8b492 Hongbo Li        2025-04-23  @858  		if (result.int_32 > INT_MAX)

What is the point of this check?  Obviously an int can't be more than
INT_MAX?  Was something else intended?

4ed886b187f474 Chao Yu          2024-05-07   859  			return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23   860  		F2FS_CTX_INFO(ctx).fault_info.inject_rate = result.int_32;
419819cc34ee43 Hongbo Li        2025-04-23   861  		ctx->spec_mask |= F2FS_SPEC_fault_injection;
419819cc34ee43 Hongbo Li        2025-04-23   862  		ctx_set_opt(ctx, F2FS_MOUNT_FAULT_INJECTION);
d494500a704342 Chao Yu          2018-08-08   863  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   864  
d494500a704342 Chao Yu          2018-08-08   865  	case Opt_fault_type:
5cefc0eae8b492 Hongbo Li        2025-04-23   866  		if (result.uint_32 > BIT(FAULT_MAX))
4ed886b187f474 Chao Yu          2024-05-07   867  			return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

