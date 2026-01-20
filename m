Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E243D4E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 17:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931188; cv=none; b=lElnRRIldlXWppb8mx57wSjJHLYvGMR10Q0Hm4C/VSAtJC/gFOH6lXPJedt4aPmmaPG5Izk2yrWumwuuXf6M9zG46AAPC0OQB/KoQeTulGfq0I3UyuygMmpzAHvan9INjMZvHRaFCCA8H/vnhuBlpWw8mLRSAcvSf2hugVDFVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931188; c=relaxed/simple;
	bh=Y8Tb6dBZUW4kJ0sV5jJZr78T/9zh4uPDFEQdF981k00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PwhPRgFrrwaCI8IljYZ2sWaFfq/HrumCo5oGEemZUPO2xtKfKWMYY47TOzI5zO41huJ3bJw3u/ZZafm9vmYLTBaK3iUINQKtwPAp3jr0I+g8u6v7f6Illr30oC4xVZrHk+gJf2qeHpbH2K/X9NimsTueQ5pV+DK7YVjfF52eqq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EkmgLwA+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EkmgLwA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768931186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bUL06Edvn+TEncsNVZCfH5lX1I48n8F6JeZIn3dM9EI=;
	b=EkmgLwA+cQjyWAqnNMRSvP0tuypu/iKtjWW4N0vDhYA7wFoydChtnQoKfBR5fFYm09Cuy5
	fzeKz3lxdkm9m4lc7P5RqtcTGRoX8scDwuh1htKJIjL9FecBbr4GD9JFXgQEdtD8l9jVyp
	4oBo5W1/OqA1OG0D96kFf3IJBOuqy9A=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-CIVkvhurOIivgOOW7kZePg-1; Tue, 20 Jan 2026 12:46:23 -0500
X-MC-Unique: CIVkvhurOIivgOOW7kZePg-1
X-Mimecast-MFC-AGG-ID: CIVkvhurOIivgOOW7kZePg_1768931182
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6e793cc0bso1954969eec.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931182; x=1769535982;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bUL06Edvn+TEncsNVZCfH5lX1I48n8F6JeZIn3dM9EI=;
        b=NgzZet568IJ3Qdpwb9yn2NiH1vKh7FU5o9Xny1Mb0zijzbX5ujS2L1fU2zQfR4Ha4M
         8YtyYgDl9svHyB6eWg7+AHG8IfJlI2WXtz6+Jb8gqdyf9XmJyDFEopxxedlOqKk5IskQ
         ASfA7hYCKsxDsdkeVYglJWe0M3W0kpu8R2sHHd2O4HPjE7AVYjrKL4vQsBDwhl3sKaAQ
         dKpCcDpyczPcDPWzxtyEsIEQFbic7MiuwI1HzVBH9IGfgwbZMMUay3GIZsHMl6b/C1SO
         syqoAKodgBC3296PBs4Dkm+NG3pXkUg20u70YCs6vbhMQJ1FlRLcvoJwQzOkxaDa8huD
         5C4Q==
X-Gm-Message-State: AOJu0YzCwEzbMukS/yjLRJOMHq79zks1gpQL4c6EYT+WmUpcmsFKlo2d
	bpZQ60i58sXYAKV6rDLxXKt7bmq043YsExONnXpXYcFkJq0ymODSS4V9/uXkC/IVlxdD3Xi1yES
	7kucupQpfCq8xZuz7/bFv3307pRBP0rUHcRK6CuTgY6HsLgSRiQsgVTttAbXnVGGhz3g=
X-Gm-Gg: AZuq6aLooLBLgYYcUlKwNV88Qdpa34REF83dNWhOawmNWDO+V83Y7m8IzPSw0V7VlMF
	0g4P/f3/TnB/NBD20UUPzbADH/SvcyX21Ih5pTJXSiIXnnJUOiX7o9c4CR+Qz/8GpTwxj94f+dR
	NSEv5p3es/a1pyPqBe6Vib91EtMd+8S7NqlfVszud+Vv3lfBIgNnDjGUzog1/W782ZwR1v2H+ES
	XNa3nYPssaPn4Clsnk8Wxbvmw1vA1gcuW7ASnKDy2xjj8nCCrOsjOMrjAITJIy7xiKjyOa9EnAd
	KxUs5gSCPvfkWaFY64YKume9ZJhVfpoHY1uyU+dmH/8hcLw3JJ7k5ES360UwSyQnBP/gJuRzOm3
	nkZgd1qzptF18rxLjr/jziJVt5P1ngnTMDyaVaMcr9LMO
X-Received: by 2002:a05:7300:7491:b0:2ae:5d5e:9b1c with SMTP id 5a478bee46e88-2b6fd623bffmr2269163eec.2.1768931181757;
        Tue, 20 Jan 2026 09:46:21 -0800 (PST)
X-Received: by 2002:a05:7300:7491:b0:2ae:5d5e:9b1c with SMTP id 5a478bee46e88-2b6fd623bffmr2269131eec.2.1768931181134;
        Tue, 20 Jan 2026 09:46:21 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70b3c8ea3sm918785eec.22.2026.01.20.09.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:46:20 -0800 (PST)
Date: Tue, 20 Jan 2026 12:46:15 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aW-_Z04g4vDj_S1J@redhat.com>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
 <202601161611.2PFhRacc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202601161611.2PFhRacc-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WmhRUR6Ne6jVbER-Pmuyl_OZ6kzIsWlvxH_yY7LqjYw_1768931182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 16, 2026 at 05:14:40PM +0800, kernel test robot wrote:
> Hi Brian,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/MIPS-copy-pic32-h-header-file-from-asm-mach-pic32-to-include-platform-data/20260110-005057
> base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> patch link:    https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-13-99859c55783d%40redhat.com
> patch subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260116/202601161611.2PFhRacc-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161611.2PFhRacc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601161611.2PFhRacc-lkp@intel.com/

None of the errors in this report appear to be due to the changes that
I made that allow drivers/clk/microchip/clk-core.c to be compiled on all
architectures instead of just MIPS.

Brian

