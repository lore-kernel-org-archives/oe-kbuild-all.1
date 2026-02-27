Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD5346AED1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221543; cv=none; b=ZBni3pdxX3ssuB1SPhXqWC8+TPmPkEwYAWK2n+XRLgtWj5ZNqqeP0qW+yZbDFageUaU6EZncwMhqvtbkcB1YrLuSBSaBbfghK0T5qiPbwSiCW6ANGkOqaHsZhP79E9hBoEODxowiqLzobpCvY+5v0tCUnwL3PphYGxw0zGr45R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221543; c=relaxed/simple;
	bh=MsWV/6FClpkzicCm3xQ7Mz+UW79J9g21c9dx03dFvhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiUOzf+zdOJS0R2d/7mXSA5Q70gqcBq93RoNIcB75iOS3NJuUGe8OjkmZ8I7tNBNZc8hIDhe9RHFB3hDFsgsHFKjL7MssJ+S7IduNUCE4yhI6VpRT2GI/XgeHsw13V/tLt9dgR4oskrDA9K6hVhkK7AMDsh8e6sXdIPcjr5sPG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6+tY7MZ; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6+tY7MZ"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-679efb9eb0dso1812710eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 11:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772221541; x=1772826341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Jbxq4nQ7cCHo0K9mO13qBbib2DHZAL310WhuqAgZmw=;
        b=R6+tY7MZks1sP7RAS65t7kNMDW3p8UQuF0nRUzu9+jB+5KFNdlHNcOAQZA4GkA9+9h
         z3AvqvX4akxZHHZG/riuWNirm/OG/dW3b/KL0UloAgqVzdayuJUdJiq+PRqU/f5LQ0ep
         TO2Ppv5B9NNitbIlAAMyEcKfYOYUaHe9GHAdiQkDU6jVR83/CFh13dauxngYppexgu/V
         xY4/clqB8F5hY8LyKCLZTbh7domfRxRxpm7MOIdCGcyh7iXZvojf11pYAkExDdppeZxz
         z2bMm2z+1kHVLHadHxjY9cu2RRYYh+grF9wuTtnF8Pzu3P65tAn1JHxRGQxGE8ahqBBL
         kGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221541; x=1772826341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Jbxq4nQ7cCHo0K9mO13qBbib2DHZAL310WhuqAgZmw=;
        b=uaXod0XfcMikwsTGLYL1t9liMz29IcgqIV3XRy74XfY5mmmqL1A+yv/uErDOp4lDTD
         M/vsmSKzDpg3ttszucFZgoG11o/CUYOTHg/BFWRMypReYcpNBPuH09F84xobz5issctB
         ox/UEuESVxWsw8lCkr6PImWINSBtu1u9q5gvUx+0Afptiu3gUHEepwA8GAzGZxQHF1hZ
         Y3RygLP0ielYAhEsqrButDo0VLkWziDABSIDn7lVI7O61nAHCdmDfyWGkFcsSonGSLmI
         DxRR5YakayN3CNxaU06E1ouqyz/cW178IdmMch0FZvbVtl+5TeNSl+cA4VC/KUh2Irti
         nc3A==
X-Forwarded-Encrypted: i=1; AJvYcCVIAkcmLjuIuoeDvWq7LmCTmXBrUaaAHZnAeDxakFnxda20bBs6/UMdqiV2Jh9pCeGhoc/dr1BwFsoga3pX@lists.linux.dev
X-Gm-Message-State: AOJu0YwE3kglG8gzwYl9ViwJ/eogxniy/IOQSkIZML6Pj0co2T4Lfq2U
	IXk0IW8mrJ42vg2oLZj2+Ay0B7hpwwpwf8IpQU0EuUXAz7PPArmsD1Yd
X-Gm-Gg: ATEYQzxncGFNkZ5JnyL/J0OnS0ny1qXClVlDK9lMCSh8jqL08KHFhQnc1H1ZjkHuQU3
	DVJwEFj8yqndiAeNXIdZ+rw67kvc+Hzul3g6Tc9ay1sVqGrJUKwbsiPU25pX+KTYb81qecVTJeV
	+B8Fitj207VEwUjS8CWthKX2YhN7cBjN5YVN5ReoEZuFtRS20VunbhnK9anBo9NUXOUSjHMjd29
	Y+fI9GFKFoYjYiiok6CkFoWji+tMLcni/mWCm0LEEJekIp8j4cEWNNlfdb5FFMJE0eX6pkkslOd
	HLcwVjN5//xtEuGqynmV3dLsBfxDMH5GAQE8zepTvD8bodmhmGejEi+j6NpcTpEm/mrSfWpFKBJ
	USOiUof8I0eLzJijXDeKirdUe0tyQ8R/vQu0pxaWK5pyZZBuI/Xxsu5i5ZKQOqYRbSfIlPJPZCo
	JRfPQ/HZa0PtJJnenpoYDjTQ==
X-Received: by 2002:a05:6820:8187:b0:679:e7b2:9fc6 with SMTP id 006d021491bc7-679fadc292emr2651719eaf.3.1772221540840;
        Fri, 27 Feb 2026 11:45:40 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4d::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bfee3csm4162972eaf.7.2026.02.27.11.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:45:40 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	oe-kbuild-all@lists.linux.dev,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Nhat Pham <hoangnhat.pham@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <liam.howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 8/8] mm/vmstat, memcontrol: Track ZSWAP_B, ZSWAPPED_B per-memcg-lruvec
Date: Fri, 27 Feb 2026 11:45:38 -0800
Message-ID: <20260227194538.928770-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202602270607.dJP65LGH-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 27 Feb 2026 06:40:18 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Joshua,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on linus/master v7.0-rc1]
> [cannot apply to akpm-mm/mm-everything next-20260226]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-zsmalloc-Rename-zs_object_copy-to-zs_obj_copy/20260227-033239
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
> patch link:    https://lore.kernel.org/r/20260226192936.3190275-9-joshua.hahnjy%40gmail.com
> patch subject: [PATCH 8/8] mm/vmstat, memcontrol: Track ZSWAP_B, ZSWAPPED_B per-memcg-lruvec
> config: powerpc64-randconfig-r072-20260227 (https://download.01.org/0day-ci/archive/20260227/202602270607.dJP65LGH-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> smatch version: v0.5.0-8994-gd50c5a4c
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270607.dJP65LGH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602270607.dJP65LGH-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/zsmalloc.c:813:17: error: call to undeclared function 'zpdesc_objcgs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      813 |         bool objcg = !!zpdesc_objcgs(zspage->first_zpdesc);
>          |                        ^
>    1 error generated.

Hi Kernel test robot,

Thanks again, this seems like the same problem of not defining
zpdesc_objcgs outside for the !ifdef CONFIG_MEMCG case. However, in this
case I think the change that needs to be made is actually to make the
charging happen unconditionally, and within the charging functions
check if objcg is present, since the node states can be updated even
without the concept of a memcg.

Thanks again!
Joshua
