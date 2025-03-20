Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1A21DE3CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742505550; cv=none; b=lb3TjtdXbObc4B1GrGrMDRc9WZsmnW/cN9NeoiV+LfofGrdH5/bBNBxqSV9c/4B5Y9ZXEcePZ/+3CHcFkIrXmySo5E9bYv8mu4LgfLu7AEug8geyuDY0SFeeU7UoNcR3+8N2H1Y/DbmS4MI8aKW8FmL7ZwkYDQ+NSEyMcjDd4vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742505550; c=relaxed/simple;
	bh=jPiJi3c5SzZjR6gacQP1MRbTfGpFOEgFSjL4khXNhVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlAC5Ai6M6SkxGQ+mBEIwEvDSovha9pmWasCSMMRN0DLMqIimTJxEqJkwQGMUf7h3Vofav/PT3PKEp8YBSnjysExNUeiZ1/X9zvIOXevZJpgvL0prdYN9p6OecVf3OJxS4l4HOwoHonML8+zJMaaB91jKVeYqlUVd/vP96o/5Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=g9SMoZBp; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="g9SMoZBp"
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4B8B12116B4D;
	Thu, 20 Mar 2025 14:19:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4B8B12116B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742505548;
	bh=30YYUKsSvySaAXssIGJf4V0RYDDmqzFMNfmvsZ+sE0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g9SMoZBpXB75EnZZwR23UZNytdgrmOB9rtaBJIUHNHwj9Qr77P9/S7GXjigRfcpQH
	 Zp02UhGDUT0vomFE1ZQKsOgj+QOnYaFVGPHzt26z4hpvKojwxGt5qQL0QXFKWwvcu9
	 PCSBrJdwHGXwGfXAnljsLZFfHGZt/2uQ2SkuqrVY=
Message-ID: <7ee6fe32-ec72-4aff-ab7e-e86ee12b21a2@linux.microsoft.com>
Date: Thu, 20 Mar 2025 14:19:07 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12013/12769] drivers/hv/mshv_eventfd.c:399:19:
 error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean
 'eventfd_ctx_fdget'?
To: Wei Liu <wei.liu@kernel.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
 Jinank Jain <jinankjain@microsoft.com>,
 Mukesh Rathor <mrathor@linux.microsoft.com>,
 Muminul Islam <muislam@microsoft.com>,
 Praveen K Paladugu <prapal@linux.microsoft.com>,
 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
 Roman Kisel <romank@linux.microsoft.com>
References: <202503210422.6u1LLUSg-lkp@intel.com>
 <Z9yAiQePXWm7Q9J3@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <Z9yAiQePXWm7Q9J3@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/20/2025 1:54 PM, Wei Liu wrote:
> On Fri, Mar 21, 2025 at 04:17:50AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   73b8c1dbc2508188e383023080ce6a582ff5f279
>> commit: f5288d14069b6580405b6f0d1c4ccd45c7ac97bf [12013/12769] Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
>> config: x86_64-randconfig-076-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210422.6u1LLUSg-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210422.6u1LLUSg-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503210422.6u1LLUSg-lkp@intel.com/
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>    drivers/hv/mshv_eventfd.c: In function 'mshv_irqfd_assign':
>>>> drivers/hv/mshv_eventfd.c:399:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
>>      399 |         eventfd = eventfd_ctx_fileget(fd_file(f));
>>          |                   ^~~~~~~~~~~~~~~~~~~
>>          |                   eventfd_ctx_fdget
>>>> drivers/hv/mshv_eventfd.c:399:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>      399 |         eventfd = eventfd_ctx_fileget(fd_file(f));
>>          |                 ^
>>    cc1: some warnings being treated as errors
> 
> Nuno, it looks like we need this:
> 
> diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
> index 3118d5472fab..6c1416167bd2 100644
> --- a/drivers/hv/Kconfig
> +++ b/drivers/hv/Kconfig
> @@ -64,6 +64,7 @@ config MSHV_ROOT
>         # e.g. When withdrawing memory, the hypervisor gives back 4k pages in
>         # no particular order, making it impossible to reassemble larger pages
>         depends on PAGE_SIZE_4KB
> +       select EVENTFD
>         default n
>         help
>           Select this option to enable support for booting and running as root

Yep, we definitely need that, I forgot to add it.
