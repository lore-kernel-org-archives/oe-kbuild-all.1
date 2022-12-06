Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0F27706
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Dec 2022 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670343719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sCUP81xXIy/70El6lCPLbAYE27sraoFkLSJy6O9sUWw=;
	b=N0NqVe8GnpFJ1lSw9V+DPaCVN5cwo/J/cj4uoIEEnyobzon2NYC3D89gf5KlOdg92KDrYD
	KGwyBMPGQo+748WdZI4SYK2a4dhAJn8YSR1SrqFsefPIWdaB3Pg1ehzEScyeohZ8xfL5FM
	tnPoTDQcb95Wlw+HNmdguZmBQogaI3k=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-W8wTviw-MICinKeLFQT4uA-1; Tue, 06 Dec 2022 11:21:56 -0500
X-MC-Unique: W8wTviw-MICinKeLFQT4uA-1
Received: by mail-qt1-f197.google.com with SMTP id j26-20020ac84c9a000000b003a7e6d38e01so5194628qtv.14
        for <oe-kbuild-all@lists.linux.dev>; Tue, 06 Dec 2022 08:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCUP81xXIy/70El6lCPLbAYE27sraoFkLSJy6O9sUWw=;
        b=EBSP3Xe1SFXPgjbtCelI3PcsEueDZRpt4u7CGpgckgQXNdl5avQVQdV0Jfkf2E8VPN
         3sDKbU+XTiN/6ySoFMNvehcxy7tEYrXCTieYTzzG7fky2Mscn9Mvvi7cdJd0sNYyryN6
         ekPpJ1CenmVZIA1v7MY1tO8+YGXdb8PSjAEcX7yrWM1Cos36nLBk11cLUBk5QV/yaH6D
         D9G37t+RErRoAssbqrp2c5TLajQ8q9z3ndCIZxr0Nc3aZgYrRQS/BWAo+KWv6ZM7lNWr
         RlY2DLCMzKP5uIa7ystFDA3S3K/KukxWvvO3dxk/cOG63ydZo2mi+ATIKhy6ZMZ+CNpV
         rPhA==
X-Gm-Message-State: ANoB5pn3hs5Tur3W37JMzrWA0U8lcohoN+oRYFF75p/UALB/DDB+KJT2
	lCCMzFWvvxxboSmyqkR0RGKhsPjupPzg6bVNS14mCS9G6tOVwrfbne+C8TSaNkqEtMVfr3ycUfU
	2k4wp6iOqxHMWZThPLHz7Nnj09g==
X-Received: by 2002:a05:620a:b9a:b0:6fa:432f:298a with SMTP id k26-20020a05620a0b9a00b006fa432f298amr63417869qkh.159.1670343715699;
        Tue, 06 Dec 2022 08:21:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4EsM3BohWqkEZPkf2Bazdn88pyZKyN2ExwE9KgYwrNWoq74e43cW2/M3n+Ei57iDV3EOHs+Q==
X-Received: by 2002:a05:620a:b9a:b0:6fa:432f:298a with SMTP id k26-20020a05620a0b9a00b006fa432f298amr63417854qkh.159.1670343715469;
        Tue, 06 Dec 2022 08:21:55 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id bj9-20020a05620a190900b006b95b0a714esm14931361qkb.17.2022.12.06.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 08:21:55 -0800 (PST)
Date: Tue, 6 Dec 2022 11:21:53 -0500
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: David Hildenbrand <david@redhat.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ives van Hoorne <ives@codesandbox.io>, stable@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hugh@veritas.com>,
	Alistair Popple <apopple@nvidia.com>,
	Mike Rapoport <rppt@linux.vnet.ibm.com>,
	Nadav Amit <nadav.amit@gmail.com>,
	Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: [PATCH] mm/uffd: Always wr-protect pte in pte_mkuffd_wp()
Message-ID: <Y49sIRZ1y6wq884J@x1n>
References: <Y45duzmGGUT0+u8t@x1n>
 <202212060801.yenOQCHL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202212060801.yenOQCHL-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Dec 06, 2022 at 08:46:17AM +0800, kernel test robot wrote:
> vim +316 arch/x86/include/asm/pgtable.h
> 
>    313	
>    314	static inline pte_t pte_mkuffd_wp(pte_t pte)
>    315	{
>  > 316		return pte_wrprotect(pte_set_flags(pte, _PAGE_UFFD_WP));
>    317	}

It's interesting to know the bot will test any patch I attach in an mail
reply, which is very nice...

I'll send a formal patch for this one soon.

-- 
Peter Xu

