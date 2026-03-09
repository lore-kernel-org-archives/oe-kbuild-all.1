Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB414EC73
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092788; cv=none; b=Zp08m8H80KsxXpDqqdlx4q8xOGQvu8R2sXWzPJbXDVSELLjNGyEUk0xl62akgzB1S3D6Ia7R4zpnOCG/DshIdObW2tNbQ3MOwmLCedBc1VVQPD39r+dGUly5s8bizE21KNJCRxZG5jWxf2a2XCKmc4SLptdzRjD0tHTg++X6fi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092788; c=relaxed/simple;
	bh=WujsYw44Txd106pWh0AwIWUt2CMnSXjMUPKghBdPMNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQJ4ddz/0kXyjL2fVJBViNjakQMJOOmz5u7VeY65Djc5lQtwEavouox8jt8JfTR+VDm2KV8YepS5Hi6uwvkTTPbIggxQj3ACwHtxmJF/Pl+NL4i+Y4ySkxVqIKFlbePym3GzsN4HMD/qk8z116eBIm3Tt9a3TudrH1pgel9hVN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id F09F260D3A; Mon, 09 Mar 2026 22:46:24 +0100 (CET)
Date: Mon, 9 Mar 2026 22:46:25 +0100
From: Florian Westphal <fw@strlen.de>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast to
 non-scalar
Message-ID: <aa8_sTGkwVy3o5ww@strlen.de>
References: <202603082002.ACHbGTsI-lkp@intel.com>
 <ea2aaffb-c124-4fcb-9070-a13603f06393@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea2aaffb-c124-4fcb-9070-a13603f06393@suse.de>

Fernando Fernandez Mancera <fmancera@suse.de> wrote:
> Hi,
> 
> Is this a false positive? nf_synproxy_info struct is smaller than the 
> word size and therefore READ_ONCE() should be fine. I guess I can use 
> READ_ONCE() for every struct field.
> 
> What do you think Florian?

We shouldn't do per-field accesses here, but one, single READ so
the datapath sees all new fields or the old ones, and no mix of the
two (albeit that would be harmless here).

Can you experiment with a cast to u32 to get rid if the warning?

That said, we have so many sparse warnings that getting rid of this
warning isn't high-prio, I think the code is fine as-is.
