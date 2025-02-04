Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36512066EF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738657548; cv=none; b=jFGYwTYAX1LPE9y/2jYh9T13bshFxnHRwqknrfIfPE1fdTZT+QzXOF9zegpFB81zL0sVutu+hLfVNF5s9TXkslPK+Kyv6Cq5hnpCEtIHHmunzqOf+wW+vI/RYrd7Zs/Vxi6KbaUXqjgmVEBXtjTH3xjsby1elg6OXdExNU3vJkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738657548; c=relaxed/simple;
	bh=X9T+ammaBrrwT64EZ99Prk/SMAVeBoxg/PNsHL7FK9Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ADPGqwCXWQXp7E1Ir5dZXM7JRMn4t9Igcm/IuwIkhZnDH7a/uyrY9uJA7KTG2at/+mUUULa6XgT5ei/Y4iOHld9yPm4FIqd9SDqqjlRc2EUagMA7iJ808xVDN8KOBuAYGCdsYh6/j85JJA52xFQ1DjSXUkTssWR+2ho5v1GzYv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+p8CE8s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+p8CE8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3146BC4CEDF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738657547;
	bh=X9T+ammaBrrwT64EZ99Prk/SMAVeBoxg/PNsHL7FK9Y=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=H+p8CE8sCjckUbwEm0/+M4aU9+J5VJvb1UaFAQ6gUDD3jbGi5gGIhQimegX/y2iGn
	 ao+ZCpgYqOfxBEtuHU5SFrB6I+MUKGNEZewSJZZnHiY+xST2plAUWJAKPEZi/GQfBK
	 Qsqm9sxhRO+UWSiRll0GGKZLOR3bDUYBY7Xod/C6AAfXag+/cXYZTAXjRIR6Yj/wsG
	 WPaNl0eZcPjY3gAvb6j1gt5TnJdGC4+j89JoRarDatpJ4c1lRNrMCCKvzX8X7xlhd6
	 h0pkgOZFO4XrRMwA8KJ0ha/yZcgHXshWZV/gWrL5KCXm+TICrwDR5dZgi0drjp01U/
	 Ppf8VfgUqR5bg==
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 475121200069;
	Tue,  4 Feb 2025 03:25:46 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-03.internal (MEProxy); Tue, 04 Feb 2025 03:25:46 -0500
X-ME-Sender: <xms:Cs-hZwXN3vzALYRCGr_j3ufT0IyT9NbnKzppL1_LmmBSfionaOBR9g>
    <xme:Cs-hZ0nloXWJaXZwJ6T7HuDSE2DE8tMQL29e1G3qlwGLh3uj24V9GpfklBXELy66V
    qfQZmo9JgpZ5fGTTFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfnvghonhcutfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrh
    hnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefffeefvdejieeiteejuefggeehleeg
    jeekteehhedvtdeiffekudfhfeevgfffudenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgpddtuddrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheplhgvohhnodhmvghsmhhtphgruhhthhhpvghrsh
    honhgrlhhithihqdduvdeftdehfeelkeegqddvjeejleejjedvkedqlhgvohhnpeepkhgv
    rhhnvghlrdhorhhgsehlvghonhdrnhhupdhnsggprhgtphhtthhopeefpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehsvghlvhhinhdrgigrvhhivghrsegsrhhorggutgho
    mhdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtohepoh
    gvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:Cs-hZ0aOmi6HWH9zH78Fr59oljrkiRtUBywOmxLEqzGjAUSTcUn2MQ>
    <xmx:Cs-hZ_XjDNXWAKo0Wz2A44TFYms8DbJh0IFn5Dtz6ukfPvpwFpq43w>
    <xmx:Cs-hZ6nxaiO635fnhdnxVHw80X8CoXfYAILdTQbKII_Q8jKo9YDF5w>
    <xmx:Cs-hZ0dXWQBC1s42GoY0zEUe1U-UPjQB9JoCza68gc551An5eHn_ww>
    <xmx:Cs-hZ8GEheQYij8UX6K0pbloPhcNnKfpb9VtQ3lsq8MKSJtUh_QMbHdz>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 19A3A1C20066; Tue,  4 Feb 2025 03:25:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 10:25:25 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Selvin Xavier" <selvin.xavier@broadcom.com>,
 "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Message-Id: <ccc10cdd-f077-41d5-8860-3a5da3800d61@app.fastmail.com>
In-Reply-To: 
 <CA+sbYW2bq3M25aH9Jm-1T+5sE27pAfj73L7A1c_c_DsXE4z2jg@mail.gmail.com>
References: <202502041114.K8XQYeJg-lkp@intel.com>
 <CA+sbYW2bq3M25aH9Jm-1T+5sE27pAfj73L7A1c_c_DsXE4z2jg@mail.gmail.com>
Subject: Re: [leon-rdma:rdma-next 17/75] drivers/infiniband/hw/bnxt_re/debugfs.h:34:40:
 error: variably modified 'gen0_parms' at file scope
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Feb 4, 2025, at 06:46, Selvin Xavier wrote:
> On Tue, Feb 4, 2025 at 8:37=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rd=
ma.git rdma-next
>> head:   10565c5cadcb629f7780d24dd351878de9f46db5
>> commit: a3c71713d9548f1a9ee141c7cfb35550c3487443 [17/75] RDMA/bnxt_re=
: Congestion control settings using debugfs hook
>> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20=
250204/202502041114.K8XQYeJg-lkp@intel.com/config)
>> compiler: s390-linux-gcc (GCC) 14.2.0
>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250204/202502041114.K8XQYeJg-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202502041114.K8XQYeJg=
-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    In file included from drivers/infiniband/hw/bnxt_re/main.c:70:
>> >> drivers/infiniband/hw/bnxt_re/debugfs.h:34:40: error: variably mod=
ified 'gen0_parms' at file scope
>>       34 |         struct bnxt_re_cc_param        gen0_parms[BNXT_RE_=
CC_PARAM_GEN0];
>>          |                                        ^~~~~~~~~~
>>
>>
> Leon,
>  I had a fix for it. Do you want to revert this check-in and want me
> to post a v3 for this patch ? or shall i post a bug fix patch?

Is it small fix? If yes, just send me Fixup patch as debugfs patch is st=
ill in wip branch which we can change.

Thanks

>
> Thanks,
> Selvin
>
>> vim +/gen0_parms +34 drivers/infiniband/hw/bnxt_re/debugfs.h
>>
>>     32
>>     33  struct bnxt_re_dbg_cc_config_params {
>>   > 34          struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_=
PARAM_GEN0];
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>
> Attachments:
> * smime.p7s
