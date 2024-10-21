Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1DC1E572C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729514490; cv=none; b=tvYEL372xpaNwa/9KS2Vq/X/cJm7NI1myJCnF4Ivi6XiYtrK6jtz7FDxN2WAj2cNP6C1kByd8OqjOPCaJMfl1lsO21FPppvPz4Uk6khZIsIjJjy7iVlRfiavEIyXK1JZugdsdX5FHwappd8cUJ8DU8fuk24EQFdQkIKUyB9hRQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729514490; c=relaxed/simple;
	bh=dvtsDQKImhM7E4Uh9+RXuF0X8LmXgCRIAgvZHTBLQzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuvhfMCCcQ2HRyNS8QW51VTyZ2vVPkJ7Ve5ZXxK2o5Zf4oobbokysb3/fKAe8wE2VfwI0CXpoycIJDj0RxDxqlcBC5OFSgE3oPPv20ASqgjcN1DHrMEhg78j3yAyuZ/F4uog3hAQQnuJ/4xhtLuvBvTOb0LOiTegyXITtawR/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JhqpSg5B; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JhqpSg5B"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b148919e82so350073985a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1729514487; x=1730119287; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp01JHtxJKNVTKHW3GsEz4X/LqPwaSDRwVPSltYs28s=;
        b=JhqpSg5Bv8N0NI9VToxDPafuWY6PBJRuRsFiKM0VqdvpB1oLLWkEbOdgd2au2T6i67
         UsX21TVULJJ0md6FusobDhFJCHIulaWuZS+1i7JIwT4ZqFN4b3ctu5CIkfyJBc4EzWv5
         leWPwdOEgcn8tyy8Hbs/6ble/u+OpXOs0r/iamNgCyO9lJ1pozSxsxsru8jTpoTQBrPs
         C/LZA613ppcUehTjeAlKr3lsW7B18/wBRWCC++UvzKrNpYva1VuV49IoTu9bS8Dn4lbz
         Ttx6NTYtor/Ji74Spk5Nn/VW7wO8B4D+nTzy6VHAguxD5uTTj27K+vQ3Cqca6+isAAsY
         o5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729514487; x=1730119287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp01JHtxJKNVTKHW3GsEz4X/LqPwaSDRwVPSltYs28s=;
        b=xHJIJwGl5LRHlzXr0vWnhWt5riakzwpYHJpyX9W1gTI+7HcV2vB2dhCgnXTvD2Imjl
         vXW71VB8wjF/UFN7uSNMFdFw7NRQ43RLbRQjkXLbuc35933FgBZCSuq2IcJBnxhuE0ul
         1OgX5+T9vw/7kYr8IxccqpgQlDDQQV63Hjt5yxyMMe0VA5EY6tiMgCVP+XTLU4l0Y+o7
         WDjtZNnICEdFhl1mb/5ek/lJINlGRU7kOV1lM6NQgPUKtqWqQJ+IHAMquwTFfuBoLhzH
         TDNgmdc+lnQu+6Xj6LimOo9SXJUPP6nii5YrOfo6ft/9Wh+PwnVCJ/IU/NTJqm+iS25k
         ls5g==
X-Forwarded-Encrypted: i=1; AJvYcCUUuNivBAXF8CDrlHW8V/BCwucTaZxg5VGIpm9/I7GkvjHTnsk+X11bA2jN77fTRb5KhQS3m1VIyFjng79e@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnn8mPdbvF73+rvuEg4LfL060mRZfE5KRnz5Z4X7wOy76FHh4L
	6SR7RRLxtHF4hVWTSBQB/jpGhnPHXUJoZRQ7pkvEh6JzAykDe0k1vV9oOC5qU/4=
X-Google-Smtp-Source: AGHT+IHsj6ukjB9FiEoRDwNI9RyX2TlH6gCJoOIRFJN46vFPdBuLf1MeQ/ffvaLGH4qd6MA/VVJcTA==
X-Received: by 2002:a05:620a:2492:b0:7b1:456e:2a26 with SMTP id af79cd13be357-7b157c06206mr2009373285a.54.1729514486767;
        Mon, 21 Oct 2024 05:41:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659c0361sm164183085a.19.2024.10.21.05.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:41:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1t2riv-008GNi-1U;
	Mon, 21 Oct 2024 09:41:25 -0300
Date: Mon, 21 Oct 2024 09:41:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [jgunthorpe:smmuv3_nesting 11/17]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <20241021124125.GA3576661@ziepe.ca>
References: <202410200404.OJrmhHAF-lkp@intel.com>
 <ZxQtJz3F9t2N5FoY@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxQtJz3F9t2N5FoY@Asurada-Nvidia>

On Sat, Oct 19, 2024 at 03:05:27PM -0700, Nicolin Chen wrote:
> On Sun, Oct 20, 2024 at 04:34:57AM +0800, kernel test robot wrote:
> 
> > sparse warnings: (new ones prefixed by >>)
> > >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long [usertype] @@
> >    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse:     expected restricted __le64
> >    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse:     got unsigned long long [usertype]
> [...]
> >    127
> >    128  /*
> >    129   * Convert, in place, the raw invalidation command into an internal format that
> >    130   * can be passed to arm_smmu_cmdq_issue_cmdlist(). Internally commands are
> >    131   * stored in CPU endian.
> >    132   *
> >    133   * Enforce the VMID on the command.
> >    134   */
> >    135  static int
> >    136  arm_smmu_convert_user_cmd(struct arm_smmu_nested_domain *nested_domain,
> >    137                            struct iommu_hwpt_arm_smmuv3_invalidate *cmd)
> >    138  {
> >    139          u16 vmid = nested_domain->s2_parent->s2_cfg.vmid;
> >    140
> >  > 141          cmd->cmd[0] = le64_to_cpu(cmd->cmd[0]);
> >    142          cmd->cmd[1] = le64_to_cpu(cmd->cmd[1]);
> 
> The iommu_hwpt_arm_smmuv3_invalidate holds a le64 array, though
> we could probably do everything here in the le64 format, but...
> 
> >    199
> >    200                  /* FIXME always uses the main cmdq rather than trying to group by type */
> >    201                  ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq,
> >  > 202                                                    last_batch->cmd,
> >    203                                                    cur - last_batch, true); 
> 
> ..eventually, here arm_smmu_cmdq_issue_cmdlist needs u64.
> 
> So, I am adding an extra native-endian structure to fix this:
> 
> ----------------------------------------------------------------------
> @@ -217,6 +217,10 @@ static int arm_vsmmu_vsid_to_sid(struct arm_vsmmu *vsmmu, u32 vsid, u32 *sid)
>         return ret;
>  }
> 
> +struct vsmmu_invalidation_cmd {
> +       u64 cmd[2];
> +};
> +
>  /*
>   * Convert, in place, the raw invalidation command into an internal format that
>   * can be passed to arm_smmu_cmdq_issue_cmdlist(). Internally commands are
> @@ -226,7 +230,7 @@ static int arm_vsmmu_vsid_to_sid(struct arm_vsmmu *vsmmu, u32 vsid, u32 *sid)
>   */
>  static int
>  arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
> -                          struct iommu_viommu_arm_smmuv3_invalidate *cmd)
> +                          struct vsmmu_invalidation_cmd *cmd)
>  {
>         cmd->cmd[0] = le64_to_cpu(cmd->cmd[0]);
>         cmd->cmd[1] = le64_to_cpu(cmd->cmd[1]);

That's going to make spare complain here though :\

You need a union to quiet it.. Or probably just a __force and a
comment is fine

Jason
