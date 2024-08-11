Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F289D17BA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 05:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723354701; cv=none; b=EzBuwPVzegBM8jeKHwQgLmTFM/+puB/65Y/plUMy6DPfAKlQvCXwCWJSMlBhGmnYAbLxj6f+Qy7Axqxavi9ZD4oU++2k1CnTCHv0vpdWM8xrJm/djU3Q7Ti+pnJN6ioOLzb5pi/NlrS+K0RZTfwsXyP6i/7rC3nOIkzV+sD24Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723354701; c=relaxed/simple;
	bh=XNboJLyi3dtFFwBalULSOFY5DvxVsN+LYWwhxnwlxLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ma2QdWPxdi7Me/Jx9dFyEhoRfsgbbMDMHSeOzdkLU/ng8guLgO4pXRm93KzE5iGu9u48/Vb+PobNcJWMRe26kg/r3h7yA+gmAMeNlYCAc79cUA6VTf45slxViT6eBAteNoTGQVC2bGOGb5ghNINDA7Qd89NTMn6+qOsqJW/+VgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3764A68AA6; Sun, 11 Aug 2024 07:38:09 +0200 (CEST)
Date: Sun, 11 Aug 2024 07:38:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild-all@lists.linux.dev
Subject: Re: [hch-xfs:xfs-per-rtg-bitmap 5/5]
 fs/xfs/xfs_rtalloc.c:1015:2-8: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <20240811053808.GA10059@lst.de>
References: <202408101851.inX7AvrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408101851.inX7AvrE-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Aug 10, 2024 at 06:52:18PM +0800, kernel test robot wrote:
> cocci warnings: (new ones prefixed by >>)
> >> fs/xfs/xfs_rtalloc.c:1015:2-8: WARNING: NULL check before some freeing functions is not needed.


>   1023		if (old_rsum_cache) {
>   1024			kvfree(rtg->rtg_rsum_cache);
>   1025			rtg->rtg_rsum_cache = old_rsum_cache;
>   1026		}

So while the check before the free is indeed not needed, it is needed
for the assignment just below, and I'd rather keep them together for
clarity.

