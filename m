Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598641C2AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708200721; cv=none; b=EoMLJX0zeqKZ0Il6Ob7A++iMhVqv4LYgV0afyDIo1AilC1njH2k6J54LHjvKkM5GiRDwdCtxPqi9atqkbPw9szg1Unpw2DTCTqD09gY4Iz34H5aq24csdVf5BTxgpxhOe4IO1BRwbqUrqyCz4XANGk8WE4/hhsw6xGcG6ZP3eQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708200721; c=relaxed/simple;
	bh=n345o+jlymw4I+gukg98Hzuwg9cn/QxSP1Pt8COtXiQ=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=dZNxfg3XzlbtFGVS5v+nEj23lgS2vMaYT9Du0rnF4w6sscGW+KWbSZR8HoGolQ5B3PYqMxHU6VQGfTkZ0YTWq7EL4v4srvhWGn58X0auW51dbOPrCcRif2TPONe+QBzi4bl1Sf8d0IGc4/LOHNOCgX7vA7MUP+f+Ia7ABkt+95A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6BqmzF2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6BqmzF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A018DC43390
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 20:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708200720;
	bh=n345o+jlymw4I+gukg98Hzuwg9cn/QxSP1Pt8COtXiQ=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=t6BqmzF2Xyk1+62fchdMo+PFz9wavX1WhooG9EwVH+NP44fF+Q0Gqgw8YpG6GBnLv
	 8Djokn9YjmZQjTkEtwYV1t6aME3JbPoEwvp+x7Ix8CDMwgWcxnH6fAEv8SVOzAwJG1
	 PPhasA7xxd2vXIxDTy2hJQNE51BAPxqeYSCdndd5Wq5T4BdXtfhdl7/X6ZGaF0PIOv
	 ZO7flZULAPLdcauSUvAkmfG0wi+RXwAcV+AQib7WX/MmPySP2j7I4GIUz6diR8V55c
	 t2cl7n84qh7got7/nYWMMBB8upZq5AYuXP2kK8lT4eWgPUUOXqAdH/RkHAZzS1Py1p
	 0TsfpGoqg8epA==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id 8305827C005B;
	Sat, 17 Feb 2024 15:11:59 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sat, 17 Feb 2024 15:11:59 -0500
X-ME-Sender: <xms:DxPRZdJrz6_F2wggPbW0myqE0ljo52iCNnyjx7lWPQwsWc4KIsArRg>
    <xme:DxPRZZKwvf9W1c3CKkUmAzgdHGrkdNpMoghH1wd4UAlraAYBRxOYZMwArzVaRvD-K
    Z0pPZzIGuliXBCUa0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeggddufeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhephedvtdeuvefhveevgefhgfefveelieeluddufeevueehtdejjeegheeg
    heekkeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghs
    mhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvd
    eigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:DxPRZVuyX6o7jDrJzUKZi7q9KgM4RkeYPBxLuWIlFiT4auRP0YCffA>
    <xmx:DxPRZeYexB9EASLyxiWM0sG0r6zToy7aAW7ACflfJDTmnqMclzDKRA>
    <xmx:DxPRZUaQj-adAzrzHSYXWI0ouL8gGWAorEJ9iLgliPyXI3ez2NVTBg>
    <xmx:DxPRZfzgDVQG36LFBDoXNBKVp-Jags2Zqb917eDbMJT8R65K3mvxcQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4BB61B6008D; Sat, 17 Feb 2024 15:11:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <606284da-1700-4186-80ec-8a4cd85586fc@app.fastmail.com>
In-Reply-To: <202402180247.kvG7qcpX-lkp@intel.com>
References: <202402180247.kvG7qcpX-lkp@intel.com>
Date: Sat, 17 Feb 2024 21:11:38 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "kernel test robot" <lkp@intel.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v6 19/19] include/asm-generic/io.h:625:15: error: call to
 '_outl' declared with attribute error: outl() requires CONFIG_HAS_IOPORT
Content-Type: text/plain

On Sat, Feb 17, 2024, at 19:09, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git 
> has_ioport_v6
> head:   0cc26afe6244fe307926528550a4de09c1e5846e
> commit: 0cc26afe6244fe307926528550a4de09c1e5846e [19/19] 
> asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
> config: um-allyesconfig 
> (https://download.01.org/0day-ci/archive/20240218/202402180247.kvG7qcpX-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20240218/202402180247.kvG7qcpX-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202402180247.kvG7qcpX-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    lib/iomap.c:156:5: warning: no previous prototype for 
> 'ioread64_lo_hi' [-Wmissing-prototypes]
>      156 | u64 ioread64_lo_hi(const void __iomem *addr)
>          |     ^~~~~~~~~~~~~~

arch/um now has some limited ioport support, so I think what
we want here is

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index b5e179360534..7cce19a22692 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -47,12 +47,13 @@ config NO_IOMEM
 config UML_IOMEM_EMULATION
        bool
        select INDIRECT_IOMEM
+       select HAS_IOPORT
        select GENERIC_PCI_IOMAP
        select GENERIC_IOMAP
        select NO_GENERIC_PCI_IOPORT_MAP
 
 config NO_IOPORT_MAP
-       def_bool y
+       def_bool !UML_IOMEM_EMULATION
 
 config ISA
        bool

      Arnd
