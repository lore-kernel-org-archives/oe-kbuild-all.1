Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB2725568
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711206561; cv=none; b=OZ3FF2TrYgW8lR0O6sT43iEXZio0gA1VXp+4REVtsrpyrsBgcKve2DRWxiwvhaaa0VhGarfXDpvCHxkRtVhqPPS96w3AgyZxMmUC0LaTn6Ur8lySSTCeZcxK1PBKEpPTW+sqKpCmVR585ARzcSRPu8grswgaPO1tJBOJGCJojqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711206561; c=relaxed/simple;
	bh=f/Bi2SGNG57OmKLLu5C4KHLBZa1sIVnooKH5RKTu49I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LW9KUJy7VvO3Lo1jdp/Okw9BDY43grYDLy+FrlqTvusin3EmHtBQ+KaNZxbgmvTjKz4KyQmZQhKZLbJbs0daiFgWHvdRvBRtZwKKJKKAgu+qDvRyI4JMwZpxx6N29McOFSU3UeXiZxhNc2e5eXNx5BBvmpoDnEzuCP0NpQNoEq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AFM3N/Dt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AFM3N/Dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711206556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Gkwe3RugO/qU9qXn91T+5RzKi/2azT+9SdH6n0yuDQ=;
	b=AFM3N/DtmZzuxMNyYkn33USXESrb5d7AFBIHHZVnj7wmuMBhfV4lvka0KTYYhy0Y5oFLqa
	OLsHyN9aviTNn7iUTPSlhipBtxsJIETdW2Dn00NVts1hkSCld2vdQV0lzWNqlze7UV7S/u
	80w/RmyjLWOB4LL/Grf7M5deAj19ReM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-BibmiULeObmCyjhaELcrpg-1; Sat, 23 Mar 2024 11:09:08 -0400
X-MC-Unique: BibmiULeObmCyjhaELcrpg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4311dd10102so12183861cf.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 08:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711206548; x=1711811348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Gkwe3RugO/qU9qXn91T+5RzKi/2azT+9SdH6n0yuDQ=;
        b=Es7BwoGx2wyB3o1E10whGfb+AFJbwxlTfTTMu1ABCdkWsdQse3/3P5/F3Wp2KJ6L1h
         1F1vdK64UOVLWFd1nGycg9CrmBAPCnI6oixdGAq/TGFsaK+zt7/NE79QTmuCyFi3kGG0
         fkTffFZ1qB7TNFr1IfQl5U9zOx0SvxtzgzmlRUKKqUmjoApITaAjbG2FySLMrNZqlhOW
         XMfZHQ7iNhNUwucMpUFWmklgTMhjj+02ImE62Mmt+h7pxRgiCimmtMsIyXwiiMGgiQx8
         i0pb5LA1tt5AMD0U/YbMwLe5AOiFBh5XaFwuNBk/Y+0sViWNbrk/JcrSSx+LfuEg8caS
         pxUA==
X-Gm-Message-State: AOJu0YyFJm2wCx8mvOr6ckwx3kutnMjFcQhXTSvG2poeZ+fRszKBp8QZ
	qABA300tvacZb4Lifk1gTrgyDkWm7LMOt+HHkVkPg15V5P/Vb5K55d5IpfuhxSqPco8Ju8+2hm3
	D4PJ1MkU3VL03ZpQTlv1vGDv/U6BodjrbOyp6InxS5Pe52VYtTHIkl8C1YEKEAiY=
X-Received: by 2002:a05:6214:3105:b0:696:6f59:4d19 with SMTP id ks5-20020a056214310500b006966f594d19mr2715435qvb.1.1711206548030;
        Sat, 23 Mar 2024 08:09:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH516xzE3UsxGqNOqz0JWWFXNZVhPgHdtkCZb20XbuKaLVOiykSXsHPkNfuTwevpb/xrb3uGA==
X-Received: by 2002:a05:6214:3105:b0:696:6f59:4d19 with SMTP id ks5-20020a056214310500b006966f594d19mr2715383qvb.1.1711206547355;
        Sat, 23 Mar 2024 08:09:07 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id gf15-20020a056214250f00b006912014b98dsm2149108qvb.129.2024.03.23.08.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 08:09:06 -0700 (PDT)
Date: Sat, 23 Mar 2024 11:09:05 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [akpm-mm:mm-unstable 115/141] mm/gup.c:536:29: error: implicit
 declaration of function 'pud_pfn'; did you mean 'pmd_pfn'?
Message-ID: <Zf7wkSr-S1qBT2hm@x1n>
References: <202403231529.HRev1zcD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202403231529.HRev1zcD-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Mar 23, 2024 at 03:12:08PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   af520f81c51001f7ccdf0579fc73df282b26292d
> commit: 529f3b89b7333564792458ca7be06f5bff258d23 [115/141] mm/gup: handle huge pud for follow_pud_mask()
> config: sh-defconfig (https://download.01.org/0day-ci/archive/20240323/202403231529.HRev1zcD-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231529.HRev1zcD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403231529.HRev1zcD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/gup.c: In function 'follow_huge_pud':
> >> mm/gup.c:536:29: error: implicit declaration of function 'pud_pfn'; did you mean 'pmd_pfn'? [-Werror=implicit-function-declaration]
>      536 |         unsigned long pfn = pud_pfn(pud);
>          |                             ^~~~~~~
>          |                             pmd_pfn
>    cc1: some warnings being treated as errors

This is a HUGETLB_PAGE && !THP setup, where on SH there's no huge mappings
at all, actually it seems to only use a similar cont ptes concept.. which I
didn't notice before.

We should have tackled similar issue with pmd_pfn() in 2022, where
7106c51ee9a1 ("arch: Add pmd_pfn() where it is missing") defined pmd_pfn
for all archs.

Instead of doing that (archs using pud_pfn is still not much; defining it
all across sounds like an overkill), and instead of providing a fixup
patch, I think it'll make more sense I provide a standalone patch to
provide pud_pfn() globally with a fallback.  Ideally such patch can be put
before this problematic commit if we care about per-commit compilations.

I'll post a formal patch soon.

-- 
Peter Xu

