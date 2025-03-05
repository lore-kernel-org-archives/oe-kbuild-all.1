Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BB8205AB0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178595; cv=none; b=a4CUGWrWIhomGxPyVMVT3hLLhtCJ5mrd+MUHp9JaawQh3GcNPHolKvsJ4qGR5sj4bFfl8do3xWCXPkVb6NPBAWkgqvfyEbIZpGrj622GXC0jjghR55szA1BuaP1XugomPBzK1WatKwKlVnz+tkNN4MZol3ySCTJmLd5g4Pjb0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178595; c=relaxed/simple;
	bh=yX7fp9xQFDeV1vAOO4Cof4q/P1p8dOBqU87kqc8Sz+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJsD+ZhvER74e9yVxGSHNy364Ndvsm3TKjlaxIYbnytlS3Vd3eoVdAf9LXtTtdl76twpr43me9qETKGH4za7fWBDYQQVtA4h+eyW1hGz2Yd7SIMs55Sx8w4MNfqDjxgsNtGY7pbxAUyqlRg6UdnQ5fxjnFaYFIIXY7wpxFrhakk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FT6gc/cN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FT6gc/cN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bd5644de8so5138105e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Mar 2025 04:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741178591; x=1741783391; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PlZdUZOwLhnEWeJY8rJ8FTJHU0RJ94GcxpySr9jV+k=;
        b=FT6gc/cNVnuCNC+lwwsEjMjEMcGOvFdR5bhB27taWOd2A8BG1wUtcBFT5IXtJQ9981
         hPUhYDCvKfxRA02Wk8HwUTwwzX0rLcprEJ/KvFQSY5L7XLWRKsylCKAr3itUU8CHaWXI
         rqAO/Wb2BH8Y29f2e1J5cGfQRclzt9t+qSPpp6Fo23WBnnn9IoxClpKFFmLLRUYFEDgA
         pmehn831lqWZw5agU9E6vG+PsxGAvgwlylkKWx6zzo0hYoO4th/JzuyFuN989vkt8x+V
         9EjpD4dhydZyYUBv+ZKZHzQ7hvtf2DCI620fZVbdSxAhszmt/Q8elkpHw5lRg9SedF0X
         t9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178591; x=1741783391;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PlZdUZOwLhnEWeJY8rJ8FTJHU0RJ94GcxpySr9jV+k=;
        b=tTTRvL7t9FVHICKWRnLiqmrq7JARg/HIGr9ZC9wuV1OwY7tMiYmvOuIkPFTIh6TRN6
         JS9LffrMAVMTbMw4FtXTARHHzIk/6Gy02u7oNZRhzdXOuQAlD3TSh4p5Q8hS2cLe3cJ9
         KDZ0hYgPz9W//D4nzopUeAddAKtlrwUVKDY0nizo112KmBr/si+OAHbrEfEAF+CVJrA5
         IDrjS8B6AzS4ABbV0Iqiwo3FTh63f/t2VN+3Amb2yHVbVKiQIZoghY6yvFx1NlSSNW2Y
         8cTZrU7Dn9IZZV2N48B7e4dqwdHv99M6O/K/FxbgcGzFAmaLXmxkmx2sRBuzJE/s0LVg
         bCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZKUknVMPgESaDD5eZ3xG7vXwLu809XQzT+CnhL5VU9Eds4G6ORbV3YM5ug2cdvGFGQ1bS0RZQYfvCrfV@lists.linux.dev
X-Gm-Message-State: AOJu0Yychm7wUCi8+YBasDT+yREMckgt6oT4WKaTMK4HxyRTmyVwbuj1
	HMlER3dvuFULxQN9978YzrvG5sfywGpojj/MZNd+4C1YB+M0MvIfoO03fE724j8=
X-Gm-Gg: ASbGncsW2jB1c65Hko2O9rw/ABk8W6u0CbQstQLRnqW8Ao36nggn2RU1T6JuxE2oowk
	HxrSSB/SRyIGfupYKA7W1rmAVS7NBbllGs3sYPm3IxRmtdTIB98TM05wrt/Eie1WAT2DW6U9ZMw
	91OHn9AQV5m5gj76d3h/N5C2EEslCVFeR70ljSYcv9P0H1afNpcwQPw24lSGDqlTw3beJVu9OYA
	s8X8GgFmA7TTxKCwslhBhW7OkpLtG7lLGzQ5N4uAmWYJNNX/2uCiQXMwzuPem5Pyj8VwdRHhZ02
	kpUKuGoVnugNDbGXDb8gGWgQcD3mDbBh3t5Jj+nFv9yb2ei5Mw==
X-Google-Smtp-Source: AGHT+IHYI+oo18Sa961XoTR21Ca5ZiZqtlzFO6EjICswEd+ZKnKw/V8w0Io6ki2/whBzw7is9CZOvQ==
X-Received: by 2002:a7b:ce94:0:b0:43b:cf9c:700c with SMTP id 5b1f17b1804b1-43bd29847ffmr30213125e9.16.1741178591267;
        Wed, 05 Mar 2025 04:43:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd42e402bsm16283765e9.25.2025.03.05.04.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 04:43:11 -0800 (PST)
