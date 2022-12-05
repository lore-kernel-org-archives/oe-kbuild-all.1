Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36EB15C9E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Dec 2022 22:20:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8EFC75C01F6;
	Mon,  5 Dec 2022 17:20:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 05 Dec 2022 17:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1670278833; x=
	1670365233; bh=y/aoNfOCa+KBPrH0Jh4WtbheJ7zZb6+HdMmLbLVt1K8=; b=i
	8XQoSAZd7iQCbkhK3I2L7LWJ7hrFPfkWnhi9FY3a0CY90907hV0o2AenRGhzpK2w
	J6IkSJ3epWSXbgsYIeeOpAKpz0JMq6PI/pO8VOmgkMqnCqgZ4nyq5Bod2Gvc3ZUt
	LXRO3gHM1+nJOuXZKDUYjS0c35X3tvDR1O5CwPrRVgIj9+kuavsMSf9xJHvzvTuH
	D2zIQOnD5nqp6Xw8sdPuVbADUnYFXgbDZ/1MZ/GFY9L3ivK7NyrRbn+MWs0/9QDU
	F0okadUyg4bE3e9GILa9zLNr86dSj6SO/63TPFlcY0BfWd5qh5HCNiIqVXO5vZnC
	KVwR3XfU7CmG2mAKbX/oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670278833; x=1670365233; bh=y/aoNfOCa+KBPrH0Jh4WtbheJ7zZ
	b6+HdMmLbLVt1K8=; b=UcydYMQdIluDHj1E2YDFpzdEpEybQYseB571W/RDkBcw
	AbSAtBxqVvKfvIpLQgo9pVVgTcT9+enAn0hUiXAV+WzRksnHi4SHCkaPQzObQQ8T
	vqaKnsHVVfzj8CzhDuZIJW+2nCWwmdBsmVSgTEiIUajBD/k0ldKECkrg34vWcsNM
	MWfOdDoq8P65EG5FM7v0zY2IcFc5KPxUl5atFW89EScrUQdUo4oFsyVafWBTRKB2
	91E3wpuRBF4vm2j+VEjNQmTaHiKGzY8sOjGcFDcQBw9y4t9aXWpElYxSouaveliA
	0QyKTF8CbFq7uXrrh9vGR20Cv9FugaxBSj3gt1rJKw==
X-ME-Sender: <xms:sW6OY-W5HNDksDN7bG3nTQo1L2MAtpd2xCzAZqYLKHgf5mSxDj7MSQ>
    <xme:sW6OY6kAUaiSjaSD1nt_P2IvKjs9_gs3TWYCr41TmFvCRl-znfOuwPZmS2fv05aEG
    6F-w5s45oNAD14msC8>
X-ME-Received: <xmr:sW6OYyZ2QZKHqGEHQhjEeUpVSlovnTvJ_mDrMGkShbF1BPOBj5HehdccmC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeggdduieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpeflohhshhcuvfhrihhplhgvthhtuceojhhoshhhsehjohhs
    hhhtrhhiphhlvghtthdrohhrgheqnecuggftrfgrthhtvghrnhepgeejudeutdelfeeugf
    dvgefhheeuhfetffeftedvffegkeethefhhedtvddtgeeinecuffhomhgrihhnpehgihht
    hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:sW6OY1Xe8Dmr1XCaigI-F4nEs-5vg4gZ1hx-ZN2e1UsTKkdLNA5VaQ>
    <xmx:sW6OY4nM7vuuEkJNKCRu-o8ydpNyLOnhTVpLPbGAdHyq-R7qNZYEVA>
    <xmx:sW6OY6fIoq3P60oXJ3HAR7m-_uP8keIizP0fklMiuW7HXvAluatZEw>
    <xmx:sW6OY0t_wxrl3cj4WYBxEUuSa-e7WIENigbm74vx2TgL4QgZy1p_HQ>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 17:20:32 -0500 (EST)
Date: Mon, 5 Dec 2022 14:20:31 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: kernel test robot <lkp@intel.com>
Cc: Nhat Pham <nphamcs@gmail.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [lkp] [+534 bytes kernel size regression] [i386-tinyconfig]
 [b45ed49f9d] cachestat: implement cachestat syscall
Message-ID: <Y45ur7cF0Q9rHAw6@localhost>
References: <20221205175140.1543229-4-nphamcs@gmail.com>
 <Y45XIDSMm85JIfg2@a90b89c6454c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y45XIDSMm85JIfg2@a90b89c6454c>

On Tue, Dec 06, 2022 at 04:40:00AM +0800, kernel test robot wrote:
> FYI, we noticed a +534 bytes kernel size regression due to commit:
> 
> commit: b45ed49f9d4f655a5e95c14f7019b455929f419d (cachestat: implement cachestat syscall)
> url: https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/cachestat-a-new-syscall-for-page-cache-state-of-files/20221206-015308

As with any new syscall, can you please add a new Kconfig option for it,
so that small kernels can omit it?
