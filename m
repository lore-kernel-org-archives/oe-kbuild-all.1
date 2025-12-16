Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2BC2EDD7D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868451; cv=none; b=VXaWzLIjfhmo7EgGok5PyIs+Cq7vQ6/9VX3dXmlQILMjv5NXb2m1jufs6xLrL8tUcmgZ5STvmzfJjC1btmogf7s/9mC9EgT41UCrX54KA3wvkQG6pmc+jbXqCen1Iq+iwSpWCUPOIzY+JEO3ywxprfsTisyQOIARpBBbrnAiSMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868451; c=relaxed/simple;
	bh=wKWZMx1ykQ3G+9hhyzzVlD9awS7htZy0ls4XG62JgLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHemxNC0nK288lJvPuHUu62BWKV1MRHMfk81hUXpufkl6tFDztQMqAajg7J+wwfZlsFHBhXMxKkYGZ90rmq8xuvhtKXvKhuqfFxpxxPT5NJfJ3Cl9dSN81BZyB8GzLm9oi0AX6YcXvAZ1zMzcaiKglvkSzi6hevstXyan3zpSxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CF0LX8e2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CF0LX8e2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a099233e8dso23280235ad.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 23:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765868449; x=1766473249; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QFAmpRfxxeFHVpZ67Bvb+vEc5qUXOEU1rpTMEK2KAsI=;
        b=CF0LX8e2o35GYU8Vp8DHZQebcP9pqdRAuc4Z8RIYPFC6c5hmM2tAqbbc7i/N8QmDR5
         eoLg9oKKScBh6rMd72Ey6wqf1RN5rz4WQjU+PWN+NTE9GXVCUpab1zIMwZlmTo8Xm4YX
         6KEjSq621L++zKonmIwiQl5kkA7lIjMX2ineS+0jozxA8U4VfzZZb6AMj+bcM2J9O9cG
         dRQNZY/qnUrN7/tCClmEjhqQ1HrXWhoFGGAW/i9Q9xxWL1TOxGsPbhcvh/oO4dHqIJEA
         cpZSr+f8T9+qfPkb6Zg8nQyKfTDq81X7g/M4yhqkrBhAm/bqFz8tYwlJPMeRfhKqoW78
         IiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765868449; x=1766473249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFAmpRfxxeFHVpZ67Bvb+vEc5qUXOEU1rpTMEK2KAsI=;
        b=UxzJ0LpmApbiJTjoMGO8BA+e0EdKTgRtJg+ObsXj2kI6SflFsByC+/V8qvakhsV1Bz
         XjTkeeEG7qYrXhQO023QLio3ZZ861v4xv9fa4ai3OT0kSclkIG5vpIeoQTldy4bXSt9/
         0oti86mpX6wNJimFqOTpMUMuBw8IKXzG+hkQ2h4rQEZgrT51bcrhQZPhDcGHfXunUpmT
         3MtjMVbkIoxms9WClCN1lI758XJk2Un1Rad3F4ZuzFziM+YLrS3VhMMKVld4SUXm+ufM
         9Lz0I0Q6GJQzj1CR5oqVwRcODlPJQBgPhHhrKYcQLTelUxwqoLuVUMp5LQRvKdlYCMS+
         h4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmvdJR6fD4XjcP+87y2/qLxeGZpRAM6ADloAN0VhAfIZMSefnQvY28dGkZGUupgrjQI+ZsCjrCtxU8FN8i@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4cxOHfGDzRBwgSqJyfQF/yGdvbWlV8hiPYvZ1yPP4yYOTJFTW
	OBkoVgW2Sorb4TN6GqIC1Wi6HdhGB5VTo6YLpQqHDIDljZBn/ghh55iX
