Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C08139D1B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268126; cv=none; b=qZh4pnwS0IUEc25SBzwa+GQjkydvK9XH7SwJXAMYJfyeVZUgEINTaAe0QKvRt1buWSs8xa99t1Y4LZLSe5UiSyP+AbflsWftLIuBKnR9RJvJ/w9mSor4lfiI0F7f9ChCn0EAxlNLqGayDmKweT4Y84m3iG4rhKHbCLFQ910K4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268126; c=relaxed/simple;
	bh=OObycL7dpSzAEkjGqtyXc61W7EVTAmlaWIuhhLTIhPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xxbu/s6+KUm7kVWxf/QYffvxMaiWNGoVYcVXjj3kWL5SISoX/57JmcRPtV2o/uAf26g2i5zbGczIHPIyFqsr8860in9+7n4lXXEZZ3aCNf9Cm3ZmozSlSgS+dGvWh/PIqjOJhkwmUmfl4o8kF41EJNQibI7K3HGS0y2cq3LZMtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UY1ZSkjc; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UY1ZSkjc"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-404e580bf09so1829782b6e.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268123; x=1750872923; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=21P8cVZfguzvlpGggP4bvaISHleDe8qCz3Magvo7Zio=;
        b=UY1ZSkjcUuE77RMkswCgsRTO7AH5gbJUNPB+xIsNcg+nfrkPAgkDAGI4rrYe0EQKce
         floDTEV71FqKN4ew1PfeW1Px+nKxSqwEM1terFcOZ8AIF+t+ZtT80lXA572Oi9kfSdk9
         //6kc0qOQoXs5brAiepmyOXtiy7DzD5yHjD4jhxrwyIHhJhsZoNp7sM8n96CJi1YmJqK
         dqG97zi1y3bFNhuWs4lKQRdq2jf4udVX18djP5GngApeGf6uflDb/1XNoYMi7B5k8XIl
         V2yFcK1FE0gyBNJSLN3kqwATMKtt+TeDrACbzXgzWoDTYvXujARCoT0ObAUC+xbXYAGK
         pkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268123; x=1750872923;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21P8cVZfguzvlpGggP4bvaISHleDe8qCz3Magvo7Zio=;
        b=QHX/eY+IQwdJXjeUarB/YLSpYlMHgW2/935xBqOMuw+f7pGb4V16mlkhtp5LCf9S3y
         i0KlIbfcQPwAA+cSfdbkg+/94eZCRfS1lWiUF/Q4vaafZJZGwD1gpjFKa35y52jydQ4w
         iC4yhNkBNTvFf7VDuXqsfM2ziwusFupV698Ljke8Ti1fjCx7sfl14kAaGnmnSF6LIB3A
         lQshyt5SyHJ//LOgWhjMcrW7UTgilHxUnUGt2m975q7RVam1s7rJ6c/ZQVApfmIgGeBL
         10a3Q5HUq8iUM+rLSMx/RBSDn0/JGTf/Hu2GNHhWcT9loZc85aPs/i5ParoWdc2mpTyl
         IUyw==
X-Forwarded-Encrypted: i=1; AJvYcCXeE0mNkHFN7boUbdG8+Rn1qVLoDb2a9khl7M7vkQqM/5lyCTMjtUkqm2RDS56xshThsIAdqufP7t0xD95a@lists.linux.dev
X-Gm-Message-State: AOJu0YyN9ha7zJnuvHKi/NtBbh/Brkx8YkDzMd/v8F4mK7OPxQlAIqZf
	9PkTE/4G452PQo2dTDl3ScNNAF4XPvFMLQnaBXY8F6wUUSaftNP65Lc9JC03lYBWsfg=
X-Gm-Gg: ASbGncvcZXHG0aSztBksj70+q86u3M9mJYSXshGFEAh1yh7jFOm6Ji3rkpjCyJnlJ2k
	Pzb/k29uYnVyS3Uv2fctgzwCyeXtOBsPZlO0Srv7kAW2yaVZvCxs/5Ey0ZACtyLEIT3iLfHfqMb
	fd0x9thTj834yvpkABC8wqzc74vzzWLqes+UMJ1DeZ/VpvofJUZGohUj+4eDOqYsGPvB4logyXv
	ekNhe/PZnv4NuAmf+Byq6xgolr3p3ns32Y1ZmnOr06PhOMlaCj7WfbpRINNMICK4769sWob2mHA
	8fpVqlxMsgES3buRko5xfLBJYxBmCbCI7v1ev9qbpu9huJ1ETXlxnOHG3xC0yYbQM9DOKA==
