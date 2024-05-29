Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A6315B546
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 14:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993295; cv=none; b=RuhW/PlfzEjJpgwHmK4m0w+9Z293SaXOT4vfDb4HrVjEzK6J6K4FZruriQNx+dAzgjcChJby0Vz9d0GDsqWfCiQBXb+9/W91R/MsvNZe5oxCmOhiy25f3jAx6MQzwV/RrwZd1Y5d7gHVaYlv1vENWBj8mt8z0s37W/ZD5aJYDVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993295; c=relaxed/simple;
	bh=Ey8/2KALuAvzcBRattnpKuA5GdNoIbG9ZqOA2Tf4z8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GS2YBrJShXq8dVF45GONNZhGY1Guh5TxhnulkT3XNoSediNld1IbgOpKaTT7TJ9r1zob7+wlwthMZcrmF2ZYQnPzCf/x4IR5KdILlmVH5LyJpmFIBhQ/paT0OjFTTOBtCZUqqxn2wZXznExRiV9qhz90HrKyyCl9CmSKd7g6Z9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZTtMv1fG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTtMv1fG"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so30084a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 07:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993293; x=1717598093; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ti8iM4CJa0zeubPFUCGKsh7js+m2+W8cxvTp1KBdZNw=;
        b=ZTtMv1fG9q1Ri4rwXNTNqJXdvTSwQB1YMxMYcYgQthPgTSNCFIWj5P1cZOOHwLxfsl
         73VMD6HLie8jtXJYmt1g3ytUXkdfIl2IgueaoGSMVo+fOG+e/yJmFupgBysjvOnFhn/U
         INPhqgRuqaGQWMf3Vst2YbasSULUdTYC6VYtE6SAjTqWPo7tRfXchU8jAJ2fUBFhlxKx
         xv+TjBMtUXy2X2rR4N97Hu2psuIsPOKvNK2oQxpWoZOrXDIFF7RS35LOWlbMTmAH8sJo
         11iyKrO+ilNPh+/nW9rfCI47X+BKVrsJ4vxpk3dBHIkozWc9GwSwzOgO3or+a2TnJMUl
         i10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993293; x=1717598093;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti8iM4CJa0zeubPFUCGKsh7js+m2+W8cxvTp1KBdZNw=;
        b=K+LQDweki5QCB5VypyC031L8fsASM5bAXHrZU34QA2gCml16N8oP+4TGDcEVCKT3Y8
         UA0y2i+RAvJZhmwardzAcA6G2EyJFidhOkGqulIPmXuhSfDdJqRqdkcO1Kbv3VLj+5X0
         cDYRBY+2tzPZyYKMfkQ+IbRcfZLxOfzSzYrAcXPqpBQf3mUfllvOltPkpA6kHJbn0UfG
         O+oZnxIxwytVfbUTmMmFMKKqUJV0Ud/RKSnFQ4g4Jqvu10vpzaZigk2kyGWxkBDKkjwU
         0GIjkjRqz/z5tJT321WC6N/1Y6r4ISccA4OEeBM+XZ2qoPWTek5a6dkCGZ8j3I9l8DOH
         FSlA==
X-Forwarded-Encrypted: i=1; AJvYcCU47TDj1WmYV9jsEUd4A6cW00PZPelpQBv/6I6vpFB+/7tcXIaAD9ixY9Aclai88V5YpRWKSnirbsVrGnYzqxtoC5Ef2yekspf3fpv4Fw==
X-Gm-Message-State: AOJu0YxbOMXcc5zrVSMBJokHDFYNaVxj53VWx5IXqOgYLrKH36r4Mxmp
	VVEKCdv1r8sbLJM6Oqc44iGM+B8X/S17N9Hct+6kFxvAg6BH2E8QV3q7C4I460I=
X-Google-Smtp-Source: AGHT+IEycpg5AfsBjpt7MmlgRlSSNnfMRzhy95My3zSPmMDPM+fo2DlvE+vQzDD0tCAo+F+apSNnyQ==
X-Received: by 2002:a50:8a9c:0:b0:579:eb77:6d83 with SMTP id 4fb4d7f45d1cf-57a03faeedcmr2279766a12.13.1716993292770;
        Wed, 29 May 2024 07:34:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57862f76dfdsm7020297a12.21.2024.05.29.07.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:34:52 -0700 (PDT)
Date: Wed, 29 May 2024 17:34:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v7 9/9]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:400 tpm2_key_ecdsa_preparse() error:
 uninitialized symbol 'ret'.
Message-ID: <59a952f0-8d32-4052-bdb5-8f3ea2310ab7@moroto.mountain>
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
commit: dfd0950fe8c58c105ecba27fc4968d8e3db7d639 [9/9] keys: asymmetric: Add tpm2_key_ecdsa
config: openrisc-randconfig-r071-20240529 (https://download.01.org/0day-ci/archive/20240529/202405290944.TAA2j4lu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405290944.TAA2j4lu-lkp@intel.com/

smatch warnings:
crypto/asymmetric_keys/tpm2_key_ecdsa.c:400 tpm2_key_ecdsa_preparse() error: uninitialized symbol 'ret'.

vim +/ret +400 crypto/asymmetric_keys/tpm2_key_ecdsa.c

dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  393  static int tpm2_key_ecdsa_preparse(struct key_preparsed_payload *prep)
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  394  {
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  395  	struct tpm2_key *key;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  396  	int ret;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  397  
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  398  	key = tpm2_key_decode(prep->data, prep->datalen);
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  399  	if (IS_ERR(key))
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28 @400  		return ret;

ret isn't set.  return ERR_PTR(key);

dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  401  
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  402  	if (key->oid != OID_TPMLoadableKey) {
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  403  		kfree(key);
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  404  		return -EBADMSG;
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  405  	}
dfd0950fe8c58c Jarkko Sakkinen 2024-05-28  406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

