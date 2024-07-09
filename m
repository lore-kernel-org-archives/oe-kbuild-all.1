Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ABC1836DC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720554297; cv=none; b=sqEkybT53NIX8Quxd4BeHlzOQUucUzVEWRihoYMqX/GvVUQllfAqab4FnX27D6QKNxs7EPp/7QpBTvUirjz09BGXSiNqUbjgJ1UjCmdTBP/3EZzM6QXhx4NqDcpPGg274HC4Vf3RwQG4mvFI9jSUDMFoDhZTjyzIrNpPdYGBL2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720554297; c=relaxed/simple;
	bh=2nkBlcGJqP8aQ/nT6DXjTCGvRZwrTG/Yjb2X557Golc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=N0KodQcIaJ7mb3cURG314SKEAxu3aqXyj2boog4+2n5f4A0xnWLciK5V14WtnQoHghAQdKdXj5VEU2jRWcaZ8qRp3WZo56GMxyE6l9JO4kDF2vnR+OEHYbz2e4YJE3YfSZ0SFl8AK8FtQcGV7QsrBYbq3CtSaCW3rKFMQnLBgjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KKnMstD1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KKnMstD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720554294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pXci+blh8PkiQtprZqDs2hDj0sD+bUxrPmPIC5bsg+Y=;
	b=KKnMstD15uETrCVIcggT/SlKLrBcKaGdFAcaytARKM9Nkc1/pOgpmy+JqyCBjXFWP6NIYa
	f4Yl+qGDRrHXLBnOJOUYPmuSn7Gi1yxi8U5vM+QW9GHwMpfHnq8DBna0TKDF3R+blsEu0l
	HNWfetZ0yPAW+Iq9ugUz/toQXZWwiLI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-JpP42dRCMzqCRnooBjaWUQ-1; Tue, 09 Jul 2024 15:44:49 -0400
X-MC-Unique: JpP42dRCMzqCRnooBjaWUQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-448335bb53aso1614581cf.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Jul 2024 12:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720554287; x=1721159087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXci+blh8PkiQtprZqDs2hDj0sD+bUxrPmPIC5bsg+Y=;
        b=p9Ih7sWWa+kFe+L0Q/juoN0idUc4jWnqwHUVDYNe5/VyegNqBJLEBrnWK/7+msRLty
         //e0m8dHXifKBpsgtvGp15VcBqtHPm2dG9Jum2zr5yjz4zUTOBmb5y3HkmEMEYNHlI+W
         etfiArxv5zXTOxx6kx/KqmqOmllGmxZ/nEqvNDLXrht3naIQKU/EbPIKRTW1ztG5m09q
         4StofREQWtUGWQhQJ4+Vc7U0udRJfGn/hYJNFCI1iyBY85LDiiw2DIjg9IqSSs+WAyBC
         +QmYkfYt4FIy0eUns/QmBzecmNnCXqt1lzoXGL3VpFzDVWT/g4BN7ItMdWL4w3wiS9HD
         aSkw==
X-Forwarded-Encrypted: i=1; AJvYcCWjKnEZ3gfnELW47zA/u3f2oeQ9clJoAG15q9eaT6dPBqQ8SGZwiNfPbP15NcY6XIervLUSp0hoo+hZtzIvVpJdRoGjJuAuighIRhNjaQ==
X-Gm-Message-State: AOJu0YxULRvrMoxbyRZ5Q/5X5pSNzNtcvdZUVWM6NQ3D+OK1vffgYC63
	1po7JOyS+Xprxq25XqrdhhoEVl3pCeuW9dDj8TXoJTLA60ozXDUit56A5p5yU0SR3BU9+p8vGTt
	tkgG5PK7yvz3ANxLPkEHLEUh8Zycn+OumRyoRaRSeQnYe8fCGspv+wZOg3PRWTD8=
X-Received: by 2002:a0c:ec85:0:b0:6b0:8202:5c4e with SMTP id 6a1803df08f44-6b61c214838mr37183866d6.5.1720554287692;
        Tue, 09 Jul 2024 12:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT3nxt9dEv/1jdMBOaRXRJgsCkAMxzEcLl92fDe742ry87qRXqAQQYG1bMf32HDc67VfqpLg==
X-Received: by 2002:a0c:ec85:0:b0:6b0:8202:5c4e with SMTP id 6a1803df08f44-6b61c214838mr37183666d6.5.1720554287366;
        Tue, 09 Jul 2024 12:44:47 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61ba8c087sm11474646d6.121.2024.07.09.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:44:46 -0700 (PDT)
Date: Tue, 9 Jul 2024 15:44:43 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
	Mel Gorman <mgorman@suse.de>, Dave Jiang <dave.jiang@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rik van Riel <riel@surriel.com>, Vlastimil Babka <vbabka@suse.cz>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Huang Ying <ying.huang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Dan Williams <dan.j.williams@intel.com>,
	Borislav Petkov <bp@alien8.de>, Hugh Dickins <hughd@google.com>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 7/8] mm/x86: Add missing pud helpers
Message-ID: <Zo2TKzvv2rkKjfTg@x1n>
References: <20240703212918.2417843-8-peterx@redhat.com>
 <202407061716.WH5NMiL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202407061716.WH5NMiL2-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jul 06, 2024 at 05:16:15PM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-dax-Dump-start-address-in-fault-handler/20240705-013812
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240703212918.2417843-8-peterx%40redhat.com
> patch subject: [PATCH v2 7/8] mm/x86: Add missing pud helpers
> config: i386-randconfig-011-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061716.WH5NMiL2-lkp@intel.com/config)
> compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061716.WH5NMiL2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407061716.WH5NMiL2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/include/asm/atomic.h:8,
>                     from include/linux/atomic.h:7,
>                     from include/linux/jump_label.h:256,
>                     from include/linux/static_key.h:1,
>                     from arch/x86/include/asm/nospec-branch.h:6,
>                     from arch/x86/include/asm/irqflags.h:9,
>                     from include/linux/irqflags.h:18,
>                     from include/linux/spinlock.h:59,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/mm.h:7,
>                     from arch/x86/mm/pgtable.c:2:
>    In function 'pudp_establish',
>        inlined from 'pudp_invalidate' at arch/x86/mm/pgtable.c:649:14:
> >> arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
>       67 |                         __ ## op ## _wrong_size();                      \
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
>       78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
>          |                                 ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
>       12 | #define raw_xchg arch_xchg
>          |                  ^~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
>     4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~
>    arch/x86/include/asm/pgtable.h:1415:24: note: in expansion of macro 'xchg'
>     1415 |                 return xchg(pudp, pud);
>          |                        ^~~~

So this is the PAE paging on i386 which indeed didn't get covered in my
testsuite.. where it only covered allno/alldef which were always 2lvls.

I'll fix it when I repost, I'll add PAE into my harness too.

-- 
Peter Xu

