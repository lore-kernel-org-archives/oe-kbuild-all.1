Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AAF1C5F1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743344411; cv=none; b=cRQb7VscOJ7OMI0e/UujOxn1QFU3KIKfUy0WR4lCUhMdimr9Tyipz7ez44C6Ib95Ha/i0+m15xa/z6rSFmChdo9gh7Gruvb670eQ4rfm8m3/AVlk7f6qtVkywnaamQjRzztihny2XwDDyh51HmHSlx81w6DXkq0sRnUEAVqzQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743344411; c=relaxed/simple;
	bh=Auv8MUOOjegX0UQ1aw4c8VmNNpuP6yEU5p7m3mOX+Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoajHoXbcwiCAeZu5Z/aKudHdSAZ4RQdVGmjRc1Kz+ljUwPHOF8nV9g3EKeu5T8BFVzQrzvItirTgWwsA8B/qFQSCz2Wx5UdsBEInjPRD7t36nQWJ1KIVjDPul4NTAZYjA24LZuBh4bNSDeHjVHv7bY7SA+ZDA910PUiJJd4lEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WM+P5Hcg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WM+P5Hcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743344408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SRhCdRWKSEsLp14H52SVVZrecvb4ICcNMfXSkyqsTao=;
	b=WM+P5HcgfChGbU9REdRyQMswqjsNCzhS0/p7Oi0uARtMERnGB9No8zNgJV8e91L+t+pZ7E
	fjMjSM8wAgK7QYAqjfLMT4+2YlApcWtSEd1ksF5gf9pmw/F6a/7dW6JNu/rHsuKXrcY4kW
	G6ehdals/6YKAVgF2d/PH/7pN0EmufM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-d4SuLccyPK2YurBOak7wBw-1; Sun,
 30 Mar 2025 10:20:03 -0400
X-MC-Unique: d4SuLccyPK2YurBOak7wBw-1
X-Mimecast-MFC-AGG-ID: d4SuLccyPK2YurBOak7wBw_1743344402
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48870180899B;
	Sun, 30 Mar 2025 14:20:02 +0000 (UTC)
Received: from localhost (unknown [10.72.112.17])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E30291956095;
	Sun, 30 Mar 2025 14:20:00 +0000 (UTC)
Date: Sun, 30 Mar 2025 22:19:55 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, oe-kbuild-all@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set in
 __get_user_pages() earlier
Message-ID: <Z+lTCz7sCKbCzaNk@MiWiFi-R3L-srv>
References: <20250330121718.175815-3-bhe@redhat.com>
 <202503302151.MdrisJhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503302151.MdrisJhx-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 03/30/25 at 09:49pm, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-gup-fix-wrongly-calculated-returned-value-in-fault_in_safe_writeable/20250330-201949
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250330121718.175815-3-bhe%40redhat.com
> patch subject: [PATCH 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set in __get_user_pages() earlier
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250330/202503302151.MdrisJhx-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503302151.MdrisJhx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503302151.MdrisJhx-lkp@intel.com/

Thanks for testing this patchset and reporting this error.

> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from arch/x86/include/asm/bug.h:110,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:13,
>                     from include/linux/spinlock.h:60,
>                     from mm/gup.c:5:
>    mm/gup.c: In function '__get_user_pages':
>    mm/gup.c:1433:27: error: 'flags' undeclared (first use in this function)
>     1433 |         if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
>          |                           ^~~~~

It's a copy-and-paste error, below change can fix it. It's weird my
building didn't figure it out. I will re-run a building on the patchset,
then send v2 for patch 2.

diff --git a/mm/gup.c b/mm/gup.c
index 3d2c57f59b4d..1ae41c1b2649 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1430,7 +1430,7 @@ static long __get_user_pages(struct mm_struct *mm,
 	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
 
 	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
-	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
+	if (WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
 			 (FOLL_PIN | FOLL_GET)))
 		return ERR_PTR(-EINVAL);

