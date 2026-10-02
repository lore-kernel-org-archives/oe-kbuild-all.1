Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632E3A5456
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 05:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790919420; cv=none; b=sJCa2Q0KrbGalGZd5A9mnwxiQEo9b35qRseN8lZdgVIunDlehyGZnNRyYzKzWcAg2DhMsH6VAVP9Jq86IPppXAftjteVLV/VJxbkqN3TgsC4oVeM/NgneGXmMErzO76dLPqePAiRZtpTfK9w/0aJKhODkm2Kl+VBqG2IyGOBHDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790919420; c=relaxed/simple;
	bh=FFS426rM6iDViDm4tEF1/CLNsK8sgyoqOl/lycTuKKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqZKEREgxbWpPvTblTRYx+sGavG5+ImeXXVwXu2pYKTntElVDifHu3Tu8JKGiCQ4fWkULT5dh1KJMD5GxNLNqeD3QvVaGiLXlxzbOo1QD5hc5IIrD/J8C+75kgfsQxScmqbnelUkPCqqZkQeS9JKkm07xBGYvsBhZ8RAQ8q+2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yt/QrV9T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yt/QrV9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCD01F000FF;
	Fri,  2 Oct 2026 05:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790919417;
	bh=kbNvNlpHgf4vVaqbUI6QYRQ7b9FNb271W7g4dYHRRFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yt/QrV9TMCiBxFOjRXNsOPwVbDokPeVaJH1U0bNm/HtgrLooegdyODbcd0nFAfrOy
	 LYZVs9Cce8kpi42instybzDtKLmi9baruIQHFVLjNqTQIwUn6D8d/z2HDFuD+gZG+S
	 33uD2TAE7iK1du9QHnHodEhjlQi6PARNglCX/sHA=
Date: Fri, 2 Oct 2026 07:36:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Elder <elder@riscstar.com>
Cc: kernel test robot <lkp@intel.com>, Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [char-misc:char-misc-testing 19/37] kismet: WARNING: unmet
 direct dependencies detected for PCI_DYNAMIC_OF_NODES when selected by
 TC9564_PCI
Message-ID: <2026100222-open-roulette-a782@gregkh>
References: <202610020124.ieOiopjQ-lkp@intel.com>
 <360cd521-5abc-49df-986e-cfe9be73a37c@riscstar.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360cd521-5abc-49df-986e-cfe9be73a37c@riscstar.com>

On Thu, Oct 01, 2026 at 08:16:33PM -0500, Alex Elder wrote:
> On 10/1/26 6:52 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> > head:   04434a1d0f311d76b1f15fa987918b471a0b8c6a
> > commit: 1304b0c47ef81cbd21e51ea0645a98104393ba49 [19/37] misc: tc9564: introduce base PCI driver
> > config: m68k-kismet-CONFIG_PCI_DYNAMIC_OF_NODES-CONFIG_TC9564_PCI-0-0 (https://download.01.org/0day-ci/archive/20261002/202610020124.ieOiopjQ-lkp@intel.com/config)
> > reproduce: (https://download.01.org/0day-ci/archive/20261002/202610020124.ieOiopjQ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610020124.ieOiopjQ-lkp@intel.com/
> > 
> > kismet warnings: (new ones prefixed by >>)
> > > > kismet: WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES when selected by TC9564_PCI
> >     WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES
> >       Depends on [n]: PCI [=y] && OF_IRQ [=n]
> >       Selected by [y]:
> >       - TC9564_PCI [=y] && OF [=y] && PCI [=y]
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> I'm about to send a patch that fixes this.  Greg, if you'd prefer
> I re-spin the series (or something else), please let me know.
> 
> 
> I did originally have "depends on OF_IRQ" under TC9564_PCI.
> 
> However I hit this:
> 
> error: recursive dependency detected!
>         symbol GENERIC_MSI_IRQ is selected by IRQ_MSI_LIB
>         symbol IRQ_MSI_LIB is selected by PCI_XGENE_MSI
>         symbol PCI_XGENE_MSI depends on PCI_XGENE
>         symbol PCI_XGENE depends on PCI_QUIRKS
>         symbol PCI_QUIRKS is selected by TC9564_PCI
>         symbol TC9564_PCI depends on OF_IRQ
>         symbol OF_IRQ depends on IRQ_DOMAIN
>         symbol IRQ_DOMAIN is selected by IRQ_DOMAIN_HIERARCHY
>         symbol IRQ_DOMAIN_HIERARCHY is selected by GENERIC_MSI_IRQ
> 
> So I removed that dependency and the problem went away.  I'm
> sorry I neglected to spend more time troubleshooting that.
> 
> So far I have found two options to avoid the recursive dependency:
> - Use "select OF_IRQ" rather than "depends on OF_IRQ"
> - Use "depends on OF_IRQ" but then use "depends on PCI_QUIRKS"
>   rather than "select PCI_QUIRKS"
> 
> I like the second one better.

Second one seems better to me too.  ANd a fixup patch is fine.

thanks

greg k-h
