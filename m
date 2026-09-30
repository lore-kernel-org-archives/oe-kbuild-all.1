Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A93EFFC3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750353; cv=none; b=Sk3sT58ncSgwxMeL0LlMZzjchFAPBTN9fpogw7zMGCPIF0FFmlotKoDRlLgQZWWrT2NhJgXvIvpzHiApx5VlEyJUR/MzumjfU1SZt70EMNPNL47PMTY6h0lKXOtoOm9LgP5OT+kEnxr95FJOHL31ZeBe636KULYAqj7Mbszhj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750353; c=relaxed/simple;
	bh=c9NFDHimJGSjnneW/NgHgP/wHsJUido8qSWjJDt/U0U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tdylYfTvU0J7YsUhVcX1rZFSCP3atdJV1OZVQs8sztx/X/yAh7duv0JFfMgMp2LuiqaJ5jC2lRTA6QZ+xC2yz56/tpzu9Nxjwe8uE8E1qnAuzbDOEjyS9Jsz5e3aFDN3xT1PQEBkIwP8FBWfGEePvQYN5OXox3B4oY7Xnkk+d4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oKeDHVV4; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9Oax+Fqp; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oKeDHVV4";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9Oax+Fqp"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790750341; bh=txD+nrLZLM5JuzxFq01cEu8
	1w2S3fPrO+3Qk0Eijl1k=; b=oKeDHVV4jiljltqkNoYKtpSZ8y1JWMpbOtyZP30n9PZIFj9dMu
	bwczWRo1qy1Y2sDntwLFupwkQkkfngWPGTTz7tWRz7DvoLtqJzh5c2YuWyVn6KuNF6rJDT8p2jS
	yKtjSTj736j8X+6OPwEZCClrjCZCPDu6lbBk08W6IUifGOhqOMnL4NywbQJfe9O+aQYy8OmZWRb
	SGABqxv3RXiXoDAp4G+dCdmyfd0YXD9ECzdGTADQbzmAE8QleUQc+vXRZhf3ggnhUflIRJfU0CW
	0c54TYpYnqVv4UDK1LtPLNNCcWZqE//TzxXE49KowgZYTL0fMBY8HIXO2QIbrhn04bg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790750341; bh=txD+nrLZLM5JuzxFq01cEu8
	1w2S3fPrO+3Qk0Eijl1k=; b=9Oax+FqprsVZaVZhk+dpx7GM/y8OfEjJOv/qkug4muFo1YNzJB
	S1HcuDo/R6iORSNGGrY4gV6VVPZEYPXKe0CQ==;
Date: Wed, 30 Sep 2026 07:39:02 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Vineet Gupta <vgupta@kernel.org>, paulmck@kernel.org
CC: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-snps-arc@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5Bpaulmckrcu=3Acmpxchg2=2E2026=2E09=2E2?=
 =?US-ASCII?Q?2a_25/28=5D_arch/arc/include/asm/cmp?=
 =?US-ASCII?Q?xchg=2Eh=3A46=3A58=3A_error=3A_pointer_type_?=
 =?US-ASCII?Q?mismatch_in_conditional_expression?=
