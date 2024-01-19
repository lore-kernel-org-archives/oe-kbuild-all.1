Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621E54BDA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705679958; cv=none; b=ergSK/1NojI78ok+mmxngdHZvir33QhWXU/9yGQFVxN5LJXp513C4nbzGfGoxJyjdRIL2J1Cu0zilh1slHNO6AIIRYg3Q4ttTj2KZb6BCfpMMt/sli1eSbP0aEQBrGZA0g/MpUI9z1G1MO7+SQYqsyIBj74xHzzpinV8KpgedPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705679958; c=relaxed/simple;
	bh=AJlDflkwRODsEUPi0NvVPIzJzP01uFfxfAVrmiLyem4=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=uoFVu68X9b854gjAZrMlPQizjiEYAIfoLAxOwFrtBiLP8xoN5fVB8/8sv2r+qLSpbGnHY8ehaaLHh1q3BRNTtMENvgvQCe3bVYbH01CoLmITnzjDfBjmEvwIR3wkq4f6qCNweC9AodQnHPVTWqiU3Qr1qGds7fdFsAHvr8rlRc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZZrdegrD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZZrdegrD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d71207524dso4111575ad.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 07:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705679956; x=1706284756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spqctO79LMEfePWwtrEykESbmCLf7TPaGT0P25piJgk=;
        b=ZZrdegrDE7xNUK8Wg7PTU31EykmSQapdz9ziWJStg52YZv1dGvyMhU7P2LAGE9CXI/
         bkqZ4PPYWYoI1XgjMUYOFq076VfDYAhfwhwpL5ZBslh3Zi7xxtSOPwG3F4BLOlizf5P8
         Czxe/BrQOQrbEDXkGjZuA+d9VflAFU1LUx7LGydq5Lly3BR+Qem0T6KVp/AyFPxOlydX
         iaE/gF6bbmJ0RvtyxQ/PDnrXroaThmnNns2yWnnShhdibMgqVJX3dol2uyayTASOUh8n
         R+DliYopvq/6+kego3lW48hjU/JYQDEVWFyfBEpsxVlZgYotIyrU0216N/yl/SMnN4pS
         pv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705679956; x=1706284756;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spqctO79LMEfePWwtrEykESbmCLf7TPaGT0P25piJgk=;
        b=V7ii6qQA2z6Lh3+d3BS+PQ2OMcq1JsXzVDxgEy9VqJpjfkcfBwZEtaXDCFthLV61ii
         SayDpDgp/B0kdtkZ+nBIxGBQmLeLP4TsiRC45JPppMAifb+Yqg5bGDN58RkTWm1wNnT9
         lfXxEB4Z6xgDONQStO+qvStmYPM0R7clpgbAJ01KoQjL1xARzSJNJslxFa/RYalmPAze
         D3V9UJdp0m2EFRIdmrZqXBB1lRL4BUdD3zX+/Hjwzdex3Y7m+vI/2822NeXzXq5jwyNn
         hwlBrtCUH2yH91rdx2JTX3Bu94vUElitQYQCLnBDSmAbJt2M0k51JEBWysluuIesu06j
         wuEQ==
X-Gm-Message-State: AOJu0YxghQ60dCAUpyFnENJ1gYsmLOdoxtW/mEiZJUQFyjPotyq2c7lG
	YD5IJtPbMBASlr6LGyiTVBP9EJdVOSauEdRwEUAq6GxHEAsPqZfOD++ql+jPfvs=
X-Google-Smtp-Source: AGHT+IHO2sWiircB3+rzKhyODHfl/Kw+IWV+ap9vV+pRXjiTQ75RpKzZ3+bgsoPp9jDxBAt70Lrn0Q==
X-Received: by 2002:a17:902:ec8b:b0:1d4:9225:9165 with SMTP id x11-20020a170902ec8b00b001d492259165mr110698plg.23.1705679955942;
        Fri, 19 Jan 2024 07:59:15 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id lq3-20020a170903144300b001d4c3918167sm3219034plb.185.2024.01.19.07.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 07:59:15 -0800 (PST)
Date: Fri, 19 Jan 2024 07:59:15 -0800 (PST)
X-Google-Original-Date: Fri, 19 Jan 2024 07:59:13 PST (-0800)
Subject:     Re: [linux-next:master 13664/13959] ld.lld: error: undefined symbol: csum_ipv6_magic
In-Reply-To: <202401192357.WU4nPRdN-lkp@intel.com>
CC: charlie@rivosinc.com, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lkp@intel.com
Message-ID: <mhng-032be4a1-e216-43ec-9607-c603b0c1520e@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 19 Jan 2024 07:50:15 PST (-0800), lkp@intel.com wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ad5c60d66016e544c51ed98635a74073f761f45d
> commit: 6f4c45cbcb00d649475a3099235e5b4fce569b4b [13664/13959] kunit: Add tests for csum_ipv6_magic and ip_fast_csum
> config: hexagon-randconfig-r054-20240119 (https://download.01.org/0day-ci/archive/20240119/202401192357.WU4nPRdN-lkp@intel.com/config)
> compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192357.WU4nPRdN-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401192357.WU4nPRdN-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> ld.lld: error: undefined symbol: csum_ipv6_magic
>    >>> referenced by checksum_kunit.c
>    >>>               lib/checksum_kunit.o:(test_csum_ipv6_magic) in archive vmlinux.a
>    >>> referenced by checksum_kunit.c
>    >>>               lib/checksum_kunit.o:(test_csum_ipv6_magic) in archive vmlinux.a
>    >>> referenced by checksum_kunit.c
>    >>>               lib/checksum_kunit.o:(test_csum_ipv6_magic) in archive vmlinux.a
>    >>> referenced 13 more times

This one should also be fixed by 
https://lore.kernel.org/all/20240119145600.3093-2-palmer@rivosinc.com/
