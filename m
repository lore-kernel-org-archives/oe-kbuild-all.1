Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327C284B54
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 02:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768270437; cv=none; b=CCk0ngJQF9aofgUczkzYnU7MjrGbge2SNyjgKr8EDsviT6XH1AYsehNjS7Ju+qz1R2y80McW3uqANrnW7iXcXTz8Nfipzh2RIejzlOZmU4QkUUcekEwd8blJ2FLp5hDxGn44xs5Q6j768NY+Wgq5nLLc96FOBxrLw97NH85Yyao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768270437; c=relaxed/simple;
	bh=hngdCgR7XmTHIGR8Yk4HkQ5ShaBBjVgcqCYFBSmEmQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fAbVt8+id7ZL6oPeIH+XePLfubBXGL0ZYdJ9foocpyMDspgWMpErxFz7kYoB56bjDMoKhjeQTrPDcr6+VHX+A3okjByFZAjny44KF7HcuS773IOSsi3GQqbKB5BgxtAFxoHhQmKV2sH0SGNzdIApUUP9g4pF3xXsHu+7zlLlHtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=332J2EiX; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="332J2EiX"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=njbNvq6wzsD1lY6ISl+XhujIyvR8dJCYOgLjORHUk94=;
	b=332J2EiXwrryBVIy5b0Fli7f1yXZVXAiKDtz2AVKk0qUc+trfoNIcYddQNUP8Jy+SWhAKvP0J
	zdjhbvlxB4i58o22w39zgltFu1kwwDEL4yqXTWFmZ1vJtvyGsd8c7Jypf5lRc2RTIrTh5Vfk2+T
	xhpIzUHRun3Ki6zCWgfGaVk=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dqt482NfSz1T4L9;
	Tue, 13 Jan 2026 10:10:00 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B71D404AD;
	Tue, 13 Jan 2026 10:13:51 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.254) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 Jan
 2026 10:13:50 +0800
Message-ID: <b07ae769-6f10-484f-9291-a8b40f58c5f9@huawei.com>
Date: Tue, 13 Jan 2026 10:13:49 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: {standard input}:4155: Error: pcrel offset for branch to .LS000B
 too far (0x38)
Content-Language: en-GB
To: Jan Kara <jack@suse.cz>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>, Zhang Yi
	<yi.zhang@huawei.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	<cooper.qu@linux.alibaba.com>, <yunhai@linux.alibaba.com>
References: <202601121758.kA3osRht-lkp@intel.com>
 <dbed961f-f3c3-496b-9498-6821852da038@huawei.com>
 <txzy4pnt3se34lsvbtpbgvndxts6xsydxx5sswdjzdrcie7zlq@63cewvtotbu3>
From: Baokun Li <libaokun1@huawei.com>
In-Reply-To: <txzy4pnt3se34lsvbtpbgvndxts6xsydxx5sswdjzdrcie7zlq@63cewvtotbu3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500013.china.huawei.com (7.185.36.188)

On 2026-01-13 00:35, Jan Kara wrote:
> Hi!
>
> On Mon 12-01-26 20:09:47, Baokun Li wrote:
>> On 2026-01-12 17:42, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   0f61b1860cc3f52aef9036d7235ed1f017632193
>>> commit: a6d73242b8b5caa9f9a529eab49cc1e85ace9890 ext4: support large block size in ext4_mpage_readpages()
>>> date:   6 weeks ago
>>> config: csky-randconfig-001-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121758.kA3osRht-lkp@intel.com/config)
>>> compiler: csky-linux-gcc (GCC) 15.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121758.kA3osRht-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202601121758.kA3osRht-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    {standard input}: Assembler messages:
>>>>> {standard input}:4155: Error: pcrel offset for branch to .LS000B too far (0x38)
>> Hi,
>>
>> Thanks for the report.
>>
>> After looking into this issue, it turns out that replacing the original
>> calculation with the macro version causes the compiler to emit a larger
>> sequence of instructions.
>>
>> On most architectures this is harmless, because their GCC backends support
>> proper branch relaxation and can automatically promote a short branch to
>> a long branch when the offset grows.
>>
>> However, the CSKY GCC backend does not implement branch relaxation. As a
>> result, once the generated basic block becomes slightly larger, some short
>> branch instructions can no longer reach their targets, and the assembler
>> reports the “pcrel offset too far” error.
>>
>> Given this, one possible workaround on the kernel side would be to replace
>> the macro with a static inline helper. Using an inline function allows GCC
>> to perform more aggressive optimization and typically avoids generating
>> unnecessarily large instruction sequences, which helps prevent the
>> short-branch overflow seen on CSKY.
>>
>> However, the more general and robust solution would be to improve the
>> CSKY GCC backend so that it supports proper branch relaxation, as other
>> architectures do. With branch relaxation in place, these issues would not
>> depend on how the code is written.
>>
>> We’d appreciate any thoughts on which approach makes more sense.
> Frankly, since this is such a niche platform, I'd just let those guys fix
> their compiler and don't complicate ext4 codebase for that.
>
> 								Honza

That makes sense. I’ve CC'd the GCC C-SKY port maintainers.
Let's see if they have any thoughts.


Regards,
Baokun

