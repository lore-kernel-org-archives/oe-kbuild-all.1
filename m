Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339B3B777F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903453; cv=none; b=VPV4a1rBUWIlaaRjhT4eagxMONRxxOmD0etOV9UI95YrelHandSvVEaWioF+Y/hvSEHjc9KDa+kgKDYBPVsPJzJIFfDz5rr3Im9NjibW2xdtXlJ4rm3pOYK32oSrJmm0YJ1nz2eSHP1YtIlBEg2F7WD6/MuUIH47hW2WuqlXLP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903453; c=relaxed/simple;
	bh=YhWojvT9wYWs1cQpVWz306uk1buWLcs5clK84YfUDfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubLxbTuZokq7GOgoVIy9IkzPxD+WM9grVJjvvMkGnCkOSrTcYOZom+3gGkfszZh/l22MUjsJC1l4/7E1N0yBzH25CEf0gYutYbAwbPLpuWIAFnvdDtcU85lgE/Oqk850pn2YCkejGreXS1PpQpX5hHPePiONLCQJ/y9geR7GXeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIfhipeb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIfhipeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D82A1F00A3A;
	Wed,  1 Jul 2026 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903449;
	bh=QHTZ7y1CbltFKBhUyiqJWgV2CypK0s29pVOZ9wt73iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WIfhipebzOXrvZjUltLEOLNJWeXWerIUhBVMbnj8UQagtkTsE68hm7tKRqYsYY5Gc
	 hpulLu4uz06RXiJU3TBhfiwmwsQjzSFynPsf5bTltff00jDYaSLT2wupxNRDwIuuH9
	 jRWiPW5w6kXx1U790AtnwBQQHC6Ua+H3DDZSNDNR9t2RjKCuuM+69jAKrdWK9JDRID
	 WuiUYDnp5DcsT7ZgUuM9k6714EJOHK97P5A9iHphIhFeDhjVGWShmnrISNzJN1GUKh
	 FrRO3wbr+SzdGwcJA9UohbBnWVPvx2F8FQjUhSkscPKMiU13oySB+98q9G4K8pMxql
	 k7oVCTOQuLQlA==
Date: Wed, 1 Jul 2026 12:57:26 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-github:vfs-7.3.iomap 3/3] fs/iomap/ioend.c:16:16:
 sparse: sparse: symbol 'iomap_ioend_split_bioset' was not declared. Should
 it be static?
Message-ID: <20260701-hengst-akupunktur-analphabeten-d768a9b9610a@brauner>
References: <202607011411.SFoYmRJa-lkp@intel.com>
 <20260701103445.GD12719@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701103445.GD12719@lst.de>

On Wed, Jul 01, 2026 at 12:34:45PM +0200, Christoph Hellwig wrote:
> Yes, it should be static, sorry.  Fixed version below:

Np, note though that I already fixed this in-tree!
