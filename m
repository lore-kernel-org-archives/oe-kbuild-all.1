Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4022E3E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706554773; cv=none; b=JTWvDYr8JrWaj95vLZooTaBFWgSbUhXmL/dPmvq0PXLkhj/uN/3vgvzSuEUHGGLwaVD5B8iC5jkddmHHC3kOmbHDSYKuWygClqsHKoykZ6sE1vVMWowb6zV5mZw/MkQEF4rm2ug4s6ng2N3xWlzkozvLyVBhWCSfa4HEfQsTwv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706554773; c=relaxed/simple;
	bh=8YqREoLKPrWeWyGuy7TPpeeNb3ZPIZGchYantxFxeGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOzb4W9xcg24mIPCSEFrnpB+y7G/SOvZu6aD6rEI8cyYpmivpJAazVoE6eUUJle57RkPExSztuaF8I5rW//ZaxGL2+Bi6p5Fh54vJeA3CMhnYPI9/vC+S9QBNbxiKL/JXN6ShrAYliblrvYOm1ZSvfSRiiRhl3GXSHvtMcaDpXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 3731E1402F9; Mon, 29 Jan 2024 19:59:21 +0100 (CET)
Date: Mon, 29 Jan 2024 19:59:21 +0100
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: drivers/of/unittest.c:573:43: error: 'struct device_node' has no
 member named 'kobj'
Message-ID: <Zbf1iWjTTVcG21sj@cae.in-ulm.de>
References: <202401291740.VP219WIz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401291740.VP219WIz-lkp@intel.com>


Hi,

On Mon, Jan 29, 2024 at 05:43:34PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   41bccc98fb7931d63d03f326a746ac4d429c1dd3
> commit: 4dde83569832f9377362e50f7748463340c5db6b of: Fix double free in of_parse_phandle_with_args_map
> date:   3 weeks ago
> config: arc-randconfig-r031-20230520 (https://download.01.org/0day-ci/archive/20240129/202401291740.VP219WIz-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291740.VP219WIz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401291740.VP219WIz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/of/unittest.c: In function 'of_unittest_parse_phandle_with_args_map':

My fault. Sorry. I will send a fix.

      regards   Christian

