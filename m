Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180AA1D4359
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850334; cv=none; b=eb2gNHy96V9TMT5L9i4UiN27bWAW3Z4MYNg+7UK3w+ckCqMZqdSSmIr2DtW8xq2pwnyAgc6ofbmBPml9oUprNqx5PUunsnOCQFHAklZz/99pvK5/sxTVr4prBqvltx1jnWWi1FzGZACGPmFWOd7wO1/+b4+qXn784eXHVzKLC+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850334; c=relaxed/simple;
	bh=BWrKgDJGCZ6rljfRFdmtj4DLRgMFM0eUs47PQF+UqpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CN3Om8Mo8xBkL8uf53j7VvWAVOXiiGywyiUNrQ7/bD+Q9HS35sThCfF39/9xLcwbQzA69tnbzkFO605BCrFkKzvgGsM0QUMoXRGERVUFGZgqcF6MT9eYBn/nEKNm7ftZTgRyN3eBgCM3nL6p+6k7zGjuiYz8ofI0nfocxd1o38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AD54339;
	Fri, 25 Oct 2024 02:59:21 -0700 (PDT)
Received: from [10.57.55.246] (unknown [10.57.55.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 109E73F73B;
	Fri, 25 Oct 2024 02:58:49 -0700 (PDT)
Message-ID: <6ccdedb3-8975-4919-8f31-e26eeda3b2a4@arm.com>
Date: Fri, 25 Oct 2024 10:58:47 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel/sched/core.c:1361:21: warning: 'uclamp_mutex' defined but
 not used
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
References: <202410060258.bPl2ZoUo-lkp@intel.com>
 <7d19367b-a4ac-4c65-a543-9a4d614bec44@arm.com>
 <20241025063249.Q3RPg_vY@linutronix.de>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20241025063249.Q3RPg_vY@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/24 07:32, Sebastian Andrzej Siewior wrote:
> On 2024-10-07 11:08:36 [+0100], Christian Loehle wrote:
>> Please allow me a day to walk through the code just to double-check, but
>> the obvious fixes are either letting UCLAMP_TASK depend on SYSCTL or:
> 
> This does not look too bad. Meanwhile I got another report
> 	https://lore.kernel.org/202410250459.EJe6PJI5-lkp@intel.com
> 
> Mind to post this?
> 
> Sebastian

I have, as standalone thread though, sorry.
I'll CC you and ping.
https://lore.kernel.org/lkml/b2ad1f31-21b9-42a5-a735-b9496470348a@arm.com/

Regards,
Christian
