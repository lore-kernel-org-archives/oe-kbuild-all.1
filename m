Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200BF1B3F23
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725890919; cv=none; b=VBEsWM9cQb4NU0wHNntihaagAC09OUrn7VaWb/543F5KTif9py4uy/QNb+4bSUsbjpWWDsGkqX687tEJzmPESh1IcukZvpxjjGwgLmKJU9ZD7RZXBuZRUpog/bzeLkJWKUA2HtWGJ2a4ebB+/fOv825auUTjwtGY56aBjT10IwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725890919; c=relaxed/simple;
	bh=fWtrmL7vyNELNLHMaHWVfDIhYOJDh0LTs+S30kEl8RA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fORGFw+9/jYZ0QJafJ//yPrhKja97WCXcUlaE9tuE+nEA9jGhXvZW1x99m111I9YgqlGbkIhpytB/GulWWBtrw+xjUro1xleOQAioJZTnaj1H46565HYqEAAQXOBRDv4vyrdgts3N2ujZe0p/2U0pzFTLAgFSrD6yqMsneR93wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 55C8D92009C; Mon,  9 Sep 2024 16:08:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4EB8C92009B;
	Mon,  9 Sep 2024 15:08:34 +0100 (BST)
Date: Mon, 9 Sep 2024 15:08:34 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: kernel test robot <lkp@intel.com>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: {standard input}:4719: Error: opcode not supported on this
 processor: mips32r6 (mips32r6) `dmfgc0 $6,$9,7'
In-Reply-To: <202409070438.79SGqcTc-lkp@intel.com>
Message-ID: <alpine.DEB.2.21.2409091500570.60835@angie.orcam.me.uk>
References: <202409070438.79SGqcTc-lkp@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 7 Sep 2024, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b831f83e40a24f07c8dcba5be408d93beedc820f
> commit: a640d6762a7d404644201ebf6d2a078e8dc84f97 MIPS: mipsregs: Set proper ISA level for virt extensions
> date:   7 months ago
> config: mips-randconfig-r111-20240819 (https://download.01.org/0day-ci/archive/20240907/202409070438.79SGqcTc-lkp@intel.com/config)
> compiler: mipsel-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070438.79SGqcTc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409070438.79SGqcTc-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    {standard input}: Assembler messages:
> >> {standard input}:4719: Error: opcode not supported on this processor: mips32r6 (mips32r6) `dmfgc0 $6,$9,7'
> >> {standard input}:4731: Error: opcode not supported on this processor: mips32r6 (mips32r6) `dmtgc0 $2,$9,7'

 This seems to me like a genuine underlying bug uncovered by the commit 
referred.  This is a CONFIG_32BIT kernel, so 64-bit instructions aren't 
supposed to be emitted, and the macros concerned won't produce correct 
code for the 32-bit psABI anyway if to be run on actual 64-bit hardware 
(where unavoidable due to hardware oddities we sometimes do permit 64-bit 
instructions with the 32-bit psABI in a careful arrangement, but it isn't 
one here).

  Maciej
