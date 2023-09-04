Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CB6C8FE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 21:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8C1C433C8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 21:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693863893;
	bh=6JZy0PdyJzgABKY+K7nfrfP+xnjaAabE9JVXBCBRIUw=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=ZdKEeGgimV/CScv0weXPMXhrhYTrgKQffpzoPfdgPHHodkYgNWL7neirnb0cLZz9n
	 Pr0wFkRd35gIKvLG5+ZqETV4h9ncnx5LjR7WwRIQRc/k4GzlR1kMB1iuLH/XFhQOsZ
	 zPrXowgc192d2xrynczRIimOngvLMtT4aCh+xGaqNQbZLPN6ueVVskuOiNk0gskuKU
	 ayw1FkUYisngGp2sQoZMUD0l0kxpEN/S/OQ1os7PVGdGjYNSuBtNBbIRezHWP28FsC
	 cbeRHGGRDs7YPpv364s4q8aRvfrhPqc2nyN2fsGr2lx8gLUYrrm2BekX9akYGVW+lV
	 ZYkjVmKOxnsCw==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 907DB27C005A;
	Mon,  4 Sep 2023 17:44:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 04 Sep 2023 17:44:52 -0400
X-ME-Sender: <xms:00_2ZPSI_6a5FHkJ0czIfIeHIzPqpv5V4wU88bQnMI-ZMkiG_l2RLA>
    <xme:00_2ZAykvtDYygVeV46RW0vqpujkWtZ5QSdlHi7sqzlnofUW6LQYAm6byjpBXbaEq
    ckZ9on4DZeD3l96TLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudegledgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhephedvtdeuvefhveevgefhgfefveelieeluddufeevueehtdejjeegheeg
    heekkeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghs
    mhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvd
    eigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:00_2ZE35_sIQsR5egzB5W0tDHahy9RoYS3h8xVfqQUn_85SN2vJ6WA>
    <xmx:00_2ZPC_avhVfYz6ybKsBfwolKwPS8a8cwlSRUIP-9sSYUiGIvCz7A>
    <xmx:00_2ZIgdaful-NskiBHS-sYUx93QD8nRxfXHf66q1xGbz2cl-3o5Dg>
    <xmx:1E_2ZEbZ_zuxXskXDNrNUzbNrFnOVyKyEzfsdiRm0mwzCs_kJVWX3MCvUlk>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A94C2B6008D; Mon,  4 Sep 2023 17:44:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-701-g9b2f44d3ee-fm-20230823.001-g9b2f44d3
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <39b5dfbe-da74-402e-8cf0-e876200033f8@app.fastmail.com>
In-Reply-To: <26e72ec44f952a36756f6a9591cd432e199f4438.camel@linux.ibm.com>
References: <202309021509.H6yovgPT-lkp@intel.com>
 <26e72ec44f952a36756f6a9591cd432e199f4438.camel@linux.ibm.com>
Date: Mon, 04 Sep 2023 17:44:28 -0400
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Heiko Carstens" <hca@linux.ibm.com>
Subject: Re: [niks:has_ioport_v6_usb 20/20] include/asm-generic/io.h:625:15: error:
 call to '_outl' declared with attribute error: outl() requires
 CONFIG_HAS_IOPORT
Content-Type: text/plain

On Mon, Sep 4, 2023, at 05:45, Niklas Schnelle wrote:
> On Sat, 2023-09-02 at 15:08 +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v6_usb
>> head:   cf97bf195665223cec989e41efee82344a2f0eea
>> commit: cf97bf195665223cec989e41efee82344a2f0eea [20/20] asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
>> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20230902/202309021509.H6yovgPT-lkp@intel.com/config)
>> compiler: m68k-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021509.H6yovgPT-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> > Reported-by: kernel test robot <lkp@intel.com>
>> > Closes: https://lore.kernel.org/oe-kbuild-all/202309021509.H6yovgPT-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>> 
> ---8<---
>>                   ^~~~~~~~~~~~~
>>    lib/iomap.c: In function 'ioread8':
>>    include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
>>      541 | #define _inb _inb
>>    lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
>>       58 |                 is_pio;                                         \
>>          |                 ^~~~~~
>>    include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
>>      642 | #define inb _inb
>>          |             ^~~~
>>    lib/iomap.c:81:30: note: in expansion of macro 'inb'
>>       81 |         IO_COND(addr, return inb(port), return readb(addr));
>>          |                              ^~~
>>    lib/iomap.c: In function 'ioread16':
>> 
>> 
>
> @Arnd no idea why I've not seen this issue before but I think we need
> IO_COND() not to compile the is_pio branch if !HAS_IOPORT.
>
> Something like:
>
> lib/iomap.c:
> ...
> /*
>  * Ugly macros are a way of life.
>  */
> #ifdef CONFIG_HAS_IOPORT
> #define IO_COND(addr, is_pio, is_mmio) do {			\
> 	unsigned long port = (unsigned long __force)addr;	\
> 	if (port >= PIO_RESERVED) {				\

This code is in lib/iomap.c, which doesn't really make sense to
be compiled without CONFIG_HAS_IOPORT: The entire point here is
to determine whether an __iomem token is an io port or a memory
mapped address,  but when CONFIG_HAS_IOPORT is disabled, this
is guaranteed to always be an mmio address.

For m68k, I think the best fix would be:

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 3e318bf9504c..d1b97049d977 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -17,7 +17,7 @@ config M68K
        select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
        select GENERIC_ATOMIC64
        select GENERIC_CPU_DEVICES
-       select GENERIC_IOMAP
+       select GENERIC_IOMAP if HAS_IOPORT
        select GENERIC_IRQ_SHOW
        select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
        select HAVE_ARCH_SECCOMP

> #define IO_COND(addr, is_pio, is_mmio) do {			\
> 	unsigned long port = (unsigned long __force)addr;	\
> 	if (port >= PIO_RESERVED)				\
> 		is_mmio;					\
> 	else							\
> 		bad_io_access(port, #is_pio );			\
> } while (0)
> #endif

I don't think we'd need the fallback check here even if we
wanted to use lib/iomap.c, it would just always degrade into
the is_mmio code path.

This is safe because without CONFIG_HAS_IOPORT, there is
also no CONFIG_HAS_IOPORT_MAP and no ioport_map() function,
so you can never get an __iomem token that requires something
other than readl/writel.

> And yes I'm back and have also started in splitting up the usb
> HAS_IOPORT patch as well as adding a lot of watchdog drivers
> (https://lore.kernel.org/all/20230728195022.1198555-1-robh@kernel.org/)

Ok, great!

      Arnd
