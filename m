Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F415D200C5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Zuo7f+qc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="EBGsWHaH"
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 176E321845;
	Wed,  4 Oct 2023 19:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1696446767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hRQLiBtNKAdxOX0woIqr25tsRAJKLVu6fNF+IssOEQM=;
	b=Zuo7f+qcI/6/V1K0iWiqx7mqDoeguA50gSgLwvc1rr845q63KG/TJlo/2wlYy37y2kiqBD
	goYiYIkMDdZ8LFO6eG0BUv+Abv5jlJ2Qctqv6jYZlst1XRNGRKHNK0tKKafelMD3nfREIx
	1nBhD61GFcQEWQQhhjGSswdUTILlve0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1696446767;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hRQLiBtNKAdxOX0woIqr25tsRAJKLVu6fNF+IssOEQM=;
	b=EBGsWHaHvHndD245wZio1icsC1UboDtAj2YpDnBazpZkMjV7y5nbAZbITR7wEpEf/fIAtu
	cA1Vha4hWVDtWAAA==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 9840A2C142;
	Wed,  4 Oct 2023 19:12:46 +0000 (UTC)
Date: Wed, 4 Oct 2023 21:12:46 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: kernel test robot <lkp@intel.com>
cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
    oe-kbuild-all@lists.linux.dev, 
    Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 693/8790] drivers/hid/hid-sony.c:2159:2-14:
 WARNING: NULL check before some freeing functions is not needed.
In-Reply-To: <202310011609.2mhDG4jJ-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2310042112260.3534@cbobk.fhfr.pm>
References: <202310011609.2mhDG4jJ-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Oct 2023, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
> commit: e1cd4004cde7c9b694bbdd8def0e02288ee58c74 [693/8790] HID: sony: Fix a potential memory leak in sony_probe()
> config: x86_64-randconfig-101-20231001 (https://download.01.org/0day-ci/archive/20231001/202310011609.2mhDG4jJ-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20231001/202310011609.2mhDG4jJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310011609.2mhDG4jJ-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/hid/hid-sony.c:2159:2-14: WARNING: NULL check before some freeing functions is not needed.

Now fixed in hid.git#for-6.6/upstream-fixes with 287f69f3f9939.

-- 
Jiri Kosina
Director, SUSE Labs Core
