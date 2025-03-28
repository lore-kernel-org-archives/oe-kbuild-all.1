Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77D13C8F3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 05:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743139614; cv=none; b=tp+rGiNikR0bxAaByX/cJoc7xmz8wLrXFwdWEW6hj6S6Pkf5jCanDBECYKzBJYAPvK23ykFG036xm8dx+0IeFFRbhBEw1/0ZgUWQYlONXSFj7hOHMn3LN/fuiSFHnO5mYOSDiyDvN+k8c3RWyoCUQhKNkiVJ/uvML3udp+eUmEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743139614; c=relaxed/simple;
	bh=1zzZ3hAoQgiQKDwuWs4Af8NLyALwZLGxcTpksqLDoW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FV5/eQIZB25q8yKpBCnJzRY8W4qBx3wTQ1OmvfWeUCeJ6xBRvD7uAwQdjHm511UZk6SznMOLftogjKHP7tjPMvHeuCthqE1wR1IabUrERaiqN8GKvJo+HTTmT8+vkCxK8ycqZC0Xh+nDXJl2yzdG0L1CduAPT1GzHXozmFHHQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOn3EAwM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOn3EAwM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso10950505e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 22:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743139611; x=1743744411; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmoyoSA2Dy8iFsEnEBLlb/cn6Ozp+HwWcLRRzXUA8II=;
        b=iOn3EAwM71Paeyzus/cAboWvgHVVv8kp/EOYEcnhT7gD8aHg9v2Ph7zdGFjJRRe7Fj
         flWogClPT3di1pGWjR7cD0NduuWlc70p/1DqVtUHR5C96WzsDt6ORGOcQ3Qzjk+lYFog
         rJa/kYZGxg6MWjZaHdsWc++8Y0iLD7hy5BUKDJQR7q/GlUsBF9whSi//a5v6OSM+WeyY
         rdHxpOJlD63+wolG0404XfxuLElkVF0cVHyuMnsmKobLBnknn7Jy25rtCHIHJ49yekLj
         7EjxIrlrLLusNVmeyb3fMBHiCjf0oYS8cE0TPnZXDIbZDsNDViAID7AHkqsRbIvYV5Y2
         5ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743139611; x=1743744411;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmoyoSA2Dy8iFsEnEBLlb/cn6Ozp+HwWcLRRzXUA8II=;
        b=kzkZcLCR8JwMLu+Lw6dM5J086A9cBvSLQSAkkPc9POeaQoqhBnPYWmqXhuYQTxrurD
         AOARqUDjsCbzV1maCZA1z9oeVSROaRsmdwcaMUiJTqKNyCvf0xpQlMcV+ik7+smp8yM+
         jqfqtxgpV/a2Fvt2N4HExXmICyBFmjkAE5xheKHk2mfSQWQRRQK3Z293CZC1ZY32BaKZ
         flzlsAZg0MPF1eJIint/2gDU6QigFSeo7NVaHHp6ctq0xWZhj591dulEsdKGc6vSklE8
         5oZ2oCEjnVatWzZTu0BoPkJ9npS0UEqr/xRdbToTmIddymDiPGCW7lIYD/LtbOjiFrVj
         siRA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7CSUj4R4mnE2x27i30FV2fSxFH/hT+N5yuSjAUDC8L8puOY7I0TMXc7rMCtQmukb1UIM5qYGnJehml1h@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5H26iE4+7nhNAuY9Z2NQOqBWA8+nIVVsMAy43sxZnKfOzDBLZ
	2jaEpOEvGr9DXhgmFxIsCmo7xoNiRFawSAo6/zC5+4QDxOa/Y1vA9mg4YGvw/Gk=
X-Gm-Gg: ASbGncuqGo5L1/4yVXLSXJo7jgmjkaDKd7eW+GAf6oIEoTAStV1WiuNLHiy137LIIRs
	VGi59GcPk1+vmMMtAwevIBPO47VqRKVjZSLB0d0ODrPeJB7spJTfEjNr6cFGYxgbjHsjvcwWHOZ
	V2JPCS8gr9wODGlfjRZFaRsvgfsXC3hUGpu3j69DQVcG/ad+6C4lxj2WtHjKe3GMMkLP+sR4oDV
	nV57R+vt2EHkSQ3WnbJ5/E5YBZo6I/0bvroBwrZzWAsEbvOdDi3Mau63wm+6CTt2y05kzKWp21C
	XT1D1G7tefHdudLUb4liQFtTaa1RYdauzoG98MHTklC6+1jkqw==
X-Google-Smtp-Source: AGHT+IH6wIHQave/ijbn3USkRE6+YMPxCQbHROwx5BiESapOlb24WCKhxVJv8KMRLhDAEGMVaztxUg==
X-Received: by 2002:a05:600c:6c4f:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43d9105c99fmr12009115e9.9.1743139610634;
        Thu, 27 Mar 2025 22:26:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d82efe678sm58772765e9.20.2025.03.27.22.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 22:26:50 -0700 (PDT)
Date: Fri, 28 Mar 2025 08:26:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alex Markuze <amarkuze@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	ceph-devel@vger.kernel.org
Subject: [ceph-client:tls_logger 19/40] fs/ceph/super.c:1042
 ceph_umount_begin() warn: variable dereferenced before check 'fsc' (see line
 1041)
Message-ID: <7ffc0531-0240-4a83-8062-e77c7710d93d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git tls_logger
head:   3d957afa4285ed4deaaf42d200ba7ee1f3092f8d
commit: 75b56e556ea415e29a13a8b7e98d302fbbec4c01 [19/40] cephsan new logger
config: x86_64-randconfig-r071-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280852.YDB3pxUY-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503280852.YDB3pxUY-lkp@intel.com/

smatch warnings:
fs/ceph/super.c:1042 ceph_umount_begin() warn: variable dereferenced before check 'fsc' (see line 1041)

vim +/fsc +1042 fs/ceph/super.c

631ed4b0828727 Jeff Layton  2021-10-14  1037  void ceph_umount_begin(struct super_block *sb)
16725b9d2a2e3d Sage Weil    2009-10-06  1038  {
5995d90d2d19f3 Xiubo Li     2023-06-12  1039  	struct ceph_fs_client *fsc = ceph_sb_to_fs_client(sb);
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1040  
38d46409c4639a Xiubo Li     2023-06-12 @1041  	doutc(fsc->client, "starting forced umount\n");
                                                      ^^^^^^^^^^^
Dereferenced

3d14c5d2b6e15c Yehuda Sadeh 2010-04-06 @1042  	if (!fsc)
                                                    ^^^^
Checked too late.

3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1043  		return;
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1044  	fsc->mount_state = CEPH_MOUNT_SHUTDOWN;
50c9132ddfb202 Jeff Layton  2020-09-25  1045  	__ceph_umount_begin(fsc);
16725b9d2a2e3d Sage Weil    2009-10-06  1046  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

