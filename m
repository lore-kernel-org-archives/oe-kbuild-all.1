Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197725A2DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315432; cv=none; b=ONlvc97S+qNZweWJF4MGfOy5HNS3wfkUbJcEuzv6LRd9zuTHe8TC24jhG3qpsVyj31aO89UTX519wWOT92HXfYw1CN1DzKv9j58UVtLIp5uTLH2Ojc0/bNVlTbLZ6MDfuzNf/ikuDoIM7uL8lPFU1uufAAW3O6AbC1Ff4UTY74g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315432; c=relaxed/simple;
	bh=RwifdzU4X+E9HF6edUO96FvkYrN0gaoeQFREJOB9xso=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tgxIh4lb2zTWv4tird6pTe7tVKqlqyevSJTdDgVlKGlIvA0G75GUgVoT1sXn2DYEAApQIxNx5pgcH1ISIJPXQg2IpvZSOu4QLPEKitEUW8kkuIxJ9uKogj/3Qgs/UhR1FtC4oscMo9nmQlthZ05ErZUpCCMnPwSNoxEM55oN6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XCAg00Aq; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XCAg00Aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768315422; x=1768920222; i=w_armin@gmx.de;
	bh=RwifdzU4X+E9HF6edUO96FvkYrN0gaoeQFREJOB9xso=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XCAg00Aqulhj2F6nT5kb7bFkaSGZNingzq9lZQApVpBla15MSwF6btJcdCh6g7j6
	 9/vSb7xvJOSr2EynyA4uHkTyIZPmql6QmOI19X66p7cCR6AJWQDU+B0nv05gnQHsQ
	 LuyL9sy7zCijH6dGhcvs4bH4alPjGDhAuIeJseMmUlfx+jgAzo+ycIFikVAX2oXjb
	 uqRk+SJar0xmmBcnFuoD8Nq/6qqFWNtLGn0Z9mj+khwOt2Ej5BdB/57DlhKlReMvr
	 L1RpmH8PEkSYeZP3rZdmZ1WCTzc8JYQPu6jm7McuOM4Ikj6haKw7wGDGpfbpOA5Tb
	 YIODqiTsaqTukbbbMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.93.37] ([141.76.8.133]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQEn-1w9Fg90Y0l-00lxXt; Tue, 13
 Jan 2026 15:43:42 +0100
Message-ID: <63a1bb66-e2b3-4521-8de8-0e7ee0ff6013@gmx.de>
Date: Tue, 13 Jan 2026 15:43:39 +0100
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
From: Armin Wolf <W_Armin@gmx.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <202601131514.lmN2k3pc-lkp@intel.com>
 <21b70177-d06f-4bb8-9c11-8f3b053cef9a@gmx.de>
Content-Language: en-US
In-Reply-To: <21b70177-d06f-4bb8-9c11-8f3b053cef9a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bFbwyLY3pZhWUKxj2Env1M1FyAMf44m3fVUQpXTZh/qLtsYVIkg
 ymWlcH7EU4nbI4B77jdGX6FN78TN71brlig6TERPomsSrM2VFcVDp0bn5MvwdXhzAerNVTQ
 D6l1xqPiZG3If1rijkXSGI0tOEViWfoNnfbHnLhsqMbaMEw7L8RHeOe2lMBWVEbww/Qs2Bo
 LRovFac7HwfVQpwJevhzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6w+4feujHEc=;dK1u5+j7/AKjxQFrXz34Sfef4//
 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
 MKMTkiG35reQJPGvisvw

Am 13.01.26 um 15:16 schrieb Armin Wolf:

> Am 13.01.26 um 07:52 schrieb kernel test robot:
>
>> tree:=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-=
x86.git=20
>> review-ilpo-next
>> head:=C2=A0=C2=A0 2511dd4dbb76ef6914c9b45ccba2492da25d772d
>> commit: bfa284e9f5e77c9e7389116a403b1dc478f2d58e [8/28] platform/wmi:=
=20
>> Introduce marshalling support
>> config: i386-randconfig-062-20260113=20
>> (https://download.01.org/0day-ci/archive/20260113/202601131514.lmN2k3pc=
-lkp@intel.com/config)
>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=3D1 build):=20
>> (https://download.01.org/0day-ci/archive/20260113/202601131514.lmN2k3pc=
-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new=20
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:=20
>> https://lore.kernel.org/oe-kbuild-all/202601131514.lmN2k3pc-lkp@intel.c=
om/
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/platform/wmi/marshalling.c:24:1: sparse: sparse: static=20
>>>> assertion failed: "ARCH_KMALLOC_MINALIGN >=3D 8"
>
> It seems that i forgot that on 32-bit architectures, u64 (aka unsigned=
=20
> long long) only has an alignment of 4 bytes.
> Would it be safe to instead only guarantee that the buffer is aligned=20
> according to ARCH_KMALLOC_ALIGN and that 64-bit
> integers need __aligned(8)?
>
> I do not know if aligning a 64-bit integer on a 8 byte boundary is=20
> compatible on 32-bit with a buffer aligned on a
> 4-byte boundary.
>
> Or is there a ways to tell kmalloc about such alignment requirements?
>
> Thanks,
> Armin Wolf
>
I think i found a solution for this: kmalloc() already guarantees that eac=
h allocation is naturally aligned, so 64-bit integers
are already aligned on a 8-byte boundary by kmalloc(). Because of this i t=
hink we can drop this static assert statement if we
reword the WMI driver documentation a bit.

Should i send a separate patch or should i resend the whole series?

Thanks,
Armin Wolf

>> vim +24 drivers/platform/wmi/marshalling.c
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 19
>> =C2=A0=C2=A0=C2=A0=C2=A0 20=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0 21=C2=A0=C2=A0=C2=A0=C2=A0 * The WMI buffer da=
ta needs to be aligned on a 8 byte=20
>> boundary to properly
>> =C2=A0=C2=A0=C2=A0=C2=A0 22=C2=A0=C2=A0=C2=A0=C2=A0 * support 64-bit WM=
I integers.
>> =C2=A0=C2=A0=C2=A0=C2=A0 23=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0 > 24=C2=A0=C2=A0=C2=A0 static_assert(ARCH_KMALLOC_MINALIGN=
 >=3D 8);
>> =C2=A0=C2=A0=C2=A0=C2=A0 25
>>
