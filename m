Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E65F335562
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894266; cv=none; b=FscWLrvtviWojNIJ0dj79nQL9um98RtGjj6m0o27efvK3rO0G/e3Onjx9yK8DeV7E7+vq+VgSeqekPRv/F0bo6eiZA9akCaYqbt88sIbivSbsdRJrRIiRTVgFWxl6V+wnNSMJVLOBVHV3NerBA8A1OrlMm0b9O2NYuu6eBHX+Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894266; c=relaxed/simple;
	bh=PZ7Ue/+reTmCsL+pA/+vn+apUzyEOCWn0Wx7kqyMg0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHuzsSq957Pd9TPCdb3Q2Z4lgHZVYojszntjJbdwfr4FSq5dpPTOllCFz4VYzig9SEmI+uT/AhUGz3l1oWCGpeC/UawcXutr3UndqCU8f4AaO62T2avuwyUJpDI3axkEC4K4mHNVVtY0mwD7FGKrQhBkZF8GIZclvc8LIndrnzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLl22ifQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLl22ifQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso29562565e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 00:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775894264; x=1776499064; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FYoxqR7Nig0LUyLiP0DsYCnjDciU52ZMAS8LUKuD7GU=;
        b=dLl22ifQqELr8p2eFpXcdzke1xWtLCrDhKLoA95dI6P4MReT/eI6O35QP57YBtwpnw
         qycNJB5O6sp024hSjB8KrI4F9IQ4OjrIgQM3O/Zk9D3l+025cen3xZoSJ8w+rsp2nTZ4
         61T4M1xQWZL6sWbowku5EXD8ULKKs36jRfQrR/O6A1LKVM0K4tWFR4BUAzCr5hUdqfYe
         on/hBwItl6rVeP+ue+NGDWp6PeR4yTNEZjIyiGyR2eSgE96JsAWnnLxm63p6ws7xYh0e
         MkKluSvzJRjWKVIr6rrm56ajpVj6jlHMDHoHa7a+dLQrWuHCIF5Ekxvm0pvEFvgzGLQ9
         vlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775894264; x=1776499064;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYoxqR7Nig0LUyLiP0DsYCnjDciU52ZMAS8LUKuD7GU=;
        b=QGfjHpCCMa19ZbJC4qE1jZCClVSY+yKTYq/Y57k9M760ZeFV/2v+1Ygz/hbeM65LE8
         r4mEg6Y+PEIFu66kZuibecYyvsDvlYSDCzjpOsGACPgv/M5L8B9qBlUdr4MsIV7WNnet
         H5M39C00uv7ZIOdeiL04yzODqByygwnEw9TriBDuqyI4o7fB0zTM7BO2UmQ78TuH9vHT
         9p4fBJJcrAQezAw3OAyss6JuZb+VnlCONGdOLSWUxtACU1MEhn9+bu8H7/ktOkRzxyQx
         9YyxQFyX8u7bAUqPlHZtFX/rpFCiYX1zWSCIq0c0j1yOG9kqETgOSGSts68CMo1IBj6I
         niRg==
X-Forwarded-Encrypted: i=1; AJvYcCWOD3vhRuCMmVHN+QtfGpIT/jy/NJh6Ua8PgG2GMtPdKfoVmtsqiM1AApjPjyBK9i0No0Bxvbf8H6oQFFlg@lists.linux.dev
X-Gm-Message-State: AOJu0YzupQQejgbIBjXwUurkP7nJP8Fx2is7xoq/OWqJIKETMReaaDIp
	3B9zNo2yEU5EJAMQGOgzmlfrSfLH74shBYhVAp9bA6NW7n+sxktFWI0m17cnHzST
X-Gm-Gg: AeBDies5vquwXZmmPnXH1ILKyCjAiPE+4hDLuicdfZdKhy05MsB7TRS7SdEKl/A+zXF
	3HUQReBM65nc75u4P/3bOf0vmlocZE5chsQoX8H4z/CnpOvOoymM7RhemohWOzHM0dUQkskMvqa
	wJkluURdbcGy+kdUHBfZBiqcvKS00g3JTojyu6lpxgg5ESEFaWtoGH6e0/MXYFpJzAog1h3Le+p
	dtuAQ0bBu/qL6Ikr1Gy5HKfi/it1010BrKdVKQR4eG9D2RrKgou2mCKVJpFMm5OQVjx+0ghEYAb
	YWIY29N/AA9oX8rJbxKgarhI2EG6hlg39BvBv+1987J+CKXp3G711002zoJZPNQp2mxyVsyk7TB
	pOF6zXmt6TnfEVb18a40GxNiXBPX3sB7hOlL/65cPW9gMYRDSyCx6Kf9uegJbTFIPkD/rlPEByZ
	3ONs8UofHfCXp+HGW9I/s=
X-Received: by 2002:a05:600c:4451:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-488d684c6bdmr67379265e9.18.1775894263430;
        Sat, 11 Apr 2026 00:57:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d70891sm42837795e9.2.2026.04.11.00.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 00:57:42 -0700 (PDT)
Date: Sat, 11 Apr 2026 10:57:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Tiwei Bie <tiwei.btw@antgroup.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable
 dereferenced before check 'qi' (see line 468)
Message-ID: <202604110937.MLUL70Lx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ Obviously, the commit just did COMPILE_TEST or something.  Anyway... -dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
config: um-randconfig-r072-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110937.MLUL70Lx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b555cb66583e ("um: vector: Eliminate the dependency on uml_net")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110937.MLUL70Lx-lkp@intel.com/

smatch warnings:
arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable dereferenced before check 'qi' (see line 468)

vim +/qi +471 arch/um/drivers/vector_kern.c

49da7e64f33e80 Anton Ivanov 2017-11-20  464  static void destroy_queue(struct vector_queue *qi)
49da7e64f33e80 Anton Ivanov 2017-11-20  465  {
49da7e64f33e80 Anton Ivanov 2017-11-20  466  	int i;
49da7e64f33e80 Anton Ivanov 2017-11-20  467  	struct iovec *iov;
49da7e64f33e80 Anton Ivanov 2017-11-20 @468  	struct vector_private *vp = netdev_priv(qi->dev);
                                                                                        ^^^^^^^
Dereference

49da7e64f33e80 Anton Ivanov 2017-11-20  469  	struct mmsghdr *mmsg_vector;
49da7e64f33e80 Anton Ivanov 2017-11-20  470  
49da7e64f33e80 Anton Ivanov 2017-11-20 @471  	if (qi == NULL)
                                                    ^^^^^^^^^^
Checked too late.

49da7e64f33e80 Anton Ivanov 2017-11-20  472  		return;
49da7e64f33e80 Anton Ivanov 2017-11-20  473  	/* deallocate any skbuffs - we rely on any unused to be
49da7e64f33e80 Anton Ivanov 2017-11-20  474  	 * set to NULL.
49da7e64f33e80 Anton Ivanov 2017-11-20  475  	 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

