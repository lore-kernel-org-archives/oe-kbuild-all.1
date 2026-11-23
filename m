Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453490;
	b=3Tt3XzBgy51aYtc965P4dZNV5QJM22OiNVEjbXlxRs4M19rbc7ijTxfHk9UU+CJb2r2C
	 Y5JKbWBhwmboSVS2RLA5p4/vBy6VdPB6sPwjLjhySri9aTunxX9dPebiJ1+zGeRZVaN2n
	 WRFseBGV0MhLovUMnnuHtkNTTaj1DtvtD4h+FNCpiNm3K6fu/Im+v8zy6mhY35Qn75C7l
	 OHNXpn+0uPoXBQKvX0yy4/Q83v4GxdRtyu1ysOWyGZUiWTqUJiB5MIDHIDgBq/ygR/SMV
	 Agvs1HNDXkp8ovoIeAFTbamu5Ign9g3bIyrpIibeDcUlV+cXQyIy8xks7ZOtvxZ/xeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=6z6ak377Awv+mxJYPSVQS/ONw5MrRNWXM3G9SGJDdio=;
	b=rNdZG0IaA/DjUbV/wbuywQLfAb8ZTv3h1xnNEQFPPjuHA6xQjjYK3YU00vuTuET8xacz
	 X79BBFkDABqV65jXEElxcw/VfK0uMsQ73VFYHuca4P2VtnaHsn1n563IuACu99lm5gNIL
	 rWs6pR+y7V9HSjClDa+Tt2y1HDyhAeGLB/al3TgdH0vDM/tKQY9ARCWnyMK2bEFKAiMzs
	 ZWp9A3uTC/fYdCw2Mh6vGuBsYRSg19ebWeFll+A3Z+ZTE1k19qEHl4TCMXD7G9afnhe+j
	 T+fjkMciMmbRXN4qzPXDTqqMwQmJx/h3mVQh0zx0PdFmcAmPAbzK2PeiknGrCxfKC6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="N/0CW2Fm";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15B5606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 17:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E15B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N/0CW2Fm
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0afdb97abso42075ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 09:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795453489; x=1796058289; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6z6ak377Awv+mxJYPSVQS/ONw5MrRNWXM3G9SGJDdio=;
        b=N/0CW2FmhG6NHCzXnTvvmlR/WJh8uUEJ75uWfac4yc1gnalHoozdxyHotM4JlzdLWs
         ARXbg51Jx/FCBJbq21Qd7WkwuwNQObDjYmuUiuCOCCZbr7TMBMCOmiSx6wqbT/rxO+da
         Jyfi9gF18qTs2NyZBaUsFCKwTGi6SY7/h/BGuEzP49n4dl/pET9rVpfriufl3zrYGRSb
         G5EDN6fGL4SfzRbE8cnVucmNHWOKpcD1YB46j1jSwKmClfcs+nUqO6rZ012x4MvwXQwn
         qlqQPHxDMTEfpMUu0Wji04Cfamw0NwK8/cf83bCS/kSP17tQKAD7Sb4qCu6qlTrnu5Ef
         aYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453489; x=1796058289;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6z6ak377Awv+mxJYPSVQS/ONw5MrRNWXM3G9SGJDdio=;
        b=FDCBOCCeb+TUDoHd4OMiEhcX82pkZREdOCIbsdckHyOit5Fg5j6t5pC1NARxLVaWG6
         zY6WdQwgh4M4VYTm+KEVNtVzQUZWHO01Zib/w6RPyHRoLUuRvBQMwDPm/JZnLp1077a3
         LacjrDxrU80wGk5vkaFWlgQov/dGI76YjSV52+8lqIB1CfKzJmxqkUoI8bKppVOhVHMb
         0K4hmuiynhzmj4l/9U0pYXCOwpTFbb3k6moOoezuOb24+nYQBoqa4oHS4hnJWtih5jWd
         Vz7+S33xSswgfdTn2fJrPgU6kWBeHak8j7EpIbr24n/HidEhAkdmBzYNmNGR97QdZLH2
         YA0w==
X-Forwarded-Encrypted: i=1; AL+hErFMgAlTrh7QO7/pGlpLYuiUpSWE9eYiWGo5mwY/13BSz84Prq3VDmlMEvcqG9siqSimgE3O5AnYyLSXS31+@lists.linux.dev
X-Gm-Message-State: APuU4Z9w9iY17xYKHArsmqsfAIUmMTdPR7LdVHC140eB48kiL5V9SLDy
	/CjJOYYAQikguZW9BsEHazy0CSCko5tMDrIcpTKQDi4o9h1lHS0f67rkNzG6y99hpAf0FBRII22
	85Zs8/Z96
