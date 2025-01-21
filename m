Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A111898F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737443377; cv=none; b=WLTGammelunBsur6sS0DyDcX69UgiK2ADcjxfmHkVncUYjUyHeCItn0Y45lVXC7yQw1u23vGPvBMsRHAf2pyVV67C4IWLt7YjLnan2gGseM5AmbhLKASooZMXAYS8gMSDhSpwF2ka1c8st42EKzKTdKhoACEWh0Kb6m/SKkTlqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737443377; c=relaxed/simple;
	bh=zCAYhKIdevfZxt2csTVqb3aNKvXBzgzF7fOPI7w/KQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s467Fmw4wA9KazULNU6JkQGAw4iSDYXBkZ/eNPsaH0PNhcQYUelLLLkeduo44P2Cl+8CEWkasH4nMYmK5BrmaHgjUSFk9tfz+AV5cnexc9Mow7Xmc8/0i9LzXtXXRwzXesGycU7U63pcZt3BVXqELitqDbINjctXqb0NTZ/6Org=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uKXDyP2Q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uKXDyP2Q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4368a293339so60357515e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 23:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737443373; x=1738048173; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tWgZXjbSf96OZ4eHqXocyVloofnFnvy8Ppl87RH61U=;
        b=uKXDyP2QfEPobffs8kxv3ISSq0XjbMRIGm0Y/OliOgtMxi1lxdEDo2RNZzUn4RWBpm
         RAcec8fEslX3E4eQqtVC3yKeUacIEcCzLS9+G3XU+KfiZBsNfZpuBcv8oIW0MUbiLJ82
         4z+f6NvvehZF6O3mDcVq4olnbfgohfO/+nJFVivb5aJGBbyX6w1M2BRkz2FM+VVzyWT/
         pxxmWTwP9BTsSDGU1vRD33mhepefW4qw7xM4xVgkxmHME80YblQWVa3jpfsVoMqX8XXZ
         ZfVW+SyZg50JiEANs8SdP9UfaS0b3qAJnxy149vP90EKFBEAVjjKdXwnhvBZPEZOZXsO
         Kxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737443373; x=1738048173;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tWgZXjbSf96OZ4eHqXocyVloofnFnvy8Ppl87RH61U=;
        b=JbyA46tYfxEdc9nLAGVJ8AnjeepzQI/axQJpUoXOlLnUfbenp7m4z0WabIdjIvFW0L
         eIPe8NRzv4m/xYD3saaZvpyEzdTJhR3ODb4kqywdXkmVARblXNfzYGi6rQORTYE6xOQ5
         vl56WrLCYoD4ZGPvJ5bFHgOuzUbeTNsGSHud1Zp9XJRhsSp7fiZC5WAY4y/sGY7cQ15n
         0KMK1DF9rUV/67tVkEciyTh+zPAo44/ncgsBq8Tv7HQMyGLJpij1g9j/gyWDU5n3J2wl
         oszVibAAU8MBWFX78874olnsZKgUz5JWlYBnnN0TFG45SeCx+g1Zd8ht3NxRpYbzyk18
         mOoA==
X-Forwarded-Encrypted: i=1; AJvYcCVIv76C/DIuaJ98g8irALR0URqv+EJ07HUimjUHSj996+gZbjad5r26y2ieRnsdFPZgRMEdUtteJuTTTf6F@lists.linux.dev
X-Gm-Message-State: AOJu0YwTjeJda8VcV1M1Ud6rZA6NhwIAavvhWMADVJUFCvSx4rolIdXT
	slgUZSSGHw2MsiMJr9SIbYE9nCyV/1mk0dJiuqKD5CnuVba120dKmX9elHO/yUs=
X-Gm-Gg: ASbGncss7CbPn6Kp2Q/gtobEeuzm2kXKb2wCAnSHzFSdz66tA/PdjkW3PN7hZB+WXFU
	dF2ygR109YawA/c5AoldYKhkrCJc9689F2W0n+zBS3Of/xBa5ssSN3L9TumHn3FEsfqKzBBdrU7
	fAPDo1AJGDjXVxhLjFhl+pRkiU/bcX8R20EraehnbLc/ghTJ+Y9zjY/U9dXh5/NC+2xjFKbVcpw
	hi3YSLt6MTvOAyRFcGZG9m20Hi5hF+J/qztX2HVEZoTpduNQUhBR5GRHoH6YCF+1mZ4gOu6fpQ=
X-Google-Smtp-Source: AGHT+IFTp45xpXqco1mefDqnZlUy7yMl6jV8aPjRMFUewU8BFCaQJB9RojtaR8+XAvgdSVJGaMbfCg==
X-Received: by 2002:a05:600c:ccc:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-4389141c1e5mr127294965e9.20.1737443373266;
        Mon, 20 Jan 2025 23:09:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214fc9sm12239640f8f.6.2025.01.20.23.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 23:09:32 -0800 (PST)
Date: Tue, 21 Jan 2025 10:09:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 13/13] drivers/ufs/core/ufshcd.c:5518
 __ufshcd_transfer_req_compl() error: we previously assumed 'compl_cmd' could
 be null (see line 5517)
Message-ID: <7dc49ef8-95bb-47ee-b123-959fa266aeee@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   21a8754aa33228c1b822c1104d24fce691357678
commit: 8563ce58954679187f0c269a504520d8def37e41 [13/13] BACKPORT: FROMLIST: scsi: ufs: Make the polling code report which command has been completed
config: x86_64-randconfig-161-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210143.ZyDTG1tQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501210143.ZyDTG1tQ-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:5518 __ufshcd_transfer_req_compl() error: we previously assumed 'compl_cmd' could be null (see line 5517)

vim +/compl_cmd +5518 drivers/ufs/core/ufshcd.c

ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5509  static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5510  					unsigned long completed_reqs,
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5511  					struct scsi_cmnd **compl_cmd)
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5512  {
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5513  	int tag;
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5514  
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5515  	for_each_set_bit(tag, &completed_reqs, hba->nutrs)
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5516  		if (ufshcd_compl_one_cqe(hba, tag, NULL,
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11 @5517  					 compl_cmd ? *compl_cmd : NULL))
                                                                                                                 ^^^^^^^^^
Check for NULL

8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11 @5518  			*compl_cmd = NULL;
                                                                                                ^^^^^^^^^^
Unchecked dereference

a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  5519  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

