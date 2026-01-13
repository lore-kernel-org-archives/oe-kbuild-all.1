Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271E827B34D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313784; cv=none; b=qEVU90gWp7+9milbHmKpJCUpUPOpRWWloEcWNxHmQxNHJsWfsUBWai+fiDd2EDzLHABqHowyXzdNphrd8EYIu5MLCeHVQ21Y1MVfJBUVDPlO/pJnclSyYktW90A7RA3xcCjqtkbu8E4ayDPf166qZKYjFlKtlw+qBTdoKFFKAnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313784; c=relaxed/simple;
	bh=Lh/rYPwwX2xZd5ZhlB4eqI8l+Qn859cb8LQ9Cq7YoQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrRZAMerr77Wwbmny3xpsWfGWwYS1RJYEv39Lc9UBJwRszAwzPjQAD8FiVkCcU+5VQ0TWXkkWP09S1aYjzOpCHKXfu/JCxIs3ILld5iI3Ir6OmtqDUBsKYjMGAAreICq0TLPBJV6wO/qtgLy1DtLr9SfyUVPVA4znVCi5CfOXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QaV/QhEc; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QaV/QhEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768313774; x=1768918574; i=w_armin@gmx.de;
	bh=6jE3VkN32EfFc0M86KtcWvLFWJtQjQFrrwtJmQVe92w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QaV/QhEc4LSBKl1/Jp3tV15fsiBBTIw1Bne5tJSp+zIqoAcXIdpW02J6BDE+Ee7A
	 WxMb62mAZsYj9GDvLXoLftL60+rcJOOdL+9xnqnFJS7Xn/gBtdrfvBbNoSYsiZ+v0
	 yf8ZbVsFfl6cP48FSLwSowHsrlov3Oni4lMzRaQn7jR/HQiKBw4Dk2/HpL+oRClg3
	 SKALD9d2xYjI+vbrykOxgq/VLY8Z+5c+24k/Nq6eC4HDl2TbQtGJ4o3+iZrBhstlP
	 zEEk7WvhibVUnhjLoxotaVt1qTHGCxd/ya2Lg2X3pimXLd8PjOJfEOtszRYeMYGRe
	 iDHuwzXRHo0Kb+H/FA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.93.37] ([141.76.8.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1vGt433Qba-00V80v; Tue, 13
 Jan 2026 15:16:13 +0100
Message-ID: <21b70177-d06f-4bb8-9c11-8f3b053cef9a@gmx.de>
Date: Tue, 13 Jan 2026 15:16:10 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 8/28]
 drivers/platform/wmi/marshalling.c:24:1: sparse: sparse: static assertion
 failed: "ARCH_KMALLOC_MINALIGN >= 8"
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <202601131514.lmN2k3pc-lkp@intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <202601131514.lmN2k3pc-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R6Z2xARgsZNwV5vkjH8fF5CYi7XE59U/dPZT6xzRAspe/4qGQGq
 6sG/EKXnLA8pqkgr4q7gIZsVCkWmKhIYM31uluc3NUkDbiU3oHLXKVvHAih8j56mUnoHqn+
 BGzSPir6W/9IKDCvb6Kbu535EIYYgnYiJdGtRIMiUIa2ncOrf8ash6vFBz/DHUH/1pNdbgo
 8sXpOSeBRWuDcd5/0X2/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tCkdxKbIV4g=;W5XLcBi9I//qsZjMS+wUm3aEGnj
 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
 0GtS7bcgem7

Am 13.01.26 um 07:52 schrieb kernel test robot:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-d=
rivers-x86.git review-ilpo-next
> head:   2511dd4dbb76ef6914c9b45ccba2492da25d772d
> commit: bfa284e9f5e77c9e7389116a403b1dc478f2d58e [8/28] platform/wmi: In=
troduce marshalling support
> config: i386-randconfig-062-20260113 (https://download.01.org/0day-ci/ar=
chive/20260113/202601131514.lmN2k3pc-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arch=
ive/20260113/202601131514.lmN2k3pc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601131514.lmN2k3pc-lk=
p@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> drivers/platform/wmi/marshalling.c:24:1: sparse: sparse: static assert=
ion failed: "ARCH_KMALLOC_MINALIGN >=3D 8"

It seems that i forgot that on 32-bit architectures, u64 (aka unsigned lon=
g long) only has an alignment of 4 bytes.
Would it be safe to instead only guarantee that the buffer is aligned acco=
rding to ARCH_KMALLOC_ALIGN and that 64-bit
integers need __aligned(8)?

I do not know if aligning a 64-bit integer on a 8 byte boundary is compati=
ble on 32-bit with a buffer aligned on a
4-byte boundary.

Or is there a ways to tell kmalloc about such alignment requirements?

Thanks,
Armin Wolf

> vim +24 drivers/platform/wmi/marshalling.c
>
>      19=09
>      20	/*
>      21	 * The WMI buffer data needs to be aligned on a 8 byte boundary =
to properly
>      22	 * support 64-bit WMI integers.
>      23	 */
>    > 24	static_assert(ARCH_KMALLOC_MINALIGN >=3D 8);
>      25=09
>
