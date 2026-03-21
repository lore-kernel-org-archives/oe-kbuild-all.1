Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EFB2A1CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774081370; cv=none; b=ZpUr4YuLuta+jvhb6DhCqfo14bHZuKX7PHPZxDLgay1Ji0F8CvRDWNoweesH0AxdEVa6q91vkvb9T9dGars0I5te8MODqjPUIUC5fN3nS7+DQHpfa1FcYFsY03LZYGLBExc9GIj7f5P8c0S0PwfQd4VsfP4O/Ury4WZemrS2pdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774081370; c=relaxed/simple;
	bh=o185dR7GcK1G3JlJOBtrgm1Du+CxvHKqi/LdjToWpDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nd8qnwmGV31achREx/3w4Ikgp8hnpMKGju6QjHbt57AqLlyOuBgUyFTz6emIb+WeKF5J6pRoB6g6JpLgo0zBY4X0cH2qujRPc9LmFPWaTt3cZA/f1+u//ko9N5nyPUCbL3IqPIKYUfcNoY4VNGtmKyY4tpb1rqo+zqNe9ctgK7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pvkPTFZA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pvkPTFZA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so23760285e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774081367; x=1774686167; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QapcZiZKmzc/L5G+0kT/84EOk/SJve3kRBM9k5Ue3U=;
        b=pvkPTFZA85S0Wag/Hy0gJetaQqOsixsrHMPqWFgfuNL2HAYoe7K8q8VFdGezPYIpl3
         ptFw+pnqQI2/ogRzWhD8V5OsxP0blJwn3A6rTK9RWVERUVRzrEfoYJUfjknEbACcNGxa
         sf8xF6tEv1FjI1/dHTJAVEesyRHuy9qwB7cnYbVVivbl33AlIuePxQMHfoZu162fvy7B
         JNLfbKrdCg+y4hG/4t9E+kqvijF2ub1jsjFd7plKRgu+XVFgf4QnoZabDAEsnPcQktg5
         ekZMWqWlzSLX6sIkvzXMTP90QF//zZM10ChQ5oaof/FSQhhxB7tmET3So5hQjZGSZVIC
         ucrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774081367; x=1774686167;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6QapcZiZKmzc/L5G+0kT/84EOk/SJve3kRBM9k5Ue3U=;
        b=GzAXVHVzrmybJJn1L68FhohS9nQvflOP5acLqo4hx6pQqO40YtGiPU+4vVmGNcRtHP
         zVN+6vE+8PT2xlX6YO6DHjfQq4lN1ccUENz+gn06Xvq0vV/NFMLidN+jLtMySjdS4pjY
         v2/DMa3p4bme5d+wV/2yLI69fvjZBHfSVnjZuHm+iGMXh3YRjmTZshoLF6O4hy6/ytfg
         rofKwNZM8teAodOv0BsyrOjQ0CKsPETSZkSEFFyLOt1JMwIn89kOfDug0lVoIjlMC7ZY
         0aUr2M8QG99z2UvROFQ92KcjNe96mal8+1Taw/6K51RbenFILZXyxni1AI4XkTjkcCGK
         drDg==
X-Forwarded-Encrypted: i=1; AJvYcCX+4aU/tDJuyUr4ObyGhsv1YSavnglC50aWLdmfRIDcbPbK62wdgLZlXAaKvZOJ5d/ShRqA4ZxJpXHU2c1i@lists.linux.dev
X-Gm-Message-State: AOJu0YwNGc+WDBIBNAHVS40ZnarbqEF08H+pRvYeZu7towILjUux2q3S
	3YFrj4vHaZph5JKAApofJ13Au9iI+6CMBkyfjhSigt/n2Q8jhOvCoSQDXWBZmsF2QOA=
X-Gm-Gg: ATEYQzyys6mzG0wjxWz0ei8b5MzH4nzksy41xJTWTaQiRzOzr03jx3U140lCU/DF+ui
	+P5IsWXZBDAbkXqqozMcToGqceKKUZFxx+iPwxLDNFi+miOa07eCmRlKbwjPdwTMzC4D4xldfbN
	80BnkZq21my4YK+hDiyBT02zWxOZGUTYsC7x+cwwPcPlcBTqJpTo/pzjsfHzGWNOLkvTEE1LOJa
	UK5q1Hy8zr+vb3MUagPaODqO9CEv6ImrAE95B4hXQoyAjfXiX+7Qjn8agSU+0XbWpBdaLRFWjgJ
	XygUTUyB3nEcpePoodh7dmpZ65JZrkDMdVjioOLM0+ey1o2vFTYnU+WxRvZdCUcKhqsfTud37B2
	8/IpgisnJabm4fPcF05jlwEbKFAW0qiOU3+GAuIAoBJ/L+lMxPLE9ncLFUEplyH0x3lsHppxpjd
	uBglGgMxNvt1kU5hQyTgatLttS9Pa6
X-Received: by 2002:a05:600c:524e:b0:486:f634:ef3 with SMTP id 5b1f17b1804b1-486ff01efcdmr79549725e9.32.1774081366958;
        Sat, 21 Mar 2026 01:22:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48703e26408sm48164995e9.11.2026.03.21.01.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 01:22:46 -0700 (PDT)
Date: Sat, 21 Mar 2026 11:22:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-block@vger.kernel.org
Subject: [linux-next:master 6465/7971] drivers/block/drbd/drbd_debugfs.c:336
 drbd_get_peer_request_state() warn: bitwise AND condition is false here
Message-ID: <202603210529.IutAxKNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: 945807e66a140e5ee0f919d04e15eadd4cc294be [6465/7971] drbd: remove BROKEN for DRBD
config: nios2-randconfig-r073-20260321 (https://download.01.org/0day-ci/archive/20260321/202603210529.IutAxKNP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603210529.IutAxKNP-lkp@intel.com/

smatch warnings:
drivers/block/drbd/drbd_debugfs.c:336 drbd_get_peer_request_state() warn: bitwise AND condition is false here

vim +336 drivers/block/drbd/drbd_debugfs.c

0c897516a4856d Christoph Böhmwalder 2025-12-16  329  static enum drbd_peer_request_state drbd_get_peer_request_state(struct drbd_peer_request *peer_req)
f418815f7adad4 Lars Ellenberg       2014-05-05  330  {
0c897516a4856d Christoph Böhmwalder 2025-12-16  331  	unsigned long interval_flags = peer_req->i.flags;
0c897516a4856d Christoph Böhmwalder 2025-12-16  332  
0c897516a4856d Christoph Böhmwalder 2025-12-16  333  	if (interval_flags & INTERVAL_SUBMITTED)
0c897516a4856d Christoph Böhmwalder 2025-12-16  334  		return PRS_SUBMITTED;
0c897516a4856d Christoph Böhmwalder 2025-12-16  335  
0c897516a4856d Christoph Böhmwalder 2025-12-16 @336  	if (interval_flags & INTERVAL_SENT)

This should be if (interval_flags & BIT(INTERVAL_SENT)) or
test_bit(INTERVAL_SENT, &interval_flags).

0c897516a4856d Christoph Böhmwalder 2025-12-16  337  		return PRS_SENT;
0c897516a4856d Christoph Böhmwalder 2025-12-16  338  
0c897516a4856d Christoph Böhmwalder 2025-12-16  339  	return PRS_NEW;
0c897516a4856d Christoph Böhmwalder 2025-12-16  340  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

