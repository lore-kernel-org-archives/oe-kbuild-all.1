Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3016F3FE55
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=devkernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=devkernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=devkernel.io header.i=@devkernel.io header.b="lzQKCq2K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m0sfytw7"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 23B0B5C018D;
	Fri, 15 Dec 2023 14:13:46 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 15 Dec 2023 14:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devkernel.io; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1702667626; x=1702754026; bh=kYlp+mdP5D
	efmXgOScr9aAadpHEMLjh4AFiJ4HNY4gA=; b=lzQKCq2KRGyrgK4De50k+kG942
	Cdu1/oQLHoqKb0OOT1d/dXkOSbNracG5NIo5ZQfdmfQ0PmuqyR37rfqPHgxJlWvT
	TRsBCx9g6G9VCt8B2XHQ6qW86JZr+uQmOTb21SSam+Y4clkrhXrRsUoBFjTl7VSZ
	ct8+JrOxsWzfjt6F3QxGT+UjHewl1q+DY1wjLXpyRPzTbg1CT5qHMmTQTpHJe4+T
	mfCoxyZVLAT08sQP6aS58j3BS/neL23OFPGxFr0xVE1pll29remrpZN8o7PgmQ4T
	Pyamaz2zihFdxrIVQgHTLcu2GF4C9RXd9PvdHDxVKo1ujNS+VLJr9n97IIew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1702667626; x=1702754026; bh=kYlp+mdP5DefmXgOScr9aAadpHEM
	Ljh4AFiJ4HNY4gA=; b=m0sfytw7RK2LqnxRs3cVtWtjgB25UoqSbvTeTzLEosyL
	UlH0VS24GZzFC9VRVdTCKtLaWFYpYTCRQJynpbZN9R4ruF4NRpNP2wx4FCnRXoCm
	32i1Sz5AGpU4TwAd/wFH4lOYCgwYAOZ0u2LOKXiHy+nEkGraMYkgawwmv2vuQqcB
	/0OnvvRBGrMRrRAZka3aFOHa+d4qN6byqbSnKmmad1k/jYg07BBtk9jCXXkWEwmi
	7m9Jr1hx2h8xDIRmxGfdd2UkFk7QSuPlT0iU6A4taeLro8JRcAQoQiXCVDERZ37c
	sG4NbkbPbEFcH7o7w+QcRyiJadwCj1G9XVlG0HUyvg==
X-ME-Sender: <xms:aaV8ZeOMyU806XCY8qDif2FwlDWZZaU7c1kqOEV4qT12ooSAdwwF_g>
    <xme:aaV8Zc8KnxAk3Up8nPk-LbufzhWZGGzaL3s2bolNKyyombijoTIHI_8kMoz9L8kRp
    jq-LqXNuIqdGDoXFLU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddtvddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtse
    httdertderredtnecuhfhrohhmpedfufhtvghfrghnucftohgvshgthhdfuceoshhhrhes
    uggvvhhkvghrnhgvlhdrihhoqeenucggtffrrghtthgvrhhnpefgveetledugfdutdeihe
    ffhfevfeffffejkeffudfgfeelkeehgfdvteehffeghfenucffohhmrghinhepkhgvrhhn
    vghlrdhorhhgpddtuddrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehshhhrseguvghvkhgvrhhnvghlrdhioh
X-ME-Proxy: <xmx:aaV8ZVTsoWfO31BFDIpc8nAONKUaeAAylhK6wsij_a_skeu6e2WZeA>
    <xmx:aaV8ZeuDmJQq3jIBS3Y0ItLO228kS2Qule3PBpMfXYE3KVieC5mnhA>
    <xmx:aaV8ZWcRXe5tE7qnTczkpa0QynFCshKyjBDkkB8hbkEkZyTgflHF8g>
    <xmx:aqV8ZaEB5gKs-Ok7JWbXZA7qOJiOZgyyGDUJ9SxdKNZDOFgPBesuRQ>
Feedback-ID: i84614614:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D4E80B6008D; Fri, 15 Dec 2023 14:13:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <3e0099de-4980-4839-8511-51ac7ba0eec4@app.fastmail.com>
In-Reply-To: <20231215111010.bbab9d6e80f43302d60c7e42@linux-foundation.org>
References: <202312151854.4k8dhWf6-lkp@intel.com>
 <20231215111010.bbab9d6e80f43302d60c7e42@linux-foundation.org>
Date: Fri, 15 Dec 2023 11:13:24 -0800
From: "Stefan Roesch" <shr@devkernel.io>
To: "Andrew Morton" <akpm@linux-foundation.org>,
 "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7414/8213] mm/ksm.c:344:13: warning:
 'set_advisor_defaults' defined but not used
Content-Type: text/plain



On Fri, Dec 15, 2023, at 11:10 AM, Andrew Morton wrote:
> On Fri, 15 Dec 2023 18:36:51 +0800 kernel test robot <lkp@intel.com> wrote:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
>> commit: 5898c0939406116f8ab33dc5a50d36f3b5d44863 [7414/8213] mm/ksm: add sysfs knobs for advisor
>> config: openrisc-randconfig-r016-20230621 (https://download.01.org/0day-ci/archive/20231215/202312151854.4k8dhWf6-lkp@intel.com/config)
>> compiler: or1k-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151854.4k8dhWf6-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202312151854.4k8dhWf6-lkp@intel.com/
>> 
>> All warnings (new ones prefixed by >>):
>> 
>> >> mm/ksm.c:344:13: warning: 'set_advisor_defaults' defined but not used [-Wunused-function]
>>      344 | static void set_advisor_defaults(void)
>
> Thanks.  It looks like there's a bunch of advisor code and storage
> which can go away if CONFIG_SYSFS=n?

I'll have a look.
