Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E59A1C13
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 07:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668411897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H7Es+mdmPcACifwFPjey8kfbFYEbv3/lurjkYQxwMuc=;
	b=gnhNy4UwSdoK8nKFVXHbPIHOdJFi4jquV2npQPkIp8oaDba3ai20Zv5iflV1YXs7l5v6mO
	UMkxWWOiyv6LPEYdqgbDXOJUoUF1V10oyHoaY5DuAV6yo/53gJNpsSkB1ra4oe25xSfiBw
	r9mF5HX5buz0rL4zRWrwN/jGUAbF4mo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-S1uXMJ96Ml6HubMiv4BS6A-1; Mon, 14 Nov 2022 02:44:54 -0500
X-MC-Unique: S1uXMJ96Ml6HubMiv4BS6A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 208F91C07592;
	Mon, 14 Nov 2022 07:44:54 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49E89492CA5;
	Mon, 14 Nov 2022 07:44:52 +0000 (UTC)
Date: Mon, 14 Nov 2022 15:44:49 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>, Dennis Zhou <dennis@kernel.org>,
	42.hyeyoo@gmail.com
Subject: Re: [linux-next:master 5002/7443]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_474' declared with attribute error: BUILD_BUG_ON
 failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
Message-ID: <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
References: <202211120436.HzD1i2yQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211120436.HzD1i2yQ-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I reproduced the build failure according to lkp report and made a patch
as below to fix it.

From dae7dd9705015ce36db757e88c78802584f949b1 Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Sun, 13 Nov 2022 18:08:27 +0800
Subject: [PATCH] percpu: adjust the value of PERCPU_DYNAMIC_EARLY_SIZE
Content-type: text/plain

LKP reported a build failure as below on the patch "mm/slub, percpu:
correct the calculation of early percpu allocation size"

~~~~~~
In file included from <command-line>:
In function 'alloc_kmem_cache_cpus',
   inlined from 'kmem_cache_open' at mm/slub.c:4340:6:
>> include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_474' declared with attribute error:
BUILD_BUG_ON failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH * sizeof(struct kmem_cache_cpu)
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
~~~~~~

From the kernel config file provided by LKP, the building was made on
arm64 with below Kconfig item enabled:

  CONFIG_ZONE_DMA=y
  CONFIG_SLUB_CPU_PARTIAL=y
  CONFIG_DEBUG_LOCK_ALLOC=y
  CONFIG_SLUB_STATS=y
  CONFIG_ARM64_PAGE_SHIFT=16
  CONFIG_ARM64_64K_PAGES=y

Then we will have:
  NR_KMALLOC_TYPES:4
  KMALLOC_SHIFT_HIGH:17
  sizeof(struct kmem_cache_cpu):184

The product of them is 12512, which is bigger than PERCPU_DYNAMIC_EARLY_SIZE,
12K. Hence, the BUILD_BUG_ON in alloc_kmem_cache_cpus() is triggered.

Earlier, in commit 099a19d91ca4 ("percpu: allow limited allocation
before slab is online"), PERCPU_DYNAMIC_EARLY_SIZE was introduced and
set to 12K which is equal to the then PERPCU_DYNAMIC_RESERVE.
Later, in commit 1a4d76076cda ("percpu: implement asynchronous chunk
population"), PERPCU_DYNAMIC_RESERVE was increased by 8K, while
PERCPU_DYNAMIC_EARLY_SIZE was kept unchanged.

So, here increase PERCPU_DYNAMIC_EARLY_SIZE by 8K too to accommodate to
the slub's requirement.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 70bc17db00a6..1338ea2aa720 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -41,7 +41,7 @@
  * for this.  Keep PERCPU_DYNAMIC_RESERVE equal to or larger than
  * PERCPU_DYNAMIC_EARLY_SIZE.
  */
-#define PERCPU_DYNAMIC_EARLY_SIZE	(12 << 10)
+#define PERCPU_DYNAMIC_EARLY_SIZE	(20 << 10)
 
 /*
  * PERCPU_DYNAMIC_RESERVE indicates the amount of free area to piggy
-- 
2.34.1

