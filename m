Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E2B14A627
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987983; cv=none; b=jW7cm9SpIU8GQBSMN+Nuhh9aL4JRI4o2uUEQ1kwGwq6cZGNCqOaZB6cU5OjA/1syTcb8DdvJt3FEUyeqAxeuicfEcRW0jjcQX573CST4I+FlQh6Y3AkEgJrEIyprJx1Y3CaAjD9VzFGcC2ZJmFHxHNovdHb2xZrzoBPX6qAQpD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987983; c=relaxed/simple;
	bh=aMlex74IyOMR1qirqxGs7gic+8F3yx2rJr4KfbBTDBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Af9qqT8j4r8VXH8v4QSJ2HxnwSHV/XtNKpkqmkVbLjD7Je9/C5UcZEDC1NZ8eiBpld+wAzKmoGSVRysAJLKrz8nDGH7EaBORNLNC3HS8u8spQgOh8YdXB348h1NwoL5WHiLq7F5rw/OA36DKCduOX0XOCzn5Dj5DBTM/kXFbX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N9ujN+Sn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9ujN+Sn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a3681aedf8so5387875f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747987979; x=1748592779; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSdRboFiYEYYT3CZ0igSixqUd+xu0dWeJ9sxgLML8B4=;
        b=N9ujN+SnXZ18Duv9fyOL2pkpi36/orKn4x59zzYBzCoiCUyAKe69pKtrCTb1rZ4iLJ
         ajx8bJrLb5ktm98OjJQDbVoCxJvrCeREgwf4X1APgVt6Yc3wNnL7c6QTMGL/LZaqd/LU
         VbtssqWbjyGIwvjB4MDXcCOLzwlD9/3+PN8ZKu6f9mdAfMSeLZqSmpHUfNIyQ1k6rVjy
         HfOiGTlfSr0O0sYSqaiV3euldreLZtu91m28kV6TrO6OayFMpD7X283SgaA4wJfVCKLV
         YqsP4dH2DonUtgCh27wJ+0Se++S+Dtaj0fhdDahnTmZkDBCtxCh4INX5S4O/RoGmwEm4
         vLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987979; x=1748592779;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSdRboFiYEYYT3CZ0igSixqUd+xu0dWeJ9sxgLML8B4=;
        b=ro32VrtOaA2QFgZ4Bst7sKBSBMdcEzv/VSWWHIIhG99lVT9lQYoAtlyt7trO0qwnhb
         hP61FeAhfqxCd6QujU6pJRpv4jza78840LaYh4dcHzjqZ8t7p+XIzHftCCXgOE6zlzPZ
         WsdDuMGrdZelVP6IVi6P+t8gHHdnhLjrerL9Aujm8iswCeSpQVo42pFkY/QB3bcTjvh2
         Ve48XAW1fMjsMBlwFrwZCrMOVCpYJBYGXtCXcjrpwJ05KjCiETtK+/tpRb/hetr/DA9O
         oDVRPWwf53SF034At1TxR2mtNv1LgAFlCWRi3sYhyTWISq/xpc2eexKYDs5fqsK/3exw
         PQAg==
X-Forwarded-Encrypted: i=1; AJvYcCX20SqCzFiFpU0qxX0P1kVgmtzRr0zwG8F/+drnAndRv/uAUPEXlaIR/2vmb9J3NY7Y5uhfi3ZRJ+dHElGb@lists.linux.dev
X-Gm-Message-State: AOJu0YyCU2GBrp8ePRDmdCJvQZQBmribfgrhaHksHpHLh6L5uDvFBF94
	zi0d8/9iG0Tuq1ZPPsHOw0MB2HOZDDysgnmTXiDnt1Mujb4LEwXNUM8oNAgX8mer25c=
X-Gm-Gg: ASbGncsp8fisphxs8FxsvKI/hrG45HrA8y6/t5uH4K2M486J2xweX7+yqxjT1VDU9gK
	OOhVbF96RVTJSylFHmPwYPuv+2cGys4UJX0zMpioKfSf8Sa3U76B6u0UQaBv8acoROaZNlXXMQE
	hfvuSzAqH7+/7XvvSfC53egMRqzeuvJUGcsUw+wSxoxg8Gnd4X4F/r61IbtyAcXqiZqUNXlBQk6
	n2QxGpBbtQu+BembFKWdFM2N6WJn0iX31p0VHpAlNK+AB8A2Rtd/bzzOhJPxJ2dNEGGTpcm0HQN
	og3Q8q3vrpOY+o/3afeQXe7rjvFtXKweRRYCpSfv7QH8D5FJz3t1g60y
