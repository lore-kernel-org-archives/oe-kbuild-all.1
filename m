Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AD2748F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233905; cv=none; b=rM7YAUgDtMPAyKP1KYEMv9Yn8Uh2M+8GRPZfzhIgfUSK/tLj+8qldo3zo8+4+Lt3TbUebRGqmIorRujXjWdeIbVtONhAryrZu7U+C7a8zfSj1zckT/S5SiiCyLrTBOrdvsMssWG88wo0GB4yeGwl9SHYIwUYwYz9mi5NLzc7xGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233905; c=relaxed/simple;
	bh=yQStRA9b0pA7U0A+eMUYUskb1niL88t0ti5tvxRwPSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJa4GIWhVCu5XHhTlezXZnCQj5MlytsHQMPe7KuQFYrZk0icy5g+MNukn0hmHyuCgVGWYYVgHP3l8Fv14Wyhwv7J40fS29enR6xRqZhbIc+nyo0U/CCEmGVKMk0pnlnTRTX15DM1YBBwewMvrpacHq4gXs/MlEHKwnDRI1WpONw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82D7214BF;
	Wed, 14 May 2025 07:44:50 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E75A3F673;
	Wed, 14 May 2025 07:45:00 -0700 (PDT)
Date: Wed, 14 May 2025 15:44:53 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [linux-next:master 7775/11093]
 drivers/firmware/arm_scmi/quirks.c:110:28: error: implicit declaration of
 function '__VA_OPT__'; did you mean '__CHAR_BIT__'?
Message-ID: <aCSsZdl7oiTsBHvl@pluto>
References: <202505142257.ejBGy5gg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505142257.ejBGy5gg-lkp@intel.com>

On Wed, May 14, 2025 at 10:33:06PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
> commit: 7b487beab7cd853ab7de58746284898fb9316334 [7775/11093] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
> config: arm64-randconfig-r072-20250513 (https://download.01.org/0day-ci/archive/20250514/202505142257.ejBGy5gg-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142257.ejBGy5gg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505142257.ejBGy5gg-lkp@intel.com/
> 
> Note: the linux-next/master HEAD bdd609656ff5573db9ba1d26496a528bdd297cf2 builds fine.
>       It may have been fixed somewhere.
> 

Hi,

> All errors (new ones prefixed by >>):
> 
> >> drivers/firmware/arm_scmi/quirks.c:110:28: error: implicit declaration of function '__VA_OPT__'; did you mean '__CHAR_BIT__'? [-Werror=implicit-function-declaration]
>       .compats = { __VA_ARGS__ __VA_OPT__(,) NULL },  \
>                                ^
>    drivers/firmware/arm_scmi/quirks.c:158:2: note: in expansion of macro '__DEFINE_SCMI_QUIRK_ENTRY'
>      __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
>      ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/firmware/arm_scmi/quirks.c:172:1: note: in expansion of macro 'DEFINE_SCMI_QUIRK'
>     DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
>     ^~~~~~~~~~~~~~~~~
> >> drivers/firmware/arm_scmi/quirks.c:110:39: error: expected expression before ',' token
>       .compats = { __VA_ARGS__ __VA_OPT__(,) NULL },  \
>                                           ^
>    drivers/firmware/arm_scmi/quirks.c:158:2: note: in expansion of macro '__DEFINE_SCMI_QUIRK_ENTRY'
>      __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
>      ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/firmware/arm_scmi/quirks.c:172:1: note: in expansion of macro 'DEFINE_SCMI_QUIRK'
>     DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
>     ^~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 

__VA_OPT__ needs a newer GCC to be used, BUT minimum GCC requirements were raised
this cycle, so it should be fine once the toolchains are updated everywhere....
....see this thread:

https://lore.kernel.org/linux-arm-kernel/94e94c5f-210b-43b8-99bc-e7ad7da2588d@app.fastmail.com/

Thanks,
Cristian

> 
> vim +110 drivers/firmware/arm_scmi/quirks.c
> 
> 487c407d57d6d3 Cristian Marussi 2025-04-29  102  
> 487c407d57d6d3 Cristian Marussi 2025-04-29  103  #define __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ...)	\
> 487c407d57d6d3 Cristian Marussi 2025-04-29  104  	static struct scmi_quirk scmi_quirk_entry_ ## _qn = {		\
> 487c407d57d6d3 Cristian Marussi 2025-04-29  105  		.name = __stringify(quirk_ ## _qn),			\
> 487c407d57d6d3 Cristian Marussi 2025-04-29  106  		.vendor = _ven,						\
> 487c407d57d6d3 Cristian Marussi 2025-04-29  107  		.sub_vendor_id = _sub,					\
> 487c407d57d6d3 Cristian Marussi 2025-04-29  108  		.impl_ver_range = _impl,				\
> 487c407d57d6d3 Cristian Marussi 2025-04-29  109  		.key = &(scmi_quirk_ ## _qn),				\
> 487c407d57d6d3 Cristian Marussi 2025-04-29 @110  		.compats = { __VA_ARGS__ __VA_OPT__(,) NULL },		\
> 487c407d57d6d3 Cristian Marussi 2025-04-29  111  	}
> 487c407d57d6d3 Cristian Marussi 2025-04-29  112  
> 
> :::::: The code at line 110 was first introduced by commit
> :::::: 487c407d57d6d32ff4370f4e738227811732d4bd firmware: arm_scmi: Add common framework to handle firmware quirks
> 
> :::::: TO: Cristian Marussi <cristian.marussi@arm.com>
> :::::: CC: Sudeep Holla <sudeep.holla@arm.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
