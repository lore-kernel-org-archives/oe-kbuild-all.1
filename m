Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F163D3BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 23:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925331; cv=none; b=vGeX08gaDbqmy4tFzvSMcwFzcptCAhTAh//Z4kZqFsdq5vhjeyjB+hCfkoAgmE6zKMiix0agEyX3kEaJ4YCGkBTEBfk6A/QusYji9M1hG3VtIdXkHAp865sOFlK/2BwR33OPS/y1hzW9IOcIvt7xeChuLpYnaipbLWcLGwL0+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925331; c=relaxed/simple;
	bh=Q9iJMiD/0taxD3UrB71fJtAFHMtVEZGEyBQw7QRxJ3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzK8AKQbcda27GUfVsrPU0T87IhNZAReFMtKEQEEko2MXbI11OuhAktmZfZN1RiPRcrs4KV2o5/8qVlGqkBgOQHtOhLcR0v4KhT9DWt1/MNLedKNIi2SXldUJk7r5T/yZxLbs7KLS8JAm/bdGmAT9W8XI2a1VgBM41YRByjrTvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=nYzuZdwP; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="nYzuZdwP"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E2EFE87DEB;
	Fri, 21 Jun 2024 01:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718925322;
	bh=Xk+2T9EY+ddwGzJlavG0NDT+6OqgyaMmI/AapErwHAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nYzuZdwPZFxS+nmvzKvPAIkcpkEzQZHXEBw+Pz1ZewBS66hmxp673De9htUe+0b15
	 qzXIGxej7kNxO6AFhf/uikt25MTTTv9vsFIfOIV4vHZJG7LoxIjnwY9icdGQUZ/ziF
	 O/HYIhSZdbGxhO+adZHlvxXG6nLHdFIRVqSEr0bf6ItvJ0r2hT4zu06uwjnnBQnK7W
	 NstR+YIl2k3l2fnVTCQY66aNfTfGqrLJ36HnkRVYCcoBNQHEl+B6QBwRCnXJP1mPjE
	 f05SIAlM87i0JNxhcscjEZvxHon+Kwqvb2ekoahm6WxGJL3Ds3i7op5VFLmzRpoUcS
	 /jfuimpl+TVyw==
Message-ID: <b75d2ae1-9537-4089-937c-f60544bf72f2@denx.de>
Date: Thu, 20 Jun 2024 23:34:04 +0200
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
To: Shawn Guo <shawnguo2@yeah.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
References: <202406171104.SmweUTX3-lkp@intel.com> <Zm+rYkorx7K9dtIA@dragon>
 <70b097d9-f859-4f57-91d2-4053ed9b1717@denx.de> <ZnOWOEBClPpPpraw@dragon>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZnOWOEBClPpPpraw@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/20/24 4:38 AM, Shawn Guo wrote:
> On Mon, Jun 17, 2024 at 06:41:26AM +0200, Marek Vasut wrote:
>> On 6/17/24 5:20 AM, Shawn Guo wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Should I drop the patch or is it bindings that need to be updated?
>>
>> It is this bindings patch that fixes the warning:
>>
>> [PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Document ddc-i2c-bus in
>> core
>>
>> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240515062753.111746-1-marex@denx.de/
>>
>> No need to drop this patch.
>>
>> I can pull the bindings patch in via drm-misc in parallel , is that OK with
>> you ?
> 
> OK, I'm good as long as we are addressing it.  Thanks!

Now in drm-misc / drm-misc-next :

https://cgit.freedesktop.org/drm-misc/commit/?id=4c3f53ed2376d63478194f72a0222185b206653b
