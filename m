Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E36349B12;
	Wed,  7 Jan 2026 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795962; cv=none; b=CVLM1BNHXD+dZXqbnqSa1CCMpYHa1dOO1SSVgFHxI+bBe4FoadAlw68x5hM/F3rsaC0g3wttmy2X35uktR9zTd1Z/jvx7ks0sR8xjMG0SrPf5dLI+hu3K/kuom7beKz/6csCvWxeJxVq17BxDNewEOIGCTjxuCL7sow6weB9y8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795962; c=relaxed/simple;
	bh=dqGxxlQ+l0yvyt5GMtk6rbjp46q1pTachRnlrJ3n29I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhtEVbB/QEQh8z4eRt5tdIG1s695Bwcy2FDoQbnASj32jzBnU8S9vlwOWTYw5rUv+T/sUi7TW8LZUufWtyoVKr/fvtQcDMMm0f1i+3X7vNnEt6tsvr6lgaQmPjwXfGTJ6dnX7bqFVaLDDMw3JkyUgrstVidlYnG1xk2DVpMOeAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQmVVf0t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQmVVf0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC7CC4CEF1;
	Wed,  7 Jan 2026 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795960;
	bh=dqGxxlQ+l0yvyt5GMtk6rbjp46q1pTachRnlrJ3n29I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQmVVf0t7FQOSROxliJpfqUrIH9ipotePInZ6/32KWsx120FxxhaSqlmumqDwZ8rO
	 glLkm0uPQqm6BcnSKhEibEOnJJ8xZc/cwG7qCFojIlKr4vEVVwJNWAVsDxuMucUzro
	 1vSy20JF1BfQuPANt/evzR82KYN4Zs3uk6WLv+tkm7gnHI9y838TsW9uzSK1Q2yUEJ
	 wZCqzvDw2XCVM/UTMkX5JCYk/gstTGAg9+8TkWMP8ClQt/mNNu7fTh2wUFiLBMRg9i
	 dmJpkFjKRJAuxJDYVoqkzW8xmWLP4q20cWz0CC1KDNDFpCZLBL0GAkXi3YO0su/bX4
	 aqm0WbZ8/Ls8A==
Date: Wed, 7 Jan 2026 14:25:56 +0000
From: Will Deacon <will@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: arch/arm64/kernel/cpufeature.c:3095:9: sparse: sparse:
 Initializer entry defined twice
Message-ID: <aV5s9MOkYzjeNNbs@willie-the-truck>
References: <202512151716.VtbG1F7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512151716.VtbG1F7H-lkp@intel.com>

On Mon, Dec 15, 2025 at 05:39:33PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
> commit: 064737920bdbca86df91b96aed256e88018fef3a arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented
> date:   11 months ago
> config: arm64-randconfig-r112-20251214 (https://download.01.org/0day-ci/archive/20251215/202512151716.VtbG1F7H-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151716.VtbG1F7H-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512151716.VtbG1F7H-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> arch/arm64/kernel/cpufeature.c:3095:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3095:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3096:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3096:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3097:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3097:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3098:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3098:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3099:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3099:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3100:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3100:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3101:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3101:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3102:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3102:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3103:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3103:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3104:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3104:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3105:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3105:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3106:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3106:9: sparse:   also defined here
>    arch/arm64/kernel/cpufeature.c:3107:9: sparse: sparse: Initializer entry defined twice
>    arch/arm64/kernel/cpufeature.c:3107:9: sparse:   also defined here

I think this is just because we override the '.matches' callback with
'has_sve_feature' after first initialising it to 'has_user_cpuid_feature',
so there's not a functional issue here.

However, maybe the diff below would squash the warning?

Will

--->8

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c840a93b9ef9..054f024ac926 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3183,7 +3183,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 #define HWCAP_CAP_MATCH_ID(match, reg, field, min_value, cap_type, cap)                \
        {                                                                       \
                __HWCAP_CAP(#cap, cap_type, cap)                                \
-               HWCAP_CPUID_MATCH(reg, field, min_value)                        \
+               ARM64_CPUID_FIELDS(reg, field, min_value)                       \
                .matches = match,                                               \
        }

