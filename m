Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579B03368A5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 22:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772576130; cv=none; b=mybf7y6cSvmS4Cqiwb8tvHsaTj3ZhF78TVZ0LfX7o4Y+0j6O+gC6NrvYKM0YY9A6/OSzLPBkIX6KWRn6A/nGs2Q8EVqLXSl+98APKu/VhLNOnYIWa+/mugudxlvccotcGsOCxlpJ/Y7KXndXt6jP6anTgY53YBSkxHdKvgBehlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772576130; c=relaxed/simple;
	bh=PnlDH0bYk2Hh1qZ6bvrdbVMEre/64/7GImN4LB6uE+o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q9agfMsqtmdwvATgA2pzEDx2iE+RogPjToMs9SaP9nrhhtMP+CUEgHA3z9X6D/YLuJZgc7xaWMa2YWFcOXyX3be7q2JPranVfO+0TN1kIBc+XP6/5BffqqThpuvVquAesZq1XAHa+/G6D67V3DhsAiGoz/2UAmo7CdCWfd7URgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W22hhrGe; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W22hhrGe"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 227981D0016B;
	Tue,  3 Mar 2026 17:15:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 03 Mar 2026 17:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772576125; x=1772662525; bh=piafCis23NCwy+3hKybLRiRLSfcLpmfKa+7
	uPVWZ6PI=; b=W22hhrGedB+A1rCDhsRdkAHKpaBntaqnCvnaV42OcnZLElVbUoM
	TUXwJCVwQzpTQkCQwajcZ7KidszoJdL+37h/l+Si300aCe2MV9X3zlyq240sefyy
	H5wmj3hUdrH1PJPdCd2czsOwqB1zVgxFQWbZC7MZ62JhkBQio9NEb74HRaf950IP
	zDmS+Uy+6WvdRCsnQlfVVzj0K+0LKyC4xmzJDpcvhH8EBdTPx2VEBRBlC+GpvB26
	VuGLvehAk1hB59/JnNz2AV+cN7r9XJM/jbn2ttLgLfZtU+4DogpCOgsANpE2ZL6U
	hnxLtCUdFuYEK/ObrgfUTB6/+eocG47+LNg==
X-ME-Sender: <xms:fV2naRPDpYdtLi-R5USiC63zncx05O2u_R2r9FrYsU5OIJeP95NNrQ>
    <xme:fV2naUqPCo3dYUBD6lyTfpIJLhKPQC8ivZdTAQS2LCfKx8ALKNNzf9RrRtl5cpi8p
    HV07dUEFaCi37JsjX0neuBEmdnfqHQMuD2QiUOAVicV-QV0l_bmUJ0>
X-ME-Received: <xmr:fV2naedSKBYFcwgqRVSSAKUMQmoBAZ2ZzL3am6WZ7YRKuwCR2t8WSboVgaTbFmQFXMgkRAwsDOYy22CjalTyWjiBsbw48vYfveA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddviedujeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehnjhgrvhgrlhhisehmrghrvhgvlhhlrdgtoh
    hmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrkhhpmhes
    lhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    mhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:fV2naSQ26LraRJxxakwoUpoYm_Ssq53fdytouAACbUdjpp5Db394sA>
    <xmx:fV2nafbAjcpEURecGS4O6oMs6JSmtiBffiK2AyPf9JJnVxuuFrVmCQ>
    <xmx:fV2nadcn6V6dQVLsS4atfcPplqQEKj2eXWibPYg_K-IDMFDO1JUiZw>
    <xmx:fV2naYLe0aI-PAIvDrT0F7-XIhfm73fZwBPZFkWxgHz316fQ4wRKzg>
    <xmx:fV2naQka-MXz1YjE_ijnj0YDbJXxFO8AVAucrlvVQlOqapuYVTQT1yOl>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 17:15:22 -0500 (EST)
Date: Wed, 4 Mar 2026 09:16:21 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Nilesh Javali <njavali@marvell.com>, Arnd Bergmann <arnd@arndb.de>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev, 
    kernel test robot <lkp@intel.com>
Subject: Re: include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_431' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
 sizeof(*u)
In-Reply-To: <81916ff0-9296-4de2-bbf9-40ef0eb4c60f@app.fastmail.com>
Message-ID: <a081b068-d14e-943c-54eb-3c263077c8bb@linux-m68k.org>
References: <202603030747.VX0v4otS-lkp@intel.com> <6bc11e2f-393d-16a2-9664-a20e2f1d3767@linux-m68k.org> <81916ff0-9296-4de2-bbf9-40ef0eb4c60f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 3 Mar 2026, Arnd Bergmann wrote:

> 
> As far as I can tell, the assertion is always true on all architectures 
> other than m68k because "struct rsp_que *rsp" is word-aligned and 
> "struct atio_from_isp atio" is either 64 bytes long. The intention of 
> the assertion is to ensure that nothing got added after atio, though the 
> way it is written does not take misaligned atio into account.
> 

Hardly an m68k issue. The same thing could happen on any 32-bit 
architecture under slightly different circumstances. (Nevermind 
Linux/CRIS, would would be affected in the same way as m68k is.)

No, the real problem is the assertion itself, which is a failed attempt to 
state that no struct element follows 'atio'. It isn't about alignment or 
padding and yet the assertion is written in terms of sizeof(). Go figure.

It is about the non-existance of an non-entity. That is, something with no 
name. I don't know how to express that in C. It may require the help of a 
fancy compiler.

> > I suppose the assertion could be motivated by some code elsewhere but 
> > I haven't yet found it. So perhaps the assertion can simply be 
> > removed. An alternative solution could be to increase the 1 byte hole 
> > to 3 bytes, and prevent tail padding that way.
> 
> The simplest way would be to force atio itself to be aligned regardless 
> of the architecture, either by removing the __packed attribute on the 
> struct nack_from_isp definition, or by adding alignment on the variable:
> 
> --- a/drivers/scsi/qla2xxx/qla_target.h
> +++ b/drivers/scsi/qla2xxx/qla_target.h
> @@ -844,7 +844,7 @@ struct qla_tgt_sess_op {
>         bool aborted;
>         struct rsp_que *rsp;
>  
> -       struct atio_from_isp atio;
> +       struct atio_from_isp atio __aligned(8);
>         /* DO NOT ADD ANYTHING ELSE HERE - atio must be last member */
>  };
> 

I'm fine with that, but I'd add a comment like the one I pointed to in my 
previous message, which explains some gratuitous struct padding added to 
satisfy a BUILD_BUG_ON assertion.

> In general, the use of __packed attributes in this file seems a bit 
> inconsistent, with outer structures being packed but containing aligned 
> inner structures like atio_from_isp and nack_to_isp. It may be best to 
> review all of them and remove as much as possible, but that's not 
> necessary as a bug fix here.
> 

I'm fine with that suggestion too. Thanks for your assistance, Arnd.

Nilesh, let me know if you'd prefer a patch to change the struct padding 
or packing, or something else.
