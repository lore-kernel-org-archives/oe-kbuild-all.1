Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03E126C18
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763411; cv=none; b=Ib8Al4KxrqSgQdMVgFaxFoPP++j5aXtwfp2qbpf5dy2pP32xGBsXe3NjxjOWOBiDKzNGVkmiHmW/uldFhPLO+C63EpB/FGBsD9F1KR9zt5ds4K5M3fCKTynvvb7zEcVms4jD3jVoMZkeG+3yo/eZSDRC0lOOuWz2ufDcVzaHccM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763411; c=relaxed/simple;
	bh=YY+OIcYgYxSAemBf2BujpW3VGZPT2Y4OzVt1zLxiXj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiwUuDK9D50pwMYOABKaDT0HENhTHxDieQr5eD11mV7sRk/ShEtKR5OrDj7lbstBFS67caoYYeE4RjsGKr3rbNMrNC/56lhbWFOpsomz84W3hF42WCGDar7YHVfUgMplIfUyfcqIyHmY7ZUGcGW0dZSXeHM02ATfufoCIU1jt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOxYGrLh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOxYGrLh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15A0C4CED6;
	Wed,  5 Feb 2025 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738763411;
	bh=YY+OIcYgYxSAemBf2BujpW3VGZPT2Y4OzVt1zLxiXj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOxYGrLheV06M2m5YBrFT8oWGq/L1C/ouMhiplBeLiL3qLqRpn3I87fwcfYTlX990
	 M/q3K65Ol/UE4M53V6WQ4Vkggp4Ivcc1HjWRn6n/HyxJxLq/s+6biwms+cc4wLrMfD
	 SpupaGHVbfGgcxVS4n8KR8WX0Z9K+DElcXN7/QiMnblEOJJv14uRf/bb+CK9UWO/Y3
	 nEki7MFlJLO4wIahdPcKTk6Fq5230Bo4yHBJLADYdiOUjj6kB9FvqrtyAnyIEMnm9g
	 DQBpIBBzVmpi8Fd7dHpHEIJwk1OK4y9co7INfF5GUk9+BEau6OPhFEb7wflhzH8IKI
	 S8PUGctZkUnuQ==
Date: Wed, 5 Feb 2025 14:50:07 +0100
From: Christian Brauner <brauner@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-vfs:vfs-6.15.misc 2/3] mm/gup.c:2270: warning: Function
 parameter or struct member 'locked' not described in 'get_dump_page'
Message-ID: <20250205-tomaten-getextet-8ccae3fc96c9@brauner>
References: <202502052058.brmQ0100-lkp@intel.com>
 <CAGudoHFOAD00iEjGSjbXeVz0F1xxyybANvo+LS-442Jn5NcuSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHFOAD00iEjGSjbXeVz0F1xxyybANvo+LS-442Jn5NcuSQ@mail.gmail.com>

On Wed, Feb 05, 2025 at 01:35:26PM +0100, Mateusz Guzik wrote:
> On Wed, Feb 5, 2025 at 1:20 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.15.misc
> > head:   625aec60ff1462a0620753deeec4a38ddd032e29
> > commit: 62801d0e24907a20b4724b58ce174bc9a2fc3b4c [2/3] fs: avoid mmap sem relocks when coredumping with many missing pages
> > config: i386-buildonly-randconfig-003-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052058.brmQ0100-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052058.brmQ0100-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502052058.brmQ0100-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> mm/gup.c:2270: warning: Function parameter or struct member 'locked' not described in 'get_dump_page'
> >
> 
> how about this:
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 3883b307780e..66d2aec76d99 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2254,6 +2254,7 @@ EXPORT_SYMBOL(fault_in_readable);
>  /**
>   * get_dump_page() - pin user page in memory while writing it to core dump
>   * @addr: user address
> + * @locked: a pointer to an int denoting whether the mmap sem is held
>   *
>   * Returns struct page pointer of user page pinned for dump,
>   * to be freed afterwards by put_page().
> 
> I presume I can avoid sending a full v2 :)

Yes, I already folded your fix. :)
