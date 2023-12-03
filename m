Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A18BEED5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="ifz2smIo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rgOD1tA3"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 314E95C01D5;
	Sun,  3 Dec 2023 14:28:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 03 Dec 2023 14:28:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1701631734; x=1701718134; bh=nb
	DUoLBtpdneWNDDrRC0y2irB6hZmfSPUUTCa/J0U/E=; b=ifz2smIo9yFqAFVOCJ
	5Utqmt1piIhWtUwXncr/0qEgx7OY2VUMe+kN2QfSmcfTlut/iFTSiuiRzeWV+0f0
	e5D8nczQlBMylYt1kmSPL1JYaCzUBXO2IcsA13Bw63vRElzfqwjSuOKS1rkVXUUb
	/MBuAUM/sBiQ4XzXd8P79EevGjEw69UEVDsYrjzyYAPBCjW/O43osnbPN4sa9sl0
	FpAtB5fu1xK6vgjjtZewmIJ9L0C6hWAkaHv8+NOuHpqBYS7z48Iwev+HY5xoqi5j
	+I2UwieNxCAn3QgaodRciDnLfZlSKVtivzHSsJcE1Y7Gm4xw2eKQwuzxyoMZfYrh
	qJ2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701631734; x=1701718134; bh=nbDUoLBtpdneW
	NDDrRC0y2irB6hZmfSPUUTCa/J0U/E=; b=rgOD1tA3YDsJAKq6GdkhFDhcNi4qE
	tNCqo960cYX0bT41RmMB/V+yQQNnvW+nRVqDAkxpEX1I0rkFxF7vAaC7SfBAXGrc
	qtnR37MTONw6I3kfmN65m/easMklldYCrdFlQl9JSH13ChujEM3v1dHiFes8HHVm
	l+FP2aqaYRj2u0SP6BPD59Gmu6QLps2HHg02IGoTqz+mbJ54v3n421qCNqAERiwU
	MSMbJowJQejzamIJ4eYwRGcTYQHzahvivz4QFTrUayBlw1HeRueIT1ONBiImuvPT
	SY+GYdv12rXPWXYeSauuOZN0s8lASNisHk/DUz+JkRceqjbeDl1DSnKCA==
X-ME-Sender: <xms:9dZsZYptnGQ641ujXOF1P-FUQwvcQa9Wsls5fRVKOD8EMNcQzNgN3w>
    <xme:9dZsZeq7MlAnx_fEkExkTKXxJ4o9ba6neDLaUNUaO_5KK7A8D0oz868DusrBOX197
    4EE8K46JqSjNw>
X-ME-Received: <xmr:9dZsZdOWhtkuxjTLQg3BuO8pNYn7e9-RZ_0z2xb9tFJ4EAx2GhDS1MeXQAAbIbpObrrqZo1xbxPeA98gXAZEsRY0rO8tAHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejgedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeghe
    euhefgtdeluddtleekfeegjeetgeeikeehfeduieffvddufeefleevtddtvdenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:9dZsZf41N9NIuD7D6hW80d9Tv03N6TehpQIRnolmeY6OEU1-Jxv76A>
    <xmx:9dZsZX71b8-Z5ht9vJJ6sHf2LfQpzUMcODjdmaShCYq_cHJm-OCySQ>
    <xmx:9dZsZfhWSf4pgcr2SExgJbAighl0suf815QB2dU6NR4F6gnWl06IFQ>
    <xmx:9tZsZUtJiNLCxgMlb_f_CwI3DvtpBI6m8EU3Kkrkyt_bNZPFT87Lsw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Dec 2023 14:28:53 -0500 (EST)
Date: Sun, 3 Dec 2023 20:28:51 +0100
From: Greg KH <greg@kroah.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.1,6.6] wifi: cfg80211: fix CQM for non-range use
Message-ID: <2023120334-rally-twenty-127a@gregkh>
References: <ZWzS5yuKKYCVIxz9@520bc4c78bef>
 <f7965d3bd612ade8535407c06f99bfee77432bfe.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7965d3bd612ade8535407c06f99bfee77432bfe.camel@sipsolutions.net>

On Sun, Dec 03, 2023 at 08:14:00PM +0100, Johannes Berg wrote:
> 
> > FYI: kernel test robot notices the stable kernel rule is not satisfied.
> > 
> > The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3
> > 
> > Rule: The upstream commit ID must be specified with a separate line above the commit text.
> > Subject: [PATCH 6.1,6.6] wifi: cfg80211: fix CQM for non-range use
> > Link: https://lore.kernel.org/stable/20231203190842.25478-2-johannes%40sipsolutions.net
> > 
> 
> OK, so I spelled it "Commit" and not "commit" ...?

No, it just doesn't know to ignore messages like this.  It's all good,
I'll take it as-is, thanks!

greg k-h
