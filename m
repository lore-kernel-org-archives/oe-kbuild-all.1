Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B114C3CF026
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 04:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778820065; cv=none; b=Vhn+irIxb/igQdrK0/Vieea2T3Ov8nIn0cgfMqFW3ZHxVgppiVg6W50f3c7mKPYNpeFhxwp/pDaxw25qVp/hDQ5NSDc/ekyfNiclZDTOxPFCsbgQMzZ2oDkeKHRkM/VnwAoxhFlRN9+IkqDLmi7a83Au9zSJ33kee2J2++kuKkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778820065; c=relaxed/simple;
	bh=9a80VyF9eQBB7SirVbvuneJJRgZM5l9KRCZLxx+vXUc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KCg5UCIShF0jTtPVv1FfLkK8yhSr6cdl0Zf5xcIKNXh+pGHq9JhyxP1IzIjyZhJzK17DMI+90ZrlQpVvUL8goWNwqXXzeVHMfWZfN8mT0OoWwGkpS6togDWBuUj+Dld00XvgDQB1TKaX/mqTg9lvIGFg5roSMn9C86L4ub2DkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tyojUmUO; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tyojUmUO"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ba838d3fa4so95010585ad.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778820063; x=1779424863; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IxEV3VBQwFIKYZPDBoIoAMK7fCm4nOYgTLu29NGJuN0=;
        b=tyojUmUOMgA8LN6y01YYlnqasw0otU2Dc8Wu1dZ3RU0A1Q03WyUNSI/epeqhVQ4aKP
         wWTa/FwghYkSOVGUF65xq38RSGWUor2jt9gCq+j/tImfhZEUnZ+nvvMz8Cu5t/IUrbhc
         B/klkIg0+0m13s068scagoTFPTSDxhCOr1yGlRRjtObhKqob15MGH94FiIniSWK5Wlts
         TzwqzH9zl38AG7fob5Ea8eiE33G+hTjwR4ia9GFGIJ26gOMmaYS/tYqJ+Y+M4fMfW1cn
         bE9Pkb4Dojfhv0bTN1dRTxkbDlwkodlQcPhFLNwFWfzbQYbOCRzsrEYGOhL9aknMS+Q7
         OUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778820063; x=1779424863;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxEV3VBQwFIKYZPDBoIoAMK7fCm4nOYgTLu29NGJuN0=;
        b=A5m3Yuq7eStxHk7/r3M9RQzrwjCgkTIMDHtaLGBmR3QGvE8qx4oWDUMiehjY+F5Ej5
         eV0sH0WyMQedrx60XJoQ/YN3PiLzqOX2WJ5uDxVfUniL8v6mqI3BSS7T+h6mzOVFNbq/
         hM+cjNwLHYamktf0x8wXGPyElEHKBBLdDtSS3+Ls18CxWSiiPgJnHffzsOoRr5B1rjBE
         5blOB95vHEy4M6OqrVu9vNE/A2+07QCANDxeGuhhE+k6SZ2QFxdPDirTIa8ciYNy4284
         WshUGSUVkOxQ2dFCMuHKxOSm1sKipGw5NbLy2supRNx97c9P47TDVQcWbFHkNlgxQHJ/
         AfbA==
X-Forwarded-Encrypted: i=1; AFNElJ88JAAOirtvKyN35U3xoyGfO6vGH5y+jPA1y0BoNBP6JgFPI+YM3JnOB/rpHxT5ZA0BmRDywOeF4rh7wpoN@lists.linux.dev
X-Gm-Message-State: AOJu0YyVbbuTNfOKNrefO2SGjRuGrg3bu1Ct8wnsg+5zQmzP7AZhmn4/
	BLa06/TXVpZ4qQJIPTPVTq461fFPVrSX3qzIYT1zRb59uUoCDZLLujidPy03DZQ7Yk2PmYw2RA9
	V/ICaHHts0pD40NDIhFgiLUN02g==
X-Received: from plsm7.prod.google.com ([2002:a17:902:bb87:b0:2b2:4686:4b8b])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c403:b0:2bd:8dbd:17e6 with SMTP id d9443c01a7336-2bd8dbd19c6mr3677915ad.35.1778820062786;
 Thu, 14 May 2026 21:41:02 -0700 (PDT)
Date: Fri, 15 May 2026 04:41:01 +0000
In-Reply-To: <202605150328.mn2hv1fZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202605150328.mn2hv1fZ-lkp@intel.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515044101.2517293-1-joonwonkang@google.com>
Subject: Re: mm/percpu-stats.c:125:9: error: aggregate value used where an
 integer was expected
From: Joonwon Kang <joonwonkang@google.com>
To: lkp@intel.com
Cc: joonwonkang@google.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> tree:   https://github.com/intel-lab-lkp/linux/commits/Joonwon-Kang/percpu-Do-not-trust-hint-starts-when-they-are-not-set/20260513-070153
> head:   53a3f421840a59abecd38cc1be7c4f1d4516c3f1
> commit: 27e83e031c0de38ffad3fe513474bff375c2a896 percpu: Introduce struct pcpu_region
> date:   2 days ago
> config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260515/202605150328.mn2hv1fZ-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150328.mn2hv1fZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605150328.mn2hv1fZ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/percpu-stats.c: In function 'chunk_map_stats':
> >> mm/percpu-stats.c:125:9: error: aggregate value used where an integer was expected
>      125 |         P("contig_bytes", chunk_md->contig_hint * PCPU_MIN_ALLOC_SIZE);
>          |         ^

Hi bot,

I guess you picked up an older version than v5. This issue has been fixed
since v5. You can also find it in the latest version v6 [1].

[1] https://lore.kernel.org/all/20260513085117.1024175-3-joonwonkang@google.com/

Thanks,
Joonwon Kang
