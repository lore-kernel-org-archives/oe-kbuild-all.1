Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888E350A0C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556284; cv=none; b=RSjUddl2yF3RuLnA56F9B6OEcnqynYUEy2ggz/tzzbh+VZo4I831lvdLLupZRqHlpwpLvYOtfAu3v0N4zJiIbUKFfVI2KIpRnenp+PyneObdiT2q9ag3nwYewZ78XtQ051MFSohQXXZF+kCYfvVZRYWGgpVR4jI4A1ieOiVqN5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556284; c=relaxed/simple;
	bh=znvLF7equBBCsQNo3Wvx+9eMsLHSab8JSQ/D1BcsOZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=T25Pji1JdXFkl8y7K5UH1pz08Lu8tBGf2rNAuKZcTvQrIauyKlSTsY5WWa5Ur3uqIfBqscHrmCd1GLTe9/gZTbyBpXfWFlff141xKORR3k9hLxqCll8KyvI0F0MxDPN60/RbyJMN4szTJUHcsbtDLEMWtSzC8ACpSpDCcnaVaZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AINbB9xJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AINbB9xJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so44905425e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 04:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763556281; x=1764161081; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vb/WHH6MVNHpgD8HWp2QmtT5QxY0dMuZGyv+c8piIz4=;
        b=AINbB9xJKTELXf8K4RIXoS+uC0S+gRD3a0PkaF77ajt7KVXTW1r6nZejZZxwQ5YnwQ
         gpYb16o08R9mrL7ul62czbJtCLqAbe+BRbNrxELV2J+pfWpxq7Xp/pKaZMlO3s8E/vBQ
         ep6Bz5MwVeVdzmDS1+19NpkXfXq5CDItmhxLDW3Jv6kbw1mEP5JKdxJFoxBici2rYRWZ
         dQZ9iN/ysEPT4B6oP8M8taFDSAJZmGPBG3OrxwigSWrYjVU+ypqX++X4pHYLc1dN6J0f
         VvVkzdfm5x1pbaTtIt/ieRHN1HTzxJWQpIdnX4gWQVljfeCfeuiaO0XV6NEUPX+PV5C6
         C76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556281; x=1764161081;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb/WHH6MVNHpgD8HWp2QmtT5QxY0dMuZGyv+c8piIz4=;
        b=WTd3HX4L8TxuZamo4auoe3UxOZt4o8evfDsE/BkQD6vFWnKvfslbzCGzNpzGTgiErq
         4+3Y/WL5ASw5i74Vjz7QCToOOUni/yPGeANRe1e+UisEZRuCojkmHL75eM6bhmCB+5N0
         OPdCuTvsWCiUtyILS/EgpLTnCwqj9BqH8/0nGa4GKo/lSLFL2z/IyEjR4m4izdWQJdl8
         fxUICH8JskCdsLPbuZwXJ5lYttRjo13+Xg8RywHgPQI22JO2eQl+QYv0R/dvvCkVgFff
         SF4cAN8WujQc4Rqy0YGpCQzuH+xwF1GA2eH+T/Ob7N/puap/DNgbHlOudLaVBU989SzG
         d/dw==
X-Forwarded-Encrypted: i=1; AJvYcCWEAof/+6caF9aT7tfRBqRAyLjMAT4T7qW6QfBMiDkArx3SrJBYEhGoma8PdbmZvqOGZ41h4ht2A27V1X2c@lists.linux.dev
X-Gm-Message-State: AOJu0Yydl+nT51KX96lh44VkcFKn4nJFJumW6kcfcUA3NvERcaOvKgOW
	kuBNXZSPPKVRIvD0vZvQKWcy8Rg+goj5ElSR9sYL4TotzolbB6+dc0mtDyMltfpD5KE=
