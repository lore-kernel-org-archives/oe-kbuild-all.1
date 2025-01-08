Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91211FA15F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340650; cv=none; b=e8tBdF27wxM7UovtJ2cRnOLK+kuz0wO2wxU4dA56cXN67A0H0+uYGdldAXnTgB/v5omkkU7NYYp5r1az2eltBj2OtkT4Gddg2s5tEF3fCkSrzh68DOEF76Uz5TOak1vWJ3s0Oc0n06qfWpysPvb5uFzq74zabLCM3nw/Wy1NCQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340650; c=relaxed/simple;
	bh=kabQNRJbkDRbWCXDucxxnkIM2bLN6V7Kkzv+SrpJHOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZ9P88IC3EYolooJB90pKHDs9aRS3eNI36AvernWkqRd3ZP3v/ntkXaynza6vuFVWSE+qJgJ3WkIXtItdBn3zrED0PaeXC7d0IKAEEYxvvwz05b7EHkCj+IgXtlqn/60AqhjeU1Gg/7TLq5ZMLMLaArHmHwofHJnVV5E2UFGt28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bZJZufQG; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bZJZufQG"
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 4604BC1F43
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 12:44:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 478A61BF206;
	Wed,  8 Jan 2025 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736340266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTNOwbU3SwRyUpqZzkjDRzneFrVGP8GSgN0BObWzwCE=;
	b=bZJZufQGMGrx2AYGVEXunYPfqYOqAoz7vuEcX4A7B2x+H6nQcablCQQjtSkymjlIjFuToR
	Lu263L2BWj49BemHh0rXqHDHDNiKcgiYodAqNoYtaMHtoLufqc7zC2fIjo+5N2BOD2P50D
	cvAyLXSETqY1UttX8Mj8SSlubX9RWJ8Ow/inhO1/tdTswG0OiNFMm0RWca5DSqjvygtBzk
	q7mM4auBstXjKbOqMI27A4w3neJ3gt26eRhn9+3Z+YDzFgiWzV5mKdzDOJOLL4FRF66/Uf
	n93bCe4DRSxe9OfK0C/m95x+BrxASEkLob13ANxal/94nbLhB2ViSmF0EP8YsQ==
Message-ID: <da411c8f-719b-4bd6-8314-4200b115a405@bootlin.com>
Date: Wed, 8 Jan 2025 13:44:25 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [char-misc:char-misc-testing 34/74]
 drivers/pps/clients/pps-gpio.c:66:47: error: incompatible type for argument 1
 of '_dev_warn'
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202501080313.MmWpjmSe-lkp@intel.com>
 <2025010849-muster-cathouse-6b47@gregkh>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <2025010849-muster-cathouse-6b47@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi Greg,

On 1/8/25 1:19 PM, Greg Kroah-Hartman wrote:
> On Wed, Jan 08, 2025 at 03:37:10AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
>> head:   daec45916d68bc14406f20f547a8c39a3eab88b3
>> commit: 8aa0545f419e5bffbb27354e0221997cb6e87cbd [34/74] pps: clients: gpio: Bypass edge's direction check when not needed
> 
> Bastien, I've now dropped this commit from my branches, please fix it up
> and resend (after at least test-building it...)
> 

I've investigated it, it's a conflict with commit c79a39dc8d060 ("pps: 
Fix a use-after-free") that changes the struct pps_device. This commit 
isn't present in v6.13-rc3.

Do you want me to send a new patch based on char-misc-testing ?

Best regards,
Bastien




