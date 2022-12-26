Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3279D7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Dec 2022 06:53:05 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id ja17so7116848wmb.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Dec 2022 22:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6Bjyq3PbciobfHplcIqHi8GfNd0dEieI1UmWpyNQ6A=;
        b=Fj7+aTaGeZ1OWqiOzCXj6wkcKchXkxXTx9RjgW3fraSv5+Ren1F7xTzO/kI6Vpebb6
         rduIP8kgYsyZnxOqsPY5zY91+KXEAFWHPpCEF8DvshlBvxisqO+gtdUMJwtftx9ngJAi
         s7E153x/B7fysxAjmUIs4OI95KjQ76qlnrRN90m1z0aSc81X5Mmsj0RU5FfwPTLTnoEp
         61xcSucY9A1KUmXeOvTz/veoxdDMG3BBH+lWwfYKpXifs4aBbWzzQPAL9NS7yJ+LOFVM
         TR0912mdRnBhhkk2doKzXsIQwaYw1wzhK+rfdCLBJ8envYY0NfK4EPZffehVWTKeqRqS
         IofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6Bjyq3PbciobfHplcIqHi8GfNd0dEieI1UmWpyNQ6A=;
        b=Wtj7PonJW7jA92Sp1XUsTuO3iHUPqGNIeb1s8dC7Jo/y1YtpY3iB3spBV83wyMLWT6
         SYZ0pZEBmyG8Kci6TuTo+EX4nveBs+Ik3dHJNH2GQC/wk7ZAwLmbptSrEt5KoIjaf33u
         m0kKMZ1gGwwpOsX+KaU5Gw6VgfZL+YbAvrpmRATmNOGdcDSiZ8YKs54zSdeQ332mml/f
         vwG7Vdrio+qbcXptYoidM2wYSz+6s9g/DAmGcRSpsm0+7k+y91HWcas/Cc18SUMU804c
         ERUZXdT3rVavHEN6EFqjeSSrPu8LRiNfZW6ZSqsYdlQ6JSqM4CucaBiazfLiYJdIccTd
         HJ0A==
X-Gm-Message-State: AFqh2krIFQRtrNRu9SQSwhe6MrwuWFXdGNlnZvS6hhyy4P6hfCRI01uD
	NIWx2nt+tWx6BvMDSFZ+QTU=
X-Google-Smtp-Source: AMrXdXtQPgBmtSPhx6oAqH6QhBicZ+d2CSffh+eEps9w12f7PsnrQKaeB7CxpPudPEwxwXmwxPtUMw==
X-Received: by 2002:a05:600c:2e44:b0:3d3:4406:8a3c with SMTP id q4-20020a05600c2e4400b003d344068a3cmr12037558wmf.32.1672037583299;
        Sun, 25 Dec 2022 22:53:03 -0800 (PST)
Received: from localhost ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003d04e4ed873sm1624763wmo.22.2022.12.25.22.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 22:53:02 -0800 (PST)
Date: Mon, 26 Dec 2022 06:53:01 +0000
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	Liam Howlett <liam.howlett@oracle.com>,
	William Kucharski <william.kucharski@oracle.com>,
	Christian Brauner <brauner@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH 3/4] mm: mlock: update the interface to use folios
Message-ID: <Y6lEzZtcbpp+OgvD@lucifer>
References: <74874865335885dabe0751c1140a6d198dea333d.1671738120.git.lstoakes@gmail.com>
 <202212260802.sZoecM1D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212260802.sZoecM1D-lkp@intel.com>

On Mon, Dec 26, 2022 at 09:05:42AM +0800, kernel test robot wrote:
>    mm/mlock.c: In function 'mlock_pte_range':
> >> include/linux/page-flags.h:273:43: error: '_Generic' selector of type 'void *' is not compatible with any association
>      273 | #define page_folio(p)           (_Generic((p),                          \
>          |                                           ^
>    mm/mlock.c:323:25: note: in expansion of macro 'page_folio'
>      323 |                 folio = page_folio(pmd_page(*pmd));
>          |                         ^~~~~~~~~~
>

OK so this is a product of motorola_pgtable.h defining pmd_page() as NULL and
the type magic in page_folio() getting confused. Easy fix, will spin a v2.
