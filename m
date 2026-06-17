Received: from mail-m11892.xmail.ntesmail.com (mail-m11892.xmail.ntesmail.com [115.236.118.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA473BD62E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 07:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.118.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682616; cv=none; b=RawE32Ic0uOLJu7uJJWGrMKjbN9RT+PxPf+i5EvcMj13QDDpdpBYdgXZr8ZIzs05tYMV3bPfgj8Ih1hjhNM1lwXevNzmtlqxF8/yqk1ZcjYiDHMOJVrhPuSJm4eFXrLwAnPgHkeZFjFr8eqOmCtA9TH4QvaiZtOVLQAWya1w5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682616; c=relaxed/simple;
	bh=JjQepXXI9+evFSwe7/Ik0rg2Rb3EEIrKrNJXTF5cII8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4uMRqf4fLLuvaclZsz7qC0HSS+rA6TUPxwPffxSfYE7yDVvqtVzVv4uMsAi3JGo6QEsSv6TpaCU2jcqKE6zT7ufKDs5FETplQX7qLkpcwlfdkILO4+dKHALWpLHwZ7uOuJK/Z3VRpKjMjqzKsLVQmd56J0GEsRDLP/6vUBX4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=NeCcLZA3; arc=none smtp.client-ip=115.236.118.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="NeCcLZA3"
Received: from [172.16.12.74] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42b932087;
	Wed, 17 Jun 2026 15:34:48 +0800 (GMT+08:00)
Message-ID: <e173819a-94af-4055-9d13-a83ad135f4d7@rock-chips.com>
Date: Wed, 17 Jun 2026 15:34:48 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 226/14321]
 drivers/gpu/drm/bridge/of-display-mode-bridge.c:54:25: sparse: sparse: symbol
 'of_display_mode_bridge_funcs' was not declared. Should it be static?
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <202606170744.FUStcWaB-lkp@intel.com>
 <DJB4NR341PMS.WYR444583WB8@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DJB4NR341PMS.WYR444583WB8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ed4810e7c03a8kunm6e7202d6fb16d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ05JGlYdSkpPS0kdQk
	tDHkJWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NeCcLZA3WW/stQxG/CA8t/QGN5csroVSHOWTsnCFJmVV5jhbgOP2d+vIHZpotJ5VuCupVSaxOAsYkHpQG43aulvzTeheOKuOF6INe1P81hk8hcD22oUqrgedM0fXVJasFb7FMbHHbsmnpzq+wXewrMSX0fBGjb/zPfijhMe4skg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=scc3l5LudMcrRQo5gqf6z53bOqoSwIqFfQKIe1ndPQc=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 6/17/2026 2:57 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Wed Jun 17, 2026 at 1:46 AM CEST, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
>> commit: ba2db93cf3d569a4525a02cd0ed5ec5f979e3afd [226/14321] drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use
>> config: sparc64-randconfig-r133-20260617 (https://download.01.org/0day-ci/archive/20260617/202606170744.FUStcWaB-lkp@intel.com/config)
>> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
>> sparse: v0.6.5-rc1
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170744.FUStcWaB-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202606170744.FUStcWaB-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/gpu/drm/bridge/of-display-mode-bridge.c:54:25: sparse: sparse: symbol 'of_display_mode_bridge_funcs' was not declared. Should it be static?
>>
>> vim +/of_display_mode_bridge_funcs +54 drivers/gpu/drm/bridge/of-display-mode-bridge.c
>>
>>      53
>>    > 54	struct drm_bridge_funcs of_display_mode_bridge_funcs = {
>>      55		.attach = of_display_mode_bridge_attach,
>>      56		.get_modes = of_display_mode_bridge_get_modes,
>>      57	};
>>      58
> 
> This had been reported already (Message-ID:
> <202605141933.yeT5SiTT-lkp@intel.com>). Indeed this should be static const.
> 
> Do you plan to send a patch fixing it? Otherwise let me know and I can do
> it.
> 

Thanks for the heads-up. I'll send a fix patch soon.

Best regards,
Damon

