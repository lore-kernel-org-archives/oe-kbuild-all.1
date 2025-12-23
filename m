Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BE072621
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766526420; cv=none; b=QINK2xcglPcjdpT16WnCHLplWGpJx4g5f89jpTZqUn5E+0SUWTwi1+FlsaUp/G4aG7izf4SIGiHXdReFiRTJhpSio1UANohCrUrVwofDXs02pTzOyTa1XZi/q2DTEGZ3FPaq5UzTn/fNZo4y6MaOqqBanbqEckIwjSYmh/QF5fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766526420; c=relaxed/simple;
	bh=D5TttSqMlqerQSdX1xm69GYsdKr+AusNH9dB9rNit18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1w280xmP6AniNZoW59PTH0lcQBaGWgyXjrWLJZNo2crXbot/atqbxqnSCKp/xhA/qfgbng0ebQIAomQe7pPAlHcvETyoEFuPuPlPqNhyBgBwEe11h0kja2IFD+1BuctU6cQAyRFAnnUCrcfx3EQW1RD+xGHvCL2RcHw6BPmNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 38A0C227A87; Tue, 23 Dec 2025 22:46:53 +0100 (CET)
Date: Tue, 23 Dec 2025 22:46:52 +0100
From: Christoph Hellwig <hch@lst.de>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild-all@lists.linux.dev
Subject: Re: [hch-misc:inode-time-nowait.4 5/11] fs/inode.c:2139:16-23:
 duplicated argument to & or | (fwd)
Message-ID: <20251223214652.GA21545@lst.de>
References: <f1bd8b4-fe38-66cd-61d-7d3551e1963@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1bd8b4-fe38-66cd-61d-7d3551e1963@inria.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Dec 23, 2025 at 10:12:27PM +0100, Julia Lawall wrote:
> Line 2139 repeats the same constant.

Thanks!