X-Google-Smtp-Source: AGHT+IH4wrNB27qQ5u494IAaU4x2ftRu6Jgz6zyeX8ggPjvxgEmWIknHKbNmF9Oa+c+eiq03aLZG9Q==
X-Received: by 2002:a05:6871:7bc5:b0:2e9:1c4a:9fdc with SMTP id 586e51a60fabf-2eaf06b3298mr8692760fac.17.1750268123435;
        Wed, 18 Jun 2025 10:35:23 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab8edbd59sm2793582fac.40.2025.06.18.10.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:35:23 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:35:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-rsassa-pkcs1 9/9]
 crypto/asymmetric_keys/tpm2_key_rsa.c:143 tpm2_key_rsa_encrypt() error:
 uninitialized symbol 'tfm'.
Message-ID: <2abb00e6-3cf0-4a7b-87e6-0f08f69156fb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-rsassa-pkcs1
head:   c233b7cd00588a7a3397f17fd2650880aa7cecf7
commit: c233b7cd00588a7a3397f17fd2650880aa7cecf7 [9/9] KEYS: asymmetric: TPM2 RSA key
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132119.0FPtnHOK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506132119.0FPtnHOK-lkp@intel.com/

smatch warnings:
crypto/asymmetric_keys/tpm2_key_rsa.c:143 tpm2_key_rsa_encrypt() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:142 tpm2_key_rsa_encrypt() error: uninitialized symbol 'buf'.
crypto/asymmetric_keys/tpm2_key_rsa.c:143 tpm2_key_rsa_encrypt() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:325 tpm2_key_rsa_sign() error: uninitialized symbol 'padded'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:325 tpm2_key_rsa_sign() error: uninitialized symbol 'padded'.
crypto/asymmetric_keys/tpm2_key_rsa.c:325 tpm2_key_rsa_sign() error: uninitialized symbol 'padded'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:412 tpm2_key_rsa_verify() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:411 tpm2_key_rsa_verify() error: uninitialized symbol 'buf'.
crypto/asymmetric_keys/tpm2_key_rsa.c:412 tpm2_key_rsa_verify() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:411 tpm2_key_rsa_verify() error: uninitialized symbol 'buf'.
crypto/asymmetric_keys/tpm2_key_rsa.c:412 tpm2_key_rsa_verify() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:450 tpm2_key_rsa_query() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:449 tpm2_key_rsa_query() error: uninitialized symbol 'buf'.
crypto/asymmetric_keys/tpm2_key_rsa.c:450 tpm2_key_rsa_query() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:546 tpm2_key_rsa_preparse() error: uninitialized symbol 'ret'.

vim +/tfm +143 crypto/asymmetric_keys/tpm2_key_rsa.c

c233b7cd00588a Jarkko Sakkinen 2024-05-26  138  static int tpm2_key_rsa_encrypt(struct tpm2_key *key,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  139  				struct kernel_pkey_params *params,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  140  				const void *in, void *out)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  141  {
c233b7cd00588a Jarkko Sakkinen 2024-05-26 @142  	u8 *buf __free(kfree);
c233b7cd00588a Jarkko Sakkinen 2024-05-26 @143  	struct crypto_akcipher *tfm __free(akcipher);

__free pointers need to be initialized before the first return

c233b7cd00588a Jarkko Sakkinen 2024-05-26  144  	char cipher[CRYPTO_MAX_ALG_NAME];
c233b7cd00588a Jarkko Sakkinen 2024-05-26  145  	struct scatterlist in_sg, out_sg;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  146  	struct akcipher_request *req;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  147  	struct crypto_wait cwait;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  148  	int ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  149  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  150  	ret = tpm2_key_rsa_alg_name(params->encoding, params->hash_algo, cipher);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  151  	if (ret < 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  152  		return ret;
                                                                ^^^^^^^^^^^

c233b7cd00588a Jarkko Sakkinen 2024-05-26  153  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  154  	buf = kzalloc(TPM2_KEY_BYTES_MAX, GFP_KERNEL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  155  	if (!buf)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  156  		return -ENOMEM;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  157  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  158  	tfm = crypto_alloc_akcipher(cipher, 0, 0);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  159  	if (IS_ERR(tfm))
c233b7cd00588a Jarkko Sakkinen 2024-05-26  160  		return PTR_ERR(tfm);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  161  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  162  	ret = tpm2_key_rsa_pub_key(key, buf);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

