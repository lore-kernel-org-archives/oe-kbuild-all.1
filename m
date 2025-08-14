Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223BC207669
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 01:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755136157; cv=none; b=YBxOBOFzUNUzUu3tvu/f3cMtGSIYQgEFXJgiQ4W+5SjxBAUHysq5urEiEpF4IcnJxnSPFm8oFZCBEx89qVGWos43/M0ZYMu0BRVKka6uHzjZDfcP81YcjIQce6YLO847vl5Aui3gE2be1D3boNWIGVduRwMrOECq61lSyPRAgEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755136157; c=relaxed/simple;
	bh=J0f7jznvQxCb1ZCzCxenoWjKTQzy+impl3uvcAhBj+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GZU60ynx18H2uj/vf1NckJ5FXWeh5OQApY+dlGv0SPgA4x8j4bp973r7fU1GAOTtIE7C3RgmP17Ig7iuwjzHPHNMmja2i9vQizke5Bo0Kfs/ATj4Tpq69K9zeb4oVNz00XAQ2/f8sJXPsMAUgZAJezU7Ph32ADmYodWsPMJDib4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWPkM8xu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWPkM8xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755136153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gBpanxhbqI21t9pFqkIgl/M2izwxvVZJUia4TaZFCL4=;
	b=YWPkM8xulp07tL1IXI7GfJZJKcKOCQXhqdqhiaHDLLm7vMfsfKE8Pt7O9gBkYN4irgvl8v
	vyvQ9itLV2VPQZvskGEcqaigT+1AJBRvQxlin0kfVLe4UXRrrcoD5z4f+F3el0lHaPC6ma
	L0zoN5WGzNBFS9XZxlLRnRAYjsotqwo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-V-0R8Vr-N4ilyGmgzzB-SA-1; Wed,
 13 Aug 2025 21:49:12 -0400
X-MC-Unique: V-0R8Vr-N4ilyGmgzzB-SA-1
X-Mimecast-MFC-AGG-ID: V-0R8Vr-N4ilyGmgzzB-SA_1755136151
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77DC1195608A;
	Thu, 14 Aug 2025 01:49:11 +0000 (UTC)
Received: from localhost (unknown [10.72.112.89])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 414181955F16;
	Thu, 14 Aug 2025 01:49:09 +0000 (UTC)
Date: Thu, 14 Aug 2025 09:49:06 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 12/12] mm/kasan: make kasan=on|off take effect for all
 three modes
Message-ID: <aJ1Akg7jMytAChgp@MiWiFi-R3L-srv>
References: <20250812124941.69508-13-bhe@redhat.com>
 <202508131826.n8gKkeXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202508131826.n8gKkeXB-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5XX86K1Y57TAIV-VpUV-YlLGCcCaVqlooJH12W-Rzt4_1755136151
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/13/25 at 06:23pm, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on powerpc/fixes jcmvbkbc-xtensa/xtensa-for-next linus/master v6.17-rc1]
> [cannot apply to akpm-mm/mm-everything next-20250813]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-kasan-add-conditional-checks-in-functions-to-return-directly-if-kasan-is-disabled/20250812-205253
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> patch link:    https://lore.kernel.org/r/20250812124941.69508-13-bhe%40redhat.com
> patch subject: [PATCH v2 12/12] mm/kasan: make kasan=on|off take effect for all three modes
> config: um-randconfig-001-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131826.n8gKkeXB-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131826.n8gKkeXB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508131826.n8gKkeXB-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/static_key.h:1,
>                     from include/linux/alloc_tag.h:15,
>                     from include/linux/percpu.h:5,
>                     from include/linux/percpu_counter.h:14,
>                     from include/linux/mm_types.h:21,
>                     from include/linux/mmzone.h:22,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from arch/um/kernel/mem.c:7:
>    arch/um/kernel/mem.c: In function 'arch_mm_preinit':
> >> arch/um/kernel/mem.c:65:31: error: 'kasan_flag_enabled' undeclared (first use in this function); did you mean 'kasan_hw_tags_enabled'?
>       65 |         static_branch_enable(&kasan_flag_enabled);
>          |                               ^~~~~~~~~~~~~~~~~~

Thanks for reporting this error. I reproduced it and fix it with below
change. While this change should be appended into patch 11.

It's because CONFIG_KASAN is unset, the static key kasan_flag_enabled
enabling is added in arch_mm_preinit() which is not in CONFIG_KASAN scope.  
So here wrap it up within CONFIG_KASAN ifdeffery scope.

And also move the kasan_arg_disabled chekcing before kasan_flag_enabled
enabling because kasan_init() is called before main(). So in
kasan_init(), kernel parameter kasan=on|off hasn't been parsed.

diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index d62f494e0808..2395ca33112a 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -26,9 +26,6 @@
 int kasan_um_is_ready;
 void kasan_init(void)
 {
-
-	if (kasan_arg_disabled)
-		return;
 	/*
 	 * kasan_map_memory will map all of the required address space and
 	 * the host machine will allocate physical memory as necessary.
@@ -65,8 +62,12 @@ static unsigned long brk_end;
 
 void __init arch_mm_preinit(void)
 {
+
+#ifdef CONFIG_KASAN
 	/* Safe to call after jump_label_init(). Enables KASAN. */
-	static_branch_enable(&kasan_flag_enabled);
+	if (!kasan_arg_disabled)
+		static_branch_enable(&kasan_flag_enabled);
+#endif
 
 	/* clear the zero-page */
 	memset(empty_zero_page, 0, PAGE_SIZE);

