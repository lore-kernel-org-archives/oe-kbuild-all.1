Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C921B185
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131591; cv=none; b=n26Ls4z+82V+C7hb+qTyXQk6CzAnTIqeihD4XVFhdnCW5ZemI6G1rqlR7pBrVmYL3PhayTXCdBUlIB8QnXG5tE/hHtnMZE8I1jB0RQ2M2zypojlc3CWO7c8GPnWNj1GkpKnqJDnPhsSLjuO7f5500Ma5azLKxGS+E35VtjdxKak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131591; c=relaxed/simple;
	bh=lM5iFd8G0Ace+/s/X/+rVN4FNyVoLU7uwRg8EPb94W8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+MKW1QMwgTX5dFm1gDRJS2AQ355oGbp1wfk6vdUi7ezhQhaHoZ9pYUOYoOiTFWQimr0x8T+BhDs5zW9L6FvMAGtj3QSn15lLjncho3ogyGngMWnf8QcGEmsPZ8FQp7l9racwbLEuu39kI1p91VisyjeWcxQxehQDQ7X6mVoMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYDAXFj9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYDAXFj9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae77516so14313695e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 00:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766131588; x=1766736388; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqDc58J0mJlF6iz/FD8YaZSHglWLc4nJynwRJQT9VB0=;
        b=KYDAXFj9WAlbf+wbDFttxXby1t8V1BnG4cD9OZjANB8zMDCkCoqslUCL3jpGvBMmSM
         Ez2Om2JDWXtFk2f2V+oQFj75g+2P5SxIqQi5dQX9WV1k6OFEkd387ZfdQvmZ8lhsYdzd
         hCWzqC3x9NrLAESl4FXaRkHRaGVMYx1BT5ZlvzNDVYbxXknaXsm+oadxbRgQ3JRahNJX
         tK6EaPAMWpLBCuR4WVy28nv29wdNT5DFuqomMq8MovcvrWIgHcGJFDxvBtSOGFWYGvNH
         UaD1kcKeZuYQ8Gdo0kH/zFykoYOGoCvvgMh+d3yQF2Q4xbyXFNHa0TFVcKOsWQgvM+Lr
         Y8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131588; x=1766736388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqDc58J0mJlF6iz/FD8YaZSHglWLc4nJynwRJQT9VB0=;
        b=ngtnfcPt12GJZDfCKw9849tGfV15iBGXmUrQ7kRzeEbdgXALcNNeKXBotE8hrag3qX
         bsCPzq1TNQaeiHCbumC2ge3H6eseqCJyJdXL3I3rwGrUf6/HAMTN81fXZRGo4lDEZDl8
         ApC/A1pdQ6rh0donI8malcI+tYbBM6wJ+RM7hvmaO6UiJf8vWpamRX2/lDsTeCkj1yds
         o9MkgDNgIqm1PmqujktFyaMRa6UI0b7QsT/FDDZL1lzr/0Y348jZDhITcfvWGNJJIWRG
         Yh3hnyQUuPnPy6OaKeaGEVTc03UOMV9icA04AyiQSjk1sqtySPeao5JudgR89iIrMtMn
         SC9g==
X-Forwarded-Encrypted: i=1; AJvYcCWFIyQfTSE2uelAlJzaFXNF5WX8IdG+qJN+9FPBNmS8eHeqoAryr/dWlsaKMAJZY0STxQUfQwUNd7+e/k3v@lists.linux.dev
X-Gm-Message-State: AOJu0YwRls4Dmydjqa/7olrM90Ob8UhNSPwz0beNkR9XZRu/Og0k9jlS
	sYBgeQs4wfH/ZTexlup2R1ImJy+SIQdoJ+keBKLGN1yPIxJ7iFwgmwBoBISlWJYjdGM=