Date: Wed, 5 Mar 2025 15:43:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] block/blk-merge.c:1006
 blk_rq_merge_ok() warn: variable dereferenced before check 'rq->bio' (see
 line 995)
Message-ID: <c372bbab-c824-4e2b-b7b7-212cf3a511e3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   41a0b7bfea10dffbd255cc0978b755dc0f427832
commit: 61952bb73486fff0f5550bccdf4062d9dd0fb163 [2/2] block: remove the write_hint field from struct request
config: i386-randconfig-141-20250305 (https://download.01.org/0day-ci/archive/20250305/202503052040.TSXL8cXi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503052040.TSXL8cXi-lkp@intel.com/

smatch warnings:
block/blk-merge.c:1006 blk_rq_merge_ok() warn: variable dereferenced before check 'rq->bio' (see line 995)

vim +1006 block/blk-merge.c

050c8ea80e3e90 Tejun Heo          2012-02-08   982  bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
050c8ea80e3e90 Tejun Heo          2012-02-08   983  {
e2a60da74fc821 Martin K. Petersen 2012-09-18   984  	if (!rq_mergeable(rq) || !bio_mergeable(bio))
050c8ea80e3e90 Tejun Heo          2012-02-08   985  		return false;
050c8ea80e3e90 Tejun Heo          2012-02-08   986  
288dab8a35a0bd Christoph Hellwig  2016-06-09   987  	if (req_op(rq) != bio_op(bio))
f31dc1cd490539 Martin K. Petersen 2012-09-18   988  		return false;
f31dc1cd490539 Martin K. Petersen 2012-09-18   989  
050c8ea80e3e90 Tejun Heo          2012-02-08   990  	/* different data direction or already started, don't merge */
050c8ea80e3e90 Tejun Heo          2012-02-08   991  	if (bio_data_dir(bio) != rq_data_dir(rq))
050c8ea80e3e90 Tejun Heo          2012-02-08   992  		return false;
050c8ea80e3e90 Tejun Heo          2012-02-08   993  
6b2b04590b51aa Tejun Heo          2022-03-14   994  	/* don't merge across cgroup boundaries */
6b2b04590b51aa Tejun Heo          2022-03-14  @995  	if (!blk_cgroup_mergeable(rq, bio))

rq->bio dereferenced inside the function.

6b2b04590b51aa Tejun Heo          2022-03-14   996  		return false;
6b2b04590b51aa Tejun Heo          2022-03-14   997  
050c8ea80e3e90 Tejun Heo          2012-02-08   998  	/* only merge integrity protected bio into ditto rq */
4eaf99beadcefb Martin K. Petersen 2014-09-26   999  	if (blk_integrity_merge_bio(rq->q, rq, bio) == false)
050c8ea80e3e90 Tejun Heo          2012-02-08  1000  		return false;
050c8ea80e3e90 Tejun Heo          2012-02-08  1001  
a892c8d52c0228 Satya Tangirala    2020-05-14  1002  	/* Only merge if the crypt contexts are compatible */
a892c8d52c0228 Satya Tangirala    2020-05-14  1003  	if (!bio_crypt_rq_ctx_compatible(rq, bio))
a892c8d52c0228 Satya Tangirala    2020-05-14  1004  		return false;
a892c8d52c0228 Satya Tangirala    2020-05-14  1005  
61952bb73486ff Christoph Hellwig  2024-11-12 @1006  	if (rq->bio) {

Checked too late

449813515d3e5e Bart Van Assche    2024-02-02  1007  		/* Don't merge requests with different write hints. */
61952bb73486ff Christoph Hellwig  2024-11-12  1008  		if (rq->bio->bi_write_hint != bio->bi_write_hint)
449813515d3e5e Bart Van Assche    2024-02-02  1009  			return false;
61952bb73486ff Christoph Hellwig  2024-11-12  1010  	}
449813515d3e5e Bart Van Assche    2024-02-02  1011  
668ffc03418bc7 Damien Le Moal     2018-11-20  1012  	if (rq->ioprio != bio_prio(bio))
668ffc03418bc7 Damien Le Moal     2018-11-20  1013  		return false;
668ffc03418bc7 Damien Le Moal     2018-11-20  1014  
9da3d1e912f395 John Garry         2024-06-20  1015  	if (blk_atomic_write_mergeable_rq_bio(rq, bio) == false)
9da3d1e912f395 John Garry         2024-06-20  1016  		return false;
9da3d1e912f395 John Garry         2024-06-20  1017  
050c8ea80e3e90 Tejun Heo          2012-02-08  1018  	return true;
050c8ea80e3e90 Tejun Heo          2012-02-08  1019  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

