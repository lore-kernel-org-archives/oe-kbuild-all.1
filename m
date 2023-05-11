Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5074E1B8EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 07:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B86C433D2;
	Thu, 11 May 2023 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683789686;
	bh=qAYHNGs0LFOOnmVkEABSLN/ePjnMD+mmOhN8OQ3Tov8=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=BEJJWOXXfhye31ABOw/81oAg9S9r1i8I2VoTS9ZtpneX/AN3tJGnnaHcZ2+SUz0Lk
	 pfMC+i86jSoDZUexwZCZIw1zwJzaf/nw/4/8bikFGyuDkyXDebd4w6bkaMgkMM9WGv
	 UAulKxVMtaQMuM1TZI92DvyJvQjO2ZYGeF+ZA85Nn3lVfYvRHbNo5RKw/gGWilnJ8M
	 9/FTr6flEeC4Vh+OFRb2rn7BddjVJwr+R7zUFsesS0t25NQuWiZcdyK0UXsiISyDHE
	 7TouC9E4MUPwDYPAG2x8ojUZCQqmFmJ7fm21gvSQ+GnETyfQZeYopaHWofB3WHne8Y
	 obCOIinaYLDTw==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id ABEA227C0054;
	Thu, 11 May 2023 03:21:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 11 May 2023 03:21:24 -0400
X-ME-Sender: <xms:dJdcZEHeHo6cZQrx1MtzzvS9WL7kAEl_jNu8regns4_gqUx4Y90G5g>
    <xme:dJdcZNUjtcjbjuxN4Sd_xwGx_bZlfZnsKkmSzCsauj527m4k8SfdBpGyRULDuMloS
    CMdwYzokX6ZfG-oa5s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegjedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpeehvddtueevhfevveeghffgfeevleeileduudefveeuhedtjeejgeeh
    geehkeekteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedqvdekjedttd
    dvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggv
X-ME-Proxy: <xmx:dJdcZOL3Dekp8hEtReHoM0AxgsQS4jeCUKr1DXL7LUG1PikTlv2REg>
    <xmx:dJdcZGED44xAxEkNJeqa7eZB9kRTuwegVNYTx042i8r4yt-OXJxLcw>
    <xmx:dJdcZKVaYWkNyYg7GzerzZ4NGdKCgm3NLF2yNERK054wTO9v4TVR_A>
    <xmx:dJdcZNe5uP-kc2DXC7iBHK3q4pkrWHtC9dABnRfXx7FC4fH9UrpARw>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6CE1BB60086; Thu, 11 May 2023 03:21:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <0474d84f-69cb-4c98-9833-695ed25bc65c@app.fastmail.com>
In-Reply-To: <202305110634.RGuHbrxM-lkp@intel.com>
References: <202305110634.RGuHbrxM-lkp@intel.com>
Date: Thu, 11 May 2023 09:21:03 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "kernel test robot" <lkp@intel.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:289:5: warning:
 no previous prototype for function 'usb_hcd_amd_remote_wakeup_quirk'
Content-Type: text/plain

On Thu, May 11, 2023, at 00:31, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git 
> has_ioport_v4
> head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
> commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb: 
> pci-quirks: handle HAS_IOPORT dependencies
> config: x86_64-randconfig-a014 
> (https://download.01.org/0day-ci/archive/20230511/202305110634.RGuHbrxM-lkp@intel.com/config)
>
>>> drivers/usb/host/pci-quirks.c:289:5: warning: no previous prototype for function 'usb_hcd_amd_remote_wakeup_quirk' [-Wmissing-prototypes]
>    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
>        ^
>    drivers/usb/host/pci-quirks.c:289:1: note: declare 'static' if the 
> function is not intended to be used outside of this translation unit
>    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
>    ^
>    static 
>    1 warning generated.

It looks like the declaration was dropped by accident, it should
have been moved into the #ifdef.

     Arnd
