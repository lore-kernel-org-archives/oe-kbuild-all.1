Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CD333BBAC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956536; cv=none; b=MgRTFhRvH0DiaPvNFHW6qrtbUeZ1JSQWa3kK9sNx152lbMdQ0vRvJvU4+JaS7G5Yns3CCo9QekPFC63O72CByHO7TNyuxckGx6l1vmOvH/3yCGyPmvAy6Ls/u2qAtfQTa3LbPZ3thCzrN39FZVdRuZVRadCEJ+HpvspEDFjuRGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956536; c=relaxed/simple;
	bh=unnzlzKdz7+4ys3fNzAnT3ActZDULosSet73g3yW8XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNABhxZ9u4JoSkT+x3Fdp3OeGnQdmck37W30DZNu/MTdvFEupeZPaMiCm181wH68UHeg2s165tBP66fwSsVm7XDbIflDwL+3eaaAL2lC1wBXMVeER01ouDuNfu43EA6fJmxFto+bphyamaQjwJrwKMyN9O5z7rrF6BrKClClxMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XE3LBmz8; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XE3LBmz8"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-430f57cd471so2142895f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Jan 2026 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767956533; x=1768561333; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7B8LHXmNZwI578mO2uE441BM//edoTtfT9Cj5GtXsI=;
        b=XE3LBmz8pu+yx+w39oE1r+jVTm0tDxQ0papQGJFBA5x9B6UacCdLvfhF6RtsaTuLKi
         eLzfcjEH7daNyyTc6ZK/cHA3BIJdGVDnwpNrtRUio+oxrUG1HaUSlzgck1q73vCZXdW6
         GP3LR1fNo8/4P2CxdBcvmyuTSMGUd2hWTatzuE+obm6qlW+tMB3WqtyvnvQh6Rczybi9
         +TWi3Zv4+LYd8WbJG75CCNDK8Ef/Fe5hP5XukPmIv2EfudndmeY3UAA4kFpLMoAsW3u8
         Pd33hX0z0Rmf06SSVR8Y18KznN16NP+oDk4ITVG6ZPaemrAClFBVwqKH98Nv8eH/m6qK
         I+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956533; x=1768561333;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7B8LHXmNZwI578mO2uE441BM//edoTtfT9Cj5GtXsI=;
        b=lRr6q7gT3JDYScbs9zGSlZDaSk9rq63gDJjbbWgMSUZxz3N49l0oKAI/XpKdHB22HP
         go/CNSE0XlPNw9K36ilGzqJ77H+5IYotcjGLvEUPsmW0FUcaczcfYT4ZkSfuWj1sTzDQ
         ch30oG5P8RNMmNK/R2G+Ytgxumg9R+w9f1HiRlHSjB7Djk7EHI2SGRdnbgaa61xrvHp5
         /KqUi57nBR/yjdSNOPV5JjApN5TBd7h/Jod1vemDKqITTICqYvB5MGFUGzBvwqjWJqkC
         HwuT7K88s+BFIlUJBMaodeStSFaqkxZ6DZI5GZN48pBXB1sAqaTHPUS9nJ7hj0JebHdK
         YV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzabARX82zWdQLT9mMGyGEuzUwgdvYqUiTClEfJG7N6iGfEMh3StoG6/V4NJdKQPVx9KpxJIIpHOmkQs/c@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+CzSycC+l8V4fIJFwIGHr1lLn0iuU7qQx6DuqNI+Ju7fQ4JbJ
	jIYRn9Uh5df1YHc7u2yPkICl08YO/uAs5gHQzQrCWafdG4rMhWLLdhud6i/8cywIoFE=
X-Gm-Gg: AY/fxX6QitFTYPecip/QHOpEeU7TW+8ngdl+JY92NSuCPpIRh1705XzDy88bBv4CJ9B
	EECDmJ3UANJH0dJgsR9gkADre/0feZL/evX4G30l4pZWpoocnilG07clW2/ASSF9tYW4GE5JTUi
	SxiON/AvuUD3nAeVlrBrU962tF6XpGxMVq2WYQ6+YLJSjLWJ07nR44IfW84gmkVUe090SPJoHYf
	L6R62xm0pRaJLCSqUSrVtYk/azIAsm8MrPm7g5tHYPJwjbmwRHlZ/60jY4Nby72Iq0wQfQkkFmC
	9OXTcAqm8hhu5VL74Fw60kOV2O2pjQD/EdbriiTm+OWNbftvrdZyCKtYrA0z5WSbS47vrL4829T
	pToHADG3c2IgcOpMw23bS+iOB3e2lCct5R8bQquV1FYYchPEWEEEiY5cas6szWvItwToDOCpcfg
	oqd52kiamUx7lnrOhr
X-Google-Smtp-Source: AGHT+IHtZQD3lyZahBuogsv0efT5rIOdiTCSiSRMPBKBytEpayQpnudygIFup55X2R9m1Syyq0idWw==
X-Received: by 2002:a05:6000:1862:b0:430:f58d:40da with SMTP id ffacd0b85a97d-432c3628038mr10599502f8f.10.1767956532938;
        Fri, 09 Jan 2026 03:02:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm21731924f8f.32.2026.01.09.03.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:02:12 -0800 (PST)
Date: Fri, 9 Jan 2026 14:02:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Brian Norris <briannorris@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn:
 pm_runtime_get_sync() also returns 1 on success
Message-ID: <202601091832.YueBSiOb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   623fb9912f6af600cda3b6bd166ac738c1115ef4
commit: 7f7acd193ba8aaa8ed07cfadc335bb17a991fd42 PM: runtime: Add basic kunit tests for API contracts
config: x86_64-randconfig-161-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091832.YueBSiOb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601091832.YueBSiOb-lkp@intel.com/

New smatch warnings:
drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:78 pm_runtime_idle_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:182 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
drivers/base/power/runtime-test.c:185 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

vim +22 drivers/base/power/runtime-test.c

7f7acd193ba8aa Brian Norris 2025-09-25   13  static void pm_runtime_depth_test(struct kunit *test)
7f7acd193ba8aa Brian Norris 2025-09-25   14  {
7f7acd193ba8aa Brian Norris 2025-09-25   15  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aa Brian Norris 2025-09-25   16  
7f7acd193ba8aa Brian Norris 2025-09-25   17  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aa Brian Norris 2025-09-25   18  
7f7acd193ba8aa Brian Norris 2025-09-25   19  	pm_runtime_enable(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   20  
7f7acd193ba8aa Brian Norris 2025-09-25   21  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  @22  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));

Use pm_runtime_resume_and_get()?

7f7acd193ba8aa Brian Norris 2025-09-25   23  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   24  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_get_sync(dev)); /* "already active" */
7f7acd193ba8aa Brian Norris 2025-09-25   25  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   26  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   27  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   28  }

