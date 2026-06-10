Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED93B42C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092754; cv=none; b=EAV89+sq+QGxatCu4T4ZOHNPdal6EZxH1ItfT7ivC7TTwThNxaLp4U/HmUgLO1pyYxkROPktktAsrmQGzt/nLpKWyICgUdr+YQHPLzNrC9+EI3tM+vryyIcoVGivcu6sG6jNmirgq/SF1j+tJc6sq83mfJXYBBpLkvH5GBOvjLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092754; c=relaxed/simple;
	bh=3lAV0Rx6lP26WBih1OzsHvbz8b7/5U9ceTGoQHqa8mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+iGfoISQsgRxoVo7q1UxXyLWHjTxvV+eNSDwJY7oZI/wsNB6e4E9Yc2L2fNNMThlB1GwnU8dHxO4fMp/F2ip1fkHGy9E/O7yO6RijfMrpC2r9sq54039jYvVljqpcDXv9x33ADWH378zjiHtPEZfRv5sDj9SMy/53AB08tB5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 941D068BFE; Wed, 10 Jun 2026 13:59:10 +0200 (CEST)
Date: Wed, 10 Jun 2026 13:59:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Philip Li <philip.li@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [hch-misc:block-error-injection 3/4] block/blk-core.c:141:33:
 sparse: sparse: cast to restricted blk_opf_t
Message-ID: <20260610115910.GC19624@lst.de>
References: <202606101953.PdmBi8go-lkp@intel.com> <20260610113757.GA18273@lst.de> <ailRL3E4dtN6/mUE@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ailRL3E4dtN6/mUE@rli9-mobl>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 10, 2026 at 07:57:35PM +0800, Philip Li wrote:
> On Wed, Jun 10, 2026 at 01:37:57PM +0200, Christoph Hellwig wrote:
> > On Wed, Jun 10, 2026 at 07:22:03PM +0800, kernel test robot wrote:
> > >    139		for (i = 0; i < ARRAY_SIZE(blk_op_name); i++)
> > >    140			if (blk_op_name[i] && !strcmp(blk_op_name[i], op))
> > >  > 141				return (enum req_op)i;
> > 
> > My spare on x86 and varous cross builds is perfectly fine with it.
> > What sparese version is installed on the microblaze build box?
> 
> The version used is
> 
>   sparse: v0.6.5-rc1

That's pretty current.  No idea why this generates a warning on
microblaze, but not elsewhere.

