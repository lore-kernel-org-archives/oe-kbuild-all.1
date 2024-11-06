Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BB1D358B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887708; cv=none; b=M9GY7u8eiwRZIyAJ+7ElB2L+wgcxtoPSujU+hLUTgYGzi29Ac1XS/OAAgKEQz1so4rjKCfx5C9/SQgxsRoLE2/sIgiGs8SftV+UPkLDhVZnajZ5Ys4pcrXg9tZjiAONYEYuwKTFMgFJBsbp7iXXhoc4jH3EG05Ipdp99QRB+My0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887708; c=relaxed/simple;
	bh=OvWDlr1loUbxSiDcW9b0GU+dwNwbbZnKFoas2+eyajM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGFm6qZmte6rl6BtrJPH38rLw+gQ1l9/9NK6nZwF6nfHy0GpNOZCJaSsQRG6IcjFWUOtbE2x0864zDY6BgSJ3wuuQ+oO9pyHIUWGnkuZGjnBtTDo1repdLJQRNxmKGLpaWJCHEWkzfVMv2MnNx2Kyooh65gWO4x6dq+rKOORXSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wEBDCOtS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wEBDCOtS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314f38d274so76110825e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Nov 2024 02:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730887704; x=1731492504; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkWWfAyBu3WW0g4TCmz8PRrfoftzcKWnN0PBwY8HE8c=;
        b=wEBDCOtSrN51VMhxXui6O73LCB88s/WTc++RcJKiuZ6JtmuDma6CutZzX6cm29YJig
         5hM/JNVYBA0WsHZqpiz9b+AFPkDoPM02e8kqFHDXc7v6sk9qv/1cdgKOPBUT3t8JHB2W
         wK7zDeX0UUt+lmonj6B9r5xl6LiaaiAgva+1WTfPnmxdtLGjX4Q9i0RHEY0532hiKwxG
         wsykojmUldvjuHIQ1EvWYJiLyIJ3FcEkT3AJSWouWdlEV4LAUnNJoa+44eR14hpSxaXU
         973EiWU9zNRcCkXuf/in8nmJ/bN0t/3440uCHM521thCYrdCyYbLAKYvkLvQ1Gh00AQr
         l5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730887704; x=1731492504;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkWWfAyBu3WW0g4TCmz8PRrfoftzcKWnN0PBwY8HE8c=;
        b=h7nOgBUUdauc0oB0XQFYKv8AaBJXrIgllb+sXbAz7QJxu4gQyJG7l64Tdkhll5wfMB
         xZ/gOYe3k0R48bXRsfAJoq6PtRVyKa4TICFulmQE/f90SZurk8V0HnTp3SEwJAwv/eCR
         EXewdU2ll8pHLS6Mcn1BosTZYQardrFva+m47QYsZr3Uc3r35960E2WLAcwQen/up2Um
         gud+oyAn7MPUyIEij9fHII5P/Enf1/mcDsHw6raLcVY49GIcJqmYjp1QuaueTvbB3FwX
         gu6Nj5DlipOnqwDBqPiBoHBjqsLvDvo9yx6jz5E1nB67wUB4D8CD4FDWi6PJc7whEx81
         g3iA==
X-Forwarded-Encrypted: i=1; AJvYcCVSgiq6hNH1EyyfMu4MAPYrcxNcrax/DmYAFYDNRKp4b1qGg6eyokCxxIDB5mkmBmt2/Rh/Y1IBA85lmWYc@lists.linux.dev
X-Gm-Message-State: AOJu0YzHGMgwuTWh93E4Ds3XA+uPxm9dF2EE0+LOAA0J+Pafk4+nmIQ4
	d8jonOGfl61vvKfjlNatDm2UnybL9KCP45yfLcjbt+hJEX5cSP5blDQSNSPezYw=
X-Google-Smtp-Source: AGHT+IHN/LNrUX8sCqZtT8Y/oHbW/YMr6KBY5meERslZsoGedrt7WohxSJqCZWJF+J3Idui5l0+S2w==
X-Received: by 2002:a7b:c5cc:0:b0:431:5c7b:e939 with SMTP id 5b1f17b1804b1-43283255a38mr212705585e9.18.1730887703823;
        Wed, 06 Nov 2024 02:08:23 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6bd6c6sm16622835e9.18.2024.11.06.02.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:08:23 -0800 (PST)
Date: Wed, 6 Nov 2024 13:08:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/slub-percpu-sheaves 8/9] mm/slub.c:4932
 kmem_cache_prefill_sheaf() warn: returning freed memory 'sheaf'
Message-ID: <6b4bd53f-92c0-4cac-9b7c-90cd544609c4@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slub-percpu-sheaves
head:   c2ef14761b7d660275c07a6f6c53db215045bcfc
commit: 7b79b3645d1e8aa28c52bcf891b8d3d59eb2bf1e [8/9] mm, slub: sheaf prefilling
config: i386-randconfig-141-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061426.Ztzp9ABZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411061426.Ztzp9ABZ-lkp@intel.com/

smatch warnings:
mm/slub.c:4932 kmem_cache_prefill_sheaf() warn: returning freed memory 'sheaf'

vim +/sheaf +4932 mm/slub.c

7b79b3645d1e8a Vlastimil Babka   2024-11-05  4900  struct slab_sheaf *
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4901  kmem_cache_prefill_sheaf(struct kmem_cache *s, gfp_t gfp, unsigned int count)
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4902  {
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4903  	struct slub_percpu_sheaves *pcs;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4904  	struct slab_sheaf *sheaf = NULL;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4905  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4906  	//TODO: handle via oversize sheaf
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4907  	if (count > s->sheaf_capacity)
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4908  		return NULL;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4909  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4910  	pcs = cpu_sheaves_lock(s->cpu_sheaves);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4911  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4912  	if (pcs->spare && pcs->spare->size > 0) {
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4913  		sheaf = pcs->spare;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4914  		pcs->spare = NULL;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4915  	}
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4916  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4917  	if (!sheaf)
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4918  		sheaf = barn_get_full_or_empty_sheaf(pcs->barn);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4919  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4920  	cpu_sheaves_unlock(s->cpu_sheaves);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4921  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4922  	if (!sheaf)
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4923  		sheaf = alloc_empty_sheaf(s, gfp);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4924  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4925  	if (sheaf && sheaf->size < count) {
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4926  		if (refill_sheaf(s, sheaf, gfp)) {
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4927  			sheaf_flush(s, sheaf);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4928  			free_empty_sheaf(s, sheaf);

sheaf = NULL?

7b79b3645d1e8a Vlastimil Babka   2024-11-05  4929  		}
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4930  	}
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4931  
7b79b3645d1e8a Vlastimil Babka   2024-11-05 @4932  	return sheaf;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4933  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

