Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB19E50246
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631499; cv=none; b=SmrMhjohe2hyyE5BqdvlcZ/6B31P9bJyk3cUv5DcF5Tnlrp/l/voM6HRTE9YSTt6F9lWYVY9p+EiwjwzCsCEqUoF57h0zqsroUk59DLarq+ff+Wz5mHtTtYCrh/P5xxH/M1+TP8mI7b0d9oZdroLPhhlg3mQJ1hltH5FrArfbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631499; c=relaxed/simple;
	bh=t3xDZ9V3DLou02VD9Pr/phfyuVAHG7r/z6gpe9wikKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY73QJdSUyiCiwUtMo8WNxEab2m8LBWAfDJx+tA5UXFynSTCi7dNreu7wKcy56RQ8m4fFZ2gXrc48IkJ1p3WwFOcIKWzxCO5ohvJQdy1b2lWQWHzgGIfPrFmeOMv+gD0wm8ycQXa/MUHKIlqky+zeN7qUS/E6nY+9uraXnKuzqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssInQXp1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssInQXp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AD8C433F1;
	Tue,  5 Mar 2024 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709631498;
	bh=t3xDZ9V3DLou02VD9Pr/phfyuVAHG7r/z6gpe9wikKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssInQXp18U6eMSpXnNpHWs43hOAYjsECg+5yIvoAogBNoEoVSWiQUNlUhmnzhMZ//
	 /dtb1HxxbS9gJTyEiRNl9d0r1LIkISZIADsOfaFo4zKgVeQ/kdFOwrKY6g9hEiF6b/
	 S9fCtFUtOoDH68ig4oPB2ubUPE0kfJY58qFU82C96ZewjCY7OJMu2S6ID0Zqswf3ec
	 qCB6mwAKZam9dOtfPTxgTfAyFHIr3oeFkOfknBNR+/ihqXQfwlYN/tti4TKnLloNJl
	 q3+S4cYYC7XwE+nlBjKumKXCGRHC5otRj0sjDDfhifIxxCsEb2lhihSayDpIKgRhUK
	 nwRHgItZKnoWw==
Date: Tue, 5 Mar 2024 09:38:14 +0000
From: Will Deacon <will@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [arm-perf:for-next/perf 34/37]
 drivers/perf/starfive_starlink_pmu.c:169:17: error: implicit declaration of
 function 'writeq'; did you mean 'writel'?
Message-ID: <20240305093813.GA21932@willie-the-truck>
References: <202403051305.36cANAVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403051305.36cANAVm-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 05, 2024 at 01:30:59PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
> head:   b9f71ab2152e5b344c02eb3ff43637162aaf29e6
> commit: c2b24812f7bc5fbd6f2f92af070856fbe4c37b40 [34/37] perf: starfive: Add StarLink PMU support
> config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240305/202403051305.36cANAVm-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051305.36cANAVm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403051305.36cANAVm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/perf/starfive_starlink_pmu.c: In function 'starlink_pmu_set_event_period':
> >> drivers/perf/starfive_starlink_pmu.c:169:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
>      169 |                 writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_CYCLE_COUNTER);
>          |                 ^~~~~~
>          |                 writel
>    drivers/perf/starfive_starlink_pmu.c: In function 'starlink_pmu_counter_start':
> >> drivers/perf/starfive_starlink_pmu.c:191:15: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
>      191 |         val = readq(starlink_pmu->pmu_base + STARLINK_PMU_INTERRUPT_ENABLE);
>          |               ^~~~~
>          |               readl
>    cc1: some warnings being treated as errors

Thanks. I'll add an '&& 64BIT' to the COMPILE_TEST clause in Kconfig for
this driver, which I think will squash this and also the hexagon problems.

Will
