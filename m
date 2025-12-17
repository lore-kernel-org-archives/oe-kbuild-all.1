Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8986C35BDC0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977610; cv=none; b=YxLEZfGs19gcNj84QTUQI3aCmwu3mztFi5pR/vswymVercJ5xWK+eHZfgdwvbAuS45ITCtYy8j6SRcYJAJHUDb1mIl839SWgOSxjorecZg/i6fk0xE49oSdtg1b96/uG5LZS09qdMpom2YwFZXCyGdWREl8OAAs4Sf2WkvFo1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977610; c=relaxed/simple;
	bh=pLRdhzvSu88pSVWDOngVnhVPoTuGAyA0SiWedY0Wg4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nu7HrcKeQhny5jnVutP2F24D1swh/reFYY5n2iS9+slKtnPRjPSQ+UTXVox0YWwdejUEbWsKyTCvu8AM1QPauzcOPJOERoQUusVhZlTKZnuLahjS2/OGJ4CIF6Rbj1Lm+HdMTVTYwR9QX8eYibKKPAfNaITzQSsVWFU7qntm3kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrQmmqSC; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrQmmqSC"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-477632b0621so39216945e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 05:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765977607; x=1766582407; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTIw9DM0cHhKePwv9AKGgFw92mWPgI0fhPn3ZfdMOEE=;
        b=IrQmmqSC1/8pDMHINe97lDpYE7l7LIUYQO7uY6owaGX+Uoag7eQM/qS9IKmPYUoiWp
         NEwWKX3meTSbxY/pyrYX5ZFn9GB+weaNhQgn4sEtAMo6tOgYxxaC/w//B+fC4kLSE32R
         1XCqQbiUwykeNlLAFdCNyktw878RKs6I3RD8Bkp6X35K50DdFSX8QWNBGt2fTqaVjX4E
         +P7cCQoYsHlDbIrw59KJ+TRvSHLullWZgrJ2URM46bTWfyZx7v86LoCDVynAWWEUesUn
         77GOForwjlzmIrsvbN3iaWzqcjosbjSDUDiNXjCpmg4ek7meh354vXeesc5uwvbFyT6f
         8YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977607; x=1766582407;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTIw9DM0cHhKePwv9AKGgFw92mWPgI0fhPn3ZfdMOEE=;
        b=WIU1L4qGUPerQOhzrAO+dUkwtUX1Jo+3p+WqpKbv4IWKVg5r80MbV2MSv3u3FrmoTn
         nJoO2AdeorFR9y82Brb81ctf2S1Y41m+GkRUcQsGr4XMiADCuLqHTMrisvThvZC4qmMK
         ou/N6ZDY/PpKHBO83vnI2qd7jsrIeWWQYLbaweK+aM8m4BW9vIVyIH2PvM7WrYPIgZFq
         83Dcq2bin1F170BaQw9l7ysC8PptpLGe8Aep1KY53EJAFSK+H+jW2PJgCw89i5U+FcV4
         KkbXQ54iPF45jtmQDiZQb6huneopyCw1CDsKNwQwgzCm3gED5gi1yy0bdbhTNAia/hJE
         EFbg==
X-Forwarded-Encrypted: i=1; AJvYcCXJXjkO2UFRWaJCxCEi2GCXtRaDeG8qubBOIHTmojYXAJPE0exrJPymDLM0DmXuGz/c4BmqQNhDgB4iNQF0@lists.linux.dev
X-Gm-Message-State: AOJu0YzbNIl/waqOUqHaKa26ClrK1CYEoHXhiooJhpUnmnLpVaAdHnVG
	4aXADXxgziOuIwBN8f1Y2KWzCkxZ1lBKnNtVdoaLL3a38ADNhhsDSMrgfS3XPIAH1iU=
X-Gm-Gg: AY/fxX4jq1dOt4TYJdOrfplgbW/H7mbmQcxpHBtzP/yVUIJA0WddHq/MvnS6+tCrA3g
	fcqqShiHnZrR/wFHuxx5rmwPCtn2h/EF1+s5ZnvKzmwvCM+n0DFyWTgpFBQtX/6mYPHZoE2GrLA
	RSFIoD4uc0GHqmCs/QLOdnWX08Fl8wAakf7C2MHhMlqsJfjwEMFmoFp/k6e07ejBul6JWe3gltQ
	r+Pdi8nupZiRd60a+y56ZtQYXkSyryZomgAMGTVLZBhdRibBVYquANXhxl3+RxynR05yz+VpJkH
	Q2JvOscneTjiGKJmn44km388dv86ef3GK5aZ6L57aGAPLgECD0j/MUDE8FzGlqcK8SlKsLo3fB4
	5vXikm2xK8Alq2BuIWYLL+NGqyHABxq6Fd5OdEC+VCOCrnhLrVrYWRdxJOX0KAf9vk4RkcgNUPG
	t+SM49oQivcEF20W+a
X-Google-Smtp-Source: AGHT+IF3jRL5fJna4tVheIKFH8bDLQB3AmOSU6niu7Q4gpFEYCm2UZcftl4yU5UCX3bXSvWKuxd2NA==
X-Received: by 2002:a05:6000:4383:b0:430:f255:14b3 with SMTP id ffacd0b85a97d-430f255186bmr16405062f8f.43.1765977606681;
        Wed, 17 Dec 2025 05:20:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ad4ee46sm4659067f8f.0.2025.12.17.05.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:20:06 -0800 (PST)
Date: Wed, 17 Dec 2025 16:20:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Subject: drivers/mailbox/mailbox-mchp-ipc-sbi.c:187
 mchp_ipc_cluster_aggr_isr() error: uninitialized symbol 'hartid'.
Message-ID: <202512171533.CDLdScMY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Valentina,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: c1382852330ee2e78d884bab2da25b880488fa1c riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
config: riscv-randconfig-r071-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171533.CDLdScMY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512171533.CDLdScMY-lkp@intel.com/

Old smatch warnings:
drivers/mailbox/mailbox-mchp-ipc-sbi.c:422 mchp_ipc_probe() warn: passing zero to 'dev_err_probe'

vim +/hartid +187 drivers/mailbox/mailbox-mchp-ipc-sbi.c
   410  static int mchp_ipc_probe(struct platform_device *pdev)
   411  {
   412          struct device *dev = &pdev->dev;
   413          struct mchp_ipc_mbox_info ipc_info;
   414          struct mchp_ipc_sbi_mbox *ipc;
   415          struct mchp_ipc_sbi_chan *priv;
   416          bool irq_avail = false;
   417          int ret;
   418          u32 chan_id;
   419  
   420          ret = sbi_probe_extension(SBI_EXT_MICROCHIP_TECHNOLOGY);
   421          if (ret <= 0)
   422                  return dev_err_probe(dev, ret, "Microchip SBI extension not detected\n");
                                                  ^^^
sbi_probe_extension() returns zero on error which is success here.

   423  
   424          ipc = devm_kzalloc(dev, sizeof(*ipc), GFP_KERNEL);
   425          if (!ipc)
   426                  return -ENOMEM;
   427  
   428          platform_set_drvdata(pdev, ipc);
   429  
   430          ipc->buf_base = devm_kmalloc(dev, sizeof(struct mchp_ipc_mbox_info), GFP_KERNEL);
   431          if (!ipc->buf_base)
   432                  return -ENOMEM;
   433  
   434          ipc->buf_base_addr = __pa(ipc->buf_base);
   435  
   436          ret = mchp_ipc_sbi_send(SBI_EXT_IPC_PROBE, ipc->buf_base_addr);
   437          if (ret < 0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

