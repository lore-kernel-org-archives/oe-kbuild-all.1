Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC911CFAD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4ApbjCx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE10AC433C8;
	Wed, 25 Oct 2023 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698235578;
	bh=zcZPrfZh3HclWke3xhgc6Q8KSv7CH/ZwpdZTXPlmCp8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r4ApbjCxuFrpyzSamdI2Xb7rCYBgYUo7IGlvkC2cDYUNEdYboUlxBWTgm3eP1TVRg
	 YOjnFIeiBBFqhct0D0wGdV1MLN2oZnlRlLPJQxCD0NFULl3MEcsbTuWyPMiphYchDG
	 eyWkouWxRlgYEfOZiASjR9LBMDbOXQM5LD//CT2mj6+PuUNgmV/cWgHbCsTRxRFxxa
	 CRaWeaqkAG5lP0vXBeQeTrfDGJF/0Cz6LWlF5TqkvVJP/smd/xOPy1MZ0rvqztSDzd
	 chjRElDs/RtmoFWLJdqeTRt9XHpWZmMnE2TbsYQ6GivUyuYln9lfhR+A+nlf8VRqYX
	 nDsUgJGHNmEIg==
Message-ID: <6a17e9a4-b256-4994-825d-ef62c310c937@kernel.org>
Date: Wed, 25 Oct 2023 14:06:14 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mediatek:v6.7-tmp/dts64 5/6] Error:
 arch/arm64/boot/dts/mediatek/mt8192.dtsi:1939.33-34 syntax error
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Balsam CHIHI <bchihi@baylibre.com>, oe-kbuild-all@lists.linux.dev,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, kernel test robot <lkp@intel.com>
References: <202310241605.K0DBxIoK-lkp@intel.com>
 <ffc5e943-cd36-4802-a4e0-451a06cd22d9@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
In-Reply-To: <ffc5e943-cd36-4802-a4e0-451a06cd22d9@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 24/10/23 14:54, Nícolas F. R. A. Prado ha scritto:
> On Tue, Oct 24, 2023 at 04:18:07PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.7-tmp/dts64
>> head:   54ca4e2e3324018d6235eba0d83953a957dbd489
>> commit: a471c48abce023f2808e8c5fd3993ec7712f276d [5/6] arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
>> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310241605.K0DBxIoK-lkp@intel.com/config)
>> compiler: aarch64-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241605.K0DBxIoK-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202310241605.K0DBxIoK-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/mediatek/mt8192.dtsi:1939.33-34 syntax error
>>     FATAL ERROR: Unable to parse input tree
> 
> The DT patch depends on definitions from patch 1 [1], which was merged
> through the thermal tree.
> 
> [1] https://lore.kernel.org/all/20231017190545.157282-2-bero@baylibre.com/
> 
> Thanks,
> Nícolas

Thanks for clarifying that.

Regards,
Angelo