X-Google-Smtp-Source: AGHT+IFjTZcfmvfed0hjVta3v+ReMWyTvmS2NU57Vb0uEbSmQjvUK3ePUpilpcC8nhmpE5pK/SXCUQ==
X-Received: by 2002:a05:6000:1844:b0:3a0:ad5e:2ee1 with SMTP id ffacd0b85a97d-3a4c2344d26mr1598944f8f.50.1747987979526;
        Fri, 23 May 2025 01:12:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a368250dbbsm21043942f8f.47.2025.05.23.01.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:12:59 -0700 (PDT)
Date: Fri, 23 May 2025 11:12:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 3/93] fs/nfsd/nfs4callback.c:1412
 nfsd41_cb_referring_call() warn: '&rcl->__list' not removed from list
Message-ID: <202505171002.cE46sdj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   d868e4920c3f4feefcbc17c5812bbe1a48af8c6f
commit: 4f3c8d8c9e109655311bbb4c6c46a54a9ef90d99 [3/93] NFSD: Implement CB_SEQUENCE referring call lists
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171002.cE46sdj5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505171002.cE46sdj5-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4callback.c:1412 nfsd41_cb_referring_call() warn: '&rcl->__list' not removed from list

vim +1412 fs/nfsd/nfs4callback.c

4f3c8d8c9e1096 Chuck Lever     2025-03-01  1362  void nfsd41_cb_referring_call(struct nfsd4_callback *cb,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1363  			      struct nfs4_sessionid *sessionid,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1364  			      u32 slotid, u32 seqno)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1365  {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1366  	struct nfsd4_referring_call_list *rcl;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1367  	struct nfsd4_referring_call *rc;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1368  	bool found;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1369  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1370  	might_sleep();
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1371  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1372  	found = false;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1373  	list_for_each_entry(rcl, &cb->cb_referring_call_list, __list) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1374  		if (!memcmp(rcl->rcl_sessionid.data, sessionid->data,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1375  			   NFS4_MAX_SESSIONID_LEN)) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1376  			found = true;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1377  			break;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1378  		}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1379  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1380  	if (!found) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1381  		rcl = kmalloc(sizeof(*rcl), GFP_KERNEL);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1382  		if (!rcl)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1383  			return;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1384  		memcpy(rcl->rcl_sessionid.data, sessionid->data,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1385  		       NFS4_MAX_SESSIONID_LEN);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1386  		rcl->__nr_referring_calls = 0;
                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is zero.

4f3c8d8c9e1096 Chuck Lever     2025-03-01  1387  		INIT_LIST_HEAD(&rcl->rcl_referring_calls);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1388  		list_add(&rcl->__list, &cb->cb_referring_call_list);

We add "rcl" to the list.

4f3c8d8c9e1096 Chuck Lever     2025-03-01  1389  		cb->cb_nr_referring_call_list++;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1390  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1391  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1392  	found = false;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1393  	list_for_each_entry(rc, &rcl->rcl_referring_calls, __list) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1394  		if (rc->rc_sequenceid == seqno && rc->rc_slotid == slotid) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1395  			found = true;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1396  			break;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1397  		}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1398  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1399  	if (!found) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1400  		rc = kmalloc(sizeof(*rc), GFP_KERNEL);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1401  		if (!rc)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1402  			goto out;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1403  		rc->rc_sequenceid = seqno;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1404  		rc->rc_slotid = slotid;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1405  		rcl->__nr_referring_calls++;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1406  		list_add(&rc->__list, &rcl->rcl_referring_calls);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1407  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1408  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1409  out:
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1410  	if (!rcl->__nr_referring_calls) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1411  		cb->cb_nr_referring_call_list--;
4f3c8d8c9e1096 Chuck Lever     2025-03-01 @1412  		kfree(rcl);

This frees rcl but it's still on the list.

4f3c8d8c9e1096 Chuck Lever     2025-03-01  1413  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1414  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

