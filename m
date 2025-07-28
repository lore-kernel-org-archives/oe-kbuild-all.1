Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1C1DF73C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753694944; cv=none; b=g5qO3AMueile0efp/n+95Z2R9Dn9JQ78/KV/6Xyc4omnCqs089Oa12bSpdU+c64DhGZ3kCUAmbZrzDI5LJZp5qy2KdWKg5PHc2RVKoL+WoYVik/6kkgDLm9jlLbtJ4YjB1pTM8oGRtvgFXF/DyhVpzN4NMZoDSwhwYUggW5Nk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753694944; c=relaxed/simple;
	bh=sjDu2mdRA20oxY5E1Z1KL5hCQOV9BE3U2VtKAuk3lOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdEAnU3q62XuDGD4L0qp9IGBGXKDnbNPOghVLHDjPvjZMSf01YEMUx+AhSf+itn/PH4h6CgUtg3sbDpRLsEPgobjRFpynImekCOaXFp6FLYCZ1Nd/lUkGUAjjp0BzIYWFni+ekby5yisD7/W1yhYzBz0+9HJcMNoubIIdcD/NKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=GSmYZXpU; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="GSmYZXpU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753694939; x=1754299739; i=deller@gmx.de;
	bh=yHuYbWyehYGcznrFOwgsYGw5KITHfQlnENXXkCVTJKM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GSmYZXpU/tH/jITimNBOKqwDz4NyYg9D6NAeTuPvi+BQMrJNh1XKO6oW8lWo8YGF
	 e/P/rVpXMQ4d6AdFajzl+mcq6Z3C6G24qsrSzdwPopBuP/Xae2ut5L/5s4Nq8hPII
	 vSk+TBZ/BpuKBAynpXKQO3jkd77jcpg+chGWF5qLMszJMel1wNYLboo1SSQRk+hE6
	 2QRIkLJ88+XJiT7yDZDlAugjzmphW5XjNPCSOuqihWyGuLQuVXH0P6HDeKtvLBhnW
	 +EAmTAewT46IJ0T3DleSH+5YSUjINkNO5oULjtj108wNDD5L/xeUq4yVm3vTTbvY1
	 +9Gk+X6FlI0zbDBDYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ygY-1uj5qf0Diw-0026OS; Mon, 28
 Jul 2025 11:28:59 +0200
Message-ID: <95efb29a-4f8f-4a10-9cf2-eb9db2c75443@gmx.de>
Date: Mon, 28 Jul 2025 11:28:57 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12467/12680]
 arch/arm/mach-pxa/am200epd.c:39:10: fatal error: video/metronomefb.h: No such
 file or directory
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
References: <202507281743.5xObRBMA-lkp@intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <202507281743.5xObRBMA-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Hr9bUzoOI/RfsaUhoOhho5tk4scOCYy1xhI888yKmvaAhRNlJG1
 H03qFJXgp66RiXjmjJFvQpW5h3Z+g8n5H66a0VAe6A5fwd/SM5mOWqiS+RSdyXcqKVcXNpi
 miREZAo7viConqh37JIJE2JqS8hdM4Y0uYf3xOzUGuFCc4e6+S2rvK6Aid2CS6PZLXI3s2z
 YSv+LAHwt4PQ+BXSDcV2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+hJiQDI9+FI=;MP0WHU4QBtHWjxFwEnh/Bl+/TpA
 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
 EhvaBMLCieMy9o=

On 7/28/25 11:21, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
> head:   0b90c3b6d76ea512dc3dac8fb30215e175b0019a
> commit: bcaba0cd4fac7e5772c8525dbf8f650045bb9f47 [12467/12680] fbdev: re=
move metronomefb
> config: arm-am200epdkit_defconfig (https://download.01.org/0day-ci/archi=
ve/20250728/202507281743.5xObRBMA-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arch=
ive/20250728/202507281743.5xObRBMA-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507281743.5xObRBMA-lk=
p@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>>> arch/arm/mach-pxa/am200epd.c:39:10: fatal error: video/metronomefb.h: =
No such file or directory
>        39 | #include <video/metronomefb.h>

This triggers because I added the "remove metronomefb" patch to the fbdev
tree without adding the previous patch too.
I'll fix it up by dropping the patch for now.
I'm sure Arnd will send a new series which completely drops metronomefb so=
on.

Helge


