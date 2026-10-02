Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0461C84CB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 01:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903801; cv=none; b=IGQO86NHijHRpIoYAxhuBhsBUdvZD3hhSO3XxSZopygHi7fv9ZTBT+XXJ16AS3/bsie0PFtgoIx/n+Q5kbtZw3Y2NS9ciNpJilCycOoNjhpGYNjsRCOR7PbtCKKZZKn10qtqcdPBFHNMewnPdcoYL5KiVkRNqfMmFRNaRZSSYHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903801; c=relaxed/simple;
	bh=ONG5ucHjwGcTjBX34KUf1R/rKl9edxNOqAKTVP1cD5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsTtJmyyzgaXZeA5P9bQNKuLSEYEIAnAtNncphTk3e7u1ja287jnHQYDPoMlLDfp57xwufJY1KpDnPbkBIU/5DzpdZPA2zVhKmSUkxJOLmEZKG66cKqndNeukaaRbe6g2s1zaOc/Nfrz8xqeyBhIGkLZWLf+9ITq+kX5p8mfUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=FbUqAwTB; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="FbUqAwTB"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-534af4d1a37so1036171cf.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Oct 2026 18:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790903795; x=1791508595; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUnSyj9W4huZSmDL5Gt6gIxnj/N9hfQq+JHqOgTA9WY=;
        b=FbUqAwTBFMec8izNr8kQK5bLVkb+Wl1QjSKWRg6+GoKQYTH9ddY9lK7hF1NFA/aqu0
         yM7M7v8tsOM1nEPmm7cqFXXiNwwLbg73UGTCtb8uPBP31v5jka7U9VOUuvxTifM26xih
         9cN+xdy/fTCol4LRDF44gx1PPC77W5kAocr5QhhjUfPWjfTLhLudVrnGmAo9LtrWcDvw
         pfaCLtA6TLaa8id2WviqR1ML6tfCFvA7FQ/HFrmaw6fYvwTHZM0gdPikMJIMvEFXZPvo
         ziuXgJ/M4pHYXDN9XMGTdaN3DpLLyBEluJCTmOQu+j7F/eD32ZonP1Re0LtXRvoB0J/t
         oINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903795; x=1791508595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUnSyj9W4huZSmDL5Gt6gIxnj/N9hfQq+JHqOgTA9WY=;
        b=CQjJeLsQZcw0vO0TCChyd6kdoABwd7/iyUZy3unClAOvaLnk/NT+TVtRhZTB7e+/lu
         tlPvDGgjZQPEF0KGuDd//rhe8wTeT9UFOSDOj5kYp1L5qUH+AMDGlgO+KP8G3ONRDkAA
         NjkwROGEbExap/oOC8qjnIUbb1aIbonLs0E4lTZbvW2Y4fXUCFkhpi+aazLIAL730o8x
         PhArkWARXmdT6XzyXqZyDwcYlLQ3qJafya0EdOpFqkP1RAQOWEd0lvVTD3Yrfck9eKRP
         WUugZOZ+8Cw74U68Qb5wCXgUeYzzNbNC+tqqt3sBIVMfeyEOD/+BEsfQNk8xThQeBqsC
         DEgg==
X-Forwarded-Encrypted: i=1; AKwUvByLsWv/gEE2ie1GElug6w/yq2NE4NmP+sGKWWcjeHRVpjAkUEbhlHbIQWppnSrdcQDKPZiMxve5OERLhPu3@lists.linux.dev
X-Gm-Message-State: AFuF++nvpWZjxvwKA88Ldot0NNeikR85UfpT9Sqqeg2A2WZvBAKsdUSW
	Ph9Qx2t4lEiYsHxNJmcrqk0ie92GZex27PUA/2+AQFITs+ote0BFqY3+qaMXEDKPsas=
