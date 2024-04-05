Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629A28DC8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712299894; cv=none; b=lo3Iib5iQSM2hj5V4mlinH82iakRWQUzKQFxnw3o3hYPNbC9rI2Dbd7jguDUOKQ4ayTYu0IpTbF+i/T4j60DWI6meWR5Mk09uXwni7hQbkmROwnmtPH8fX1sx/1YNf02RmC1iugvH1XJvRZyZ/QgiwlPjUFP3fjjrVPD8okP35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712299894; c=relaxed/simple;
	bh=HRu3sS51PRAfPSI4fE8qGhqKN5RukRlQb95JgC2E/0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eq2uY0b/C+XT80tcsZih+BBnFpi0U5v4D+iQn+A4/2n3JaVLMSw8TLx9R3Oo9sxmd9UQlrY6RzJvulUxejC3y5QoGMhf4L31lOpM/coDj9Fc1k93qHhC0wS+iQZ4qzH/uXYY5Z7aKQKknn2APPDe5v9MeDaMkUgh1wjmj9iWH+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7zTLvGd; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7zTLvGd"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d718efedb2so30647961fa.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Apr 2024 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299891; x=1712904691; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kGVaA3WJWHVbNBxt+U/RcsWe6jTaobH9TJQijogTH8=;
        b=w7zTLvGdjZIzidLX2f4dwMsd5PhcxuPeQcLhZPzmLuh/mdWBgcy3Pc4eDC9/M5VejA
         8upWZgAM0qwkULcAAP2IP8GC3YArLhJlwgAgajLiGMVGxBRb0xC1mMYAf45MWciNfft5
         W1y4/0Yqr86T8Hz31Uv/y6JaWpD3gaOx0vFOWQINGs59/NQ4+U+i9k2Lowzh5PDH42+C
         MUP1661nNWP3wKMeun2qzU10ukahG46SI9VZ8WtdIYFAVxv3wrmqc7rb+n1cEcPglReT
         O+Kk+ojr+pBhUwWevDGOe+l2JvhZjmQV+GsrASp0fF4tV8jqyZZcXNWLLIdoS1g5aSqj
         SfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299891; x=1712904691;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kGVaA3WJWHVbNBxt+U/RcsWe6jTaobH9TJQijogTH8=;
        b=ZDDWvdUA40Bn2ss9FVWrhJoI/eiHO/2ouvrY3ffM/gStx3KbW/4RHc0p0ufe0X0zwa
         G2amPWz9GMuekxN31P+IuXYl2ONiR1OKS16znpti2Dx/wvhzSdKHOpY5jNFgtXq6Dipi
         5Ep1aUJ6KO1QIjuaR+JhVnBbnmtWjc9hii+yg0p2OV8Ahnp8EBbhlRv8iy0php2Yb9FS
         pzzMmYd4fVzCt4E/nBPU1lDZVmSDSbcds5Y/onE765Y2bPbi6cJ8Z80jbo36biWVg1Q3
         sWFyZMRJ6lM1NEf4OSipQOrAWJyo0LC2zAJQK6F3a87XJ8FuXubl7ddpt4447cnHu81c
         Hq5A==
X-Forwarded-Encrypted: i=1; AJvYcCUxOZ3CN+Rd5raDMYRsG5RhQ4ZNx/lkdPpFkP26onrPrBhhLSuVBI8KEep0BKgEBCZfVzS7+GVIbp5CQYKdSBBiH4b39usddCSNHWagaw==
X-Gm-Message-State: AOJu0YyKBQm/5HgijwVg74RSbfBJkoL19mBljHT0qPPR/24Czm3cmc21
	Oh7M2rV/XUTHvGZN8mQ2jDHWh48o5QAOv46Qg57NGZ6JKJXtxfvgEMjSew0sGc8=
X-Google-Smtp-Source: AGHT+IFwtoZNOfqiTS9IsKoi5djsn7PZ8pD7+tifBOzwhZ88FUiBOiHHEZ7FKbyAdtXAuQMIWL/3qA==
X-Received: by 2002:a05:651c:331:b0:2d8:5fe6:820d with SMTP id b17-20020a05651c033100b002d85fe6820dmr643511ljp.11.1712299891274;
        Thu, 04 Apr 2024 23:51:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r11-20020a1709067fcb00b00a4e9359fbe8sm489868ejs.44.2024.04.04.23.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:51:31 -0700 (PDT)
Date: Fri, 5 Apr 2024 09:51:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Suren Baghdasaryan <surenb@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [linux-next:master 2720/3921] lib/alloc_tag.c:142 alloc_tag_init()
 warn: passing zero to 'PTR_ERR'
Message-ID: <6b5281d8-2998-4e66-b65e-45a0e68e5780@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
commit: 9e2dcefa791e9d14006b360fba3455510fd3325d [2720/3921] lib: add allocation tagging support for memory allocation profiling
config: microblaze-randconfig-r081-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051340.7Wo7oiJ5-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404051340.7Wo7oiJ5-lkp@intel.com/

smatch warnings:
lib/alloc_tag.c:142 alloc_tag_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +142 lib/alloc_tag.c

9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  132  static int __init alloc_tag_init(void)
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  133  {
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  134  	const struct codetag_type_desc desc = {
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  135  		.section	= "alloc_tags",
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  136  		.tag_size	= sizeof(struct alloc_tag),
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  137  		.module_unload	= alloc_tag_module_unload,
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  138  	};
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  139  
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  140  	alloc_tag_cttype = codetag_register_type(&desc);
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  141  	if (IS_ERR_OR_NULL(alloc_tag_cttype))
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This should just be IS_ERR().  I have written a blog that has more
details:

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

9e2dcefa791e9d Suren Baghdasaryan 2024-03-21 @142  		return PTR_ERR(alloc_tag_cttype);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

