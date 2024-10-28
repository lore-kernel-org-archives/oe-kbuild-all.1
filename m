Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07719188CDC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730157047; cv=none; b=C7YF2k9GAaGJrGIiLNmUazmOhOaTUCR5e2aldwIOKzA5dQ+TkObmcyUhJNI7zKWcs1DOHNRNXBWrrRzZk3qwwvpvx33kh7vFRBCtlgNz94vKWKl3zm5nQPP1w7JooN2T0QNwMeAuKyAfMB5uehbWTWSUsJsmu0+hT948qmgy9cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730157047; c=relaxed/simple;
	bh=oUT70BQkiah8zFlkN5KXPEcdRWzrtaA/FMNAWU2K1Hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx45a5q0yocxQQLc4k5O6gOVGu768+ctRmrt37gcRSLNVCx9r+N+0CEgwnobwsVc8AwYaKcqzxCarnDpd60Utc5/L4rVaDfSTo4HlGJD5VELcKRT0O3vRMUKpqYxvcPmqx3lfdznIMYXi+ZY8DNtFzbq1CLgNUT+xgjiiGtnHSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ROGS6xw2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ROGS6xw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730156638;
	bh=oUT70BQkiah8zFlkN5KXPEcdRWzrtaA/FMNAWU2K1Hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROGS6xw29xlhwiyax04X3jSyIe37CrDdR1wGmgHqFoLu7qRkzE9d56YWTnEbMsg+o
	 TbUDpBjWSK7SHkjNVVwPxDfvuucGi3dcNpV9LPicWFnwUcffYWH33WBubaK2u1OVel
	 kNGyFpOjuZgkud5ByzTABxqgI1PoNRzJ4XnOTQ+GZ3zqHL9LLEapmTPnt2sIxcN/ZE
	 wmgv/+Mg/6dZkSUGfYOZ3InljLgIEbfSXoRtHDhZUl6xL7zeN8geNplc3T8DSoo9Zq
	 BSTrZuGlB+4P3k0oYbB/hzOOP0FdRrpO1V6uzN/261EA4mIkHmhm2zucIEwARyQQgK
	 tZBrPyHxqQn/g==
Received: from [192.168.1.90] (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E827817E0CAB;
	Tue, 29 Oct 2024 00:03:57 +0100 (CET)
Message-ID: <43c1707d-38d0-4dc3-85a7-4e20ef155757@collabora.com>
Date: Tue, 29 Oct 2024 01:03:57 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4481/7183]
 .tmp_gl_dw_hdmi_qp-rockchip.o:undefined reference to `__udivdi3'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Algea Cao <algea.cao@rock-chips.com>
References: <202410260625.ARIyt2GI-lkp@intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <202410260625.ARIyt2GI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/24 1:29 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
> commit: 128a9bf8ace290d86d2805c06f3b0e4cfab75de0 [4481/7183] drm/rockchip: Add basic RK3588 HDMI output support
> config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410260625.ARIyt2GI-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260625.ARIyt2GI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410260625.ARIyt2GI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    microblaze-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.o: in function `dw_hdmi_qp_rockchip_encoder_enable':
>>> .tmp_gl_dw_hdmi_qp-rockchip.o:(.text+0x2c4): undefined reference to `__udivdi3'

Will be fixed by the patch already submitted by Arnd:

https://lore.kernel.org/lkml/20241018151016.3496613-1-arnd@kernel.org/
