Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2599F188CDC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 23:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730156727; cv=none; b=N0xHSeAvJOeg0Ox8hWnPTMJd/PRqLWoMXdlDNyOzcgud7Ic8UmcW/iIvo45KxYGNAKAlAlHIsp4fBybYK1LJdRa17F3Q9glyyvyfVbPIgHX4baN9WX1VAJqyMseRw7/DByHZh/D3phP/RqYHJQfZEJVwHXMpODfKhkczmftL5xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730156727; c=relaxed/simple;
	bh=lQAnXPN/BtaDth6nmNAPIKodOdlAtU1bNZOtqSP7KBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbFXscEYypNze51aoIPJl1qyRlSA4lOBn3ChTgkXI/rdmNyqiGTSIgCxCEX08AkUkaz3edUiwXEff4UVsvDtsnQOSTuYa3ezTNPstq1QKdI6iQ/3p2j4bvZiulqxj+d5SjidBmnhO8dVeKBT2UQ9qivLQGxcAIRjCM3WPk+bd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GktQw238; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GktQw238"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730156723;
	bh=lQAnXPN/BtaDth6nmNAPIKodOdlAtU1bNZOtqSP7KBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GktQw238s82SRAnkal9TBtRHtpyU1c3H+VtZlurXqTHxiTfGND+oMn7SrF4oKO4TW
	 pE8pyK5raKKuUHm0DIwIHvzBRBf27ELeF/1eHGirkIbVr95n+xPSWFTYl1l6BR8Vir
	 xzPKFkc3GPWVBbltUwVd/ZzSrOhWV3JAoyT5dyiKMFlsNzDCTL23MbASNSzPMy68s3
	 pGqILnhvbWERa21z0xfD2U3u7QbZGPXTMDhehhG83pQPFdngyHj6ZSIR9v3+26Q4aA
	 +HIvjZjLodi3inDq2TTUNRop+BGmBD5nsQKqqqeIDxsTn9JCyn3DFV1pr3tVYQVcnQ
	 ZqIDQyIeiR/+Q==
Received: from [192.168.1.90] (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 023A117E0CF5;
	Tue, 29 Oct 2024 00:05:22 +0100 (CET)
Message-ID: <d8425632-61b8-4d38-8d53-2ff71f9b0294@collabora.com>
Date: Tue, 29 Oct 2024 01:05:22 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4481/7183] ERROR: modpost: "__udivdi3"
 [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Algea Cao <algea.cao@rock-chips.com>
References: <202410261024.izEWMQGE-lkp@intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <202410261024.izEWMQGE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/24 5:37 AM, kernel test robot wrote:
> Hi Cristian,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
> commit: 128a9bf8ace290d86d2805c06f3b0e4cfab75de0 [4481/7183] drm/rockchip: Add basic RK3588 HDMI output support
> config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20241026/202410261024.izEWMQGE-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261024.izEWMQGE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410261024.izEWMQGE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/imx/imx-legacy-bridge.o
>>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!

Will be fixed by the patch already submitted by Arnd:

https://lore.kernel.org/lkml/20241018151016.3496613-1-arnd@kernel.org/
