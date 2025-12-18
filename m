Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C36321F5E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042493; cv=none; b=aY0JJEQk05hWkr5ixEPWMT/D8wk4eczvSRonduHbTzfn0I+68MQE4c+noq/ID6XoDoVP3r0Xex14pveyw8vaZC19wqP31hgX4TjkkOBcUkgHKmwXM5XpCW6uKh1Yz6Wr1kwzPWMR4yKUxH4GD2hCs8xYiJreiVcifkxKqD1OVjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042493; c=relaxed/simple;
	bh=fXLtSVk82ESKQOzdshAmeibfIxSRyhMx8s2wTZtSSTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BAgC7M3PPJKEaChOO11HERqsuomlc2bZFQKa7UsdzmQ7bA3oEc5XUa/HZVE6ZbOBlmpJsPnLiA+2jY7LyYTXiQfq1N1avX6N6meJtMh67cFuJ/nljUm5bRS0gRKPZ2NNhS5tOYlNdmwwlTnSTc7WoLBG8Bu6m8MeN5JanrTSnZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCUyfnYx; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCUyfnYx"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso1788425e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 23:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042490; x=1766647290; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjftRkgAweItEZkBzFZPCbzdvPthZCUVd118Fzc2bn4=;
        b=bCUyfnYxbHmQeYOXN10RqlLvpn9a3qLfIC31fdH9CjCojGmvBIls+ZCgP3jso+G3A3
         aCTWbZliLp3IW+WozwAVqH/oGFmF991wt/agZot5NfLVtLoW1WWi0XhKL95stuWuSZG6
         wb/6UGEwXn0kXKP4uM/MmJyaLnDjp/AwKE9ZBdGoVDwBEWMvXKI+UdLcmC0wzrYbyL0s
         TSebwFeVDn9jJFagOsDxnPCc8Ras13hjZ6gFc5i5uQHfeb9ovpdkRAjy3vmRP+PhgWs5
         GxJbCG9SxUO58qW+yxxLOOtP5GcaJSx8P8iC4EnUP15Z4whNr7HDFLCUURlfoQsyznog
         RYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042490; x=1766647290;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjftRkgAweItEZkBzFZPCbzdvPthZCUVd118Fzc2bn4=;
        b=M8yIwChhlq6h5XXmPT7Fd4fLLovhujkLQpYwkLNOpgADUNPgxsLwDac4tcqZ8fk78V
         ZSQKR+r1F+aB+HtF1WJuEbaRoP5kMDAI9QZ+qAc3AwXMjgGKEwvb9lYYKWu/NdJTx1SC
         ucv6SBnkP1CDVhWXsIE3DAE8Fo/cvpf8nTmu88vKZjPKXKIYPwHskyRLhCXL3EDPrJlK
         RfDNc5pXrIJIofmHq4WoAMwTDmWLTi2iMQNMZsqc3D9Z+Q8aMkyRo6q7hn8XfanZZeaD
         vb00WcFwnN/Xu3jxopLa1HCSLHkdqkbXFQFboBS+5xGa/Yp8xssyYzhv23iQYXsX4ol/
         8fMw==
X-Forwarded-Encrypted: i=1; AJvYcCW7tUwig6HC+dPlVoQ7cZYBqHBy9Ex9Ve/fgR8LM8vxhTPz+U3UV1mHPAL7o8l/Zg3BGIoVkbaWRSGLLFhm@lists.linux.dev
X-Gm-Message-State: AOJu0YwkLvTFJ+o8PNsitIJMNJYr3wcHQyypqo3zt4spRny9bBAPNszI
	NEJu2Eq63Wxel8deWdtdvxaOTAOWCi+b6t35nno29isY5MMv9k4wSNOzFnc4Kn+xaYI=
X-Gm-Gg: AY/fxX5K7qSLIhqJqVRwuXGOqcLoHKY2ife/RnwuJCMz+mDCrXgIhFHkayONYsXBuCE
	HhM264fR//EaNxbvGFJAqzOSlRnHoeUzCYZ42xpI/edyjzuEhu8/X7gLYYMzcBWL4aooQvuWBba
	AXZ897g1jexDan33E8P9dbYBosDhW7Y9MOZy3rKOjqkt5z5dQnHD1WRGwGW5C6tSo10qj1BE7WH
	RuZb3TCnkLGezf0PnGHtq4z+RzzhNJTNZPxKNEmVqthUF0Sq9bUpYLN7i7hQbfaM/b/+T5gn3vu
	hv3zIMpm+g1Uic3LK4ImTpAMISRZ9yKggVbjU16C1N2vBRupxyNo+RQ0+jH6pRGTJ42aYZrPxLj
	Ld+ID/IIMn+gPjSGzIAezMyWzvD+pfiIV2AbqImNd8/hGGJc8eJvn/igGdFx1f16ojQtP57+6Wt
	SM2g/Vq++hM1QEBzdv
X-Google-Smtp-Source: AGHT+IG2wYnKF9UcJtAT6tzXqD2LRHXeRY/+PjOkEmoHb+4nvafowC40CKcIOmp6/EX2Aw9ewSX0Kg==
X-Received: by 2002:a05:600c:8115:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-47a8f8a80eemr197952455e9.8.1766042489623;
        Wed, 17 Dec 2025 23:21:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be32832fbsm23362215e9.14.2025.12.17.23.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:21:29 -0800 (PST)
Date: Thu, 18 Dec 2025 10:21:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 14/14]
 drivers/interconnect/debugfs-client.c:121 icc_commit_set() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202512181424.7SYJiB4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8b3c4de1cca2b865619f8662a2f262e499db0e13
commit: 4439db7b8f941e4e418fc4d07e84a2eb31c6f339 [14/14] ANDROID: interconnect: Enable debugfs client
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181424.7SYJiB4W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512181424.7SYJiB4W-lkp@intel.com/

smatch warnings:
drivers/interconnect/debugfs-client.c:121 icc_commit_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +121 drivers/interconnect/debugfs-client.c

770c69f037c18c Mike Tipton 2023-08-07  114  static int icc_commit_set(void *data, u64 val)
770c69f037c18c Mike Tipton 2023-08-07  115  {
770c69f037c18c Mike Tipton 2023-08-07  116  	int ret;
770c69f037c18c Mike Tipton 2023-08-07  117  
770c69f037c18c Mike Tipton 2023-08-07  118  	mutex_lock(&debugfs_lock);
770c69f037c18c Mike Tipton 2023-08-07  119  
770c69f037c18c Mike Tipton 2023-08-07  120  	if (IS_ERR_OR_NULL(cur_path)) {
770c69f037c18c Mike Tipton 2023-08-07 @121  		ret = PTR_ERR(cur_path);
770c69f037c18c Mike Tipton 2023-08-07  122  		goto out;
770c69f037c18c Mike Tipton 2023-08-07  123  	}

Fixed upstream commit 6bfe104fd0f9 ("interconnect: debugfs: Fix
incorrect error handling for NULL path")

770c69f037c18c Mike Tipton 2023-08-07  124  
770c69f037c18c Mike Tipton 2023-08-07  125  	icc_set_tag(cur_path, tag);
770c69f037c18c Mike Tipton 2023-08-07  126  	ret = icc_set_bw(cur_path, avg_bw, peak_bw);
770c69f037c18c Mike Tipton 2023-08-07  127  out:
770c69f037c18c Mike Tipton 2023-08-07  128  	mutex_unlock(&debugfs_lock);
770c69f037c18c Mike Tipton 2023-08-07  129  	return ret;
770c69f037c18c Mike Tipton 2023-08-07  130  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

