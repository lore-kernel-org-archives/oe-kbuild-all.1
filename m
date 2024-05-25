Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D112B83
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716625932; cv=none; b=Ca0H3n56C7VDoZmJXt6FjG0IlqTSQiMthZ5xDgTT8vwgq8LlESEDcUE6wWMLbTI4tuBjUwPQc2+zafObdbHCtV2vHz9t903ol9XOsK4M//CCs5DptuYvIDI264FaCZ/npphewTaMHYJbl2ZcE6Xv98+DChbl+MNJfDVGdp0+C6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716625932; c=relaxed/simple;
	bh=hcw5pZWbSFXCHqThJ5IaouqprfaR9MI2ld8Q2uaN7hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIzq6nIjNryY+6dtXQMJb7qopXpgW10OR4104ZmIi64lrRqLDNzyFx76ls7f4ytEWa7YbrutpKxCdLNpRnotfl7tR8Eclx3xwpVm+DdHQg8zYrvDWE3vy4kCjZmB24bh9jyMpfYJ6fOQ+lAd1seCOoZEOc8BET9ZWd/92AvoL2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g5WYrvgx; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g5WYrvgx"
X-Envelope-To: philip.li@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716625926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uVOKLNS5bleQgasiPS65AwbAWNrFEBXBiff/dOJcxsA=;
	b=g5WYrvgxAdCRVnihnye7dwKpP4H4j5ijmCmn+yDsxUgUSzSw3b06zXKhmTSo9IWISHtTbY
	D5u2271kk1AMEGEYABf7YKksCoZHM05dnUUghqItj+iHYz64cXnvDtQJee9OJaTgBvc/Lq
	Yw6t3qv81guqUwbx8/LUlaT3z6UkhUo=
X-Envelope-To: lkp@intel.com
X-Envelope-To: surenb@google.com
X-Envelope-To: oe-kbuild-all@lists.linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: linux-mm@kvack.org
Date: Sat, 25 May 2024 04:32:03 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, 
	Suren Baghdasaryan <surenb@google.com>, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: include/asm-generic/percpu.h:31:40: error: implicit declaration
 of function 'raw_smp_processor_id'
Message-ID: <2b5jetp5exc7jwjqhdvwnrttp3b7gge4pqq6jjvjc7aj6zzqtk@5aghxx2x4u6q>
References: <202405210052.DIrMXJNz-lkp@intel.com>
 <d5ldg2u6kqgpiv7p42al7yp7zn2bpd3qrwmv76ccmzbvw5ag6x@enbx3xdtry4s>
 <ZlGcfHD3ZCNKWDdr@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlGcfHD3ZCNKWDdr@rli9-mobl>
X-Migadu-Flow: FLOW_OUT

On Sat, May 25, 2024 at 04:08:28PM +0800, Philip Li wrote:
> On Fri, May 24, 2024 at 11:58:30AM -0400, Kent Overstreet wrote:
> > On Tue, May 21, 2024 at 12:31:18AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   eb6a9339efeb6f3d2b5c86fdf2382cdc293eca2c
> > > commit: 24e44cc22aa3112082f2ee23137d048c73ca96d5 mm: percpu: enable per-cpu allocation tagging
> > > date:   4 weeks ago
> > > config: mips-randconfig-r133-20240520 (https://download.01.org/0day-ci/archive/20240521/202405210052.DIrMXJNz-lkp@intel.com/config)
> > > compiler: mips-linux-gcc (GCC) 13.2.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20240521/202405210052.DIrMXJNz-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202405210052.DIrMXJNz-lkp@intel.com/
> > 
> > I have a fix I'm testing for this but it's going to need a lot of
> > randconfig build testing on all archs.
> > 
> > Philip, could 0day help out with that? I don't know how you schedule
> 
> Got it, we will cover this branch with randconfig build tests.
> 
> > which branches for which testing, and previously the memory allocation
> > profiling didn't get enough build testing before Andrew merged it.
> 
> Sorry about this, we really need extend the test number to generate
> more randconfigs.

It was getting caught by 0day in Andrew's tree, I think it may have just
been a timing thing. This is (one of the reasons) why I'm hoping to get
you a dashboard (and maybe get some test infrastructure consolidation
going, too) - right now I just have no way of knowing how long the
randconfig tests take or when they're finished.