X-Gm-Gg: AY/fxX7/y19FG5gGS5/Fio3EZHd7XWzXnAiGApWfUpmJrBDq3XTTGvjVUPDoDJnhpOo
	4gAWWahSGfcx1IxwpIdP4rcpncE5fPO14fha+V521r8OyytPwjkQKrJJ5Gi8m0wDF3XKI/bjhsv
	hJ+yde83HyFMmekx3mALw2l15iLeCdcJxqkDTV7DFZAUHE7nrbjUgqN0SwpN4HeGPJ0X076W8i5
	HBFRP1Ih4koyL1Rgi5D0YOi8e4Lqc3R9Bkc2Sm46Tjhgc5szlmWj+V9fq9c2hSRzIY4FofJvZ1p
	oz74z9FHLAAJFg2HVNXNouz3BgfFlS5Hv+Ky9oejAZxMDT1+Fp8EXshOE48g6hsXV+gcw7msFNx
	bgLnLFsy2Wm6n7E4K2jv1R03JcjdU3cConlXpWctBCoJ7A+52Wdeot6ADIf3n4vHHvsarcLxcTf
	/uA0KNyjdTHLySZ6dqbvOT+h9Hs5o=
X-Google-Smtp-Source: AGHT+IGDnrg3fAhxrem74CTe/Ql8uGGeqyOVUZ6NLQXko+3T6NwjpJot8e06kUTBU0L/xFNgP4bTqQ==
X-Received: by 2002:a05:600c:1c1a:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47d195780eemr18520105e9.11.1766131587913;
        Fri, 19 Dec 2025 00:06:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm87239355e9.12.2025.12.19.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:06:27 -0800 (PST)
Date: Fri, 19 Dec 2025 11:06:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable
 dereferenced before check 'buffer' (see line 2172)
Message-ID: <202512191559.0oHMB8eD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 5ecbcb61e172d82faf1bd8c00b17837d3c658c59 [43/43] ANDROID: ring-buffer: Introducing external writer support
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191559.0oHMB8eD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512191559.0oHMB8eD-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable dereferenced before check 'buffer' (see line 2172)

vim +/buffer +2177 kernel/trace/ring_buffer.c

13292494379f92 Steven Rostedt (VMware    2019-12-13  2165) int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2166  			int cpu_id)
7a8e76a3829f10 Steven Rostedt            2008-09-29  2167  {
7a8e76a3829f10 Steven Rostedt            2008-09-29  2168  	struct ring_buffer_per_cpu *cpu_buffer;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  2169) 	unsigned long nr_pages;
0a1754b2a97efa Qiujun Huang              2020-10-19  2170  	int cpu, err;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2171  
5ecbcb61e172d8 Vincent Donnefort         2022-08-24 @2172  	if (unlikely(has_ext_writer(buffer)))
                                                                                            ^^^^^^
Dereferenced here.

5ecbcb61e172d8 Vincent Donnefort         2022-08-24  2173  		return -EINVAL;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2174  	/*
ee51a1de7e3837 Ingo Molnar               2008-11-13  2175  	 * Always succeed at resizing a non-existent buffer:
ee51a1de7e3837 Ingo Molnar               2008-11-13  2176  	 */
ee51a1de7e3837 Ingo Molnar               2008-11-13 @2177  	if (!buffer)
                                                                    ^^^^^^^
Checked too late.

0a1754b2a97efa Qiujun Huang              2020-10-19  2178  		return 0;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2179  
6a31e1f135d1ab Steven Rostedt            2012-05-23  2180  	/* Make sure the requested buffer exists */
6a31e1f135d1ab Steven Rostedt            2012-05-23  2181  	if (cpu_id != RING_BUFFER_ALL_CPUS &&
6a31e1f135d1ab Steven Rostedt            2012-05-23  2182  	    !cpumask_test_cpu(cpu_id, buffer->cpumask))
0a1754b2a97efa Qiujun Huang              2020-10-19  2183  		return 0;
6a31e1f135d1ab Steven Rostedt            2012-05-23  2184  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

