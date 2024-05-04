Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242384FAA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 22:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714862841; cv=none; b=nKQcu9ixdgufSNaYcu1h2+eHU9vJP6Y27zJL2YtJBNT4kXkkFyffFSTX8XcH9y2M6m6Zh313MeAs1I7lnU+W9BHvRYed0NHj2uArcTFEhfudqILerEKk5uZrt0UCX7a9sU1zEirDcv4HJifCLlWlypNsfUwpLrnCXC0QaCpVzTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714862841; c=relaxed/simple;
	bh=Yf7l4TkiQG1ZwFgtEfA4LhegiVNbEgdb9YlsGKAnFVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1I68cCn+CxJwbxP28zPtRMVn0++5vxAj0PYjj33w3d80BrHYL4OlqmjnRW4G9crxyiEkSST2QKq5NacD/lUs1xvDnlj5KVE+oAmXkIjokaQkaQtUiM3UpFy7EOxFxAOoUKmp0czD7ftogjgZJraeYjeDC1ihnFfvJlvfXhm0L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ef6uEmmG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ef6uEmmG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7mjooXHU8nB/XGYMNHSMZnDBMj3hnPkOp0sLVPuWzkE=; b=ef6uEmmG9k6P3d0gn/ebUsb6Qh
	a2nwNNPGo4u4awHiPAfRSH2pdh0ON3U6LYEyaYBAU5Lp/SPINP7CBVC1md4RgKeolHeGKp2KekM04
	CVH0qW40mPu3y+04TUiZeRPHgSN3+6GvDWiYAX4dBrPI8Kno2UTpkgIhxaUBq5Hh0xQdhBw93Pb3X
	5P8NW8IJCKB1+gj1ifRzMy/cbCb17O8hXZFG+gEAimRRi0al8HosQnvyKDBKQnTlUA8CJYf6fR9iM
	HjVK+SB522w1V/pJ9r3fm/DIY9UAfx9Mwxh3Qbp5Z9V7f2vI1RV/MOs+bAaVHLy1sh5EG8Eg8MswF
	QSBmicEw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3O9s-00000007Kxh-0Syy;
	Sat, 04 May 2024 22:47:08 +0000
Date: Sat, 4 May 2024 23:47:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Song Liu <song@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 80/82] kernel/watchdog_perf.c:282:
 warning: Function parameter or struct member 'str' not described in
 'hardlockup_config_perf_event'
Message-ID: <Zja67MQWDTh6JpNw@casper.infradead.org>
References: <202405040851.2EgypmL1-lkp@intel.com>
 <20240504154455.2ddd2cbc523698a270cca9c2@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240504154455.2ddd2cbc523698a270cca9c2@linux-foundation.org>

On Sat, May 04, 2024 at 03:44:55PM -0700, Andrew Morton wrote:
> +++ a/kernel/watchdog_perf.c
> @@ -277,6 +277,8 @@ int __init watchdog_hardlockup_probe(voi
>  
>  /**
>   * hardlockup_config_perf_event - Overwrite config of wd_hw_attr.
> + *
> + * @str: number which identifies the raw perf event to use
>   */
>  void __init hardlockup_config_perf_event(const char *str)

We don't usually put a blank line between the name of the function and
the arguments, but other than that, looks good.
