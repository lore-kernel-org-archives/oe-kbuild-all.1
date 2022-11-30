Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA863C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Nov 2022 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669823591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CeqSwNjVEno70P0tD7HNeu67BLU3wBvOKBuwAC7eQo8=;
	b=KH45jko7jH4Xe40RHiehN/0/pC+as4fjaMoElEMRFxYSzrupSfIRJ7b2R5lxz52r6Lek+9
	rYTLdIk2Ub+US7hykX0pV+OogmQeBrdGYfabmFNzQAoZjjOWnj3beZYFgsnMeqoohdO6rv
	qI26QPpeDlHDZ82oka6C02RuLW5lIjM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-lgbV6HadNeqZEqY7_VZT1g-1; Wed, 30 Nov 2022 10:53:10 -0500
X-MC-Unique: lgbV6HadNeqZEqY7_VZT1g-1
Received: by mail-qv1-f70.google.com with SMTP id mf16-20020a0562145d9000b004c6d76c9efbso26977211qvb.13
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Nov 2022 07:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRwTsRF/kFVt6li6b4D8+8/D8JRMaZAotCBJm82Pt4o=;
        b=gD4L9BjDz3bPXpArFNxz9fdZP8vuNeBsTh+moBLDXHqY+pThyt7H9jplANDL5PHK6o
         92TBQAXX0GU3uZ0Wn5DUlpBCZrhG8ZTqGMXhkR71ObLhoRixbGzfJhm2iEWBzvMGZ6kD
         smlQHyQXASt1TtqdfIUbrpEcIgYp9/yywpBkdJ758JOkxcGlCltLdk+rURpj+gVkhtQK
         oTdGsjqRMpkMd6SmlgtKzOb/erSqQefL8cv5KhpyjztGs9qv3vHoJb4ZpTzBUPLT8uwG
         WZVtHahVGj5QbaMqAiMCWY9W1JEJ9URyj9OBF29mtCY5R1gwCWh5p0UgjJLIny/fUXvC
         q2Kw==
X-Gm-Message-State: ANoB5pk6pXTIcNU2xz9RM7K6yMyO/lJUWzzd24529Bmvw53LaEh8+0dF
	Sku6OGklS6vfZpKOJbC7JUyhiMVuKgDCbIxrZkr2APl0lcxc5HKeO1IJV23QDq88cMP+KPPy/PS
	mp4gpELPwugoHMIKxb81+2Vzj/Q==
X-Received: by 2002:a05:622a:424f:b0:3a6:6d91:5fb with SMTP id cq15-20020a05622a424f00b003a66d9105fbmr24122884qtb.308.1669823589725;
        Wed, 30 Nov 2022 07:53:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ZSaU+dqJDqP7grR9JlDuDEx2h1DbFetTYt21IHghT2tVphV5Uzs/xGB+T4aCqvBGmWwqUmw==
X-Received: by 2002:a05:622a:424f:b0:3a6:6d91:5fb with SMTP id cq15-20020a05622a424f00b003a66d9105fbmr24122863qtb.308.1669823589430;
        Wed, 30 Nov 2022 07:53:09 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id r26-20020ac867da000000b003a5689134afsm1034541qtp.36.2022.11.30.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:53:09 -0800 (PST)
Date: Wed, 30 Nov 2022 10:53:08 -0500
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 11904/12006] include/linux/hugetlb.h:1240:33:
 error: 'VM_MAYSHARE' undeclared
Message-ID: <Y4d8ZLzD9A+nW70m@x1n>
References: <202211301622.RXGmFGTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211301622.RXGmFGTv-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="0znsW83eknVlmdnn"
Content-Disposition: inline

--0znsW83eknVlmdnn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 30, 2022 at 05:01:00PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   700e0cd3a5ce6a2cb90d9a2aab729b52f092a7d6
> commit: 98438ed47d60a6d30d5d2ad9c8786a0b92ca23f2 [11904/12006] mm/hugetlb: introduce hugetlb_walk()
> config: s390-randconfig-r031-20221128
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=98438ed47d60a6d30d5d2ad9c8786a0b92ca23f2
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 98438ed47d60a6d30d5d2ad9c8786a0b92ca23f2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/mm/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/s390/mm/pageattr.c:6:
>    include/linux/hugetlb.h: In function '__vma_shareable_flags_pmd':
> >> include/linux/hugetlb.h:1240:33: error: 'VM_MAYSHARE' undeclared (first use in this function)
>     1240 |         return vma->vm_flags & (VM_MAYSHARE | VM_SHARED) &&
>          |                                 ^~~~~~~~~~~
>    include/linux/hugetlb.h:1240:33: note: each undeclared identifier is reported only once for each function it appears in
> >> include/linux/hugetlb.h:1240:47: error: 'VM_SHARED' undeclared (first use in this function); did you mean 'MNT_SHARED'?
>     1240 |         return vma->vm_flags & (VM_MAYSHARE | VM_SHARED) &&
>          |                                               ^~~~~~~~~
>          |                                               MNT_SHARED
> 
> 
> vim +/VM_MAYSHARE +1240 include/linux/hugetlb.h
> 
>   1236	
>   1237	static inline bool
>   1238	__vma_shareable_flags_pmd(struct vm_area_struct *vma)
>   1239	{
> > 1240		return vma->vm_flags & (VM_MAYSHARE | VM_SHARED) &&
>   1241			vma->vm_private_data;
>   1242	}
>   1243	

We can use some ifdef machineries too I think, but not as solid (and clean)
as just include mm.h in hugetlb.h..

Fix attached, to be squashed into "mm/hugetlb: Introduce hugetlb_walk()"
too (along with the other fixup to the same patch).

Thanks,

-- 
Peter Xu

--0znsW83eknVlmdnn
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-fixup-mm-hugetlb-Introduce-hugetlb_walk.patch"

From 0064540dd67aea788ec5dac2d87bdb83262b941a Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Wed, 30 Nov 2022 10:45:21 -0500
Subject: [PATCH] fixup! mm/hugetlb: Introduce hugetlb_walk()
Content-type: text/plain

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/hugetlb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index ec2a1f93b12d..1c20cbbf3d22 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_HUGETLB_H
 #define _LINUX_HUGETLB_H
 
+#include <linux/mm.h>
 #include <linux/mm_types.h>
 #include <linux/mmdebug.h>
 #include <linux/fs.h>
-- 
2.37.3


--0znsW83eknVlmdnn--

