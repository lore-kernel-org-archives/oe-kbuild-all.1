Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44B91EA80
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708355750; cv=none; b=rFo6ogMJ/fhAiidO78qZKjfvPbGRJSa7UttqbrdWBZrBddD9OZ0l9Lo+sjraGahGJzogMpPADkL5pA4BKvPzfPWLgyZUBo2lK4cy5VnFaIIL4L9U9ol2ECmHeWvkocCjjDAV5UL7TnK+WgRMLxv+o3J3JgyhPuaZevoOcuVIsf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708355750; c=relaxed/simple;
	bh=2jVMPRZNIJB4xuzz3dRpbjxFAAyCqRQ8lo0W4833wmc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=t/YXkh2+PcLzQnBvZSE2/T9UxV3ms6T94FJF5YqkwZKsuwLhjE8ZECOJg/UlNefqGwChM5Ws8ppFvEf54XK8NJLco4WYls3pZUkvDZdYvYGlCmwbEmgURVbBVlEMiWpp6xWntHCWYctA8nwqQFzG0sVWoNLtGWR0+orXYIqLJVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqGKWeM+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqGKWeM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F80C43390
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708355750;
	bh=2jVMPRZNIJB4xuzz3dRpbjxFAAyCqRQ8lo0W4833wmc=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=SqGKWeM+s7y3HhabaKz68sSpluOpIztHVTTdctjTifa84pJtg5pfp6Sfg5n5kAxbo
	 ENf665Tk3RgPs549yJCRUSJ1um6ZGTNWXTxBokfs4LVsnuExPbSjblM4cVNOqVwv9S
	 vnHqFK5RHCsHDbah7MEu/wz+Nb0qyWICaGALRJsd88FYtlOU4qgwxeiJLovKhBuI50
	 lxqaq//lM9QDGjFrgNrPsDbdgRYRuQfc5bJ/7Z7OD+7j19yn9tDga1n7uqtMk0GdxW
	 Gfhfu2E47PV4C4lylx82xXlcRYy8YtUp7ded8AmPz0VaV+fBYTR+JASabf5nX3aioG
	 WKV31HnXMHU8g==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 13C621200066;
	Mon, 19 Feb 2024 10:15:49 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 19 Feb 2024 10:15:49 -0500
X-ME-Sender: <xms:pHDTZfL-ubzQXhmp7tMwYY8ZWCLC5P3jNfs4cMWrIZw6Edh-kT5WWQ>
    <xme:pHDTZTIVTaES_9HmjLp7rBIjV4vAlvvV8UaV5m581ODnspg8mNpQZp30_kDNAMmCF
    01V5MPrE0RSyWwbhGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeehudeg
    tdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddv
    gedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdrug
    gv
X-ME-Proxy: <xmx:pHDTZXtKVczxnzKhxYvrknAI6an5qk1qDDfgOgYVXLHEbzf_QjqNcg>
    <xmx:pHDTZYakgjnhp-gWoaYLCJLGiCkkVTaLgNuez5N6UwfGuq91C-gXpg>
    <xmx:pHDTZWY1PPizJ_3mmGZ0qK0Vw9Is5xYw3Lid68lDC97BKfTnykWdbg>
    <xmx:pXDTZZx6u6qN9OK-bo7cXKaqUencPjY-7RaSCnGbleS393_TBbiwosFBsjA>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5472EB6008D; Mon, 19 Feb 2024 10:15:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <d81e5e16-7eec-477b-b3cd-75756ba1fbe4@app.fastmail.com>
In-Reply-To: <4d329c6d7b399f41c56659ad5e0b00322485eeb8.camel@linux.ibm.com>
References: <202402180247.kvG7qcpX-lkp@intel.com>
 <606284da-1700-4186-80ec-8a4cd85586fc@app.fastmail.com>
 <4d329c6d7b399f41c56659ad5e0b00322485eeb8.camel@linux.ibm.com>
Date: Mon, 19 Feb 2024 16:15:27 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v6 19/19] include/asm-generic/io.h:625:15: error: call to
 '_outl' declared with attribute error: outl() requires CONFIG_HAS_IOPORT
Content-Type: text/plain

On Mon, Feb 19, 2024, at 16:01, Niklas Schnelle wrote:
> On Sat, 2024-02-17 at 21:11 +0100, Arnd Bergmann wrote:
>
> Thanks you. I've added two commits for this and the hexagon change.
> With those I'm now at 21 commits vs master and linux-next. What do you
> think is the best course of action for upstreaming these? I'm guessing
> per subsystem commits and separate patch mails for each?

Yes, I think this will need two more rounds: send each patch to
the respective subsystem maintainer and mailing list separately
(possibly multiple versions if there are further comments),
and finally the remainder of the series that has not been
picked up or seen any replies to merge that as a series.

     Arnd
