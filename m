Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8D6DF72
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 18:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764614120; cv=none; b=TGWdy3Y3Edu6Ib4++o5ZX3R9GmORKMUe4WQK+qTu1v+l9yWQb7NeF16bs6fBXX8C87DQ3fha///9f3xUUNxXghBoC7eVqmPnlRUTAE2LAiZdwRmVytGPw2YNCmknqDRd2/X10oUSeo8HPQlX1VypLZPuiSfeDAi61i0QtrdJ2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764614120; c=relaxed/simple;
	bh=C+PXX3TOApAr5yIkyBDCO/YnEJTvHNDcx0zbS8RWuo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6zfIdsRHdOF2XluNMcgsAtbXw8jmD4sO7+eSNS3MsOTim6ojDx6A4vfKH7rEnF6cB7bTlhjk8DXPaVs6euDMiJ5So0IoJFxtJp8owBLaNdQyXogmOeKfVH6CLA/Y46VeJMBsoLZapSXmoyuSNkwHXZdHw+03xlDg5lOiayPwCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/OUjqU0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/OUjqU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A12C4CEF1;
	Mon,  1 Dec 2025 18:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764614119;
	bh=C+PXX3TOApAr5yIkyBDCO/YnEJTvHNDcx0zbS8RWuo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/OUjqU08RImBKwbXe3HoyKAfQrHF13YwcBL6PFxHE/LaYIw0GwJatMUx5vwEOmsb
	 5/syDHnYFdQla89Zr3zFQUIwqBuXZVUEgkbyOcKOeOe7GNF0LnlhvxVPuMGAE3maBC
	 X1lAhhjFAY4M2ILeVOqkGdCVVw3YcYGAwGvjrmGoCWGtumz0ZnsrPIiu7S9k6JACpq
	 wOgqpllFNfXrYPkRAJSNKXq9CWRWrD0Wpjv1Pc1exZWaw5asHG1pdagwzrZpatTch+
	 OQGGkZmlc7VNxbQKRKFTOmpCtneNV946UFUoyEAtrRKCkTfn+4bmPLZZCETdsCGSiD
	 shF4gLjANY8ew==
Date: Mon, 1 Dec 2025 20:35:16 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [linux-next:master 12420/13171]
 include/linux/compiler_types.h:602:45: error: call to
 '__compiletime_assert_293' declared with attribute error: min(burstcnt, len
 - count - 1) signedness error
Message-ID: <aS3f5Enpz7qj6u8N@kernel.org>
References: <202512012040.BkoYgkkr-lkp@intel.com>
 <20251201124256.328f4f35@pumpkin>
 <aS2ljp-MWo_7ZTjJ@kernel.org>
 <20251201161228.3c09d88a@pumpkin>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201161228.3c09d88a@pumpkin>

On Mon, Dec 01, 2025 at 04:12:28PM +0000, David Laight wrote:
> On Mon, 1 Dec 2025 16:26:22 +0200
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > On Mon, Dec 01, 2025 at 12:42:56PM +0000, David Laight wrote:
> > > On Mon, 1 Dec 2025 20:18:45 +0800
> > > kernel test robot <lkp@intel.com> wrote:
> > >   
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
> > > > commit: 9ce4f8e56bd2ed2bd473572bbd4c1a7f8863487c [12420/13171] drivers/char/tpm: use min() instead of min_t()
> > > > config: xtensa-randconfig-r123-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012040.BkoYgkkr-lkp@intel.com/config)
> > > > compiler: xtensa-linux-gcc (GCC) 11.5.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012040.BkoYgkkr-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202512012040.BkoYgkkr-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > >    In file included from <command-line>:
> > > >    drivers/char/tpm/tpm_tis_core.c: In function 'tpm_tis_send_data':  
> > > > >> include/linux/compiler_types.h:602:45: error: call to '__compiletime_assert_293' declared with attribute error: min(burstcnt, len - count - 1) signedness error    
> > > ...  
> > > >    drivers/char/tpm/tpm_tis_core.c:456:28: note: in expansion of macro 'min'
> > > >      456 |                 burstcnt = min(burstcnt, len - count - 1);  
> > > 
> > > I hate compiler differences.
> > > Usually the:
> > > 	if (burstcnt < 0) {
> > > 		...
> > > 		goto out_err;
> > > 	}
> > > a few lines higher is enough to make the statically_true(burstcnt >= 0) pass.
> > > 
> > > I'm not sure why it doesn't here.
> > > 
> > > 	David  
> > 
> > It is already part of PR, which I've revised already once in order to
> > drop one patch:
> > 
> > https://lore.kernel.org/linux-integrity/aSnQZ4pRWqJai6FW@kernel.org/T/#u
> > 
> > Since I don't want to end up into a cycle of iterations with this I can
> > at this point drop the patch, unless better suggestions are available.
> > 
> > I.e., I'll update PR one more time dropping this patch.
> > 
> > We can revisit this during rc cycles. I'll hold on for a while before
> > taking action in order to leave a bit window to respond. Just need to
> > address this quickly, that's all.
> 
> I need to go through that patch set (it hit 223 patches for allmodconfig)
> after the merge window and decide what to do with it.
> There are a few real bugs in there where the min_t() cast does discard
> significant high bits.
> 
> The pattern that failed here works most of the time.

OK, yeah, this was what I suspected actually :-)

I just wanted to communicate what I'm about to do before I do it,
and appreciate the quick response, thanks.

I'll create +1 iteration of my pull request and drop this commit
from my master and next branches.

BR, Jarkko
