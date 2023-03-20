Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1BC1C3B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 15:56:32 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 0A7D95C0167;
	Mon, 20 Mar 2023 11:56:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 20 Mar 2023 11:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679327791; x=
	1679414191; bh=75d7UQH2kYSXDy8YCiJRk5o82Ngw3si2xFQ5NEAYyJw=; b=k
	Px21H6H9iLYUHBR6cbURnEif2mDHmikdZhVvJXO9NCFrvaxaYRlR1xk4Nqgw1jEf
	B8qztIg96hUGqnFPadzmqGMDip+OGpn6F6Qt9pH8kbAA7MlO0zXfmbMrk68rCoWh
	Q0UjDz0oqAqoiethrWVs11gaKqeJqURpvfcOtXE1UJfYYlOK8Hg+05Z77MhA0NZV
	2udwVIYpDhcDHOEaMEtTSbOPaelnqsNyaIHrZOvowjVcjGA0oa2BR9yB3Kf7qb4A
	a9oZrPfuCAjUBxrVU3kNpNO+OKOst4b2+l7qcQWqw/tfP0xFzRLPUTfz3y1bd+3j
	XnbqMfNqbjJcnOKMGPsZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679327791; x=1679414191; bh=75d7UQH2kYSXD
	y8YCiJRk5o82Ngw3si2xFQ5NEAYyJw=; b=aGLrRznG/hZExbF+qT16SeIFeBxBh
	A8WfhRzLKk4HJD/fmM7mS2rwe3z6ZuWpEMSe+fR214ihrmMIsQXrLrLo9N4rAspJ
	Z6IZfU+uqHGamHWZZVwiSwsCPO0cLvIhHmts1ZDPCfNb5oSfn3NT8TTvH0tThTAA
	GMXcsW33SC/R1uWrc08c9rvCbJcDZnqoRD9FfrbFl8+7/4Pb/S8HcAoSNHj7SAU8
	RIemI+Sw2M4sB1AkzTCER9vwsbpg/E4NqDZukhhahisGgwomf67BQG29/fVpGwGt
	oQE4WqKIicvTfG6LPMz1x4zelzreY4/zOs9RwDjBN1ZlJywgWvWIl7yeA==
X-ME-Sender: <xms:LoIYZCNOsOm-cH1ctr-mXcxS1JtKc-9RstV9yKlBt3GPo2WU0sObHw>
    <xme:LoIYZA_TfpDlsont0pKQXhzwNFryvCKXTM_sLnj6SQEUZrj-ymUjWDEez-EvVWFxb
    lCaGA10ZXCM3YQ1kkk>
X-ME-Received: <xmr:LoIYZJSv0wLG5fhEHklnfxX_53QSryVYQhTsuCNuQk2SUTCFOBqQdR-pwW0DZu7ZtWcizg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefkedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
    ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpeetkedtjedugeelueekgfdtgfeujefhgfejveet
    heeffffghedviedttdefgeekueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtud
    drohhrghdpghhithhhuhgsuhhsvghrtghonhhtvghnthdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvg
    hmohhvrdhnrghmvg
X-ME-Proxy: <xmx:LoIYZCsmNN3ZuNNSLxCatspT5FWJ4K-GH6WLyiAXq5T3y8o_047hZQ>
    <xmx:LoIYZKemZr9l0apgl56T3manb9YNYAUfPHhWoYeZkOPG_HypRdwC5g>
    <xmx:LoIYZG2bSa3IbyWpgC6WH0PML8xvL3dzU7wG-1ScGrhj8IeW4kj-jg>
    <xmx:L4IYZCSCqelPb0Gaa3AI6ewODK2KV4H7dFPkbpUFaF7rQ6Bu6JajMA>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Mar 2023 11:56:29 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 1D34C109590; Mon, 20 Mar 2023 18:56:26 +0300 (+03)
Date: Mon, 20 Mar 2023 18:56:26 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: kernel test robot <lkp@intel.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.xn--dev-s01a
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 3778/4413] include/linux/mmzone.h:1749:2:
 error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <20230320155626.hirui3frcaunnajj@box.shutemov.name>
References: <202303201615.Qfu18nWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303201615.Qfu18nWV-lkp@intel.com>

On Mon, Mar 20, 2023 at 04:06:33PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
> commit: af8daebdbc0833b8095767ccef7ddce55e9fdf32 [3778/4413] mm, treewide: redefine MAX_ORDER sanely
> config: loongarch-buildonly-randconfig-r003-20230320 (https://download.01.org/0day-ci/archive/20230320/202303201615.Qfu18nWV-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af8daebdbc0833b8095767ccef7ddce55e9fdf32
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout af8daebdbc0833b8095767ccef7ddce55e9fdf32
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch prepare
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303201615.Qfu18nWV-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/gfp.h:7,
>                     from include/linux/mm.h:7,
>                     from arch/loongarch/kernel/asm-offsets.c:9:
> >> include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
>     1749 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
>          |  ^~~~~

+Loongarch folks.

The same situation as with mips:

https://lore.kernel.org/all/20230315152636.smn34f3c6a5jzpn3@box

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
