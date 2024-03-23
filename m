Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333CE7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 00:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711152762; cv=none; b=PSVXFhwMxwnwWOzTJve/uoEm2zILnY+K7HzuuV01tVnEMvl+cJa9jIXRh6t0F3A/rwePHPitZyzeVgn/p8txm19X6oGzfGob7vuSW4cDWSgKd0FFMomhVdqhUVWT4wRAzJHnVuB7ib51YfDVEXJo6kD7UIzMCyOm6h6xgxVMY1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711152762; c=relaxed/simple;
	bh=4kJAxamoNcVL6zMEThvxLxBe7Z9270xGqoFml/ZlX+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeDWBDGQBwAU8hyicci0qZnJKNSH51DnXP8I+q4IsRCEL59iLkYnpFjdhIAlVU1J7lCIrZQhJq3KC3jbnKYMAPTySK4R1dpypLV45yufZ1gmmdDx9FWRhLClgl682dJAsChxR6mzpFh4LvD39zQIP3gGuF+eERaoqKDSXiwRgOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v30udkRr; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v30udkRr"
Date: Fri, 22 Mar 2024 20:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1711152757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S34exRPLM+SUVKDayYAyhxvfNiz/6zpYZeVgX4bug+0=;
	b=v30udkRrcHi6UWd5igvkH4BvOdw9AaJOwCRI9+kf+Le5ZaDbsYwWgh1FRk/HN9OhNLtwrS
	1TbTDFdPTwbdCr3zZsZgZXSUBmlxct0QceIvEOXOC9ZyPJYIl0KcEBSaRL74hX+5NJpl0t
	Pj79PXWDprQpQINLssuTOCdcoZpH7wU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Suren Baghdasaryan <surenb@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [akpm-mm:mm-unstable 55/141] ERROR: modpost: "memcpy"
 [fs/nfs/nfs.ko] undefined!
Message-ID: <odwsfkz6vmgc6yiakat2oqq73lgzfu5w44lc7lpgewskezclw3@jvzxmbyeklrz>
References: <202403230731.fved39RH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403230731.fved39RH-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Mar 23, 2024 at 07:48:03AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   af520f81c51001f7ccdf0579fc73df282b26292d
> commit: fa5bfe65d50ae7006d711f490bba3cb4d437bcad [55/141] fix missing vmalloc.h includes
> config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240323/202403230731.fved39RH-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230731.fved39RH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403230731.fved39RH-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
> ERROR: modpost: "memcpy" [fs/reiserfs/reiserfs.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/nfs/nfs.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/nfs/nfsv3.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/nfsd/nfsd.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/lockd/lockd.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/seqiv.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/crypto_null.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/sha512_generic.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/sha3_generic.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/cbc.ko] undefined!
> WARNING: modpost: suppressed 16 unresolved symbol warnings because there were too many)

We were supposed to be getting 0day testing for our stuff, and we were
at one point, clearly that slipped - who would be interesting in helping
build a dashboard for 0day so that we can make sure this isn't happening
in the future?

I want something so that a maintainer can see at a glance that code's
been tested before merging. I've got a dashboard for my own CI that we
can adapt.

Also, I'm build testing mm-unstable on alpha now and I'm seeing more
build errors that I don't think we introduced. I'll see what I can
fix...
