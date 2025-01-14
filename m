Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0DA1B960
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 01:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736817007; cv=none; b=J60zOet6C2tc0gxl5f9pIAMc2Wp14ZwONaiW/+UXgTCR6y1/STVxGJw6X7hlN5CgiGDCG5RKmY4Z88ZOfjSVGKTicF93kfeynYExhpnrnu7z3opQ9TzGtQfVovFLp347bUOhrEj9qT2CgfD183+Ec2ohxy8t7RCLqiTGc6ezF4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736817007; c=relaxed/simple;
	bh=nQXnhP4M0+hul34qRmQpsxa+Cddp54PIw6wrkSs77YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtMXybFJBw0cwmVyL9spLyb5vRb1A4wNMbgCgodvWS7oGNLEJzWjaY6leQmIGKiUnV8H/acZ8MlwL7DbLFi/RLDQC24hTHgEJ8SOtM3pxdb2Y+06+MMmIBL/XUIxpmg612afo0T/Atau0Vv1UPbMxFSEXu1VdcrEanu0qShKYUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E9Y4KuZ8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E9Y4KuZ8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=JvC4eavl+6UPdMsEpzc0PY0O7asTgij4c0u8NzH8Rig=; b=E9Y4KuZ889KF4evw7A0YIH+tKJ
	AxYaBEA8jyVkqx8mdacd5yBPKiSaV01+dT06cVTgu3WYPrgnbB4PLVCdO+JrsuyyNyU18bvKDcN7k
	SHFc5DyQrr2tLCJLPwj9lzb7tlgpDmjiI8V9wUJKQoVnQMkTVa+LoKWS5ieTa083AXg0uE5mra5jF
	h3EtwAVs8RoXw7QPHWZCjoUxVtmjB6mxmzT79GI3vQIYJS2k0K4IdOX+KDsDLo7Tu1MIM0XbsL+rC
	vggSR/O2yUyYoaW4EFxMgRrvXcRBs0Jb23/wAZq/DgTbL/9qJa8cEGLGvn3JKFmtXJa7amkPmzr5u
	dDkYVU6w==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tXVRM-000000073Rx-0cGB;
	Tue, 14 Jan 2025 01:09:56 +0000
Message-ID: <6eb5718b-cf4e-4d43-9ac7-a43a2b57cda2@infradead.org>
Date: Mon, 13 Jan 2025 17:09:50 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-nonmm-unstable 171/173] kernel/kthread.c:913:
 warning: expecting prototype for kthread_create_worker_on_node(). Prototype
 was for kthread_create_worker() instead
To: Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202501122249.upmy4970-lkp@intel.com>
 <c883110c-6baf-410e-8a77-4c2501060375@infradead.org>
 <20250112183338.0ac4e721a48829afffd16073@linux-foundation.org>
 <Z4TtX8GzLk-82u5Y@pavilion.home>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <Z4TtX8GzLk-82u5Y@pavilion.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/13/25 2:39 AM, Frederic Weisbecker wrote:
> Le Sun, Jan 12, 2025 at 06:33:38PM -0800, Andrew Morton a écrit :
>> On Sun, 12 Jan 2025 10:21:40 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>>>
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11  901  
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11  902  /**
>>>> 1bc3c5db9becd0 Randy Dunlap 2025-01-10  903   * kthread_create_worker_on_node - create a kthread worker
>>>> dbf52682cb0286 Petr Mladek  2016-10-11  904   * @flags: flags modifying the default behavior of the worker
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11  905   * @namefmt: printf-style name for the kthread worker (task).
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11  906   *
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11  907   * Returns a pointer to the allocated worker on success, ERR_PTR(-ENOMEM)
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11  908   * when the needed structures could not get allocated, and ERR_PTR(-EINTR)
>>>> d25c83c6606ffc Petr Mladek  2022-03-15  909   * when the caller was killed by a fatal signal.
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11  910   */
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11  911  struct kthread_worker *
>>>> dbf52682cb0286 Petr Mladek  2016-10-11  912  kthread_create_worker(unsigned int flags, const char namefmt[], ...)
>>>> fbae2d44aa1df7 Petr Mladek  2016-10-11 @913  {
>>>
>>> @Andrew: I don't know how to handle this. My patch applies correctly to linux-next
>>> where this function name has been changed. It looks like 0day is applying it
>>> to mainline linux + your tree(s?) for testing.
>>
>> It appears to be a fix against Frederic's b1e125dcbcea ("kthread: Unify
>> kthread_create_on_cpu() and kthread_create_worker_on_cpu() automatic
>> format") so it would best be carried in whatever tree holds
>> b1e125dcbcea.

I should have noticed that...

> Exactly! I have queued it to my tree (with an update to the Fixes: reference),
> which should appear in -next soon..
> 
> Thanks.

Thanks.


-- 
~Randy

