Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA44301016
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178458; cv=none; b=BtbiVtVsi6Hcf+TKbOF+iV/2fwfGHF1AOZT+vH02F+Lt9zXlSZ+GVVhG4hz8neoUhxoW5se+/mjsmlswzt/IpG6pHdanchi6rxtjusWyBHQloEdjjlYyI+ixr8vALHfwfQdLPEyig7UqJ1kqItwjXXkHcgPIoGxGtAuxdqXUx/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178458; c=relaxed/simple;
	bh=d+Zq0KH9V9tpTZLWaI/Ubtudof8ymOMF5GgtpZJcnEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kr+fwBo7Azry+FYAvjIVvjnr/85BoQBdi3KHk1EIbQTfSHmY/lkNZBPWJNygfrax1S0KC730l9Fa+lQXxePx5zy3iuArsF9haz0jNyHIc92F73jd/2XEPJFOQRQzElBhlJwnWTYt0g/fjYUc9TIjPw+CIdH5P8NANp+VnCMHS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3CUJNi0t; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3CUJNi0t"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-242d3be5bdfso127765ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755178456; x=1755783256; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PVPZB7Z9YFYF+yeaPjpUiJMadHLWEgG0iAH/nCr4blI=;
        b=3CUJNi0tQBj8SHWaVjD40ArmoO6Svdb5dBxb6BtF+0e0/8hHGXG1jiM1VLF890Ev1h
         aDVcepOE/jC+84UHNNW3O3DZOr81UTJHf2lh9/AF6h/Fvz+42EUku1qj2gGi2gdrDEwQ
         RlFutY/feI+0/dF9s4f97/W7B18EWNI07MuPM4YgQQ1qsAqi5T4aLjQ2UfavbNVlQTOp
         dD72wvtHbdAV/HLOYYaj5Z5bHREIgwxdocrr+GIvuVTK2nRa59fedWiV4LkRsqfZxWp7
         bOU2Pxx/OCEB/BJvQxAx71R9iIoGTdw3G2NhL+cQGUoiKrW/xX7gD8nwznaRGx3kt3os
         p5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178456; x=1755783256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVPZB7Z9YFYF+yeaPjpUiJMadHLWEgG0iAH/nCr4blI=;
        b=cb4vm1yk1wE1QdiC8/yiQ5quzhS5BN44VpvA1hBe/ShZ4WQ0LFIQRgU+8I9ynvlSWO
         lZW867cLZbw+S9dGayRshlalgOkR525aPV53jyD4qiDuqkm0Y+vb0PORI6NZzECy+LQc
         /LyBf7WclilDUmg6oxepmKdrfV0dQgJYoZsdD6ke9N8weOWhXV5Y0u/ivTFGcyx8Rrg9
         /3vP8Ggbax2NZXIrwKz+sEdhPatSD6z+gcti2gPt6xDQiePEDLVWLWdTFLp/HwRl9K53
         SXbrPpRY6zCFb3pSvvJhUAnq36PNFNQlCy0z3KWTp+myiZtKH3BXeeW18VpjKV2rbqkE
         5jhA==
X-Forwarded-Encrypted: i=1; AJvYcCVjmLMfS4uiEQduhSvVf9udjKAS69hAXgT4L0a8XZFhaEckZF3V19N0EqyNCRnvtIcp2dl4AocvPfowVGpM@lists.linux.dev
X-Gm-Message-State: AOJu0YxAugnyuTkZdVoCWW9JHJcT0oiZ+4SeoMeh57CPE/FQlDU3sdak
	Dpk0y6APWPvJYx/wVQ67biK6mnbRxSVEQzk5bpeRJhsuP9ZoOYIoURK4wWInCf2+eU4iiA5G6CM
	CnH4PBw==
X-Gm-Gg: ASbGncuvQnm1i0cig9cDRpgmmoJ9lvC7EpzZMekTs0QhEpr3Hk9fxOD+OSac87IACcp
	yatKt8MbKMTDb0uWqviQcTHCdf7a7d/NQhZ6yHHXVDDYNnv77i6YneERbvGpTZAZsum2CMecmFy
	PR+s3PjIl9+nwJCTexh6bpjQXhm5H0xAXq5W5pifqsuwvhpb8Zx22GtcqcxDnJp1SrsaQjXVj5/
	10uPd38dQ82RAdLZCmQm3Mdi/Jl3JgNxxYsxiqNWRDXwwKLT0aMXTFThaVuolFaHvcrQJWIyr8p
	DpupPKf6GfeVxiEP4jYjjuRbPQyeFUL3C+czq1rl6nQjYJlV2Daj5xzvipYD+sRoqfNakgs+xej
	qfhYwCprp4A7Ho0DPuxzHsn4te/wcPR+CeEpM1YNdcoLjjE6Q8PQiP2xBsiDV5TiHdmN7wV7Fbw
	==
X-Google-Smtp-Source: AGHT+IGiurUt9ylpxFbjyO2OYiUuWjmwB4u7OQw4g4IWLeYevMmm62ZBdWTRpBtN2Em/+3rTdLUCyA==
X-Received: by 2002:a17:902:da83:b0:240:8f2:6442 with SMTP id d9443c01a7336-2445a7e8358mr3533555ad.15.1755178455620;
        Thu, 14 Aug 2025 06:34:15 -0700 (PDT)
Received: from google.com (208.131.87.34.bc.googleusercontent.com. [34.87.131.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bd9b3b3d4sm32813235b3a.10.2025.08.14.06.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:34:14 -0700 (PDT)
Date: Thu, 14 Aug 2025 13:34:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Subject: Re: drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <aJ3l0Te5Q1d4g3u-@google.com>
References: <202508142105.Jb5Smjsg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508142105.Jb5Smjsg-lkp@intel.com>

On Thu, Aug 14, 2025 at 09:21:50PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
> commit: 32b2d3a57e26804ca96d82a222667ac0fa226cb7 iommu/tegra241-cmdqv: Add IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV support
> date:   5 weeks ago
> config: arm64-randconfig-r112-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142105.Jb5Smjsg-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
> reproduce: (https://download.01.org/0day-ci/archive/20250814/202508142105.Jb5Smjsg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508142105.Jb5Smjsg-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
>    drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47: sparse:     expected restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47: sparse:     got unsigned long long
> 
> vim +305 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> 
>    297	
>    298	static void tegra241_vintf_user_handle_error(struct tegra241_vintf *vintf)
>    299	{
>    300		struct iommufd_viommu *viommu = &vintf->vsmmu.core;
>    301		struct iommu_vevent_tegra241_cmdqv vevent_data;
>    302		int i;
>    303	
>    304		for (i = 0; i < LVCMDQ_ERR_MAP_NUM_64; i++)
>  > 305			vevent_data.lvcmdq_err_map[i] =
>    306				readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));
>    307	
>    308		iommufd_viommu_report_event(viommu, IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
>    309					    &vevent_data, sizeof(vevent_data));
>    310	}
>    311	
> 

I assume we'd need something like the following (untested) for this:

--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -303,8 +303,8 @@
 
 	for (i = 0; i < LVCMDQ_ERR_MAP_NUM_64; i++)
 		vevent_data.lvcmdq_err_map[i] =
-			readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));
+			cpu_to_le64(readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i))));
 
 	iommufd_viommu_report_event(viommu, IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
 				      &vevent_data, sizeof(vevent_data));

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
