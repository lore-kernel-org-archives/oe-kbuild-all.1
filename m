Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40C223324
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770827283; cv=none; b=gTWoneWD2kub7hnxW5Nhg1w4gBiLZondu/UaN0zWA9fVN9F+xOGQc+4hF2bHppERj7tjVHBueTWs8HxtbXD+HGhMBZlKMVLrNT9Uoib+g6tKoj8uoCSlzP4NFK5JcJBg8GsARauqh15HF74k55o7SazF/B0Suynv/aW6njnpr6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770827283; c=relaxed/simple;
	bh=faN+K5Drnqu+bvU5qWpRQF5CbdmBvPL5NG8Jf6EUgPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4u7clDKRh4nIHtyBpmTlnXC1kVNfNcNomh0Rp1sJkVPrL6lZlgMYM43KgEf+Di9yUl5E7vYksxB7iISVlHmVZOc6K3UNMYCV6sklD+zAES/XuffQIxy1HAlMlqiMVowtlMuUObxYH8KjYJsDEr98y14nT0VdINu54p5qcw/IGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=rZF2CjcD; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="rZF2CjcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770827269; x=1771432069; i=deller@gmx.de;
	bh=UQts+40xkAK+zAm9Us7U03JF9JJ/WdXgKIkaKf9ZuwU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rZF2CjcDqaB4RYdLSGHsONMUVlPE11TTUwFSqEeo0BMWPM7cudLEgs28cTM/Eau+
	 z8KLldWSw6hAqmw/0Edz0c7OhosbI66IAEv0/N4kzzx3dbiM/tCLaQnov/kMNTtiS
	 GwxWmIUOouWKp5HTMySkPV6c9NO/OqzmDlirsEcS+lKV46k8i9k0qB4goHP5j42X9
	 SEeyZ/pwpcopPVhDthqZKryPfDxW7kF7jZWqrLOxwRO3cF1FM+41cST0DOzxDeBXx
	 C87oDZ1Z+WyObeM3Upt7l3KLHpqXHcXRgmbuBP/SnV3/m1fukbE0CvyCIkfNkHvg1
	 wxus7UMHO8ZFzzwjvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQeA2-1wBjpT2eqk-00RabE; Wed, 11
 Feb 2026 17:27:49 +0100
Message-ID: <933de445-c15d-49f6-a5f9-026eff6e4e06@gmx.de>
Date: Wed, 11 Feb 2026 17:27:47 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9199/12313]
 include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 kernel test robot <lkp@intel.com>
Cc: Tamir Duberstein <tamird@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Petr Mladek <pmladek@suse.com>
References: <202602110708.x7AYvCN7-lkp@intel.com>
 <aYxi3KG0gHBBbqox@smile.fi.intel.com> <aYxomlXamlNiNa8G@smile.fi.intel.com>
 <aYyKYa36G-X-ScN2@smile.fi.intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <aYyKYa36G-X-ScN2@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PKEr5bm9Yuo+Zz9q43Vv3oBoAtMvfxpGvUhPnJw1TPUROZmNc7I
 WfqoLrm6+eqosXuF1MN0Azrv2XppJE2fxdm5ijrFhZ1Y3rENDtgkfWGlTbfnqUXCEMDtTkX
 3b763msbsGcQAni2FTQ/tlwrPGsVu6+y95npjCOew341BV6rLwjzG6TFTv4E19NxNa66kw0
 zToAjysbl9fumBFXMaSYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:puZwpUBZO5o=;C7u8vzYiTaqyBSgXRZW6LUWMj3i
 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
 dW

On 2/11/26 14:55, Andy Shevchenko wrote:
> +Helge, do you have any insights on this?
>=20
> The original mail is here:
> https://lore.kernel.org/r/202602110708.x7AYvCN7-lkp@intel.com
>=20
> On Wed, Feb 11, 2026 at 01:31:41PM +0200, Andy Shevchenko wrote:
>> On Wed, Feb 11, 2026 at 01:07:12PM +0200, Andy Shevchenko wrote:
>>> On Wed, Feb 11, 2026 at 07:15:01AM +0800, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
>>>> head:   fd9678829d6dd0c10fde080b536abf4b1121c346
>>>> commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 [9199/12313] printf:=
 convert test_hashed into macro
>>>> config: parisc-randconfig-r122-20260211 (https://download.01.org/0day=
-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/config)
>>>> compiler: hppa-linux-gcc (GCC) 8.5.0
>>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20260211/202602110708.x7AYvCN7-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202602110708.x7AYvCN7=
-lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>
>>> Very interesting case. My theory is that this is a compiler bug or
>>> a rare corner case. When test_hashed was converted to a macro it
>>> affects the scope of PTR in errptr(). And compiler most likely
>>> mistakenly drops it's value to 0.
>>>
>>> OTOH, I do not believe that it's a problem of IS_ERR_VALUE() implement=
ation
>>> since that it is so low level C standard integer promotion rules and s=
hould
>>> be covered very well by compiler tests, etc.
>>>
>>> However, it might be possible (but very unlikely) that the 32-bit
>>> value is considered smaller than (unsigned long)-MAX_ERRNO. If
>>> this a case, why only now? The change was introduces in 2019 to
>>> have this BUILD_BUG_ON()?
>>>
>>> TL;DR: Changing a compiler version might help, I think?

I think so too.


>> So, PTR was used in two places in errptr():
>>
>>          BUILD_BUG_ON(IS_ERR(PTR));
>>          test_hashed(kunittest, "%pe", PTR);
>>
>> The compiler has seen that PTR is always used (it was static inline).
>> When it was converted to a macro, the stage that does some pass now
>> probably thinks that PTR may be eliminated even if it has non-0 value!
>>
>> But again, my knowledge in all this is close to 0, especially for PA-RI=
SC.
>> I'm purely speculating here based on my experience, intuition, and curr=
ent
>> code base of the Linux kernel.

I tried to reproduce, but my cross-compiler does not trigger:
hppa-linux-gnu-gcc (GCC) 15.2.1 20250808 (Red Hat Cross 15.2.1-1)

Preprocessed source is:

# 76 "/home/cvs/parisc/git-kernel/linus-linux-2.6/include/linux/err.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) =
__attribute__((__no_instrument_function__)) bool __attribute__((__warn_unu=
sed_result__)) IS_ERR( const void *ptr)
{
  return __builtin_expect(!!((unsigned long)(void *)((unsigned long)ptr) >=
=3D (unsigned long)-4095), 0);
}
...
static void errptr(struct kunit *kunittest) {
...
  do { __attribute__((__noreturn__)) extern void __compiletime_assert_305(=
void) __attribute__((__error__("BUILD_BUG_ON failed: " "IS_ERR(PTR)"))); i=
f (!(!(IS_ERR(((void *)0x456789ab))))) __compiletime_assert_305(); } while=
 (0);

I will try to check again, but I believe upgrading the compiler should fix=
 it.

Helge
