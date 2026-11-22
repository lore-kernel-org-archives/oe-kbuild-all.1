Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389283;
	b=XiLz26Pdp+wGZZUNQN0yyTvPHGNh3D9ZW2g9VeVbxdZdry88T6QU7LmtAzu5btaPtn9m
	 RlITW79wVZINIW6st1gRqn4o0c42KPHDMsmq+1wt3ZU/Tr+TiTyj1dfU+2Ei7GuN4RLOF
	 HVzBCWnUF6loGK/mbV1qDLhtj9gMH67nmv3/D1ZQ0Y9wPW+aQ/XzxKV6/trkNJNANlrw1
	 4Ctnb2IxXk7fHM7K77H5/cgoEWi2lmAEBhcTT6emdvQcZLLrktAoqxDgs+DE/49fUSDnV
	 pYu46yp/iWbIgwDVbq1YRWIp8dxsf6nCK3KoCb7Xi/8HY3WRIYsa3Po4PJawQyAYqNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389283;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=n6jI5G6DqCpJM42Zlj/GMbutWdG4wQmfv30cYJ9hj7Y=;
	b=gac/rcQ2BncRIuGeQIU5nj50bugUpmOCPMGmscJ1JFF46b0WkISSkbqsiV+0UGQJDQAl
	 8oiRW9j68g5+63/GTPFk3+WZoaT4SBkylNy91chqPMmwSczGyEIVDc2p7pgKsWwHFDfBo
	 aoKaftwAmS9d9u/u5LuMtszUQYwOYkS3HHjEbaBcpJ226Hy1814wvM1adSu8BxA+T8ObJ
	 62kFMeaBv/bFSJwET2E8pPHUs31u13jY/W58TE2rH4Rz2Pmxjyx+y2OV90zoq2Ds1LjeY
	 15dGmoAE/Qz5YSsi+5JMnmxTZYIdFFXmm0aNrp6HeGumAm+a6yhEOM9nkqFO90lYjxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bASGs+Qw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8EC606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 23:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bASGs+Qw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE601F000C4;
	Sun, 22 Nov 2026 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795389282;
	bh=n6jI5G6DqCpJM42Zlj/GMbutWdG4wQmfv30cYJ9hj7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bASGs+QwQUOe+UApfbt2guv9gC96J1c+oLJZ5ZIf5zFYc9+IJPbVpkAtYmWM6gyVy
	 EqRqJE3ILo8Dqv7h6X8HApjEZDBvPxundAiQTyreM+/Jqm/DIY8pBBAoIAHko1gg/2
	 1pIs0UkebZjDgj9RHDhGtur1C97spX4IzUc8Q2fiKd2IgOIcNb9Zu6dWEREbsEh/gp
	 AFGj6sWue4HBmSU/R4KBnVcPQQ/zJZn3NswO8iTNysOyBCEPLP3GTu5b3N5uIrdtOa
	 cJM9as3l5ICTdbVNNy9QYwaXn2Xy0Aep/dLWeeO+3maDC6h1NOgZQnUI2GY8sqiDr9
	 wKb3bAmZjA9mg==
Message-ID: <e96c9d87-53e6-4e82-9502-40e86bac3edc@kernel.org>
Date: Sun, 22 Nov 2026 15:14:41 -0800
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8956/10560] main.c:undefined reference to
 `__st_r13_to_r15'
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
References: <awDriH64LFbN0dkI@rli9-mobl>
 <5d49465f-8584-4e75-8973-9fbf326bce58@app.fastmail.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <5d49465f-8584-4e75-8973-9fbf326bce58@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 02:18, Arnd Bergmann wrote:
> On Sat, Nov 21, 2026, at 01:53, kernel test robot wrote:
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> master
>> head:   909ef7a9a30fa139e69e555e3606680f5cca7726
>> commit: 86a4eab2bd8313fec6e54742e3ea187b65b86b07 [8956/10560] ARC: stop
>> linking libgcc
>> config: arc-randconfig-2000-20261120
>> (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/config)
>> compiler: arc-linux-gcc (GCC) 9.5.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/r/20261121004452.TskH9STt-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     arc-linux-ld: init/main.o: in function `__traceiter_initcall_finish':
>>>> main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>>>> arc-linux-ld: main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>>>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
>>>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
> I've managed to reproduce this, but only with gcc-12 and older,
> not gcc-13 and up.

Thanks I was trying to do this as well, but couldn't since I didn't have 
an older toolchain handy.


>   I also found a workaround, but I'm not sure if this
> is a good idea or not:
>
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
>   CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux- arc-linux-gnu-)
>   endif
>   
> -cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -mswape -D__linux__
> +cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -mswape -mno-millicode -D__linux__

I thik this is the right fix.
Ideally this is only needed for OPTIMIZE_FOR_SIZE, let me send a v2.

>   tune-mcpu-def-$(CONFIG_ISA_ARCOMPACT)  := -mcpu=arc700
>   tune-mcpu-def-$(CONFIG_ISA_ARCV2)      := -mcpu=hs38
>
> The alternative of course is to include the libgcc file that includes the
> millicode helpers.
>
> I also came across the "-fno-builtin", which seems like a bad idea because
> it prevents a number of optimizations. I could get it to build without the
> argument using two oneline changes, but that doesn't mean this is correct
> or complete:

I don't recall the history behind this is, seems like its been since 
since th eoriginal port.
I can do a follow up cleanup.

Thx,
-Vineet

>
> --- a/arch/arc/include/asm/bitops.h
> +++ b/arch/arc/include/asm/bitops.h
> @@ -143,7 +143,7 @@ static inline __attribute__ ((const)) unsigned long __fls(unsigned long x)
>    * ffs = Find First Set in word (LSB to MSB)
>    * @result: [1-32], 0 if all 0's
>    */
> -static inline __attribute__ ((const)) int ffs(unsigned int x)
> +static inline __attribute__ ((const)) int ffs(int x)
>   {
>          int n;
>   
> a/arch/arc/kernel/traps.c
> +++ b/arch/arc/kernel/traps.c
> @@ -156,4 +156,5 @@ void do_insterror_or_kprobe(unsigned long address, struct pt_regs *regs)
>   void abort(void)
>   {
>          __asm__ __volatile__("trap_s  5\n");
> +       unreachable();
>   }
>
>       Arnd

