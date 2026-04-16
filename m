Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8B13947A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331264; cv=none; b=pLOWLwRowuvNN8Lc1qsVXTZwCX8Serwd6CJvTI36d53koBXpMAQp6gzKL1xuowaYkve6EyFMwnHgTeL23lRI0/ziaiKDL3Uih/hlW23jfDNFzdUqNtbvPfjagG97+4SkEFkTg6Vx3/RK7+trFW8prQ0jqxT1ynmkWGh89768j5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331264; c=relaxed/simple;
	bh=hzgQFeLUK6gMHss7MTjgKQkWHZ80xiax2C13E2MP7bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3CrhBze16OBDyOHgDztIpB5KXfi2ZJorsqfR2JxvyWnWU17LHxqTwHFiHEwiwifcP3vP6V8G3JOo3Y5JulZwG+AIoBW7nttih7BbO8v0YEX5NzYDwQ4Jt3GR4A95lcMob0RmVsLrQEtfA/5TJD5nxQMa0svN4t4Lv79NukwP/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FAJ8W5id; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FAJ8W5id"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1686D1D6F;
	Thu, 16 Apr 2026 02:20:56 -0700 (PDT)
Received: from [10.57.89.188] (unknown [10.57.89.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18E523F641;
	Thu, 16 Apr 2026 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776331261; bh=hzgQFeLUK6gMHss7MTjgKQkWHZ80xiax2C13E2MP7bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FAJ8W5id/nfev+xlcsFdIQjmhFRqBe4Acp/STtD301NRRiXBuZbVfz+NxqCQmdzSn
	 cgzTDN7J1AQePMh9ViI5hWOgxMByHLzS+BdPQ5/nz/HvQqUfP30cVbCkZsj/S4K6Vu
	 CjbO9RsPDDZYGotC8Gh98dVYtswPeNCl9BT3oU8M=
Message-ID: <18f27168-d70f-4031-87af-502df84b4058@arm.com>
Date: Thu, 16 Apr 2026 10:20:53 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 501/13951]
 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: typec-portc@22
 (fcs,fusb302): 'connector' is a required property
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
References: <202604160254.eTvhtKq6-lkp@intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <202604160254.eTvhtKq6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-16 1:34 am, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   936c21068d7ade00325e40d82bfd2f3f29d9f659
> commit: 25afddad23b8e91fcff625756e51a805e288ab38 [501/13951] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
> config: arm64-randconfig-2054-20260415 (https://download.01.org/0day-ci/archive/20260416/202604160254.eTvhtKq6-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> dtschema: 2026.5.dev2+g3579443c5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160254.eTvhtKq6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604160254.eTvhtKq6-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
>     	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
> 

Presumably this is an existing issue in the base DT, and is only being 
flagged here since the overlay build now creates a "new" DTB from that.

Thanks,
Robin.
