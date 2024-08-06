Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA417A59B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722981763; cv=none; b=G9Hdb5sEPbSd3mtvM1XaNYGL3gXtT1aKFNwE7evoX2rliQhfnx/RNtsdgzHDK9JSsFbtjRItru9S6COIW8fDs0zaX7Lt2qcr8Q9csxw1W1/dTwVLkqTe7+4z4G5E6j24zzCSjiTuGFfl2ZxwvtUbcDC3TQHfQ/0TcU2flNvIwIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722981763; c=relaxed/simple;
	bh=aR1W/c9RP1fIj6vHqwGqd/uGjv/1lmu03CBJ0wO/Hw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2pGL+CsGH/hIuFyq5bRX9vYOXi3tDzzLCs0S3gZwu0TU4Vebl/B1I+egxI7gmr3ZQsN1vYl+jvKcowVvr3HywN5NJwTbqLZhe/+xEdnlszanLgVZLBrWBWgkiBEMhrnC+uVN5Z6Xl/dJkZweIIDzz2MNMUcqq2nWxw23qW42ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCE7bx/N; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCE7bx/N"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428243f928cso7728015e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 06 Aug 2024 15:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722981760; x=1723586560; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mp0WpaiC2XvuDjPrqJ1y4U3Oi9te7Bps6SXi4DFmtEs=;
        b=XCE7bx/NkThaN44pEnM73qnmWI4PKvi4RxDd/7MLgCKxdRhqm2K9/eTOIFqwZJHWgW
         IToh3qYczmeU3j+546gKmKHmceUDd2liYRBa3p+LifYkau6d3GG5ienapLYyN9ak+7hl
         LDyfUq2joODfP+em4e6GvpAdsW6+gAZfdzVVy2DfOXHiA34QXe0s0hRWwvusYoV6EyRz
         xl/LMaU0eL8MWoqfERSq8KK9OKx4yDnTcEZ47sV/ct+3oFpp2zzzswA+wojnik2la9P9
         QS709oXkIomHqNvreOm9/woO+1EDk2yQQoHKbLfeVn1P0drHObXCT25VCt4I0tK8g7cA
         WAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722981760; x=1723586560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mp0WpaiC2XvuDjPrqJ1y4U3Oi9te7Bps6SXi4DFmtEs=;
        b=ol9oj2dhhxs9jyfHbQC2tFqliICJP14Sd1yJdpM7iOUzvAwBEneNc/c9m7t3K9XKWl
         Uyuw0h/tz3NxdW70nutsTDUDU9Jy4rjVQ3daznJ5H9oW/guU+GCjZuUNUMJ2A0+UShES
         vqEkmAkRNUDPQcYkLT/mcUqR00B0ip8kpGm3U3J1edipKomigWRxAt9AHpAAZKYyibF4
         XYQfhHf4dddLj/8uXh9/2tJbBlm1yIAgSpqSPvDSlQf1b321q77FKaXmoWiHspC1iRA8
         Y+YYsCt7vgkAqpo5sHP/gwCEZAcdXMZ2G6XOXs1DtmpVWgp8JSVy4fftSLMGdtjPQIg7
         Oymw==
X-Gm-Message-State: AOJu0YwVmKfe7molR8vTRT+TmLGYnP3JTL6f9YphOIjrcRrX9vcOUAIM
	qqrj2HAEMVzPmA+WWUiUugoelXA9Lv37Lv4PNTOznds2sxw+wcEK
X-Google-Smtp-Source: AGHT+IG4Dx1g+NkaBIciA+wHIQJHu1E+LL7rr9z6w9T0IuFUILRLHEvNl+aoTVLSgg2g8CbSu9m0iQ==
X-Received: by 2002:a05:600c:1f90:b0:427:9dad:e6ac with SMTP id 5b1f17b1804b1-428e6b96b2fmr114221385e9.34.1722981759894;
        Tue, 06 Aug 2024 15:02:39 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:7600:c5:51ce:2b5:970b? ([2a02:6b6f:e750:7600:c5:51ce:2b5:970b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429057e8fe9sm255675e9.1.2024.08.06.15.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 15:02:39 -0700 (PDT)
Message-ID: <4ed9feaa-b7dc-4a02-a58d-ee845e872bd2@gmail.com>
Date: Tue, 6 Aug 2024 23:02:38 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] mm: add selftests to split_huge_page() to verify
 unmap/zap of zero pages
To: kernel test robot <lkp@intel.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, roman.gushchin@linux.dev, yuzhao@google.com,
 david@redhat.com, baohua@kernel.org, ryan.roberts@arm.com, rppt@kernel.org,
 willy@infradead.org, cerasuolodomenico@gmail.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Alexander Zhu <alexlzhu@fb.com>, riel@surriel.com
References: <ZqsS/1ts8leyUeEQ@rli9-mobl>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <ZqsS/1ts8leyUeEQ@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/08/2024 05:45, kernel test robot wrote:
> Hi Usama,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/Revert-memcg-remove-mem_cgroup_uncharge_list/20240730-223949
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240730125346.1580150-6-usamaarif642%40gmail.com
> patch subject: [PATCH 5/6] mm: add selftests to split_huge_page() to verify unmap/zap of zero pages
> :::::: branch date: 32 hours ago
> :::::: commit date: 32 hours ago
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010618.lgnamdZd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202408010618.lgnamdZd-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    vm_util.c: In function 'rss_anon':
>>> vm_util.c:188:41: warning: format '%ld' expects argument of type 'long int *', but argument 3 has type 'uint64_t *' {aka 'long long unsigned int *'} [-Wformat=]
>      188 |         if (sscanf(buffer, "RssAnon:%10ld kB", &rss_anon) != 1)
>          |                                     ~~~~^      ~~~~~~~~~
>          |                                         |      |
>          |                                         |      uint64_t * {aka long long unsigned int *}
>          |                                         long int *
>          |                                     %10lld
> 
> 

Interesting affect of different compilers!

If I compile with the above suggestion on my machine, i.e. convert ld to lld, I get a warning on my machine that uint64_t is long unsigned int (and not long long unsigned int as above):

vm_util.c: In function ‘rss_anon’:
vm_util.c:188:42: warning: format ‘%lld’ expects argument of type ‘long long int *’, but argument 3 has type ‘uint64_t *’ {aka ‘long unsigned int *’} [-Wformat=]
  188 |         if (sscanf(buffer, "RssAnon:%10lld kB", &rss_anon) != 1)
      |                                     ~~~~~^      ~~~~~~~~~
      |                                          |      |
      |                                          |      uint64_t * {aka long unsigned int *}
      |                                          long long int *
      |                                     %10ld


I will just do below which should work hopefully with all compilers: 
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 7b7e763ba8e3..bd147bdb1bb2 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -172,9 +172,9 @@ uint64_t read_pmd_pagesize(void)
        return strtoul(buf, NULL, 10);
 }
 
-uint64_t rss_anon(void)
+long unsigned rss_anon(void)
 {
-       uint64_t rss_anon = 0;
+       long unsigned rss_anon = 0;
        FILE *fp;
        char buffer[MAX_LINE_LENGTH];
 
@@ -185,7 +185,7 @@ uint64_t rss_anon(void)
        if (!check_for_pattern(fp, "RssAnon:", buffer, sizeof(buffer)))
                goto err_out;
 
-       if (sscanf(buffer, "RssAnon:%10ld kB", &rss_anon) != 1)
+       if (sscanf(buffer, "RssAnon:%10lu kB", &rss_anon) != 1)
                ksft_exit_fail_msg("Reading status error\n");
 
 err_out:
