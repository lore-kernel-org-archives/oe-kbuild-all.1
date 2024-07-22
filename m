Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1C7167DB7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721640829; cv=none; b=ehpGUJIH38nRNzLI0OJcRyL7Vfwcqgqiz/04G+8drldHXmmtduFk/gSs6LIFokyGwfSxIE7ZjdVEWLLTQJ+70Kj30HB1A++zrqVo5bIjRHWyn4Jt+HwAYUQ6c4nLLxv5KvXDouyTrHMsWlsr8psNHInnVhhpdgOqDZlP9HUBg2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721640829; c=relaxed/simple;
	bh=OLpH7vMSMX5JJ0JjZuwg3qgUMCrU92ploJFMvgdXNZs=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PpRaM1x498xwXJ89Dg7p6IEuZ3z6vulNSserQ3SBmvZe9GEMr5JPZlQYUg0ogXboe4xS8tKhAzdBAQj1Oqe2AfrNpc+8N1AVBywGwXkD9Ir05VO+1FM0eosqlCrz9+lbfUJQseC4XRILZH0HNcyrGGmtRZBA91y2Zpqg1bRfWEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx68an+Z1mCL9TAA--.54280S3;
	Mon, 22 Jul 2024 14:18:16 +0800 (CST)
Subject: Re: [chenhuacai-loongson:loongarch-next 5/18]
 arch/loongarch/kernel/syscall.o: warning: objtool: do_syscall+0x11c: return
 with modified stack frame
To: Huacai Chen <chenhuacai@kernel.org>, kernel test robot <lkp@intel.com>
References: <202407201336.mW8dj1VB-lkp@intel.com>
 <CAAhV-H6Baxm_V=cjcJe5HN1ej7LWhvUL7fdWA1awGwf6VK06zA@mail.gmail.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, oe-kbuild-all@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <66045dc9-d2ae-23c3-f3fc-183b12090ea7@loongson.cn>
Date: Mon, 22 Jul 2024 14:18:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6Baxm_V=cjcJe5HN1ej7LWhvUL7fdWA1awGwf6VK06zA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx68an+Z1mCL9TAA--.54280S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyxCF17Cw47ur4UWr4xCrg_yoW8AFWDpF
	W5Wa15Jr48ur10vwsFgr9rWF15K3Z3Gr1agF1DCr48Za1jvr1jyw4SgFZxJasrKwnrKrW0
	yFWSqr9rt3WYva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
	02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
	6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
	j4xRhUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/

On 07/20/2024 01:52 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> Can this warning be fixed? Or we can only use
> STACK_FRAME_NON_STANDARD(do_syscall) to skip it?
>

In the patch "LoongArch: Add RANDOMIZE_KSTACK_OFFSET support",
add_random_kstack_offset() was added in do_syscall(), it changed
the code flow due to asm volatile("" :: "r"(ptr) : "memory") in
add_random_kstack_offset(). I think you can skip the warning by
STACK_FRAME_NON_STANDARD(do_syscall).

>
> On Sat, Jul 20, 2024 at 1:06 PM kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
>> head:   14c860e4d30d97502271d5c19474c8561ba06c98
>> commit: a196fe59bfa2120d0625afd2b3cc72050a7260fa [5/18] LoongArch: Add RANDOMIZE_KSTACK_OFFSET support
>> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240720/202407201336.mW8dj1VB-lkp@intel.com/config)
>> compiler: loongarch64-linux-gcc (GCC) 14.1.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201336.mW8dj1VB-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407201336.mW8dj1VB-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> arch/loongarch/kernel/syscall.o: warning: objtool: do_syscall+0x11c: return with modified stack frame
>>
>>
>> objdump-func vmlinux.o do_syscall:
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki

