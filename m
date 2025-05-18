Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAE31A0B08;
	Sun, 18 May 2025 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747564615; cv=none; b=FkJbNcVxnoPOUIsKDrgBrclOhKHzsNqtW6VuuQmh6k8TH7obtXdErL8ThirwvyCIjxdUyOEwPIrHspLI5AaFkixp6cgw/O2garRXbg4HBc++rd96Llef3W3j5v1kpR2Vpq6XcVzrGTi6TSiS0UpmqrHx0EMZL22ECrHwcAdHZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747564615; c=relaxed/simple;
	bh=Zy91Pq1yFlAMUc+CSyEs08eCZGIpNcLhNJdnhr+kNxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNn4sd+SFz6yTox5bnLpzY+wlKcislwnapdONfq2ORgaIYAKVq6OOf5tGmJIjqQFePKqObeMekQYHOFaGruEZRS9ohRwpFqkuHgFiN9upbFa7iaOTj7dPcRMESJfibRENjDzCKXsAla1lLYqiEy2ctjAnJGDJ6vgtuivPU8FMLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WT9WbHNB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WT9WbHNB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7900FC4CEE9;
	Sun, 18 May 2025 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747564615;
	bh=Zy91Pq1yFlAMUc+CSyEs08eCZGIpNcLhNJdnhr+kNxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WT9WbHNB42CEZzSZSSwHBjom1YxXVWrXPpPH08kVWYXj3gUXdogRFNSEqwSN9XdLg
	 lce2oN53iwe0R1Zu6BTVN2RfaAyU/wrnRrnY+7li+HMalQNgG8rej83RRPpeTCxa6u
	 wuzvEoTS/ufTF/rsEYKWku5TxdS579IatEVebAPLEXs0RYnYgNxpGpLzAYUcRm4M88
	 eXNRBInbx/uT6YI6Cx6EHGCiK9sVrNbMtZLHQvmdKnl97LXqu1kNeQFhTOXIJ/oH5H
	 4Sj+VIX/1qb96JrB3vXe+PE/iizb6t4flG4HYtJED7x0K95xlk15Z6fFwxbQjIrLaC
	 2zPWgC2h3DZTQ==
Message-ID: <3c3d0020-1dce-4364-a0a1-7c35b21e93de@kernel.org>
Date: Sun, 18 May 2025 12:36:50 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9473/11093]
 arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning
 (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error,
 expected "fe000000"
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Finley Xiao <finley.xiao@rock-chips.com>, kernel test robot <lkp@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Kever Yang <kever.yang@rock-chips.com>
References: <202505150745.PQT9TLYX-lkp@intel.com> <3983362.fW5hKsROvD@diego>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3983362.fW5hKsROvD@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/05/2025 22:10, Heiko Stübner wrote:
> Am Donnerstag, 15. Mai 2025, 16:04:20 Mitteleuropäische Sommerzeit schrieb kernel test robot:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
>> commit: ceb6ef1ea9002669afc0e1ef258e530d3c05d91a [9473/11093] arm64: dts: rockchip: Add RK3562 evb2 devicetree
>> config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/archive/20250515/202505150745.PQT9TLYX-lkp@intel.com/config)
>> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
>> dtschema version: 2025.3.dev27+g32749b3
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150745.PQT9TLYX-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505150745.PQT9TLYX-lkp@intel.com/
>>
>> dtcheck warnings: (new ones prefixed by >>)
>>>> arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error, expected "fe000000"
>>>> arch/arm64/boot/dts/rockchip/rk3562.dtsi:1115.20-1181.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
> 
> hmm, I don't really understand this error message.
> 
> From a practical point, the dtschema-version I have installed is
> 2025.3.dev27+g32749b3, which is the topmost commit from
> may-13th.
> 
> Running the dtbscheck on the rk3562-evb-v10.dtb on the full
> linux-next from today, yields no errors.

These are standard dtc warnings.

> 
> Checking out the specific commit ceb6ef1ea90026 brings up the
> errors from below [1], because they come from different trees.
> 
> 
> But in no cases does dtbscheck complain about the PCI memory regions.
> 
> 
> The PCIe controller in question of course has 3 memory regions
> 	reg = <0x0 0xfe000000 0x0 0x400000>,
> 	      <0x0 0xff500000 0x0 0x10000>,
> 	      <0x0 0xfc000000 0x0 0x100000>;
> 	reg-names = "dbi", "apb", "config";
> 
> and currently the node-name mimics the "apb" memory region.
> Should it always use the first one?

I don't understand where is the problem. The warning tells you: unit
address is not correct. Fix the unit address to match reg.


About second warning: that's also kind of already existing issue and
fixed in multiple places. Don't put non-MMIO nodes in simple-bus, like
soc, because it is not correct. simple-bus is for MMIO nodes.

Best regards,
Krzysztof
