Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1154319DF62
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 02:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770863127; cv=none; b=RHy3oWyBOkArqnaykTs+UlJchm8fZn5aH+OnQDffGDMG9IKFF2s3EtStIpnV3jwu0NwYedWYTg5rBNbCPddrKCn9GJtSMSO76avveSs5hpGxIQAQ0jAtYT6Jq9BEdpqbtKDInaScItgYThvMWCO/lys9MLylbyjAdH2TlRCN+rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770863127; c=relaxed/simple;
	bh=4PnXNNy7PSA47ka3TglfbwhzMH2hrLV3dWKJyDAqTuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=to4VCms8+0wQr1Hv4VkZyYUSsan231AzoDprLohjxNSggniuvb99iB+daREIDd3gspvdKRILJ2q0wKNmsj6pQGBD5si3sg2BSuf5b4VHe8Qop2uewRmS0M9hyeCZCS/sIawHH6SPsy5dMpFq0z+KQ//NfvWigo2Z6isTwTagvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K5DoyXpP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K5DoyXpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770863125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BW+Mgpaq6SwF9hkVhCNywA9aCMpLFaTHrW15uFZTbFY=;
	b=K5DoyXpPysvfVRTPxJtxGLMC8QdvDKiI1awH0JfD+qpxgQI4WUKX04/Y/GpIAP8y+gfu9Z
	6eax6tD1013cF+NsClhFI9taXsZJzAGD0dBLW3Ad3Z3Cxn2sG4oB4NMTVDia5xpLG0dGei
	a/cUcNCrQeNYIcYCLDHkaQd6AvSXjmM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-F0xi-yZ1N66ym6Ros765mw-1; Wed, 11 Feb 2026 21:25:23 -0500
X-MC-Unique: F0xi-yZ1N66ym6Ros765mw-1
X-Mimecast-MFC-AGG-ID: F0xi-yZ1N66ym6Ros765mw_1770863122
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8249cbbf769so577912b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 18:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770863122; x=1771467922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BW+Mgpaq6SwF9hkVhCNywA9aCMpLFaTHrW15uFZTbFY=;
        b=Z+rltY4QRzVZo/yBbE4NSZJBVXgBFPWm4NsTHXw4GeFJ4kRepLqC8P8fe25OKPSxHd
         BbZcd906T9qlGFh4UIRwp5j/sOlCT/tUs6383RTCPEgVtLRe/TBMdGsdLOZeRXQ+Ccte
         LeqCHwOsZ9ZIhS6uAI5lSfN6pTAYxTTN//Ny5GDYaao3K/+TLy7EGd9WoO056YYXEIkV
         Upcnn6YdfjvTH+o9Ur7+2hbECFqlq3Jlt366FVL8iw9UVcfBnCInAzHtrHonwYxuuEdL
         cDYpSix35D5pQrRpDYn2VS7C1XTnhiLYHpBwo4oY8fjAMpdRzEBMoZVSTIl8jw7g3DLD
         m73w==
X-Forwarded-Encrypted: i=1; AJvYcCU1Oja6jFsU79Z5qi85H3txoRqos77giCiWOrhndX2dZErf4GuTUYxT8wHI2mxGPDgUse84cjvCbrJAT867@lists.linux.dev
X-Gm-Message-State: AOJu0YzY0xMgTQ+rjrrsdqlnilOeBrojLaIlEBsiXDIcw8GWwFnPG2R7
	lMg2tUwLkDFzbqydgWCWRiQvOsCyoQHf8wBv9dlnzVSNIY1jOqyGcnTMkDZl834j3I3er7Dx4Ss
	oemRYLB9xhThZrkraiSVaV/hX25FxFOBRct9FA/W1Wda5NUmSy+RKIAkpBVmK1kXPOAU=
X-Gm-Gg: AZuq6aJOSp9YhHPCyxXc+UFQRZhiBFLOIMLl+VFzDOxhfIanc0EUURTvYe7F8naWckm
	8uM6Uh5FLrDkxBQrzGU9reoxsFwC4x9hyGiE1ei7LdPNOrylgkRuC8X702WQFDoqmO1Y6+wUj0n
	y8wOjANfE3MhdTMkNeShl7Ja22Jzu+MI6vR0FRUnHje8qXYYRPyfNI5nZPB8pziCW5IlWh4fOgZ
	KHwD1ZeoaLgqSD0ocMgexR2xmJP6NUvjZR2ccmfCGsNqCeajoGJA4Y91fXjMUoh2nGhOU27xNWh
	ikJNaOr5v2AFBUtHbsYMdM+kbH6PmbS+3mTvwhL2kutCWPn0U3OsND5ltoEeK2sW5rxnRn/mDLK
	JaJKRrdJUbW2Y
X-Received: by 2002:a05:6a00:1d84:b0:824:9451:c1ee with SMTP id d2e1a72fcca58-824b3068659mr493707b3a.55.1770863121965;
        Wed, 11 Feb 2026 18:25:21 -0800 (PST)
X-Received: by 2002:a05:6a00:1d84:b0:824:9451:c1ee with SMTP id d2e1a72fcca58-824b3068659mr493667b3a.55.1770863121385;
        Wed, 11 Feb 2026 18:25:21 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e8198a6sm3984873b3a.50.2026.02.11.18.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 18:25:20 -0800 (PST)
Date: Thu, 12 Feb 2026 10:22:10 +0800
From: Coiby Xu <coxu@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <aY05DpHN6QL8xQQ4@Rk>
References: <20260211082401.2407853-3-coxu@redhat.com>
 <202602120648.RgQALnnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202602120648.RgQALnnI-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -h6O7prz7oHQlzif7evVDF5ecVLCKy9mrZpLuSX4AKo_1770863122
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Feb 12, 2026 at 06:35:52AM +0800, kernel test robot wrote:
>Hi Coiby,
>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on 2619c62b7ef2f463bcbbb34af122689c09855c23]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/crash_dump-dm-crypt-Don-t-print-in-arch-specific-code/20260211-162729
>base:   2619c62b7ef2f463bcbbb34af122689c09855c23
>patch link:    https://lore.kernel.org/r/20260211082401.2407853-3-coxu%40redhat.com
>patch subject: [PATCH v4 2/2] arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel
>config: powerpc64-randconfig-r111-20260212 (https://download.01.org/0day-ci/archive/20260212/202602120648.RgQALnnI-lkp@intel.com/config)
>compiler: powerpc64-linux-gcc (GCC) 11.5.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120648.RgQALnnI-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202602120648.RgQALnnI-lkp@intel.com/
>
>All errors (new ones prefixed by >>):
>
>   arch/powerpc/kexec/elf_64.c: In function 'elf64_load':
>>> arch/powerpc/kexec/elf_64.c:82:23: error: implicit declaration of function 'crash_load_dm_crypt_keys' [-Werror=implicit-function-declaration]
>      82 |                 ret = crash_load_dm_crypt_keys(image);
>         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: some warnings being treated as errors

Thanks for reporting this issue. I'll fix this issue in new patch set.

-- 
Best regards,
Coiby

