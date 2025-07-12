Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66C1EEE0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752355422; cv=none; b=j2xBjF3ucQFoMzBnMFub+rrZUjIl5rMC1oZ21p/9dLmv/qPa+C3Fwxj6+ItNSQGZaWZa/O5c4HtT/+hMe7Yl/Wh6jCEC5d2l8EF+uFRWqJmVftzPyn5LN7a7xdbkzJSKM+0PsncU4f1wTAaWxMBYN5JuXod1D7w/i3n6D/eYbd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752355422; c=relaxed/simple;
	bh=NF/6PcdxBcU7OAarUxK0KHd2Bil3ZmkoduApxVnIrmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmYGRkuD67Cxkext2FY2quaJiCKj9ag7NFnB6exyGAZQvDjpD5JrwJXYB6nbrT6ganDxCNCYkbBPk0S4HZSjeXpistdcUftyBNqGka+jLkzxKThMr/kXuWSxlxXtZ/w4ciRdtF0YqispC8Lj8qeoAC9b7wFmZZDU2ds0Z+8/+9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UT+H9G+k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UT+H9G+k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787AFC4CEEF;
	Sat, 12 Jul 2025 21:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752355422;
	bh=NF/6PcdxBcU7OAarUxK0KHd2Bil3ZmkoduApxVnIrmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UT+H9G+kQv8Cbl4jRb/h/00nFIhhSs+PQfzLz5m7I1/N4tzEuNC7gCuhi84Eug5mX
	 A0OQ8rE3wOLJEFFJTOjIpzPrxBfhogjFZqSZEbu+BeM4D+4HHfuM0B0naADNAWxKTy
	 V+dineXPRAJFpm4HSjQh0WpTUwQqByR2E1UJUwSjoPXtHh8QzhA0Bnn7X0OnCY93xx
	 qVDGOgff05xSXyf+KUYndsdBGqpt+q0vrVb5MM0o2g/u456zQS02aQDiocUSSafqKh
	 WBFNuRdUKd7TwSz80DRlzRukiq3ECxxDkz/4AX1LWtDeT+gJqPUAIimmVcRycP3M5M
	 wMwM6zQ7uTylA==
Message-ID: <d7030919-307e-4f58-927d-c21ad16c4453@kernel.org>
Date: Sat, 12 Jul 2025 16:23:40 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8552/9053] arc-linux-ld:
 amdgpu_drv.c:undefined reference to `pm_hibernate_is_recovering'
To: kernel test robot <lkp@intel.com>, Samuel Zhang <guoqing.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>
References: <202507130333.ABgltDgA-lkp@intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <202507130333.ABgltDgA-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/25 2:39 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
> commit: 530694f54dd5e097866999bbaebc5c133e5507b6 [8552/9053] drm/amdgpu: do not resume device in thaw for normal hibernation
> config: arc-randconfig-002-20250713 (https://download.01.org/0day-ci/archive/20250713/202507130333.ABgltDgA-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130333.ABgltDgA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507130333.ABgltDgA-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     arc-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
>     amdgpu_drv.c:(.text+0x480): undefined reference to `pm_hibernate_is_recovering'
>>> arc-linux-ld: amdgpu_drv.c:(.text+0x480): undefined reference to `pm_hibernate_is_recovering'
> 

I've sent the fix here.

https://lore.kernel.org/linux-pm/20250712185851.591024-1-superm1@kernel.org/T/#u
