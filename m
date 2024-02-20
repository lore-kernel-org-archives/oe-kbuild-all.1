Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44D4763E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 22:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708468462; cv=none; b=p4e/X4gs5Jg3mKfIsL7r2n9K3UYrCQDL6gTbjpy76YgFO2p+w3nYfmjc1jEkU54TX3WLtf3W1MPNJqesKjpLx1zmb+Cjo1DEZPbRejbpj2GzAGK8ZP1+5NQ/F50oyYR64wZedUgicSXCtW6H6xe/ldVPinOMeNbAe8SLYmKutvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708468462; c=relaxed/simple;
	bh=J6m0q0nq3jixj14MDGNC8OsGffarS1SciNipiKv04OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVelTlv1sn7762I0o+GYHH4kdAjJiyN6PDd0J3ZK5Y86hwL78cSEs4dgUIuWoC2DKdcLOZOz7f4oDzCRWfTuwEubSZh4i6J8SZdSXyUsiPJDL/yqd5c6LwEA2BxusaC2xN1q/74sQURTdpZ5EOQjtvy4ARRS0HJzgbEC4tDG248=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TmMinULv; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TmMinULv"
Date: Tue, 20 Feb 2024 17:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708468452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hb/vuf96wBfbCn47mBhLeWkIbFauKXmJv6i+aRjTqI0=;
	b=TmMinULvUtZJP/WhjdeFn8BVC+KBBYo08xXBkLdu+DJf1OrsUmSYTy5Z14Hzf9M0ntWtrA
	kRz/GSix9WrCz3YL70MRe2lLbEKz6ZJGvy5bLULmlwMrc6fShO1jjyu/nlLdO8LesodPmR
	JogOnv0Ne7tV1vmfnRVjUFzsX0D63Ds=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: kernel test robot <lkp@intel.com>
Cc: Suren Baghdasaryan <surenb@google.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [surenbaghdasaryan:memalloc_prof_v4 28/36] mm/z3fold.c:923:25:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <lqhpmam42cg4it36b2ikuzxc43s4q6rrtxuxr2r5i4xot4m3wl@ieamqc6pxak4>
References: <202402210511.ByC178AG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402210511.ByC178AG-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Feb 21, 2024 at 05:42:17AM +0800, kernel test robot wrote:
> tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
> head:   ce0668442c846ef25854d37e252ccbfec2a35241
> commit: 0ea8081a7fd7a604cad1195c80f82b015381aa0d [28/36] mm: percpu: enable per-cpu allocation tagging
> config: x86_64-randconfig-123-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210511.ByC178AG-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210511.ByC178AG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402210511.ByC178AG-lkp@intel.com/

All the sparse warnings I've looked at so far from the memalloc_prof
branch were false positives - they were also present in mainline.

Is there something that could be tweaked in the 0day code to fix these?