X-Gm-Gg: ASbGncsY4qZ8wWbkT2WGlw5Sx7Crg2jhdsBrmEGxRfLLylRdFIJt/mUbjDLfPAJ9nML
	lQx/u+reQ1oHBgQbvYwvZi+066zQwug7y3F+svCbkl3VO9Tc7qwH9Sy35vgEPQTiHLL0hRO3IDA
	j4gWlYThkDKh2IGGrG8Zido9MIrNlFVoFpu6cve6co+/YcVUNlYiaHbBlERCOeLlpQPsBscEM4L
	3v80wEzymsdY3U7QPdkipnICBfqgHcjJU8KJZx2rVggIZiTzYEXRs4cneyvYoc3zMkcMKhlxXXG
	QEpcEe4mOntz806BTNF+DH4p1V9IiF8Gz+dJu2EIcft7yIq53PmrQgKG5GU8VvYt1M3Y7lF2P82
	x8O5RH8SPGMx67NEY/ysOkdYsFV7H3aiONNSXuNZqqrQAJKAFnTUzl/77uZpVrs+9X3/Qlu+zQV
	ATgz4DpxoZNJwO5MT4CKQvJorcRsA=
X-Google-Smtp-Source: AGHT+IH+SRQgfI4whxa9IoNU0Rarp9jo3DPA5bGSZXLbpbdHgT7D/SNsZlFT/IKmF36TzB+D3qSx9g==
X-Received: by 2002:a05:600c:3b87:b0:477:a0dd:b2af with SMTP id 5b1f17b1804b1-477b19ed467mr21820495e9.33.1763556280815;
        Wed, 19 Nov 2025 04:44:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9deeb96sm40177305e9.4.2025.11.19.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:44:40 -0800 (PST)
Date: Wed, 19 Nov 2025 15:44:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Gregory Price <gourry@gourry.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific
 Purpose Memory Nodes
Message-ID: <202511161706.ZqNHM1XU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112192936.2574429-5-gourry@gourry.net>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-constify-oom_control-scan_control-and-alloc_context-nodemask/20251113-033247
base:   24172e0d79900908cf5ebf366600616d29c9b417
patch link:    https://lore.kernel.org/r/20251112192936.2574429-5-gourry%40gourry.net
patch subject: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific Purpose Memory Nodes
config: x86_64-randconfig-161-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161706.ZqNHM1XU-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511161706.ZqNHM1XU-lkp@intel.com/

smatch warnings:
mm/memory-tiers.c:737 mt_set_node_type() error: uninitialized symbol 'err'.

vim +/err +737 mm/memory-tiers.c

6fee6292300e00 Gregory Price        2025-11-12  728  int mt_set_node_type(int node, int type)
6fee6292300e00 Gregory Price        2025-11-12  729  {
6fee6292300e00 Gregory Price        2025-11-12  730  	int err;
6fee6292300e00 Gregory Price        2025-11-12  731  
6fee6292300e00 Gregory Price        2025-11-12  732  	mutex_lock(&memory_tier_lock);
6fee6292300e00 Gregory Price        2025-11-12  733  	if (type == MT_NODE_TYPE_SYSRAM)
6fee6292300e00 Gregory Price        2025-11-12  734  		err = node_isset(node, mt_spm_nodelist) ? -EBUSY : 0;
6fee6292300e00 Gregory Price        2025-11-12  735  	else if (type == MT_NODE_TYPE_SPM)
6fee6292300e00 Gregory Price        2025-11-12  736  		err = node_isset(node, mt_sysram_nodelist) ? -EBUSY : 0;

err not initialized on else path.

6fee6292300e00 Gregory Price        2025-11-12 @737  	if (err)
                                                            ^^^

6fee6292300e00 Gregory Price        2025-11-12  738  		goto out;
6fee6292300e00 Gregory Price        2025-11-12  739  
6fee6292300e00 Gregory Price        2025-11-12  740  	if (type == MT_NODE_TYPE_SYSRAM)
6fee6292300e00 Gregory Price        2025-11-12  741  		node_set(node, mt_sysram_nodelist);
6fee6292300e00 Gregory Price        2025-11-12  742  	else if (type == MT_NODE_TYPE_SPM)
6fee6292300e00 Gregory Price        2025-11-12  743  		node_set(node, mt_spm_nodelist);
6fee6292300e00 Gregory Price        2025-11-12  744  	else
6fee6292300e00 Gregory Price        2025-11-12  745  		err = -ENODEV;
6fee6292300e00 Gregory Price        2025-11-12  746  out:
6fee6292300e00 Gregory Price        2025-11-12  747  	mutex_unlock(&memory_tier_lock);
6fee6292300e00 Gregory Price        2025-11-12  748  	return err;
6fee6292300e00 Gregory Price        2025-11-12  749  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

