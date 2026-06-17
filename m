Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1C035E937
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781719630; cv=none; b=jQCWBenXROWZDOhFfo3+22Jk5V3e5l8/BkFle/tXBQGEWA9kvOGQw8HSCr3YMXu69hLq8hdN5cTq2B0QIFz6Yp3gPzVJDy5UvN6cBUzAg5Mh0ABQLqYlvOVD7jn8BwgRH8MxIAa3VwaRgieDpGxzjoGHObduFwbhh42NP3sDtOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781719630; c=relaxed/simple;
	bh=ypxugpPRF6WOaptuO/LqBAXKEr1d1goy/C+UMlVrN+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWvWCRZSH7JWE8I6rJaXqJCiWsWGvzZFqrsUH6X2Nn3IDZKYyrU/JPO3a5OMDZPBwXIRZMMm6GPsyN1t5HN92TJPnfbguteU+KpdKRTX1zEficWRxYKMwQ/OJlmIy6eFDoRDyOWP0BdNdkSzYORk0DY+M2YYt1LPLpSzKhd318Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h0VWWycf; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h0VWWycf"
Message-ID: <b3729b0b-6809-4712-9bc1-1655906aa100@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781719625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r777nbJnoJBmRzy6AS9sn/4aqKvMx3VPpvVLSkRIJp4=;
	b=h0VWWycfu36zGcNyb2ZVZoHTtRreo9Unf8iERR0Zczsjz0fgQZH4EaLrw4846YuJ1E8rr9
	MnF02PTboTtzAGvyWUc9wS9oftdVR9G9vFOKx0Rv7uioHKG/zfV6O0yrvtE2YE5fQtZdDq
	OV1LzaWkQIJLeiHdAkS52MUzBsfH+zs=
Date: Wed, 17 Jun 2026 11:06:55 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: mm/bpf_memcontrol.c:125:27: sparse: sparse: symbol
 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, kernel test robot <lkp@intel.com>
References: <202606150332.Xy4Egd9s-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: JP Kobryn <jp.kobryn@linux.dev>
In-Reply-To: <202606150332.Xy4Egd9s-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/14/26 12:07 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> commit: 99430ab8b804c26b8a0dec93fcbfe75469f3edc7 mm: introduce BPF kfuncs to access memcg statistics and events
> date:   6 months ago
> config: powerpc-randconfig-r134-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150332.Xy4Egd9s-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150332.Xy4Egd9s-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 99430ab8b804 ("mm: introduce BPF kfuncs to access memcg statistics and events")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606150332.Xy4Egd9s-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> mm/bpf_memcontrol.c:125:27: sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
>    mm/bpf_memcontrol.c:68:9: sparse: sparse: context imbalance in 'bpf_get_mem_cgroup' - different lock contexts for basic block
> 
> vim +/bpf_mem_cgroup_memory_events +125 mm/bpf_memcontrol.c
> 
>    117	
>    118	/**
>    119	 * bpf_mem_cgroup_memory_events - Read memory cgroup's memory event value
>    120	 * @memcg: memory cgroup
>    121	 * @event: memory event id
>    122	 *
>    123	 * Return: The current value of the memory event counter.
>    124	 */
>  > 125	__bpf_kfunc unsigned long bpf_mem_cgroup_memory_events(struct mem_cgroup *memcg,
>    126							       enum memcg_memory_event event)

Roman, it looks like the kfuncs added for bpfoom can safely be made
static since they get resolved through BTF. I'll send a patch to update
where applicable.
