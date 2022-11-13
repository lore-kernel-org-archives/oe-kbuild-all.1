Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159977E5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Nov 2022 22:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668378837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O2hoXnIfgvOzO3T+U/es9J0VUcpxguVgLPnnVOVorDE=;
	b=WGZYI9TOpdsXvMCJx1R1rOx/u5f4ixHCDoCEXIIqxniyRI0V2QgCvnLodpSJdmQSxwscC2
	3K6GW8fvt5Zj8HtrXAJRActfMkyp2Mutj7SoPz2zAcJc0tjSkYXHeGHNk2nfitRo5r0aXI
	V8DiPAFxqR7YOc+t/Q6qfd3wToK6sd4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-gORxot-RP3CjbkL0IGlIpg-1; Sun, 13 Nov 2022 17:33:55 -0500
X-MC-Unique: gORxot-RP3CjbkL0IGlIpg-1
Received: by mail-qv1-f72.google.com with SMTP id d8-20020a0cfe88000000b004bb65193fdcso7457186qvs.12
        for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Nov 2022 14:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2hoXnIfgvOzO3T+U/es9J0VUcpxguVgLPnnVOVorDE=;
        b=oksRgDWNktPPrULgQ0smSqbTruyAh8FWwgIX/Dn9UFLyVtvm9fp9RBPvdwyG1aWYc1
         eXJSDI0SXySyR6KRnt1wt61efM7yAZifygYs6HsQWOvCijBHV0rVlHII0tRIfQw80ReG
         MNzOONgrDdF7sB2PZp+dREuqCxIL8+7BXkBwNH0KWVpt3rvN9ukoIivoqPs2brm2hRA5
         WOZn1UAsC7nkqhgwlVzWIShQw63v7nCgEM9/w05hhM+pqZfCkJ9gtcwcXVAcx9EYwBBp
         xsMqz8a9RT70zBxdBOLbMlx+zCP+VLb45cbWyTTLGjKOgyPUsciPP0EISuVV8xnIFd7z
         wt0g==
X-Gm-Message-State: ANoB5pn2rj99/mtm0S1xGzJQzuWLohCOmcQzeRqD0CVpppKPBtvgrswF
	7rBoeVPVKhL/3DLVoSyd1qqZijCFF3F7DBbCk20HWUvTFTWGTPvhZqYnn74qqYuD3SgAPI+2UDe
	l84fDg87Zlb/+WKv/xLNHmkxurg==
X-Received: by 2002:a37:9343:0:b0:6ce:7d05:9f9e with SMTP id v64-20020a379343000000b006ce7d059f9emr8998650qkd.409.1668378835411;
        Sun, 13 Nov 2022 14:33:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4eJQTFSP4CzAmOQbZu+GqM4Y5Eujvu4hcxKqkfEMsWacfjNBl7Li5FqqZNL/1wBRHLo8rusw==
X-Received: by 2002:a37:9343:0:b0:6ce:7d05:9f9e with SMTP id v64-20020a379343000000b006ce7d059f9emr8998637qkd.409.1668378835195;
        Sun, 13 Nov 2022 14:33:55 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id g26-20020ac8469a000000b003a5416da03csm4745644qto.96.2022.11.13.14.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 14:33:54 -0800 (PST)
Date: Sun, 13 Nov 2022 17:33:52 -0500
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ives van Hoorne <ives@codesandbox.io>,
	Nadav Amit <nadav.amit@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] mm/uffd: Sanity check write bit for uffd-wp
 protected ptes
Message-ID: <Y3Fw0DcIr/rXLw3v@x1n>
References: <20221110203132.1498183-3-peterx@redhat.com>
 <202211120515.eqlTdrD3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211120515.eqlTdrD3-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Nov 12, 2022 at 06:06:22AM +0800, kernel test robot wrote:
> vim +306 arch/x86/include/asm/pgtable.h
> 
>    290	
>    291	#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
>    292	static inline int pte_uffd_wp(pte_t pte)
>    293	{
>    294		bool wp = pte_flags(pte) & _PAGE_UFFD_WP;
>    295	
>    296		/*
>    297		 * Having write bit for wr-protect-marked present ptes is fatal,
>    298		 * because it means the uffd-wp bit will be ignored and write will
>    299		 * just go through.
>    300		 *
>    301		 * Use any chance of pgtable walking to verify this (e.g., when
>    302		 * page swapped out or being migrated for all purposes). It means
>    303		 * something is already wrong.  Tell the admin even before the
>    304		 * process crashes. We also nail it with wrong pgtable setup.
>    305		 */
>  > 306		VM_WARN_ON_ONCE(wp && pte_write(pte));

I just saw the comment in check_pgprot() right below:

	/* mmdebug.h can not be included here because of dependencies */
#ifdef CONFIG_DEBUG_VM
...
#endif

I'll repost, will be the same as v1 code-wise.

-- 
Peter Xu

