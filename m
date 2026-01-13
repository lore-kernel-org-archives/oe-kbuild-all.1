Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824630C62F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 06:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768286846; cv=none; b=OGK8fnymjeaRhdwNIeGshmjITYeBpJHQiiGxaNUu0flhgMgGASK9e63GpmQAAq5+o67cJqcOd0TBRx6zZBxNKrJrbZtrND/BhGZFjHe1FRtGaSwUIHQl3CCz1fE0WuTZxwbE5+vaEYXOdB0ocWeJsI5Km+mNegVCt11E6fqoRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768286846; c=relaxed/simple;
	bh=FXJG6hIpP3yOOfx1GOS2g5PNan6AIzFhuggUvnGrqDc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=chtK1tzyk9K3cpsE/DTEJEIakEu1NuHe1Eqlj+q3IJsU1qF3TLkphHiJ3qAStI78PwO15ZQwDrf7+wSwzi1VYKpzeSu3/zGiCaeQbTN3DXPJL5HBvl6cHf2/ZFYWiSaa6UoKchSKFjT4f9Q5mss6vPOhaZcw72ZXEFwlNNW/6Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VZmIKdse; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=onjlnBeB; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VZmIKdse";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="onjlnBeB"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CB4A2140018F;
	Tue, 13 Jan 2026 01:47:23 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 13 Jan 2026 01:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1768286843;
	 x=1768373243; bh=cEYOMM1PSktxOqi05mzVpBiogG7bA9EEwz1KvC3eXio=; b=
	VZmIKdseuDgzijlfdj+qhHWGxVFqUdqPBk5B70BVBJg8iqRkDNg4AWQjc8AF+bAX
	EQaaxdXDQix723/04mn56gkhcHIIMEzKMZ603y+ef+DcKC5wX6q8PaMPJt4ZYQPC
	n4+4zMA53lYMBIGRowH0cPwmeb0aW/If+R1GLP3aw6h6Q2YbqSBTMi2XiS3ZtsXo
	tEHmuh9wCO66PN/7zif4c5RvSx/Ufrmqw5qmRlStM6fKAY5VzmgUmpamrp2mR9p1
	mKSSf0OIHlbAWAMFuLWXA8daP42XejZDJc8qKpJdflhhsjxCxx2ou6kqHC2LNjcO
	AKH3V02tiI2Kzojo9xiPYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768286843; x=
	1768373243; bh=cEYOMM1PSktxOqi05mzVpBiogG7bA9EEwz1KvC3eXio=; b=o
	njlnBeBMU3hlPxkaR58mJUEK2Vrue3rPnsiGrDX/lYcogaOC8SlgDtSXkNXnNr00
	FBID91ZliQoj15ez1Rhz9tIDsOJsEMvoRnoUsRSyNvexT48ft97d7p9uDHzf2ixJ
	94Hxdb91eq4f+xsOuIEjGMH/AXRoYW3qvGzJjUlF0VXx80jBhYX3eEPBgxy/qxAA
	N3UFysSa9aOJVUGFWLgH6x8fYt1iXGqrooTQTrd047DvRSElsSFc82fgivavoWmf
	Y6r+lH15diJjjO8qmnXP1BWAqU/iQxSez5eSBKIuxsOA1LjTgT+F22J9wWp9Lvtj
	EOJUde4W35uLxzM3qYQ4w==
X-ME-Sender: <xms:e-plaYd9ngr25ccb1ekc4st25HucG-bZTCmaorUxelHnl5WzMUERtg>
    <xme:e-plaVCQRZB-Mj8ElUEsp53ncFj7K01vcw_BHHH6ce2PpYxkK3jQMMnrWt_mQZEl7
    AFCZ0Sd-spvo6YJ8cuXB1m8Dz18g4EFBMFwwhmAv_BlYA1U78-hONE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehvghhuphhtrg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhu
    hheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhsnhhpshdqrg
    hrtgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehovgdqkhgs
    uhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:e-plaeqX1YzFIpCMYwaFMknxciE1GlTPlJLJEtp_g4cqBG6P76Nopg>
    <xmx:e-plaVlEItkHoeyaoE6xXU7aVmUPlUjxbWUw5edqBjxwvt1jOAz1vw>
    <xmx:e-plaexXRMPAYewdg06LGisiRGKCRKop3QSExevpAVsWMCo5vnaXTQ>
    <xmx:e-plad-4GDhZDsGc_OV6NY4YBfRxV4Y4tOYzV4Ho9U0v5WPfE7W5xQ>
    <xmx:e-plaZaQRDuibgOEW9qxo96HpswZQxMVYsBHCVhGsayDkNXUoFNrTtmJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 923DA700065; Tue, 13 Jan 2026 01:47:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AZuBu9tzlIoV
Date: Tue, 13 Jan 2026 07:47:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, "kernel test robot" <lkp@intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
Message-Id: <49e273ef-80e5-4199-912c-79c7f62da5ec@app.fastmail.com>
In-Reply-To: <b92a06fb-9032-4b96-a733-e80fe6ddfb20@kernel.org>
References: <202601131142.f4Kyqt82-lkp@intel.com>
 <b92a06fb-9032-4b96-a733-e80fe6ddfb20@kernel.org>
Subject: Re: [thomas-weissschuh:b4/at-vector-size-arch 2/24] ERROR: modpost:
 "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jan 13, 2026, at 07:13, Vineet Gupta wrote:
> On 1/12/26 19:20, kernel test robot wrote:
> Sorry my bad.
> While ARC770 cpus do support swape, it seems gcc doesn't define the 
> builtin for
> arc700 (and generates a libcall) and as Arnd mentioned we don't have 
> -mcpu=arc770.
> As a quick fix/hack we could add EXPORT_SYMBOL this in 
> arch/arc/kernel/arcksyms.c ?

I don't think that exists in the kernel, it's only in libgcc.

How about keeping the inline function, but making it unconditional?

     Arnd