X-Gm-Gg: AZFdTZf5pGP8uB5dAnv8Z3uH/x9TAaLiSxGFap0+Ng7Zh6z6f56mfxHTuJb4ES6C+rC
	z9SLvs1CAzslXgg2r1RG4G881k6+7pzgEheg86ej7BHMqH2+4x28bguozxr4Vff0+g/8XqNIyFr
	y8bHQJQ8eyHMDX5fsCouzcXJ7Km7L/HgsX5nuS84i8yeJZhpWTJ6vLoOCU7tjPTTD+vNDq1XhqA
	GL5D8aV67e6XmqoKd7UTVH1uGWFibIblxGCvzaKwI/yluNAk1ZiKsq/d7NEr2+kgJ5Ol5v2qr7v
	wFMzq5UONYK4H05ee4QisONobTQVm0tJnFGLSfVCRisdri0zHg/U/Aup2w/AmNOmt6q/EF21vB2
	Go3LG1fsGILHdeslThB81SGnwTPCNxd79mkU9sDg/XhGUdDUHR9H4wftcG9JxYyRnrfHRRGxh9Z
	uWVCrkT5fzB7CNZ/wA4jt03scwyzgcDk5ne6nUusyNvdipI9GCAyT1vuxUMBfVqy2QjHOIwROlD
	4NAHHUnxIt50TEFw1PHevpCI3jc1FjoCbIt59ynb/D90tpyDklSarZa9htFFulEqbJAJuEOHe7/
	+QxNu4gZjGnYFsm6B8LEFK5HSiRdcUu6i+k0KEnjAfLKwpKISv7jT+m5R5y+UIwyx00+6EpcfKN
	1EA9ljybbsLve81rOO18Hd29LpTVsa1QXR3ai95YiT/Xb89zJlzj9msJqXGbpUht1t4U+MgoFl9
	HSy5848jQ59EQK5KDLn5JIC+m3M9NOHawpzm3o/Ty0X2CMLQ==
X-Received: by 2002:a17:902:f790:b0:2e5:9bdf:6b65 with SMTP id d9443c01a7336-2f0615ca0f5mr7681115ad.0.1795453488528;
        Mon, 23 Nov 2026 09:04:48 -0800 (PST)
Received: from [2a00:79e0:2eb4:9:2973:837c:48c1:1e91] ([2a00:79e0:2eb4:9:2973:837c:48c1:1e91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm5993799b3a.9.2026.11.23.09.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:04:47 -0800 (PST)
Date: Mon, 23 Nov 2026 09:04:45 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: kernel test robot <lkp@intel.com>, 
    Christoph Lameter <cl@linux-foundation.org>, oe-kbuild-all@lists.linux.dev, 
    David Hildenbrand <david@kernel.org>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    mm-commits@vger.kernel.org
Subject: Re: [akpm-mm:mm-unstable 327/327] arch/arm64/include/asm/percpu.h:261:1:
 sparse: sparse: cast truncates bits from constant value (ffffffffffffd8f0
 becomes f0)
In-Reply-To: <20261122194825.2541c7389c2f958ef3d07fbc@linux-foundation.org>
Message-ID: <7d1f916f-2a4b-c31e-617c-e1da7623fca3@google.com>
References: <20261121133112.48w1QOqw-lkp@intel.com> <20261122194825.2541c7389c2f958ef3d07fbc@linux-foundation.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Nov 2026, Andrew Morton wrote:

> On Sat, 21 Nov 2026 13:34:45 +0100 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   7d1a16abe4cc5dccd21e3d6262e44433a5885d27
> > commit: 7d1a16abe4cc5dccd21e3d6262e44433a5885d27 [327/327] mm: vmstat_kunit: add synthetic benchmark for mm stats
> > config: arm64-randconfig-r2305-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121133112.48w1QOqw-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 15.3.0
> > sparse: v0.6.5-rc1-21-g84ec0658
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121133112.48w1QOqw-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/20261121133112.48w1QOqw-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> >    mm/tests/vmstat_kunit.c: note: in included file (through include/linux/irqflags.h, include/linux/spinlock.h, include/linux/kref.h, include/kunit/test.h):
> > >> arch/arm64/include/asm/percpu.h:261:1: sparse: sparse: cast truncates bits from constant value (ffffffffffffd8f0 becomes f0)
> 
> Thanks.  sparse is being a bit silly here.  Using a variable instead of
> a constant silences it.
> 

Thanks very much for taking care of this, Andrew!

> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm/vmstat_kunit: avoid sparse warning in vm event cleanup
> Date: Sun, 22 Nov 2026 18:51:40 -0800
> 
> Sparse warns about -TEST_COUNT in an unreachable 1-byte arm64 per-CPU
> case; the actual counter is 8 bytes.  Pass the completed loop count
> instead to silence the warning, with no behavior change.
> 
> Link: https://lore.kernel.org/r/21183f5b-2697-cbe6-6370-dbd27c5e2b60@google.com
> Fixes: 7d1a16abe4cc ("mm: vmstat_kunit: add synthetic benchmark for mm stats")
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/20261121133112.48w1QOqw-lkp@intel.com/
> Cc: Christoph Lameter <cl@gentwo.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Sarthak Sharma <sarthak.sharma@arm.com>
> 
>  mm/tests/vmstat_kunit.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/mm/tests/vmstat_kunit.c~mm-vmstat_kunit-add-synthetic-benchmark-for-mm-stats-fix
> +++ a/mm/tests/vmstat_kunit.c
> @@ -107,7 +107,7 @@ static void vmstat_test_interleaved_zone
>  
>  /*
>   * Test 3: count_vm_event() benchmark.
> - * Restores counter balance with count_vm_events(item, -TEST_COUNT).
> + * Restores counter balance after measurement.
>   */
>  static void vmstat_test_count_vm_event(struct kunit *test)
>  {
> @@ -124,7 +124,7 @@ static void vmstat_test_count_vm_event(s
>  	time2 = get_cycles();
>  
>  	/* Restore balance */
> -	count_vm_events(SLABS_SCANNED, -TEST_COUNT);
> +	count_vm_events(SLABS_SCANNED, -(long)i);
>  
>  	time = time2 - time1;
>  	avg_cycles = div_u64(time, TEST_COUNT);
> _
> 
> 
