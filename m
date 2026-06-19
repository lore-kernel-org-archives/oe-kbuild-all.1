Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EEB395AD9;
	Fri, 19 Jun 2026 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879528; cv=none; b=X8iLg5uNCYjPdvz42rkd47TVRJBfZgjpm7BclTsfwkq5qedLYvdSq4Th5pDZKsARbfUm1DMNWLC5pN3Nlwf7vi+cCn/lcE8Ge30AZ/uOp2Qp53NXXUQDHLk7MQLAQfLTWn5kAxSJRsqtQ8h8q8DHQo5PsD4K1xROiIlqD4SUP0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879528; c=relaxed/simple;
	bh=SFEQx3wcqdKm+kAd0I+NkzcLnZcD2/Bo/wubgvxVCH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXWPrzqARRaeiXTpk58Y7j7YL7EyHZ3dPfx+qSsLRfJ2x30XKC21MS8m6lFlqqvBbqTzX5oHE9TtRmT4ERRTQKcBMtTBKeUYGZDS5kzCWrnJqZHp/Uf4zFm1k586QU7M9MJSmSs9BvTsfPO7xswUdUUoPlt1Xi32UBDumDThnuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ugp1qMsO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ugp1qMsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991721F000E9;
	Fri, 19 Jun 2026 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781879523;
	bh=mn1WJZcA2p+49qsPo+pz9DqRqyubK2AH0HmWcI8bo2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ugp1qMsOXDQmP69CzdsgV96YQiGq+RpaPndZHyhWjy1yPHUFXBAo0v13n8bRIEK/M
	 uPMK5QtuKg3g6ozzX01D5bJ413ulFzQ+QKQoxeoxCNBfodDuOtzFgXb/KiFtdkYHpi
	 dCLrhOMmjpXSTcvC5bWwEw4v0OZnjYMp+LFJWZmBNS44cUnp8jvht0KWrB4uWlAIsN
	 GLG0elN8dizu/BnEG1excVYdRCMPDNwvuXDNr01BOtoLWbkOXfG56zyFzNG2NKVchZ
	 NDH3JtvAV0uGkm3JOs2wsJTrH9nPzW2eVXUlHn7fFF3MFkm14hOOpv5wwDhZtc8aPs
	 MOTYoiDDJtTVg==
Date: Fri, 19 Jun 2026 15:31:59 +0100
From: Will Deacon <will@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1122:38: sparse:
 sparse: cast from restricted __le64
Message-ID: <ajVS3-NT4jAp1QtN@willie-the-truck>
References: <202606151017.QU0evpH9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606151017.QU0evpH9-lkp@intel.com>

On Mon, Jun 15, 2026 at 10:27:16AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> commit: 7cad800485956a263318930613f8f4a084af8c70 iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence
> date:   5 months ago
> config: arm64-randconfig-r123-20260614 (https://download.01.org/0day-ci/archive/20260615/202606151017.QU0evpH9-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151017.QU0evpH9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 7cad80048595 ("iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606151017.QU0evpH9-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le64 const [usertype] eats_s1chk @@     got unsigned long long @@
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse:     expected restricted __le64 const [usertype] eats_s1chk
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse:     got unsigned long long
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le64 const [usertype] eats_trans @@     got unsigned long long @@
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse:     expected restricted __le64 const [usertype] eats_trans
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse:     got unsigned long long
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1122:38: sparse: sparse: cast from restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1124:33: sparse: sparse: cast from restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>    arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
>    arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
> 
> vim +1122 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> 
>   1095	
>   1096	VISIBLE_IF_KUNIT
>   1097	void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
>   1098					  __le64 *safe_bits)
>   1099	{
>   1100		const __le64 eats_s1chk =
>   1101			FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_S1CHK);
>   1102		const __le64 eats_trans =
>   1103			FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS);

I guess neither of these ^^^ should be __le64?

Will
