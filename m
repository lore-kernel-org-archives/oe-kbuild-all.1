Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F042B13B592
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728824901; cv=none; b=Jc2vBc8SzNt/wh6T3knSzovCqTorQboQXJncBZmNGBAGDBFqaLhrxyhY6fiDO++Zdj55q/HRJMNs4ldWSFEl+AK9Y/Dc4h+y5yFjYDtPftJ2Omt5R47p1KX9LG789ZfPujR6M2VWOh+LJbDKoXY2xGHN3i4me/FRdiV64hJ1qSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728824901; c=relaxed/simple;
	bh=UzwP+v7wSYe0vRug8F7Q/yE+ZrNVEpXmHSGfLFKU8vM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ros5tJgqQoQ1x5zyICWNSEzx/Y3B39FDnvrOx9OLGA/WtkHFO2fRMjbMC3EtqIi3hQzKsp6r3vP+7JFRJ51GHLUukNMquWHT3uVFPTm7MzKVuttFolQO9FWYWIWN3mczETidg2xEAzvle5icVWr1WC+0mk4fQbN9HflE6WciQPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlV6C547; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlV6C547"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c95a962c2bso1717851a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728824898; x=1729429698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgHxcpCnt1m28Spmy794S8e8vo0cvEqjskS68PjwE4k=;
        b=jlV6C547rFf2PfxIgIy1GCmLAyaD3sZmX/qY4QTPqX7NmRXYgUhN1Met6RxjAem+Wu
         0vdegraNpiqBbA1ft/WPSo7iiNyPdjrIzB2dVgnxwLFMN3tfACywYLPJKRWDisDxgkO+
         qqQ3EwD4j3tddGhOjcvDFDDd5oRO4J7APC76RQNP1Nna+726f+SndiCZoViFRFGiG/CY
         Zsu0cpESffeRbGzvvgOA6G6/7DCcL1toDtjmReVgK/mt69HoHnXl4RKwcMolZjj3tvEI
         QChoxhVUOzCkZELW5tfaI7PtS2Rtqvw1QIlofT5UwN2Eq4P2+LCfNomb7kMOBJ2PxNky
         E9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728824898; x=1729429698;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgHxcpCnt1m28Spmy794S8e8vo0cvEqjskS68PjwE4k=;
        b=QwThnFzAW3t78+gos2FsBIW1Bk5mtnTEkLPHYHevm1/6E/4ifXXfw8QbDP6dKLaFwU
         7l4hvwe6e+GyGqsjUL6tZ+nVxCEzLEWGSsaGoWhvgY2f4fsxRjqLXFQRmFgv96G63LO4
         2TAo2S7kXN8I4k7DZY7WADMoEoJSQrBy9PnY5vKE+P1rtgnGDS74/M+Z8lx0ZyoW7jHV
         pa9iL2Leuxmvgdy0Bi1KIyMmwtmvG1avFjuTupGjdCOdku5NSesT6KI3d4Zs6wcSuEAg
         GL9NA1cl1+MaAK+yZXgVBbOPIjUZdkrmNN1V3+ng5oG/AiTctyX8Q4f/WzVx4Nx9GGq3
         s1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXz6R2mUBbGhHeYoIWutpwaM02sK5tE2EmjC4AT+MPret3+FBLhMOxHszWuX2BeQBnuufSw4MPbNhCCMwPQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzEUcc63KiknsAhIvALcwwwSX68kqdayDuY9re07Kisgs84pIdH
	DF9shD+NDuCCIItcvJdg8XDQDX2SsC7TXyzS5xR0S8+ZncVYDbCQQyvnJYhoz3Y=
X-Google-Smtp-Source: AGHT+IGwEWE371TARzktggzetrHDP4kTrhJ9brqkPyC9v+9STeYVdsEo8EWbdpgQCfEd+yto1WG10A==
X-Received: by 2002:a17:907:9489:b0:a99:e98f:e73d with SMTP id a640c23a62f3a-a99e9900010mr296287666b.37.1728824898043;
        Sun, 13 Oct 2024 06:08:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937298cc5sm3745677a12.93.2024.10.13.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 06:08:17 -0700 (PDT)
Date: Sun, 13 Oct 2024 16:08:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hou Tao <houtao@huaweicloud.com>,
	bpf@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Daniel Borkmann <daniel@iogearbox.net>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, houtao1@huawei.com,
	xukuohai@huawei.com
Subject: Re: [PATCH bpf-next 08/16] bpf: Handle bpf_dynptr_user in bpf
 syscall when it is used as input
Message-ID: <47cda1ac-3d40-415a-a36c-833efbbfa19c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008091501.8302-9-houtao@huaweicloud.com>

Hi Hou,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-map-flag-BPF_F_DYNPTR_IN_KEY/20241008-171136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241008091501.8302-9-houtao%40huaweicloud.com
patch subject: [PATCH bpf-next 08/16] bpf: Handle bpf_dynptr_user in bpf syscall when it is used as input
config: x86_64-randconfig-161-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120530.zUoa1scp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410120530.zUoa1scp-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:1557 bpf_copy_from_dynptr_ukey() warn: 'key' is an error pointer or valid

vim +/key +1557 kernel/bpf/syscall.c

e1883aa78ac1fe9 Hou Tao            2024-10-08  1543  static void *bpf_copy_from_dynptr_ukey(const struct bpf_map *map, bpfptr_t ukey)
e1883aa78ac1fe9 Hou Tao            2024-10-08  1544  {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1545  	const struct btf_record *record;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1546  	const struct btf_field *field;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1547  	struct bpf_dynptr_user *uptr;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1548  	struct bpf_dynptr_kern *kptr;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1549  	void *key, *new_key, *kdata;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1550  	unsigned int key_size, size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1551  	bpfptr_t udata;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1552  	unsigned int i;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1553  	int err;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1554  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1555  	key_size = map->key_size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1556  	key = kvmemdup_bpfptr(ukey, key_size);
e1883aa78ac1fe9 Hou Tao            2024-10-08 @1557  	if (!key)

This should be if (IS_ERR(key))

e1883aa78ac1fe9 Hou Tao            2024-10-08  1558  		return ERR_PTR(-ENOMEM);
e1883aa78ac1fe9 Hou Tao            2024-10-08  1559  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1560  	size = key_size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1561  	record = map->key_record;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