X-Gm-Gg: AY/fxX4Gne7LSpd/NjIhnfDgMhYrYDuhkh0uDS7xRFbvfU7EVBANTbDEG1bYdrZsUmP
	OGPN2rfCTZRSl+k9H5mZF9J18JMgO328RB7qY1Ww/Ws0TOt4itLqut8KXmGC120FxLAA6zlDF9o
	+b+yQFY3UWYrPe00vRwL54RDnPg4nA3KCxHImJlGo8EVNjEx5b+uiRWygA0XvUf9rxo26mDmvZy
	2EVYMSJLPSnUMlQfuE/RtnvfefoyjhE/vsVDD8ZdWIjOo9ij+K/dLeW/aMwkAYjvaAXEk9LhleB
	Fxev8bOQw0BhNKOkYZnMjJxQQTIVxHJb/Fvgd7RgRFF42HoqDRGxjlnAkLD4sEXQX8PN/QxO/6Z
	Yk7Rr1d0IEdC0OjoPIMQOesGvEFaHN8sHkGqjUcoVf+13W+RdMrCrOXI5bJMYPUeK12X7uvu1Gd
	CF0W5zEItjHNP7qVBSdQbTxxm7
X-Google-Smtp-Source: AGHT+IGh6bmnUUir8G3p+H40K0uXG1XJ8Ee1y80UE7dusYw6M34uFWl8fwWh7yEEQaUxMtCplSPWHQ==
X-Received: by 2002:a17:902:d58a:b0:2a0:c1f5:c695 with SMTP id d9443c01a7336-2a0c1f5cf3amr79926245ad.16.1765868448784;
        Mon, 15 Dec 2025 23:00:48 -0800 (PST)
Received: from localhost.localdomain ([114.231.217.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a146538c6dsm3036695ad.52.2025.12.15.23.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:00:48 -0800 (PST)
Date: Tue, 16 Dec 2025 15:00:22 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, david@kernel.org, 
	lorenzo.stoakes@oracle.com, oe-kbuild-all@lists.linux.dev, ziy@nvidia.com, baohua@kernel.org, 
	lance.yang@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: Re: [PATCH 3/4] mm: khugepaged: move mm to list tail when
 MADV_COLD/MADV_FREE
Message-ID: <besdqn664ys7izgipfi5wloy4kmscosipizpbxt3hig6zvo2cz@yibkwnkitc7h>
References: <20251215090419.174418-4-yanglincheng@kylinos.cn>
 <202512160400.pTmarqg6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512160400.pTmarqg6-lkp@intel.com>

On Tue, Dec 16, 2025 at 05:12:16AM +0800, kernel test robot wrote:
> Hi Vernon,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.19-rc1 next-20251215]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-khugepaged-add-trace_mm_khugepaged_scan-event/20251215-171046
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20251215090419.174418-4-yanglincheng%40kylinos.cn
> patch subject: [PATCH 3/4] mm: khugepaged: move mm to list tail when MADV_COLD/MADV_FREE
> config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20251216/202512160400.pTmarqg6-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160400.pTmarqg6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512160400.pTmarqg6-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    mm/madvise.c: In function 'madvise_cold':
> >> mm/madvise.c:609:9: error: implicit declaration of function 'khugepaged_move_tail'; did you mean 'khugepaged_exit'? [-Wimplicit-function-declaration]
>      609 |         khugepaged_move_tail(vma->vm_mm);
>          |         ^~~~~~~~~~~~~~~~~~~~
>          |         khugepaged_exit

When CONFIG_TRANSPARENT_HUGEPAGE is disabled, trigger this build errors.
I'll fix it in the next version, Thanks!

>
> vim +609 mm/madvise.c
>
>    595
>    596	static long madvise_cold(struct madvise_behavior *madv_behavior)
>    597	{
>    598		struct vm_area_struct *vma = madv_behavior->vma;
>    599		struct mmu_gather tlb;
>    600
>    601		if (!can_madv_lru_vma(vma))
>    602			return -EINVAL;
>    603
>    604		lru_add_drain();
>    605		tlb_gather_mmu(&tlb, madv_behavior->mm);
>    606		madvise_cold_page_range(&tlb, madv_behavior);
>    607		tlb_finish_mmu(&tlb);
>    608
>  > 609		khugepaged_move_tail(vma->vm_mm);
>    610
>    611		return 0;
>    612	}
>    613
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--
Thanks,
Vernon