X-Gm-Gg: AYBFou1wpF0sAeYQFZ+47wrydQvMc+ZdnX2p2T7dfUCMN+l9avqYHngGdXYNP1Hrrt8
	aQTEl7m6czCacejnU7EajQYf2ooZBtCNw5NH8wwrcTocoFEkCPVS72rHFrVWagLIu601xU5i9ii
	Pqk+F/MrAQ20LkEIeuhci8ox1HivQWSZoVokLFlOHm9h28Ihs0HgWtemc9wdSAmg6CkCIJtvrh1
	BeyJQj06ebkWIPTwxWLqOWHh6aB4TrA5iajbf3Qx9swmgkcxZUJSRp6AjjqVy73p97L9470jHB+
	diSjCYN0Nw9t9wGvSQXdlicxz6KLNtPIaitYx/f4XBaddEPNJrn1QWJ24IuKZzrI7tKVcRvXv4e
	q5lTtBmrN7dzStVVPS0zPb9FYI103xerDcOz5jyMoZ1Z52x1ThQTQtf4gCbtsH76MDP7S/HpFKb
	aqFM1TbpvTGM++5MucSNupI/N5L+RbBvSNc1SzJRIXueW64k5/sa6OnS2Y2CoWJ4HxXL7eQ68=
X-Received: by 2002:a05:622a:1e10:b0:533:2feb:9fde with SMTP id d75a77b69052e-533cd884e80mr18159031cf.38.1790903794627;
        Thu, 01 Oct 2026 18:16:34 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398aa0baesm12734691cf.13.2026.10.01.18.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 18:16:34 -0700 (PDT)
Message-ID: <360cd521-5abc-49df-986e-cfe9be73a37c@riscstar.com>
Date: Thu, 1 Oct 2026 20:16:33 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [char-misc:char-misc-testing 19/37] kismet: WARNING: unmet direct
 dependencies detected for PCI_DYNAMIC_OF_NODES when selected by TC9564_PCI
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Thompson <daniel@riscstar.com>
References: <202610020124.ieOiopjQ-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202610020124.ieOiopjQ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 6:52 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> head:   04434a1d0f311d76b1f15fa987918b471a0b8c6a
> commit: 1304b0c47ef81cbd21e51ea0645a98104393ba49 [19/37] misc: tc9564: introduce base PCI driver
> config: m68k-kismet-CONFIG_PCI_DYNAMIC_OF_NODES-CONFIG_TC9564_PCI-0-0 (https://download.01.org/0day-ci/archive/20261002/202610020124.ieOiopjQ-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20261002/202610020124.ieOiopjQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610020124.ieOiopjQ-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES when selected by TC9564_PCI
>     WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES
>       Depends on [n]: PCI [=y] && OF_IRQ [=n]
>       Selected by [y]:
>       - TC9564_PCI [=y] && OF [=y] && PCI [=y]
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I'm about to send a patch that fixes this.  Greg, if you'd prefer
I re-spin the series (or something else), please let me know.


I did originally have "depends on OF_IRQ" under TC9564_PCI.

However I hit this:

error: recursive dependency detected!
         symbol GENERIC_MSI_IRQ is selected by IRQ_MSI_LIB
         symbol IRQ_MSI_LIB is selected by PCI_XGENE_MSI
         symbol PCI_XGENE_MSI depends on PCI_XGENE
         symbol PCI_XGENE depends on PCI_QUIRKS
         symbol PCI_QUIRKS is selected by TC9564_PCI
         symbol TC9564_PCI depends on OF_IRQ
         symbol OF_IRQ depends on IRQ_DOMAIN
         symbol IRQ_DOMAIN is selected by IRQ_DOMAIN_HIERARCHY
         symbol IRQ_DOMAIN_HIERARCHY is selected by GENERIC_MSI_IRQ

So I removed that dependency and the problem went away.  I'm
sorry I neglected to spend more time troubleshooting that.

So far I have found two options to avoid the recursive dependency:
- Use "select OF_IRQ" rather than "depends on OF_IRQ"
- Use "depends on OF_IRQ" but then use "depends on PCI_QUIRKS"
   rather than "select PCI_QUIRKS"

I like the second one better.

					-Alex
