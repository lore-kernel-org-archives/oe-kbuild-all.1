Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2956C155CBD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 04:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677942; cv=none; b=Y03hEkrZpJAmVZTz2zx4ONhAukTzc9mrA48R36D6eCTKArbUDMWLHKdZ8qO0cHdbb8QBdnSgj1YSEuIvMjWQzkdAo0cpZut8IqBI+wIWJnroELCrWR/BrtIvVmEGi+mJWG3HrC4TDoKy6VDT85ClBgQx1rmrxiLI19MLjtdm1Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677942; c=relaxed/simple;
	bh=5syYQ1Xodsyu67SCzL7GvypMLIOYc3gmkNY4ZM972gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMhhS8md20/BkFxU9eMN2nfugprnzPtHY9SREACcTUQiWwPuFbqQj+caoHWC5rQng0LHwFivDfXAsFWLmAHJpo9qleXcf6dL+J5YCyw5x5acWtxNswgEvG8zB2hfsASWCZJnQSd03KyTsHsTcf+9ojNqLtxJTx7Rw2me5O1er0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lDKWrhBz; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lDKWrhBz"
Message-ID: <5788ef70-fd3c-410d-b52f-12b8e2cca197@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746677937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etu8v+8WSCHQq4TvfNLMKeVhCuUVfsfmNX66p1aBmoM=;
	b=lDKWrhBzI43j3vukQI0TK6FbbVQBB18KV0qomuO8wxTYByOGz3yi+5lKBKmADhSzOVp/Dr
	XRUDbHNjHckQYmv6zeII5GteRuyA1/LPJ7J3BqfVzp6/TuVFLIw7xATwVHOqdPuED+iwmq
	zASgE5QEXeH3yKpo2a+sTNNfNInP/qg=
Date: Wed, 7 May 2025 21:18:47 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [RFC PATCH bpf-next 1/4] cgroup: Add bpf prog revisions to struct
 cgroup_bpf
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <20250411011528.1839359-1-yonghong.song@linux.dev>
 <202504120853.I4bFTHhG-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <202504120853.I4bFTHhG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 4/11/25 8:41 AM, kernel test robot wrote:
> Hi Yonghong,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/cgroup-Add-bpf-prog-revisions-to-struct-cgroup_bpf/20250411-091743
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20250411011528.1839359-1-yonghong.song%40linux.dev
> patch subject: [RFC PATCH bpf-next 1/4] cgroup: Add bpf prog revisions to struct cgroup_bpf
> config: x86_64-buildonly-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120853.I4bFTHhG-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120853.I4bFTHhG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504120853.I4bFTHhG-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     In file included from include/linux/kernel.h:16,
>                      from include/linux/cpumask.h:11,
>                      from arch/x86/include/asm/tlbbatch.h:5,
>                      from include/linux/mm_types_task.h:17,
>                      from include/linux/sched.h:38,
>                      from include/linux/cgroup.h:12,
>                      from kernel/cgroup/cgroup-internal.h:5,
>                      from kernel/cgroup/cgroup.c:31:
>     kernel/cgroup/cgroup.c: In function 'init_cgroup_housekeeping':
>>> kernel/cgroup/cgroup.c:2074:45: error: 'struct cgroup_bpf' has no member named 'revisions'
>      2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)

This needs the guard CONFIG_CGROUP_BPF. Will fix in the next revision.

>           |                                             ^
>     include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
>        11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>           |                                 ^~~
>
[...]
