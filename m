Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101415956E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993408; cv=none; b=jTJ34DF+YhZwuX1ztWEuzyRpFAOMGwnn0eraxdCVrva2gJwdPDGJf0FBMcmukmuQduyZRH2w738Z4cEdetC2TU2Aa3e8glwr67lX/8NM4cjOh0GXS+EWzwIcY5btnCFHoi9jhVupIYGg/luZteOVQsblK7hlpb8gICHtafoHmBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993408; c=relaxed/simple;
	bh=v+AqXz9lE7vMj8YZneK1GB2GEtgHWi76CLZjSCBDrqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kxpCt1ebp6sWmowbwWEuX+EnTmN/vB18q3WJxv0Pxs/X3U6TfX3UBxQRNMmP9zkmSM5BlzxEaVlRslCBwhq+QHqYIlIgfYUYgK0+OZoQSyorjSkwqYbBnGhhLpVD3fpIG0u7d7q0SFZEvKnKKIWnMU+DB8qnVvCiDVTAdtXlg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/K9pbSd; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/K9pbSd"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a634e03339dso262974566b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993405; x=1717598205; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yv3a3CJFN4Nnb+bjJbzTRKcZ98dxxB3lgsL5CdCIzmU=;
        b=K/K9pbSdT6xI6p9N34ZFf7QMJIWGjNX79VH8rGtGxZJ2tF95Hmd8AVtr3n+0ErQYGw
         +G7JPvhkWCfFjjhVoq4kTNtLxbe/BzFRW4LZ/5fdnXOii4BdmF2OCwI4AHDn5oP9hPre
         O1wRKS+mPJtq+TjyCF8xEmBu9eTceRHhAhVHak2wyN5hWTG2sST88ZYxIRyNAs6vtLV3
         xq0R70ueyJ5btCRr8XF4m9staRneKakQJtlaUkf9KaVXBd7TjGrH73amiN1Sz/eOghzD
         2GM5XtQ/eaA03uqqkrsZcwNJIlFeaj74dctIPmTgckIMlczzfFx6J2JlzHkEj15nunM/
         kkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993405; x=1717598205;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv3a3CJFN4Nnb+bjJbzTRKcZ98dxxB3lgsL5CdCIzmU=;
        b=UC1DrqUZYllJrsDTXdkCOBxFsayf2XYpSHGETAieiTnzH8sznKWLVvrEZPrK/7BfBd
         bwZr1kRoSwGbRaC5o4us6uReQodrV3lA42c9SljbVZqOdXXHxGqJXc13hVeua5ZNiUuz
         PEZriAiB+xzxkqWouPPM8o1wurLhjo81FfexERTj2SrTZJMDea9pnDw5thstyBuxjZT+
         IVvYeE3qOki/XWZYPj3ShE+CK8ShN12hJq0zCwqA5EpPAEnd6O9o/KBwgk8A67C4Q2Bz
         0HUOooS+sMmN+a/rb3/4C5Y7WvEvrQIUMov0EwnPKPyr80n+P4bSYQ3K4Rb7pzjt0qL4
         5lRg==
X-Forwarded-Encrypted: i=1; AJvYcCUaWXuP7vn6r7QVlsj6Pd7gmxXuTsgq/ZmycHs1FqR4zX/MW4g63uW38Gwc7ORimd8Irwf2lsKSPcZcq3Loo49EIkT3OqTm1BpSS+d4OQ==
X-Gm-Message-State: AOJu0YzXG/bm4MLBX/cl4UUvnDKLki16cjtOJ+WBHLEDoD2bgcOcwhBP
	ekUtAgPi5wBPXiCuINRCL6oM5yLuYiMg494jwZtZzfUvbWciJElCjQa+gkEEQLA=
X-Google-Smtp-Source: AGHT+IEzmGWtCmzYo+wzkCM+TEmy2NyYpktDM4J2BXNMHhR6pvHvLeHzCgGQ3u0rvedu0L2fz7FH9Q==
X-Received: by 2002:a17:906:6d4f:b0:a63:3c69:ec4 with SMTP id a640c23a62f3a-a633c690fdemr337843266b.23.1716993404942;
        Wed, 29 May 2024 07:36:44 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8b9aasm719367866b.155.2024.05.29.07.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:36:44 -0700 (PDT)
Date: Wed, 29 May 2024 17:36:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	James Prestwood <prestwoj@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v7 8/9]
 crypto/asymmetric_keys/tpm2_key_rsa.c:636 tpm2_key_rsa_preparse() error:
 uninitialized symbol 'ret'.
Message-ID: <cbae0ed0-e0a6-41ba-9671-a9f48e8f07f3@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v7
head:   892305fec7841bf841a9c19e01c999c5f4b4e831
commit: 4970b8d723c3af732b21a8bf7c1eebfb03792457 [8/9] keys: asymmetric: Add tpm2_key_rsa
config: alpha-randconfig-r081-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291528.FxUKVyP2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405291528.FxUKVyP2-lkp@intel.com/

smatch warnings:
crypto/asymmetric_keys/tpm2_key_rsa.c:636 tpm2_key_rsa_preparse() error: uninitialized symbol 'ret'.

vim +/ret +636 crypto/asymmetric_keys/tpm2_key_rsa.c

4970b8d723c3af Jarkko Sakkinen 2024-05-26  629  static int tpm2_key_rsa_preparse(struct key_preparsed_payload *prep)
4970b8d723c3af Jarkko Sakkinen 2024-05-26  630  {
4970b8d723c3af Jarkko Sakkinen 2024-05-26  631  	struct tpm2_key *key;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  632  	int ret;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  633  
4970b8d723c3af Jarkko Sakkinen 2024-05-26  634  	key = tpm2_key_decode(prep->data, prep->datalen);
4970b8d723c3af Jarkko Sakkinen 2024-05-26  635  	if (IS_ERR(key))
4970b8d723c3af Jarkko Sakkinen 2024-05-26 @636  		return ret;
                                                                ^^^^^^^^^^
Same.  return PTR_ERR(key);

4970b8d723c3af Jarkko Sakkinen 2024-05-26  637  
4970b8d723c3af Jarkko Sakkinen 2024-05-26  638  	if (key->oid != OID_TPMLoadableKey) {
4970b8d723c3af Jarkko Sakkinen 2024-05-26  639  		kfree(key);
4970b8d723c3af Jarkko Sakkinen 2024-05-26  640  		return -EBADMSG;
4970b8d723c3af Jarkko Sakkinen 2024-05-26  641  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

