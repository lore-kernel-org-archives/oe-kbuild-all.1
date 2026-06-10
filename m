Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0680F3AB26C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091924; cv=none; b=BghvxoTjU19JfP/xicfoYq6lGSaAzuSvV0VmVBd0COJ9nqmfyzr9CR/BpQpqCgh11EfpRsUDic+DvShoRCBr+pO7UhOjFsky9FBEB6FtKjuLy8HeFdAF4das5aEdqLyzdxbBiJ563oN3QunC4uabCXwEjpex8W6aEkeBer3OjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091924; c=relaxed/simple;
	bh=IcFP81fSvikHyth7boSSI3EfrUiHI5U+dn0MbAm5gk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3xBoWXEFyDp9m+T2vL/DU04jfQRu38AS4hmA2gOXhad5x7tnJy/m/52AcjphVu6RLNwWZyX/yTU6VqQee/PV1rSKvcPyi7xk7l6+QTxXMDr7otoiLAb0IdSMP/xNeq3T1BBEgKqe0ubA8G8T0dTF9gSH+lhNHfefZ3hbKjHtmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id D25AE68AFE; Wed, 10 Jun 2026 13:37:57 +0200 (CEST)
Date: Wed, 10 Jun 2026 13:37:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild-all@lists.linux.dev
Subject: Re: [hch-misc:block-error-injection 3/4] block/blk-core.c:141:33:
 sparse: sparse: cast to restricted blk_opf_t
Message-ID: <20260610113757.GA18273@lst.de>
References: <202606101953.PdmBi8go-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606101953.PdmBi8go-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 10, 2026 at 07:22:03PM +0800, kernel test robot wrote:
>    139		for (i = 0; i < ARRAY_SIZE(blk_op_name); i++)
>    140			if (blk_op_name[i] && !strcmp(blk_op_name[i], op))
>  > 141				return (enum req_op)i;

My spare on x86 and varous cross builds is perfectly fine with it.
What sparese version is installed on the microblaze build box?

