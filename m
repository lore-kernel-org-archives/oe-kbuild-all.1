Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C03382C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701064; cv=none; b=FWe6mONWjU0i09cc4sTvYawuuWmcwGx9K3wyZ6VrAruDGrs9GbJzvnvF6Tgg35w9uEdUuLAHVVIuW3gAY+PcPi/uwIU5SIjOZd3WzT//lZPGl5ErxFG2yphfMQNpOE6rDIvZiQgcE4ZgLQf+zwOObggmyxMDMnOW6m0R0/sJraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701064; c=relaxed/simple;
	bh=CBQBVTne5hqfhnfdOMiZ9ySAGvVjcyb3uckBEJpp2p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4KmHt3xfAyDIeU9ovNIKnHZmMbsbUAufKvSNF8hf1AbP7LM4G9+Yov9Iccflwwx1m0JRY3b6V/Jep2m8zzK+B/yQOCLMXBPR49oDZj6Pmwxbwa3qUF5itsek5AuUEDod3q9+Qn1XbH9LzPpSvA0WTi9koPKHR7sOJn0njyBiEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=JBYJhJ7j; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="JBYJhJ7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772701051; x=1773305851; i=deller@gmx.de;
	bh=mO9x/IfNI4iOZdeeFuis/vRi1276MqT/h+zlXQyNJRA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JBYJhJ7juDktzaqBvT0MzbgCJzGkFs3i3jd2sD4pDswBzvcuF0LfJNn9UNXLv2jP
	 gGd4efMR36L43zpmJ6JM01eMwiybE9Uwnx/Fl4YhPE3bJZzf5agoa2bzgSt9Dux1T
	 7a3HVamQQExat1qNZGUVezpsPtPHGABFjpJuA6zlSGTaCwzMjexQ0AAZExnmy88jR
	 L9Epi1y+9LFTvdW6JeGI37DZ7xek5U+Y31nfrqNORU+Fc8H+f9RKF/qEDr0zyLXJz
	 lmQGbF5iztpkDXHVxQUaDTI33w6Lchen2if1V4j42Za355MBUmSKaXh8mkbP9tNb6
	 klJSR3P4VVWZOnDXIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wLT-1w0ZcX2x59-008rd8; Thu, 05
 Mar 2026 09:57:30 +0100
Message-ID: <eccfd2eb-f635-400c-9517-1cf574da70d7@gmx.de>
Date: Thu, 5 Mar 2026 09:57:29 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <202603042127.PT6LuKqi-lkp@intel.com> <aah4opTMZeDDfWFG@carbonx1>
 <aak3k24kjfD55xNQ@monoceros>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <aak3k24kjfD55xNQ@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oWBVoHK5QLurd6FKNJTdV+sSbYaFQ7hbx82slwBzIRvIzP97qo/
 YAvhaJ38Iy6VPhVPQ32OSZDILq22HuJKtTlSoLVP8COpYh32R+dTWtgy/aLl/F60W1Kcwbx
 FKGyWERros3Qa4kuFMyptkTmOc83+STFqNb78aGHXFKGqVxG3inPBgyoUmVXIva/cKTW9ME
 uZShjJO0I2ZdEIeepZTJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1y+sbCWS/VU=;x2/cM5TaoKhF4HkXtC/Ept0W91l
 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
 SyPUePELfe/9s9I1jS/MMBfA7mLmlvY9w==

Hi Uwe,

On 3/5/26 09:07, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Mar 04, 2026 at 07:23:30PM +0100, Helge Deller wrote:
>> * kernel test robot <lkp@intel.com>:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git master
>>> head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
>>> commit: 6f366e86481a7503a821de82930df517dddd4047 fbdev: au1100fb: Make=
 driver compilable on non-mips platforms
>>> date:   13 days ago
>>> config: mips-randconfig-r052-20260304 (https://download.01.org/0day-ci=
/archive/20260304/202603042127.PT6LuKqi-lkp@intel.com/config)
>>> compiler: mips64-linux-gcc (GCC) 14.3.0
>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20260304/202603042127.PT6LuKqi-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi-=
lkp@intel.com/
>>>
>>> All error/warnings (new ones prefixed by >>):
>>>
>>>     drivers/video/fbdev/au1100fb.c: In function 'au1100fb_drv_probe':
>>>>> drivers/video/fbdev/au1100fb.c:448:46: error: implicit declaration o=
f function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Wimplicit-function-de=
claration]
>>>       448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(f=
bdev->info.fix.mmio_start);
>>>           |                                              ^~~~~~~~~
>>>           |                                              CKSEG1ADDR
>>>>> drivers/video/fbdev/au1100fb.c:448:23: warning: cast to pointer from=
 integer of different size [-Wint-to-pointer-cast]
>>>       448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(f=
bdev->info.fix.mmio_start);
>>>           |                       ^
>>
>> I've pushed the patch below into the fbdev git tree.
>> It should (hopefully) fix the issue.
>>
>> Helge
>>
>>
>> From: Helge Deller <deller@gmx.de>
>> Subject: [PATCH] fbdev: au1100fb: Fix build on MIPS64
>>
>> Fix an error reported by the kernel test robot:
>>   au1100fb.c: error: implicit declaration of function 'KSEG1ADDR'; did =
you mean 'CKSEG1ADDR'?
>>
>> The header asm/mach-au1x00/au1000.h is unused apart from pulling in
>> <linux/delay.h> (for mdelay()) and <linux/io.h> (for KSEG1ADDR()). Then
>> the only platform specific part in the driver is the usage of the KSEG1=
ADDR
>> macro, which for the non-mips case can be stubbed.
>=20
> This paragraph is copied from 6f366e86481a and doesn't make sense here.

Yes, I noticed that later and removed it already.

> I'd write something like:
>=20
> 	arch/mips/include/asm/addrspace.h defines KSEG1ADDR only for 32 bit
> 	configurations. So provide its compile-test stub also for 64bit
> 	mips builds.

Ok, added.

>> Fixes: 6f366e86481a ("fbdev: au1100fb: Make driver compilable on non-mi=
ps platforms")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi-lkp=
@intel.com/
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>>
>> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au110=
0fb.c
>> index 1a04154bc535..3b104d377d28 100644
>> --- a/drivers/video/fbdev/au1100fb.c
>> +++ b/drivers/video/fbdev/au1100fb.c
>> @@ -380,7 +380,7 @@ static struct au1100fb_panel known_lcd_panels[] =3D
>>   #define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
>>   #define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CCO)
>>  =20
>> -#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
>> +#if defined(CONFIG_COMPILE_TEST) && !(defined(CONFIG_MIPS) && !defined=
(CONFIG_64BIT))
>=20
> The condition is equivalent to
>=20
> 	defined(CONFIG_COMPILE_TEST) && (!defined(CONFIG_MIPS) || defined(CONFI=
G_64BIT))
>=20
> which is logically a bit easier, but I'm unsure if it's easier to
> understand (IMHO both are bad).

Yes, both are bad. I changed it to your proposal.
 =20
>>   /* This is only defined to be able to compile this driver on non-mips=
 platforms */
>=20
> Maybe adapt the comment here, too? Something like:
>=20
> 	/*
> 	 * KSEG1ADDR() is defined in arch/mips/include/asm/addrspace.h
> 	 * for 32 bit configurations. Provide a stub for compile testing
> 	 * on other platforms.
> 	 */

done.

I've updated the patch in the fbdev git tree, which you can find here:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/log=
/?h=3Dfor-next

I'll keep the patch a few days in there and will push next week.

Helge
