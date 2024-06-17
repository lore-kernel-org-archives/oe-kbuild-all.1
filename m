Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C66256A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 04:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718599838; cv=none; b=MjrXKTd5HZ9tS6rzZasUToANKbe2C9G8L/CWmqMshi6OQQTt5wihMoT7wFdv1p3SkHwUuZRNTPOvF0DIu6kMyCXBLBHLQQ7495HIjIxf019jhQwEBIUNkYAcgzyZxwEI+wr9UsbOYnxf4pSlk/vEKxc2T7CjMeaiqjs2RxCFPUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718599838; c=relaxed/simple;
	bh=DYb7FVK6mobohO7ru+Krfip/fCFTss8isQVNugizQJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAYDCCRM4aIfQ8PQpZFziUeKSjSBniuVgSC6NJMtQmyPEy19V9+IU0fATaSBpS4FUpWGX5oSewK9V+EaCgkW33xkUf1XBxgiWMGGdZo6EGg2oqBr4oYsD8Eznj9DMoalwHz6/IqJIVcE5tuy22Emcc9q+AVLEdWARBUcwSER9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=z5svOkTn; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="z5svOkTn"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DD77688274;
	Mon, 17 Jun 2024 06:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718599829;
	bh=yTVAlUCYpnZxoDVGMufkmGcSLzlmVqwvJQGKUrxRtbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z5svOkTnDtHDyPHDy7ziscwYZtiOjfofTKb1ZXIM20RYSP7L7zo0VZd0tGxUGajxm
	 xhC0f/Z+g5DiCiSxcGeBLMkpUEfaJs+/Q94/AEUNIfFSShDXNWH9Cpup2Lh24FH6gR
	 jSknPPl1ikZuA0DpWKAZnmD+P5ygbP9+MWfLMWgVWxlFwyygwUIvDVtzFsb97lbzqi
	 ntQbjrhK2PYD0TiTNY0qbP8U5360sAHvU/uu9+ckU1HFn3xIE2iEFxY2jBB7a2CHY4
	 T5k2zRDeiIG7UdKiApYi+dIupDK3DWGkRc6qmq3Xvvzk6APb2GALYwphhKBOM4ATW6
	 LDzoKHWMx/e0g==
Message-ID: <70b097d9-f859-4f57-91d2-4053ed9b1717@denx.de>
Date: Mon, 17 Jun 2024 06:41:26 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [shawnguo:imx/dt64 27/42]
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: hdmi@32fd8000:
 Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
To: Shawn Guo <shawnguo2@yeah.net>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
References: <202406171104.SmweUTX3-lkp@intel.com> <Zm+rYkorx7K9dtIA@dragon>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Zm+rYkorx7K9dtIA@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/17/24 5:20 AM, Shawn Guo wrote:
> Hi Marek,

Hi,

> Should I drop the patch or is it bindings that need to be updated?

It is this bindings patch that fixes the warning:

[PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Document ddc-i2c-bus 
in core

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240515062753.111746-1-marex@denx.de/

No need to drop this patch.

I can pull the bindings patch in via drm-misc in parallel , is that OK 
with you ?
