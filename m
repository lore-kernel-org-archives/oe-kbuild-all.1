Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDC3272904
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767291; cv=none; b=Kf+woC+9/Pr9y/HQDDMnl3Mq4lEp/V6YjF89XM8PaSBa5rBA/L0QIi7agIuWogYysviK9WciFk8ABWD8GWMBvWnCeKjHdYYUwpQLGc/ivACan+jdcOC5jkwRPd9lft7hzp2Cy7jk/Oz7S5GtxKWiWBrXcRahdA15OE0V+ZsM8qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767291; c=relaxed/simple;
	bh=RfYd5Dgh4U3T5nzqDGGI2aUFj1w3UMgwy0swiuP8Yy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIqED7lIJ0IqOawm+azX+a9uaHdsDojpjO+ebddtZU4VG3kWVpHyz0RMEm9rXyCO74/Rw92PGTYZSSLZivX1PO82Q9WOp2yL1YKr+bzR1U5EGgCNSjPlQDihYxVBTOpFLEe3uEMm0ZPy9GsNGa4JerKY0t8kQlSsVWxw87Y9cbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=y+TcNNOd; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="y+TcNNOd"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e895f3365aso18543446d6.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 10:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1740767286; x=1741372086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1HeI5Hj5FdgZC1kQ9hnOVpQk/bjqVhL1cfDe9mBVxU=;
        b=y+TcNNOdB3VP00zhJbGGUXJMKjeedbCNFXIf0jmytIDM0Qq4r3rqrGJQFpJLyX6k/A
         l/el4f+SE72hULBdQ5txKSbGWbb8+JNnF0Dfjlxa+KCwpcGmqhWWcaNvL3aG4ag2YSNe
         2ouytV+IKgnp7fLtBHlW4UYOdbJsPnxWogYzkFgpBOQpHIUyCddT1N1ySYVEW7ExHjoC
         3pJSFqGH0YxJvdRt/WVLr9KrAn2svBPbqhhZHlPsNTQMHUrrF11W9wR8MDPcluQ4zbq0
         XnITVvRZBasQgYeF4U0Sgc4cxsxQAkO8O/hkdrQiLTCd9VWAQ1xn6FpGkBtt+yY0+4R6
         ZF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740767286; x=1741372086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1HeI5Hj5FdgZC1kQ9hnOVpQk/bjqVhL1cfDe9mBVxU=;
        b=TQ15EjkCsUA4B5Ga45TeHjUTii32qp1fhGUAIfTng5PrQQD6pLEare/b3q6nVfKv0e
         F+6H2AYQSAx5EM2MUUaUilVGBzaF646XK+ge38tpwZqHOF8xFnmpshp3zDt7Y0VD7kWo
         rYXjXYiRxId14fbjMIsiSu1BYXpENwG9ISzQL8v6zk03cOhPi4YuUQANMFY6MXnmNh8r
         FNh0yHFbGOO7ZEgPnCdJ8AdReFZLvV1DWvsj6zICZ5jzjcBHfzguZlu+WTLyo5f2V1pZ
         SSwRWbDjCVHA86LFNqEVIOIynseeEdwBILEwMb5jD2osvwABZC/Az3YAqO9dzUWjcUYK
         Shgg==
X-Forwarded-Encrypted: i=1; AJvYcCU0ycWL1HaDHT+nw36RgA82aEbLljBrcYM4uqwQO55DgljTxHnq43HPBb9lFTZFHDDFl9ByQAoUqiD6eLqs@lists.linux.dev
X-Gm-Message-State: AOJu0YwfBphHsLqfeem9EjpnHVInMFLfsx0QLLPVDwLhzTHIzpF6rUK0
	7J0Zo0qNuThPOSqp6iZBN5W44ildpQnfmPWp6/bcFQOfcwColGDP0s+UsxjsOH4=
X-Gm-Gg: ASbGncvLMeUFiPiIA4TbZ91g8jmDBH0ZuI+w91ftlKvKEoucUsNtZ9RbxhJMjdxOPWY
	oiF5YxV1kuPeNtIw1IOw44DaxAImaoqthEFDiAZSOHjU1wJFNFzUuf7w25g7oXHGk7tmImVzdET
	PMgyCfRMMu30WyoibsZKsAjgGWau6KZmcYDuqUQ9RUBe9Rf32knzxJX/+yd11JKacEWXogTJubi
	Wn3fyBmo/ChgGYl43l9Q7Ccggo7z7UeOwMM63MH84U3ja61u7DhCmck4UVqCGNGKiG65YDcfGml
	PJCtVwvXt3N0r1CWLS2fxfnQ
X-Google-Smtp-Source: AGHT+IGs6srUxnr6AWXxdYbrfmwZOp03iNYHFv1+6TtdPkGxEDbRLb7+2Svam+kAW+1eMjMaYvZVrA==
X-Received: by 2002:ad4:5ba3:0:b0:6e6:684f:7f6f with SMTP id 6a1803df08f44-6e8a0cd3ed4mr73143116d6.7.1740767286445;
        Fri, 28 Feb 2025 10:28:06 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8976ccbacsm24682146d6.93.2025.02.28.10.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 10:28:05 -0800 (PST)
Date: Fri, 28 Feb 2025 13:28:04 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: kernel test robot <lkp@intel.com>
Cc: Brendan Jackman <jackmanb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: Add lockdep assertion for pageblock type
 change
Message-ID: <20250228182804.GB120597@cmpxchg.org>
References: <20250227-pageblock-lockdep-v1-1-3701efb331bb@google.com>
 <202503010129.rJvGqZN1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503010129.rJvGqZN1-lkp@intel.com>

On Sat, Mar 01, 2025 at 01:31:30AM +0800, kernel test robot wrote:
> Hi Brendan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on d58172d128acbafa2295aa17cc96e28260da9a86]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/mm-page_alloc-Add-lockdep-assertion-for-pageblock-type-change/20250228-002107
> base:   d58172d128acbafa2295aa17cc96e28260da9a86
> patch link:    https://lore.kernel.org/r/20250227-pageblock-lockdep-v1-1-3701efb331bb%40google.com
> patch subject: [PATCH] mm/page_alloc: Add lockdep assertion for pageblock type change
> config: x86_64-buildonly-randconfig-002-20250228 (https://download.01.org/0day-ci/archive/20250301/202503010129.rJvGqZN1-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010129.rJvGqZN1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503010129.rJvGqZN1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from mm/page_alloc.c:19:
>    In file included from include/linux/mm.h:2302:
>    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from mm/page_alloc.c:44:
>    include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
>          |                                    ~~~~~~~~~~~ ^ ~~~
>    include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
>          |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
> >> mm/page_alloc.c:421:3: error: call to undeclared function 'in_mem_hotplug'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      421 |                 in_mem_hotplug() ||

The patch is missing a dummy in_mem_hotplug() in the
!CONFIG_MEMORY_HOTPLUG section of <linux/memory_hotplug.h>.
