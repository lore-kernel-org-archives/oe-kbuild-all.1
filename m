Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD2922068F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 20:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596690; cv=none; b=s4Nwiq7Gnuzo7AGjTABIJUgIorwRB1F2lSYgZrLODWTxmeE/d9Xycw9PMwoqFnLnv6dSYKbjJUNiM/9cORUpRdPFwO1sHdCjT3ci3Z0xlzs9IMbuzjMtj6DcZswYNofJBCHfoSvN3D38kRoGIYYrFK+QgkWEwnB3qHF6qcZDoyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596690; c=relaxed/simple;
	bh=EU3JiZKNhA/0BoTK/TUObx7kQ+JoouI8RyKGGoZWjJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyilJqofIWccTbfjspV2ZYBVlp8qEKIeiIYqVmU7J5bWin6ebRMLkUQRht7qfo9gDQeWIc6le3+o89v8OEMr4SdtmEtcO9uO8hVKWWFRSP5N7R+Va/QafUetGQqek08E7I8MCI7PP9LNRXkopFT7nqcrSGCgCOX3+3PTSElok2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Y3e/UR6g; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Y3e/UR6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596683; x=1769201483; i=w_armin@gmx.de;
	bh=v6Q4IUiXUv7GAzZR38YyjFsXwG6x8nGuRPUblyzBuCM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y3e/UR6g/rUP0pN0QAGG3Hza6I8L7Q2boCVnTbwFMewu0ojhRFrbQkSASrPN2PUQ
	 w6O24bhCaU9+Jg6F4Clur5jdWr2X9g3vLOEl4DE5J95pWzg2IiIsaRUHHsudFCvnN
	 F5tD6hfjXwkOKPmlgxs4iYsttrvPF5LbYBDhEETe0aCXde73uJjH0YnrrGVSl49H2
	 /i5IwXtcj+x6iA33E24hqW1yqVKQIYTDeSyz6FZb+zH1ZlvuC9iv3Vmd5fxQNcubE
	 Zzo6g6+SuJMOy1xcnEIzQp4qWljtwRU8IKKlk+YuAwLwLHCTN+VQI9L8V0dQTn1t9
	 g0oUF+HcyUK2zY8dBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4s0t-1vhfrw0lDb-0074Bx; Fri, 16
 Jan 2026 21:51:23 +0100
Message-ID: <5e3f117f-3c83-4459-a88d-4a569985b85d@gmx.de>
Date: Fri, 16 Jan 2026 21:51:21 +0100
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
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <202601131514.lmN2k3pc-lkp@intel.com>
 <21b70177-d06f-4bb8-9c11-8f3b053cef9a@gmx.de>
 <63a1bb66-e2b3-4521-8de8-0e7ee0ff6013@gmx.de>
 <6a8e58c3-0eed-2921-9da9-69ea315f7540@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <6a8e58c3-0eed-2921-9da9-69ea315f7540@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M8Ch6rIU9kzMLwDzwr2DCCdywZgaxMVHTGqHfuHpjQ+WNoNJCDe
 6XC65yJNHWp9UkykH7BG/Cf6+SfKTNxz2kKaIOhgV40p6bBEnBLwsphJQEW70cZkTW3NiOA
 6eRZR6bN3TFQCkZvy3QOa4VpxSu4X6aS4R7vyhhMIicLt7g1+MV5uI03BMmysHVce/KFojp
 OTj6CdNc1iHwQ14J9LxzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+8rxpQDfgOo=;wiQ89A92y9u0+RAMQG0ux0DCvCu
 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
 qHZWwWzVh+BzQQaL1OI2

Am 13.01.26 um 15:55 schrieb Ilpo J=C3=A4rvinen:

> On Tue, 13 Jan 2026, Armin Wolf wrote:
>> Am 13.01.26 um 15:16 schrieb Armin Wolf:
>>> Am 13.01.26 um 07:52 schrieb kernel test robot:
>>>
>>>> tree:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driver=
s-x86.git
>>>> review-ilpo-next
>>>> head:=C2=A0=C2=A0 2511dd4dbb76ef6914c9b45ccba2492da25d772d
>>>> commit: bfa284e9f5e77c9e7389116a403b1dc478f2d58e [8/28] platform/wmi:
>>>> Introduce marshalling support
>>>> config: i386-randconfig-062-20260113
>>>> (https://download.01.org/0day-ci/archive/20260113/202601131514.lmN2k3=
pc-lkp@intel.com/config)
>>>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>>>> reproduce (this is a W=3D1 build):
>>>> (https://download.01.org/0day-ci/archive/20260113/202601131514.lmN2k3=
pc-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new
>>>> version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes:
>>>> https://lore.kernel.org/oe-kbuild-all/202601131514.lmN2k3pc-lkp@intel=
.com/
>>>>
>>>> sparse warnings: (new ones prefixed by >>)
>>>>>> drivers/platform/wmi/marshalling.c:24:1: sparse: sparse: static
>>>>>> assertion failed: "ARCH_KMALLOC_MINALIGN >=3D 8"
>>> It seems that i forgot that on 32-bit architectures, u64 (aka unsigned=
 long
>>> long) only has an alignment of 4 bytes.
>>> Would it be safe to instead only guarantee that the buffer is aligned
>>> according to ARCH_KMALLOC_ALIGN and that 64-bit
>>> integers need __aligned(8)?
>>>
>>> I do not know if aligning a 64-bit integer on a 8 byte boundary is
>>> compatible on 32-bit with a buffer aligned on a
>>> 4-byte boundary.
>>>
>>> Or is there a ways to tell kmalloc about such alignment requirements?
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>> I think i found a solution for this: kmalloc() already guarantees that =
each
>> allocation is naturally aligned, so 64-bit integers
>> are already aligned on a 8-byte boundary by kmalloc(). Because of this =
i think
>> we can drop this static assert statement if we
>> reword the WMI driver documentation a bit.
> Yes, kmalloc() does guarantee > ARCH_KMALLOC_MINALIGN in some conditions=
.
> You probably read this already, but here it is for the record:
>
> "The allocated object address is aligned to at least ARCH_KMALLOC_MINALI=
GN
> bytes. For size of power of two bytes, the alignment is also guaranteed =
to
> be at least to the size. For other sizes, the alignment is guaranteed to
> be at least the largest power-of-two divisor of size."
>
> So effectively, if size has run of zeros in the least significant bits
> beyond ARCH_KMALLOC_MINALIGN, that will become the minimum alignment.
>
>> Should i send a separate patch or should i resend the whole series?
> I already dropped this series to avoid head-of-line blocking
> the review-ilpo-next branch (but was still looking for what to reply to
> your alignment question). So please resend.

I just send the new revision of the patch series in question. The alignmen=
t
check happens in wmi_unmarshal_acpi_object(), if you want to take a look.
I also verified that this code successfully compiles and runs (as far as
kunit is concerned) on 32-bit x86.

Thanks,
Armin Wolf

> --
>   i.
