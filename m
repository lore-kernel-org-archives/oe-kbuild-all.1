Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604908820
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 05:52:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id E74235C0DBB;
	Fri, 29 Sep 2023 01:52:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 29 Sep 2023 01:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1695966761; x=1696053161; bh=XV
	vqIfHPHtEcbdr5LfkG8vjFGIU6rfeQaDgYBi2Jgi8=; b=A6eKm/T5fF7OJUBJu8
	uBDMUtuR2BXSND3tVu1sJ6ujOMZ/QOuK9blKH1wOsutFXX1KIk8S0Xb+lU4SQos8
	G83j2HNkgxsdTTfV/pV0TgGb/F9pKwPQSVjf92ABtmioFTlhc2XBhlepo7zfEq2v
	EzsqfnE8JzDgVvsDruH5HGDzTngOMLEF3NbZhayhHrBg2uCbaM7PwuUaiCCBVAR/
	OLe68irW5mgumWIXqq/sO4FkjzXByaAY9AkgdaxBc9zbYxIZ3IQFP+pfUEJNkPwn
	8A1ajkSsQj4893t5TVJCG68+DsSjRyXKI/S8kRD13c9YgsIiCcYKw0urwPQ5Xnxn
	KTpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695966761; x=1696053161; bh=XVvqIfHPHtEcb
	dr5LfkG8vjFGIU6rfeQaDgYBi2Jgi8=; b=QF7vgD4LMXp4C85ROdkiLktIjmG0w
	Os6Iw5kex4POEDPPM4OSU2UopA+Lnl+//6yfEzPbwTASRx8WAA0M0D8gcSPPsoOx
	4PVXvaFyqRDdF1XoJtwi9DKPae1srUnQICyEt1ps9bYQgx1eowlBmK6/1s2hMgA+
	3sPoT+mxVng3J80HH/qZI+Cw4/1GOigZfqA8Dps6h+q1HpBzJVUWTQa58ELJXnwh
	4RE8uAoPCblI2ZtfqYtWQn5Rb7J9nQq4SmdhK+Hh5WazRi5opOW8H/Ooyg/hUXQI
	LPT/NdtlLb6f5seicv9rcjQER1EkEHcUeLDHIvD7lYDrBuaDqNtE3PXxQ==
X-ME-Sender: <xms:KWYWZUylQppie6wVSZBpcbsaMFrmJruDdFkjNEsAgma62xhcWGql8Q>
    <xme:KWYWZYTF6CBRwyKnFDtM-4nFRnP7R-1uXlp4EA2uH3kEQggfnhXqeCw3vonvBDiCF
    haSyrACQpOLOA>
X-ME-Received: <xmr:KWYWZWUJoak3__zdaYqtU3WiHmQbSh9qjGCQZdZLARzTVv-b-PYs-SMl2lr-AG5OXDiFeJySYJ5ZDiZfQSyrRZc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrtddugddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheefle
    ettdeihffhleeltdffffethedvffeglefgkeeiheeitdehheduveehheehnecuffhomhgr
    ihhnpehurhhluggvfhgvnhhsvgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
    rdgtohhm
X-ME-Proxy: <xmx:KWYWZSgqAWx3nWAGG7NcgBRYjnO0eG2nQE--blOzPL0hnS_Crd7IHw>
    <xmx:KWYWZWCngtEekFYLlRm2ZGkmXRVgy9o3-6J85RTtMzJhyP_UViKx-w>
    <xmx:KWYWZTIgaKRkABYp9eDi0i8R-3raV_Lhqpckq4fRyV_YnEWs9WI19A>
    <xmx:KWYWZY31E8JHjaWUU1APyxeqbqc-D8ljyKHIR9aHt6gfTQXlDFFsHg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Sep 2023 01:52:40 -0400 (EDT)
Date: Fri, 29 Sep 2023 07:52:38 +0200
From: Greg KH <greg@kroah.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/3] mmap: Add clarifying comment to vma_merge() code
Message-ID: <2023092922-erupt-pope-aaa5@gregkh>
References: <20230928171634.2245042-4-Liam.Howlett@oracle.com>
 <ZRW1MBvWCCFevIg1@f61ccfac960a>
 <20230928172639.hmnzdsk3y4snjkwe@revolver>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928172639.hmnzdsk3y4snjkwe@revolver>

On Thu, Sep 28, 2023 at 01:26:39PM -0400, Liam R. Howlett wrote:
> * kernel test robot <lkp@intel.com> [230928 13:18]:
> > Hi,
> > 
> > Thanks for your patch.
> > 
> > FYI: kernel test robot notices the stable kernel rule is not satisfied.
> > 
> > The check is based on https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/*option-1__;Iw!!ACWV5N9M2RV99hQ!Oav0h0ZRmSJZ5mOjG5-prYR3nJYyas32Z8AfSgTboijdcVMSWzmyOVzI-s1RuIdzGakIiSzdg1vB$ 
> > 
> > Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
> > Subject: [PATCH v2 3/3] mmap: Add clarifying comment to vma_merge() code
> > Link: https://urldefense.com/v3/__https://lore.kernel.org/stable/20230928171634.2245042-4-Liam.Howlett*40oracle.com__;JQ!!ACWV5N9M2RV99hQ!Oav0h0ZRmSJZ5mOjG5-prYR3nJYyas32Z8AfSgTboijdcVMSWzmyOVzI-s1RuIdzGakIiRhQUpN6$ 
> 
> Right, thanks.  This is part of the series but stable does not need to
> backport this one.
> 
> Sorry for Cc'ing stable on the last patch of the series.
> 

It's not an issue, I think the kernel test robot is a bit pedantic here,
so no worries :)
