Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6314C1DA23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 21:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718831223; cv=none; b=rZVCF1N81G4ZeaR18Kwy+spyvKuOXM45USk9ygD2zmjINUpOBfmpx56WC3DzMp4DatDwfdOGGgleqP8RpGtric6gH3MeniNvj0G82xsFu5Jl3ddd1NgBuNmUO+1RMuH+fLQClGacq9TUgXwpZUxkVvHnr093GfFExGP/+xTRT98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718831223; c=relaxed/simple;
	bh=Id2c5+TkEkGLnTdJlWxvcv7CatC8JE9ewiUZwHunvWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ME6QZEQwDOA7qAIOR+cM/B4x4xcCLmlt87LayspleroppeyYbCAyL3SnhS3++DAN/TqY1QgQgASiX7lYuHEGcxvf0/2nBjkkUFcN/It1pH8O1dUdlh++z1W5MkNNYPWR1JwxhfMVRKGqvjK3D8ouDqdNadsXzPEqTRiadU1DLAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHF8Zybw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHF8Zybw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f6fada63a6so1651875ad.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 14:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718831222; x=1719436022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ8YE+ClvGwcyb1zAHMiV6hSznoZItrne+dyoJbbTB0=;
        b=OHF8Zybw53fRW7hMKpvx+hEOtcoEApEwisxPc4xs0Ch1M2Hu27SqBpfjCX1qQt+x3U
         mUTwESDuNc3o30WTb8CpGQ91BbfV6tBFj6n/hzDAmI50iwcfOMZ03+tmSTsxewWq8llq
         mV4VhinpIip1UY8NpsoYtxxMAzz+dYDgyZlbnMKaw2rCyqP52CEeLrpqEUSz/p1/QnNG
         himsL+PylUFhBy1yGGxDeSJ8OElreHPiLNhos07apAQy8gybC1ASwt5hsc63FfEuLeAS
         uRl7UUwQmwfbwe6FeJwL9MnGs6VUIkftnw1qCKFgdRAgQNv837vlZHNikVrdRLraYAsF
         EBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718831222; x=1719436022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ8YE+ClvGwcyb1zAHMiV6hSznoZItrne+dyoJbbTB0=;
        b=utIWA/B2iU/S3w3TwOrInF8EdMo4LAn7XnASkpgC7rsSW2xuSQvTrkxlQ56adetnkb
         RuvxkccJjrV7Rrq3SW0/T6kJH/2zAA1oPREgVba372tTffl6v38C3oUTc7UdKwiPz5+U
         IDuruJf13AJuwVo07OzvdeaEUBWOXJm2h++gvgfmYhcxoCGEjoJwMoXQIPlZBcva1UTR
         J+FR9wfVp0d+ILgLeyYuaoXJosGw5nCzJVifql+qbw+LHkvAGV/HVl1XMqT/XgqFUTdt
         b5uYPGYHOTdvVkk5n2n3IPgA3Aq1E02edm2RDOssLKwIaWdJ7FXD7mHqGrANA5tcinAX
         FJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDs+2+8TnXBzc2yF1A4LH2s6JriPfouFMgS+OQLs6g35drNbJFeBVQ0P6EHhgSeGMI+iw/vZ1eJTLUmNBY9VuCbdaIQkecDxgJdP9JQQ==
X-Gm-Message-State: AOJu0Yy7J8Idd8G0+RBPdLKHUeqc9Y3pZDEUtO/YOt+5/OiMr4wNupI2
	UHIqRLIojrqbBYkHGyBjPXIcQTzqzrVlR21A1OOtHIp8Nip6htt/
X-Google-Smtp-Source: AGHT+IGka42sQSuDxfJUhRxDzJXo7wfvmG0yeUaYHfbYX3PGtZXgjzFXMPWo+hdA3oASFuHN0mKivQ==
X-Received: by 2002:a17:902:f549:b0:1f7:234b:4f47 with SMTP id d9443c01a7336-1f9aa3e7017mr37429365ad.27.1718831221651;
        Wed, 19 Jun 2024 14:07:01 -0700 (PDT)
Received: from localhost.localdomain ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9a78657aasm25893525ad.0.2024.06.19.14.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 14:07:01 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev,
	v-songbaohua@oppo.com
Subject: Re: [linux-next:master 6728/7105] mm/rmap.c:1413: warning: Function parameter or struct member 'flags' not described in 'folio_add_new_anon_rmap'
Date: Thu, 20 Jun 2024 09:06:41 +1200
Message-Id: <20240619210641.62542-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202406200059.tVU9semU-lkp@intel.com>
References: <202406200059.tVU9semU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2102cb0d050d34d50b9642a3a50861787527e922
> commit: 41bb9aa5f614423659ced668d0f1ff0c1da6552e [6728/7105] mm: extend rmap flags arguments for folio_add_new_anon_rmap
> config: arm-pxa910_defconfig (https://download.01.org/0day-ci/archive/20240620/202406200059.tVU9semU-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200059.tVU9semU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406200059.tVU9semU-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> mm/rmap.c:1413: warning: Function parameter or struct member 'flags' not described in 'folio_add_new_anon_rmap'
>

Hi, Thanks very much for the report!

Would you test if the below patch fix the WARNING?

From: Barry Song <v-songbaohua@oppo.com>
Date: Thu, 20 Jun 2024 08:57:55 +1200
Subject: [PATCH] mm: fix the missing doc for flags of
 folio_add_new_anon_rmap()

Fix mm/rmap.c:1413: warning: Function parameter or struct member
'flags' not described in 'folio_add_new_anon_rmap'.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406200059.tVU9semU-lkp@intel.com/
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/rmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 9b7310120ccb..df1a43295c85 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1390,6 +1390,7 @@ void folio_add_anon_rmap_pmd(struct folio *folio, struct page *page,
  * @folio:	The folio to add the mapping to.
  * @vma:	the vm area in which the mapping is added
  * @address:	the user virtual address mapped
+ * @flags:	The rmap flags
  *
  * Like folio_add_anon_rmap_*() but must only be called on *new* folios.
  * This means the inc-and-test can be bypassed.
-- 
2.34.1
