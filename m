Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD722541D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880157; cv=none; b=BC3IRZiUvKZbp26jE22yevl+pNHcGpdpCdfpbA903Cu+jzji71bkMtequu2zvGIilsS4yORMtxPGX6J0TWuA9/gwKl92oWPgsEDG2pmwVEm+4XS/RzQx468VvNbgxloE0oEy/a4L9d3gu8RkbNUKgaWU4Fee+JbhIVY8fRtPSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880157; c=relaxed/simple;
	bh=Pj0rkXbXHlC1i+JkhrKO5ulby40T9aLidjFMy0AMCk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skd9VSHFKpU2fm1j5q/yZh6qnjoBW7k6nC3HXKF/FBPtut6Uz6WVGOHSmMzH0Wj+ztPzt5CKatjk/49DDZClqne++Uo4aqgv/5045aOqlwoOuwQtibTRXPnC8pGFvezK7DV/Hu++gKVTwbNHlKT3ALmrfZo3oHiv674eP16FJx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v2B+q/IX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v2B+q/IX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB714C4CEE4;
	Thu, 17 Apr 2025 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744880155;
	bh=Pj0rkXbXHlC1i+JkhrKO5ulby40T9aLidjFMy0AMCk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v2B+q/IXVHmJBHqOTczY21YNxzQzSlFRAZts6jXP+xzK+oqh7eFtOntlQRmA2CpcJ
	 YLrNcT3E2TF7/Vg+S5xsK28G7QN4gkqJ6p0rv50regOdlZqUqKWFU4xZwgZiAPkULL
	 nZnP1mWWQBVIan72t38zKK1WJ89VONrbAy3Vj/hs=
Date: Thu, 17 Apr 2025 10:55:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [char-misc:char-misc-testing 9/9] ERROR: modpost: "init_mknod"
 [drivers/misc/misc_minor_kunit.ko] undefined!
Message-ID: <2025041733-clerical-maybe-f349@gregkh>
References: <202504160338.BjUL3Owb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504160338.BjUL3Owb-lkp@intel.com>

On Wed, Apr 16, 2025 at 03:23:15AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> head:   9f240f7b8e40bdf35e45fce5c6a5e956db3938ce
> commit: 9f240f7b8e40bdf35e45fce5c6a5e956db3938ce [9/9] char: misc: add test cases
> config: riscv-randconfig-002-20250416
> compiler: riscv32-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build):
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504160338.BjUL3Owb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "init_mknod" [drivers/misc/misc_minor_kunit.ko] undefined!
> >> ERROR: modpost: "init_unlink" [drivers/misc/misc_minor_kunit.ko] undefined!

Thadeu, I'm going to drop both of your patches from my tree now, can you
fix them up and resend?

thanks,

greg k-h