In-Reply-To: <05f1310a-684f-493a-ad4f-4f313f344c81@kernel.org>
References: <202609241517.SSV1Goz3-lkp@intel.com> <3cbe5de8-d04b-4afe-b19f-ad755d4ea320@kernel.org> <7CB37192-1AE6-4392-8D7B-89F401214C02@mainlining.org> <d7a78ebb-8b5e-42e9-9560-bd731724c9f8@linux.dev> <5c72050d-95c8-4ba1-ab15-22f774ea9319@paulmck-laptop> <05f1310a-684f-493a-ad4f-4f313f344c81@kernel.org>
Message-ID: <F788AD1C-9D20-4D74-8B85-BA7DA4E82132@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 29 September 2026 23:10:01 BST, Vineet Gupta <vgupta@kernel.org> wrote:
>
>
>On 9/29/26 13:47, Paul E. McKenney wrote:
>> On Thu, Sep 24, 2026 at 02:27:11PM -0700, Vineet Gupta wrote:
>>> On 9/24/26 13:58, Bradley Morgan wrote:
>>>> On 24 September 2026 21:52:55 BST, Vineet Gupta <vgupta@kernel.org>
>wrote:
>>>>> On 9/24/26 00:51, kernel test robot wrote:
>>>>>> tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
>>>>>> head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
>>>>>> commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC:
>Emulate
>>>>> two-byte cmpxchg
>>>>>> config: arc-allyesconfig
>>>>>
>(https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/config)
>>>>>> compiler: arc-linux-gcc (GCC) 16.1.0
>>>>>> reproduce (this is a W=1 build):
>>>>>
>(https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/reproduce)
>>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new
>>>>> version of
>>>>>> the same patch/commit), kindly add following tags
>>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>>> | Closes:
>>>>>
>https://lore.kernel.org/oe-kbuild-all/202609241517.SSV1Goz3-lkp@intel.com/
>>>>>> All errors (new ones prefixed by >>):
>>>>>> 
>>>>>>       In file included from arch/arc/include/asm/atomic.h:13,
>>>>>>                        from include/linux/atomic.h:7,
>>>>>>                        from include/asm-generic/bitops/lock.h:5,
>>>>>>                        from arch/arc/include/asm/bitops.h:190,
>>>>>>                        from include/linux/bitops.h:67,
>>>>>>                        from include/linux/log2.h:12,
>>>>>>                        from include/asm-generic/div64.h:55,
>>>>>>                        from
>./arch/arc/include/generated/asm/div64.h:1,
>>>>>>                        from include/linux/math.h:6,
>>>>>>                        from include/linux/math64.h:6,
>>>>>>                        from include/linux/time.h:6,
>>>>>>                        from include/linux/stat.h:19,
>>>>>>                        from include/linux/fs_dirent.h:5,
>>>>>>                        from include/linux/fs/super_types.h:5,
>>>>>>                        from include/linux/fs/super.h:5,
>>>>>>                        from include/linux/fs.h:5,
>>>>>>                        from include/linux/fscrypt.h:16,
>>>>>>                        from fs/crypto/fscrypt_private.h:15,
>>>>>>                        from fs/crypto/hooks.c:10:
>>>>>>       fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>>>>>>>> arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch
>in
>>>>> conditional expression [-Wincompatible-pointer-types]
>>>>>>          46 |         unsigned long _new_ = (unsigned long)(0 ?
>*(_p_) :
>>>>> (new));              \
>>>>> 
>>>>> Issue is in  fs/crypto/hooks.c doing cmpxchg_release(&inode->i_link,
>NULL,
>>>>> pstr.name)
>>>>> where i_link is char * and pstr.name is unsigned char *),
>>>>> 
>>>>> The problem is when pointer types are incompatible and that's exactly
>the
>>>>> W toggle above.
>>>>> 
>>>>> So Bradley's patch needs this fixup
>>>>> 
>>>>> diff --git a/arch/arc/include/asm/cmpxchg.h
>b/arch/arc/include/asm/cmpxchg.h
>>>>> index 4596edfefa95..9053098bb152 100644
>>>>> --- a/arch/arc/include/asm/cmpxchg.h
>>>>> +++ b/arch/arc/include/asm/cmpxchg.h
>>>>> @@ -42,8 +42,10 @@
>>>>>    #define arch_cmpxchg_relaxed(ptr, old, new)     \
>>>>>    ({    \
>>>>>           __typeof__(ptr) _p_ = (ptr);     \
>>>>> -       unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));  
>          \
>>>>> -       unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));  
>          \
>>>>> +       __typeof__(*(ptr)) _o_ = (old);    \
>>>>> +       __typeof__(*(ptr)) _n_ = (new);    \
>>>>> +       unsigned long _old_ = (unsigned long)_o_;            \
>>>>> +       unsigned long _new_ = (unsigned long)_n_;            \
>>>>> 
>>>>> P.S: For arch changes shouldn't the submitter be required to at least
>test
>>>>> the building, specially when this involves the macro maze. Its really
>easy
>>>>> with crosstool hosting all the cross-compilers [1] - just download
>and
>>>>> untar.
>>>>> 
>>>>> [1]
>>>>>
>https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/16.2.0/
>>>> Well thanks but I didn't have a proper server till yesterday.
>>> A relatively decent laptop works for me.
>> And you will get *way* faster response time than waiting on kernel
>> test robot.  ;-)
>> 
>>>> I'll post all arch patches when Paul tells me how he wants it
>>> Please do a minimal compile build - it will save you the re-spins.
>>> 
>>>> Like if he wants u16 in first then arch changes sent.
>> First, I queued Vineet's cmpxchg patch from his pull request to Linus.
>> I have marked it "EXP" so that I don't accidentally ship it off
>somewhere
>> myself.
>> 
>> Given the surprises from the u8/u16 changes, I suggest the following:
>> 
>> 1.	One patch to add cmpxchg_emu_u16(), but without the u8/u16
>> 	changes.  And without the CONFIG_ARCH_NEED_CMPXCHG_1_2_EMU
>> 	change.
>> 
>> 	At Bradley's option, cmpxchg_emu_u8() could remain as is, with
>> 	cmpxchg_emu_u16() being born as u16.  The upside is less churn
>> 	later.	The downside is that more up-front testing is needed,
>> 	and thus greater interaction with busy architecture maintainers.
>> 	If it was me, I would start with cmpxchg_emu_u16() being as
>> 	close to cmpxchg_emu_u8() as possible in order to "get the
>> 	camel's nose into the tent" as quickly and easily as possible.
>> 	But this is Bradley's patch series, so his choice.
>> 
>> 2.	One patch each to add use of cmpxchg_emu_u16() to each
>> 	affected architecture.
>> 
>> 3.	Given #1, each patch for #2 can go in independently.  The patches
>> 	for #2 of course need acks from their respective maintainers.
>> 
>> 4.	A patch to rename CONFIG_ARCH_NEED_CMPXCHG_1_EMU to
>> 	CONFIG_ARCH_NEED_CMPXCHG_1_2_EMU.  This will cross lib and
>> 	architectures, which should be OK because it is just a name
>> 	change.  We collect acks as before.
>> 
>> 5.	Convert cmpxchg_emu_u8() away from uintptr_t, and, if needed,
>> 	cmpxchg_emu_u16() as well.
>> 
>> This could take a merge window or three to get in, but that is not all
>> that bad for cross-architecture patch serieses such as this one.
>> 
>> Bradley, Vineet, thoughts?
>
>Sound like a plan, buy hey its Bradley doing all the work here ;-)

Hmm, I'd prefer to leave u16 as is, I'll send the rename patch in the
coming hours/days, I have school 

>I would only add something I mentioned before: download the cross
>toolchains and do some build testing locally before posting. This is not
>because arch maintainers are busy or lazy (although they can be both) -
>that saves potential respins induced by new code or even broken existing
>code exposed.
>
>And on that topic I just found a gcc 16 ICE when building an allyesconfig
>for ARC. I will only be able to post the gcc fix after LPC, but just FYI
>in case someone runs into it.
>
>Thx,
>-Vineet
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
