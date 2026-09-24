Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED79E4CCDE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 21:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790285246; cv=none; b=TYyEsqjH7XW5ZdkJiH/nDqhWBvpaWX58CYAVdlTxABBUXocvSEObhVOYrm6quIFFqPFtqfkmYw85UQV+Y/YxfQR0F9P7MF9mq5+Hnsfb3Ti6ztdexDmDFDOjRTM9L2TVx5UdNeuFLzGtQtpBEr8snAApUQIInfRfkOluEiH/9Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790285246; c=relaxed/simple;
	bh=J0Nw9TWXU+lYkeRoVC9OVQhSfSX6DIvUl0Vxf3ijfro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqmzlDTFc3FPjOI4ZYvFntGiYVNPRYq+TMwQ9SWmEYTkhgxppK69e1sQAXvzfxkihHzTJVN6I+5MoXQdejzmU4Tf1bxhWydM7lLxLUmZSTHoTC7iCRawd68puK14yYY6FRNp/r3es30PlNH4Ea2vGOkBBCIh/eQbZHJ8NRWjK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r8bfV5wR; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r8bfV5wR"
X-Envelope-To: oe-kbuild-all@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=J0Nw9TWXU+lYkeRoVC9OVQhSfSX6DIvUl0Vxf3ijfro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790285238; v=1; x=1790890038;
 b=r8bfV5wR/SgiankkGzMof3sOcjX1VDl3QL37mmoP6dBrNDpbbbcJUXavC/KV9KILv87GJaqC
 8J+QmFJIQIGrVm6AhzoNjGEIy/YMH/lvJTAJ9UTbaVO1zmt+MwjQNKT+eoBtbC7gGpMAkgcAbg1
 +45Qi4LCShHkCVniqZI38pxg=
X-Envelope-To: oe-kbuild-all@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 3a331c7e9b5d616d;
	Thu, 24 Sep 2026 21:27:18 +0000
X-Mizu-Trace-ID: 3a331c7e9b5d616d
X-Migadu-Flow: FLOW_OUT
Message-ID: <d7a78ebb-8b5e-42e9-9560-bd731724c9f8@linux.dev>
Date: Thu, 24 Sep 2026 14:27:11 -0700
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
To: Bradley Morgan <brads@mainlining.org>, Vineet Gupta <vgupta@kernel.org>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <202609241517.SSV1Goz3-lkp@intel.com>
 <3cbe5de8-d04b-4afe-b19f-ad755d4ea320@kernel.org>
 <7CB37192-1AE6-4392-8D7B-89F401214C02@mainlining.org>
Content-Language: en-US
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <7CB37192-1AE6-4392-8D7B-89F401214C02@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 13:58, Bradley Morgan wrote:
> On 24 September 2026 21:52:55 BST, Vineet Gupta <vgupta@kernel.org> wrote:
>> On 9/24/26 00:51, kernel test robot wrote:
>>> tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
>>> head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
>>> commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate
>> two-byte cmpxchg
>>> config: arc-allyesconfig
>> (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/config)
>>> compiler: arc-linux-gcc (GCC) 16.1.0
>>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/reproduce)
>>> If you fix the issue in a separate patch/commit (i.e. not just a new
>> version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes:
>> https://lore.kernel.org/oe-kbuild-all/202609241517.SSV1Goz3-lkp@intel.com/
>>> All errors (new ones prefixed by >>):
>>>
>>>      In file included from arch/arc/include/asm/atomic.h:13,
>>>                       from include/linux/atomic.h:7,
>>>                       from include/asm-generic/bitops/lock.h:5,
>>>                       from arch/arc/include/asm/bitops.h:190,
>>>                       from include/linux/bitops.h:67,
>>>                       from include/linux/log2.h:12,
>>>                       from include/asm-generic/div64.h:55,
>>>                       from ./arch/arc/include/generated/asm/div64.h:1,
>>>                       from include/linux/math.h:6,
>>>                       from include/linux/math64.h:6,
>>>                       from include/linux/time.h:6,
>>>                       from include/linux/stat.h:19,
>>>                       from include/linux/fs_dirent.h:5,
>>>                       from include/linux/fs/super_types.h:5,
>>>                       from include/linux/fs/super.h:5,
>>>                       from include/linux/fs.h:5,
>>>                       from include/linux/fscrypt.h:16,
>>>                       from fs/crypto/fscrypt_private.h:15,
>>>                       from fs/crypto/hooks.c:10:
>>>      fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>>>>> arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
>> conditional expression [-Wincompatible-pointer-types]
>>>         46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) :
>> (new));              \
>>
>> Issue is in  fs/crypto/hooks.c doing cmpxchg_release(&inode->i_link, NULL,
>> pstr.name)
>> where i_link is char * and pstr.name is unsigned char *),
>>
>> The problem is when pointer types are incompatible and that's exactly the
>> W toggle above.
>>
>> So Bradley's patch needs this fixup
>>
>> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
>> index 4596edfefa95..9053098bb152 100644
>> --- a/arch/arc/include/asm/cmpxchg.h
>> +++ b/arch/arc/include/asm/cmpxchg.h
>> @@ -42,8 +42,10 @@
>>   #define arch_cmpxchg_relaxed(ptr, old, new)     \
>>   ({    \
>>          __typeof__(ptr) _p_ = (ptr);     \
>> -       unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));             \
>> -       unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));             \
>> +       __typeof__(*(ptr)) _o_ = (old);    \
>> +       __typeof__(*(ptr)) _n_ = (new);    \
>> +       unsigned long _old_ = (unsigned long)_o_;            \
>> +       unsigned long _new_ = (unsigned long)_n_;            \
>>
>> P.S: For arch changes shouldn't the submitter be required to at least test
>> the building, specially when this involves the macro maze. Its really easy
>> with crosstool hosting all the cross-compilers [1] - just download and
>> untar.
>>
>> [1]
>> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/16.2.0/
> Well thanks but I didn't have a proper server till yesterday.

A relatively decent laptop works for me.

> I'll post all arch patches when Paul tells me how he wants it

Please do a minimal compile build - it will save you the re-spins.

> Like if he wants u16 in first then arch changes sent.

Sure !

Cheers,
-Vineet
