Received: from mail-m1973187.qiye.163.com (mail-m1973187.qiye.163.com [220.197.31.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF11F4E54
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074421; cv=none; b=kvX17TwQOVWisFpr4EbBcX6OeZlhJMpd98QhjvZsTMI5ANSuBZmOymiKJZGu9EHMZu7CsW7xhG08uHFcJrDGXTLECl7pPt8NJItJ00FOHYu8i7ANOjzOW1oL5bYSuVKxAcAzOtxaAovNjJbBBjIQJAwSyPIOb2bUe4MmzlmJoCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074421; c=relaxed/simple;
	bh=Sse+Z9JKZIysn3gaFNUEfTKOqpPKNwNi+CbsEZ2+R14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBHbHs1dFoWcnrh/do4RthiGZtSXvLegqg9uG5SOTuchu1vPno+pzmg7qCFJs8/vQvXmWo2zh5qpAZ4YYA1l+apRr6VIn7jAP0oKnkkcTBloCzc5y6sbtLvB3QZjslCUMCATIOcZn4rguekwSm3Ml7aZSd3V/Kdp23tAdWIn6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=bOAZ1s0W; arc=none smtp.client-ip=220.197.31.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="bOAZ1s0W"
Received: from [172.16.12.69] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id cddaadd8;
	Tue, 4 Mar 2025 15:46:47 +0800 (GMT+08:00)
Message-ID: <a0206942-2d25-48fd-97e7-04985c813348@rock-chips.com>
Date: Tue, 4 Mar 2025 15:46:46 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7437/7719]
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:28: error: implicit
 declaration of function 'FIELD_PREP'
To: Heiko Stuebner <heiko@sntech.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202503040135.fgoyWdLB-lkp@intel.com>
 <965c133c-9ef3-4186-b7c5-da7319ece845@rock-chips.com>
 <4992403.31r3eYUQgx@phil>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <4992403.31r3eYUQgx@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpJGlZCHk4fSB0dTBpJGE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95601f1f6b09d6kunmcddaadd8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRw6SQw6HzIPDUwiNEIDCEkZ
	FiNPCklVSlVKTE9KS0xPT0tDSEhCVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSk5JSTcG
DKIM-Signature:a=rsa-sha256;
	b=bOAZ1s0WUcm8ay3Oi/ZyZxKep5+0IrjpU3oAWgqzSDoH33zgEPcfGTnJGY//h1bHxaRrYeN+SpEfSk8vEbNmLYH3Q7/x2OylOs3CFccO9BVC7RZQL/LpX4NoTOEBRMSx8CMBAcV7NphwbP2j2tcAcDYM+vKSe+TqDCCKOUDIR7s=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=0Fwmk8Yu/In/Kwv8VvAr8icXc2Wd9dRQPLra8O7VpAY=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 3/4/25 15:39, Heiko Stuebner wrote:
> Hi Andy,
> 
> Am Dienstag, 4. März 2025, 04:40:47 MEZ schrieb Andy Yan:
>> On 3/4/25 01:20, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
>>> commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f [7437/7719] drm/rockchip: vop2: Add platform specific callback
>>> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250304/202503040135.fgoyWdLB-lkp@intel.com/config)
>>> compiler: alpha-linux-gcc (GCC) 14.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040135.fgoyWdLB-lkp@intel.com/reproduce)
>>
>> I can't reproduce this error on arm64 defconfig, so this let me wonder that should we
>> let drm/rockchip depends on ARCH_ROCKCHIP, so as to reduce the testing overhead on other
>> unrelated platforms?
> 
> Hmm, depends.
> 
> Limiting Rockchip-drm to ARCH_ROCKCHIP || COMPILE_TEST could make sense,
> as as you say, completely different architectures have absolute no use
> for this driver.
> 
> But the error was real nevertheless. We should never rely on headers
> getting included by accident. the vop2-reg.c change does introduces the use
> of FIELD_PREP, so we should include the header ourself - as my change from
> yesterday did. So the test-robot showed us an actual problem :-)

Got it, Thanks for your clarification.

> 
> 
> Heiko
> 
> 
> 
