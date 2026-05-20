Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0289B33CEA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301946; cv=none; b=m8iWxOorJBfuVo3dCugihjm8OUW6GlUAjYpnmlXtLa0MxPnvH1Z5kZmoW4eyHAb/OnBEHhb+SrpS4E203EtN2KUgaB1Zw9ivTQCjKcUj0YiFARsnQJ/b8KxLnsEpYtBQR1VVN8s4KMfqk6aV5KFXpRFuJV95ZH3wUv+zT2FD15Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301946; c=relaxed/simple;
	bh=JO0feQUIdHcnoo1GduU83l99OBYQ3rVhl9d9uWoZGmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKFWRB3i2kQtBDeQfPcBvFmqaFZUn1WAXEseOQOpnqyNmkOer+Z8WmvEFUXbJfUMCZpy06sBNCpjYC1abIyThcFOHx6SitHHBT8E8KLq0nEEbvw6swraLsU8XAdvZK0hnEZMqNmfIq5gViMiFAibnQg7dx3WPT+f397D9R5cY/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=YOZrXd0C; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="YOZrXd0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779301939; x=1779906739; i=deller@gmx.de;
	bh=L9oOuPkBqhbGJiHBJwWlrn+HTbq5hP58kpcm9QX7lsc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YOZrXd0CjmA0JfQGt55muN03Cbvpvd6VL+hk/1rUo0X4RTHrcO4BuTkg32Fogh59
	 gH7dmg0G30dCVt+6yyNVIEam5TeF3wnLLoDZodoxbj2rh8q1q4V8lBu0nKiskvpj8
	 Yx0cDbZnboP8ai6wRIQ08tLY37kEN/luaOU73FU+c5AIqE3Vgz+YdTLCDaHe9mCVz
	 /KkOA/STTfR7JJ2kxSOpiIiSAA5avv9/1fjeHsXZziWCnhESX/iIvqd2cSE7mWuLX
	 sBCF0X2hY7Z/JJwkK3F0IsVnxz9J0/8ndIIdUOSQ4bxAXxxi0H3QxYgE6feDuVGW4
	 6EIjWMIh0s5pqQ2bDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfUe-1wWKDb1zse-004CsX; Wed, 20
 May 2026 20:32:19 +0200
Message-ID: <14fec279-8481-46b5-8abe-8af1cb97459a@gmx.de>
Date: Wed, 20 May 2026 20:32:18 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5907/6922]
 drivers/video/fbdev/sunxvr2500.c:109:29: error: 'struct fb_info' has no
 member named 'dev'
To: kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Rahman_Mahmutovi=C4=87?= <mahmutovicrahman5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202605210159.lG6dgvU2-lkp@intel.com>
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
In-Reply-To: <202605210159.lG6dgvU2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HoBW9NjLy7H4N+1LHLXSrRnOVxhPsYNDaZraz/q9lU2rplp2dI8
 R++caW2/oBO9F1h5GvTGD9A8PC4N0kgkgsY6u6yCTy+p7z8+wdJRcYMMlA8z4Bk97uN31iW
 NuO8E0KUQ4iHbCjidBE9Xa7bR5bODhnxZ/1FdYTd4HqDXrAbf47uYc5JKvpVKgADBYmX2Yn
 RjmzcWHj6a3KmRnIrOTlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YSkSCmTV6+s=;VELW0j48i3PPXc0HMoHKDQJaq2/
 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
 +XCJLZT/Cnv2+FSQ8I=

On 5/20/26 19:31, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
> head:   687da68900cd1a46549f7d9430c7d40346cb86a0
> commit: f918ad639c76838beeacd5ab2ef4b6f0f9d486a7 [5907/6922] fbdev: sunx=
vr2500: replace printk with device-aware logging functions
> config: sparc-randconfig-r072-20260520 (https://download.01.org/0day-ci/=
archive/20260521/202605210159.lG6dgvU2-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 12.5.0
> smatch: v0.5.0-9185-gbcc58b9c
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arch=
ive/20260521/202605210159.lG6dgvU2-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605210159.lG6dgvU2-lk=
p@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>     In file included from include/linux/device.h:15,
>                      from include/linux/acpi.h:15,
>                      from include/linux/i2c.h:13,
>                      from include/uapi/linux/fb.h:6,
>                      from include/linux/fb.h:5,
>                      from drivers/video/fbdev/sunxvr2500.c:10:
>     drivers/video/fbdev/sunxvr2500.c: In function 's3d_set_fbinfo':
>>> drivers/video/fbdev/sunxvr2500.c:109:29: error: 'struct fb_info' has n=
o member named 'dev'
>       109 |                 dev_err(info->dev, "Cannot allocate color ma=
p\n");
>           |                             ^~

I fixed up the commit and pushed a new version of the patch to the fbdev g=
it repo.

Helge
