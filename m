Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5249E35A39F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790719804; cv=none; b=I5dalDCO8eTZZm65Ie9KkCyVpsH/sKP8T3hvYTPvcEz8YrmneaF72BK3Dtf2G0+VjQJj/QcgYsXdyLpdvq00lUZ2e1ZlEu7YYGwhr9JGP/aUsa+vcGgeU/JPSgcPOAlqRWpAjMwXz63N6luvGjcNTajYQKz0ZMMbjw5tq6MR/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790719804; c=relaxed/simple;
	bh=/kr1KwofEtVgYPvbg5FU1cJhoddAiZL0IrjrtTKFVIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILYpkCuRwStBJmTuzMQwG7q9DrC3mTjSRArOvP7A7AgHa2Ea8UOSl6l2kutNcLBrUvbyTKyxy6Kcwey9D/Q9etQSF1CR/Pv+KEKpeOVWqQGrGVeHYRyVvFI2/EZmSDNorD8K3g8zXuB/e8w/BhtOEw99H6Opufuc3JjerIgiEDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozIpiCtz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozIpiCtz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A439A1F000FF;
	Tue, 29 Sep 2026 22:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790719802;
	bh=atysJlYmp68WwzbFkJ01LFOgq9LAGHjYb4kqN7NEt90=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ozIpiCtzOzZTkj0TdynnuOux7jjsunTJLfwB9+WZvUkgnLbCXRP0NdkRUYEAZ1msF
	 IcN0wxf2cgONciWCNShGnTWgA7M5bd0dnk7iFldeUwrptPil2LrjrXvIAr84kzc14a
	 EXvy2xcR/hgd4DY1jLclo/JAkuVs7wPP0itBB1qt/Q7dZ68wKr9FqFC81giEVllU32
	 /CgdcgPIZ2vpfs21eMLYT4o39zpdF8Z9Bca/2hIX051qtBfVJzbEK5ICXNYbydSXqq
	 56mHLlKDmzzWIs/KD0DnEoxsD7CcV2IlcLrV37Jmx3Eah3iCRT0hQPQacoSxz9sz+j
	 IaCaqxjrUIhPg==
Message-ID: <05f1310a-684f-493a-ad4f-4f313f344c81@kernel.org>
Date: Tue, 29 Sep 2026 15:10:01 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
 conditional expression
To: paulmck@kernel.org
Cc: Bradley Morgan <brads@mainlining.org>, Vineet Gupta <vgupta@kernel.org>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-snps-arc@lists.infradead.org
References: <202609241517.SSV1Goz3-lkp@intel.com>
 <3cbe5de8-d04b-4afe-b19f-ad755d4ea320@kernel.org>
 <7CB37192-1AE6-4392-8D7B-89F401214C02@mainlining.org>
 <d7a78ebb-8b5e-42e9-9560-bd731724c9f8@linux.dev>
 <5c72050d-95c8-4ba1-ab15-22f774ea9319@paulmck-laptop>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <5c72050d-95c8-4ba1-ab15-22f774ea9319@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/29/26 13:47, Paul E. McKenney wrote:
> On Thu, Sep 24, 2026 at 02:27:11PM -0700, Vineet Gupta wrote:
>> On 9/24/26 13:58, Bradley Morgan wrote:
>>> On 24 September 2026 21:52:55 BST, Vineet Gupta <vgupta@kernel.org> wrote:
>>>> On 9/24/26 00:51, kernel test robot wrote:
>>>>> tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
>>>>> head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
>>>>> commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate
>>>> two-byte cmpxchg
>>>>> config: arc-allyesconfig
>>>> (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/config)
>>>>> compiler: arc-linux-gcc (GCC) 16.1.0
>>>>> reproduce (this is a W=1 build):
>>>> (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/reproduce)
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new
>>>> version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes:
>>>> https://lore.kernel.org/oe-kbuild-all/202609241517.SSV1Goz3-lkp@intel.com/
>>>>> All errors (new ones prefixed by >>):
>>>>>
>>>>>       In file included from arch/arc/include/asm/atomic.h:13,
>>>>>                        from include/linux/atomic.h:7,
>>>>>                        from include/asm-generic/bitops/lock.h:5,
>>>>>                        from arch/arc/include/asm/bitops.h:190,
>>>>>                        from include/linux/bitops.h:67,
>>>>>                        from include/linux/log2.h:12,
>>>>>                        from include/asm-generic/div64.h:55,
>>>>>                        from ./arch/arc/include/generated/asm/div64.h:1,
>>>>>                        from include/linux/math.h:6,
>>>>>                        from include/linux/math64.h:6,
>>>>>                        from include/linux/time.h:6,
>>>>>                        from include/linux/stat.h:19,
>>>>>                        from include/linux/fs_dirent.h:5,
>>>>>                        from include/linux/fs/super_types.h:5,
>>>>>                        from include/linux/fs/super.h:5,
>>>>>                        from include/linux/fs.h:5,
>>>>>                        from include/linux/fscrypt.h:16,
>>>>>                        from fs/crypto/fscrypt_private.h:15,
>>>>>                        from fs/crypto/hooks.c:10:
>>>>>       fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>>>>>>> arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
>>>> conditional expression [-Wincompatible-pointer-types]
>>>>>          46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) :
>>>> (new));              \
>>>>
>>>> Issue is in  fs/crypto/hooks.c doing cmpxchg_release(&inode->i_link, NULL,
>>>> pstr.name)
>>>> where i_link is char * and pstr.name is unsigned char *),
>>>>
>>>> The problem is when pointer types are incompatible and that's exactly the
>>>> W toggle above.
>>>>
>>>> So Bradley's patch needs this fixup
>>>>
>>>> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
>>>> index 4596edfefa95..9053098bb152 100644
>>>> --- a/arch/arc/include/asm/cmpxchg.h
>>>> +++ b/arch/arc/include/asm/cmpxchg.h
>>>> @@ -42,8 +42,10 @@
>>>>    #define arch_cmpxchg_relaxed(ptr, old, new)     \
>>>>    ({    \
>>>>           __typeof__(ptr) _p_ = (ptr);     \
>>>> -       unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));             \
>>>> -       unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));             \
>>>> +       __typeof__(*(ptr)) _o_ = (old);    \
>>>> +       __typeof__(*(ptr)) _n_ = (new);    \
>>>> +       unsigned long _old_ = (unsigned long)_o_;            \
>>>> +       unsigned long _new_ = (unsigned long)_n_;            \
>>>>
>>>> P.S: For arch changes shouldn't the submitter be required to at least test
>>>> the building, specially when this involves the macro maze. Its really easy
>>>> with crosstool hosting all the cross-compilers [1] - just download and
>>>> untar.
>>>>
>>>> [1]
>>>> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/16.2.0/
>>> Well thanks but I didn't have a proper server till yesterday.
>> A relatively decent laptop works for me.
> And you will get *way* faster response time than waiting on kernel
> test robot.  ;-)
>
>>> I'll post all arch patches when Paul tells me how he wants it
>> Please do a minimal compile build - it will save you the re-spins.
>>
>>> Like if he wants u16 in first then arch changes sent.
> First, I queued Vineet's cmpxchg patch from his pull request to Linus.
> I have marked it "EXP" so that I don't accidentally ship it off somewhere
> myself.
>
> Given the surprises from the u8/u16 changes, I suggest the following:
>
> 1.	One patch to add cmpxchg_emu_u16(), but without the u8/u16
> 	changes.  And without the CONFIG_ARCH_NEED_CMPXCHG_1_2_EMU
> 	change.
>
> 	At Bradley's option, cmpxchg_emu_u8() could remain as is, with
> 	cmpxchg_emu_u16() being born as u16.  The upside is less churn
> 	later.	The downside is that more up-front testing is needed,
> 	and thus greater interaction with busy architecture maintainers.
> 	If it was me, I would start with cmpxchg_emu_u16() being as
> 	close to cmpxchg_emu_u8() as possible in order to "get the
> 	camel's nose into the tent" as quickly and easily as possible.
> 	But this is Bradley's patch series, so his choice.
>
> 2.	One patch each to add use of cmpxchg_emu_u16() to each
> 	affected architecture.
>
> 3.	Given #1, each patch for #2 can go in independently.  The patches
> 	for #2 of course need acks from their respective maintainers.
>
> 4.	A patch to rename CONFIG_ARCH_NEED_CMPXCHG_1_EMU to
> 	CONFIG_ARCH_NEED_CMPXCHG_1_2_EMU.  This will cross lib and
> 	architectures, which should be OK because it is just a name
> 	change.  We collect acks as before.
>
> 5.	Convert cmpxchg_emu_u8() away from uintptr_t, and, if needed,
> 	cmpxchg_emu_u16() as well.
>
> This could take a merge window or three to get in, but that is not all
> that bad for cross-architecture patch serieses such as this one.
>
> Bradley, Vineet, thoughts?

Sound like a plan, buy hey its Bradley doing all the work here ;-)
I would only add something I mentioned before: download the cross 
toolchains and do some build testing locally before posting. This is not 
because arch maintainers are busy or lazy (although they can be both) - 
that saves potential respins induced by new code or even broken existing 
code exposed.

And on that topic I just found a gcc 16 ICE when building an 
allyesconfig for ARC. I will only be able to post the gcc fix after LPC, 
but just FYI in case someone runs into it.

Thx,
-Vineet

