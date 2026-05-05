Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1A64A341F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 19:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010186; cv=none; b=lhEte0i+74nR6p1X9eSeS9ACYeca+Nz3mDWGA9o5kp4UvItwSIZ3KuPQuMhkwYGYCueVS3ldJSAIg2pgeKN+lxTKPAh/p8aJue6BsUI7m4G95MbtxMyFmqpZLcNWt2vgyQ2OPLSLFWz9PwHitnq9Wk7R2pNVUDcXaoFlzCiZFsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010186; c=relaxed/simple;
	bh=Aapgr5OtQ4htdKTxTADkn0CTai5AHWm4A0IizMNA7+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtIWdOFe5TXyWLJxmGM6zFr2gifRo0FIR0WTwRqm5egF7HfL8Vo+Fdax6gNjudn6SPkdVuQHBPBFeIPDMQzxWBY6RF0x8GZbGAy0+Niin4bk0pvsXyXIbfRfn9OvEfyExvkNViJFq7MW/qlC09MjBgFrU6ZSHtpG2I9HIwgwyxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=2pUwacgd; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="2pUwacgd"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4g987W6VmBz1XM5kY;
	Tue,  5 May 2026 19:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1778010181; x=1780602182; bh=qsTCg6xzDUkhbQKYk8jVpK7b
	40F/TpyfhGuPx8NMHdM=; b=2pUwacgd1M9Bo/8SCsnSVFSsOUW98k7fSrM3g7X/
	FO3xC9jX7h6FGCiLd8gIyUfKjRpcFQAqMKGQ797PqZBiJ0BZ7tcL1cHFT9kA9fK1
	1Lam483eY2dtmlEJ0ytNVS2/Ncq6c42ZGQrwg+LoJ5T0p2pIPniad4iJMotqGJSM
	4r2KIoNPJBGqv31gqI8nHeIJWmLgd/jKc1Vawit2acaBbwr3VdkTCpG9gTzJykoi
	bTZl9a2AYhgIYJaXBDIMDAHK9HCxFjK6Pn7PkeZY28Y5B2OOeKvQoy/MRi6iCXrI
	wkmrtU6UwANlhZtc7Iqd9KTvSZgssZqvqeqOSzkYEJuJ9w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id oDxwk2ufXlXC; Tue,  5 May 2026 19:43:01 +0000 (UTC)
Received: from [10.211.9.52] (unknown [213.147.98.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4g987R6mVWz1XM5kD;
	Tue,  5 May 2026 19:42:59 +0000 (UTC)
Message-ID: <73f1e5d9-d672-44df-9c45-4dbe81c22003@acm.org>
Date: Tue, 5 May 2026 21:42:56 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bvanassche:block-thread-safety 18/27] Error:
 drivers/block/loop.c: CMatch: Unexpected token '@' on pos 164:
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
References: <202605060228.2E0I2nzN-lkp@intel.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202605060228.2E0I2nzN-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 8:52 PM, kernel test robot wrote:
> tree:   https://github.com/bvanassche/linux block-thread-safety
> head:   10259f322f6fbd9089c9e695daed50e886455b9c
> commit: a7ef3bd0a35d3e0476cf41e21c11614fd8bda149 [18/27] loop: Add lock context annotations
> config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260506/202605060228.2E0I2nzN-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060228.2E0I2nzN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605060228.2E0I2nzN-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: drivers/block/loop.c: CMatch: Unexpected token '@' on pos 164:
>     	'static int loop_global_lock_killable(struct loop_device *lo, bool global)         __cond_acquires(0, &lo->lo_mutex)         __context_unsafe(conditional locking on @global)'
>     Error: drivers/block/loop.c: CMatch: Unexpected token '@' on pos 152:
>     	'static void loop_global_unlock(struct loop_device *lo, bool global)         __releases(&lo->lo_mutex)         __context_unsafe(conditional unlocking on @global)'
> 

Hi Randy,

I think the above error message indicates a bug in the new kernel-doc
tool. Please take a look.

Thanks,

Bart.
