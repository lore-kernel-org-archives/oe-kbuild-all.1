Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D31898E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733984638; cv=none; b=e4dg7xaLzZG64sT2ZDOlChvERE1QvPIshCjvlB6ZjfrVNFoF6Mx7CryXAnWAOsGCdJ+j1Z1gfVZI4NAqo84c84CZkuNPtYr5bynFq4efg3BGWbj9lNF342v5yIGCS0lMo+SOtwTUpOLAScVgjgTB61zcfppOmJTz9r3lpJPYygA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733984638; c=relaxed/simple;
	bh=X/8fmsw4SvDZiDRK+ySbK6znIVZo79uundghAd9mvRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEpxwbl+t4esASFne9QmU0HYzd7onMw5ZkLglqrmPKo45EN4D09R3rNk/xAan22Pt072nAVbj8qP7t9ps0+NwRV88tsNrw2OpAj/MWASci282OFu9vnz7sVhZf2ZMw9sZd+7aFPZcRj5YiGOVG/lIhtMTG4LkJ46XWEnc1Zxay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2189968D07; Thu, 12 Dec 2024 07:23:54 +0100 (CET)
Date: Thu, 12 Dec 2024 07:23:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Cc: kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: drivers/md/bcache/super.c:108:14: sparse: sparse: restricted
 __le64 degrades to integer
Message-ID: <20241212062353.GB5586@lst.de>
References: <202412071044.tthTVBw4-lkp@intel.com> <33E9C2B1-BF96-46DD-BE45-00811C986ABD@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33E9C2B1-BF96-46DD-BE45-00811C986ABD@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Dec 11, 2024 at 12:34:20AM +0800, Coly Li wrote:
> >   drivers/md/bcache/super.c:108:24: sparse:     expected unsigned int nr_keys
> >   drivers/md/bcache/super.c:108:24: sparse:     got restricted __le16 [usertype] keys
> >>> drivers/md/bcache/super.c:108:14: sparse: sparse: restricted __le64 degrades to integer
> 
> It complains about line 108 which is,
> > cafe563591446cf Kent Overstreet   2013-03-23  107   err = "Bad checksum";
> > cafe563591446cf Kent Overstreet   2013-03-23 @108   if (s->csum != csum_set(s))
> > cafe563591446cf Kent Overstreet   2013-03-23  109   goto err;
> 
> Here s->sum is __le64, csum_set() is uint64_t, these two types have same length. I don’t see the direct connection between code and warning.

The are the same size, but not the same endianess.  In other words this
is a hint that this code is most likely broken on big endian systems
due to the lack of a bytespace (which is a no-op on little endian
systems).

