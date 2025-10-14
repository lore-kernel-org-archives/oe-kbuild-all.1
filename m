Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5E13D539
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443012; cv=none; b=uw4uvkeL1ArEhxUKXZW2zes4d+nFXPmzhR+ACiVQd9vghl15xLC4bQs9wMlizjOkmhPsI0cs8iRT+prmWlXHC2b7uEjttqfSXOuJVDJ2HyBTY5CrokofeqGEiB/ZFr/avbFiLp6YfoD5Pf5vqydF1z2/QvupaQsgsXBEKq36DMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443012; c=relaxed/simple;
	bh=hkydFLPUZ9bnV9gcMkfMhYWSqn7gzyE4I9/UlQlyXKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hs23/CgjKms9FkzBzAlRRAP29TL7cKfXRfX6eJIa89kYlEY3JSIQq/dEZExSozACrLDTZlS1CGMub8NLgvFBNwkSNUHlD3rV+Zd94lJqJf3ieIOX8M+zhUT64crphYtc5kr3kEDAbH2QF3hkkdyJKPRMmIr/feveauVvAStAQBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4VqcUVq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4VqcUVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760443009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLOR5+q/p7S4YJmEE2l0yvCfrYwsvBgNGhwGHJ8ptQs=;
	b=S4VqcUVqZfxFycABqtryGhvQja0EV05X5/U6xn+uY4IFwPzqxuyXRNQaepcC4XuKsQh2dR
	yFre7yoFxg3gvoayhpdsFr3WiKsaFvsBndagNTabjKjwpksjg0St4zPrzU/Faunv7mOUrw
	G8leLuDqUVaqNlHk2hgefUHXHwBSxRE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-508-CSGadO48OCOAK5cqKlzTgQ-1; Tue,
 14 Oct 2025 07:56:44 -0400
X-MC-Unique: CSGadO48OCOAK5cqKlzTgQ-1
X-Mimecast-MFC-AGG-ID: CSGadO48OCOAK5cqKlzTgQ_1760443003
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F12E18004D8;
	Tue, 14 Oct 2025 11:56:42 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0A881955F21;
	Tue, 14 Oct 2025 11:56:39 +0000 (UTC)
Date: Tue, 14 Oct 2025 19:56:35 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev, chrisl@kernel.org,
	kasong@tencent.com, youngjun.park@lge.com, baohua@kernel.org,
	shikemeng@huaweicloud.com, nphamcs@gmail.com
Subject: Re: [PATCH v4 mm-new 1/2] mm/swap: do not choose swap device
 according to numa node
Message-ID: <aO46c6v/arlyo/nG@MiWiFi-R3L-srv>
References: <20251011081624.224202-2-bhe@redhat.com>
 <202510120456.vTSygUXV-lkp@intel.com>
 <20251011150408.b865cffc3a8fb8bf834067f7@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251011150408.b865cffc3a8fb8bf834067f7@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tfYsPycBS-TMT6jsAKuQsHpnqiHExFkgAJ7MQxJ1p30_1760443003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/11/25 at 03:04pm, Andrew Morton wrote:
> On Sun, 12 Oct 2025 04:45:07 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Baoquan,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on akpm-mm/mm-everything]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-swap-do-not-choose-swap-device-according-to-numa-node/20251011-161743
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20251011081624.224202-2-bhe%40redhat.com
> > patch subject: [PATCH v4 mm-new 1/2] mm/swap: do not choose swap device according to numa node
> > config: i386-buildonly-randconfig-003-20251012 (https://download.01.org/0day-ci/archive/20251012/202510120456.vTSygUXV-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120456.vTSygUXV-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202510120456.vTSygUXV-lkp@intel.com/
> > 
> > All error/warnings (new ones prefixed by >>):
> > 
> >    In file included from include/linux/list.h:5,
> >                     from include/linux/wait.h:7,
> >                     from include/linux/wait_bit.h:8,
> >                     from include/linux/fs.h:7,
> >                     from include/linux/highmem.h:5,
> >                     from include/linux/bvec.h:10,
> >                     from include/linux/blk_types.h:10,
> >                     from include/linux/blkdev.h:9,
> >                     from mm/swapfile.c:9:
> 
> Thanks.  I did this.  Baoquan, please review and retest?

I finally got a system, retest this patchset + the appended fix, all
works well. Sorry for my mistake, and thanks a lot for the fix.

> 
> 
> --- a/mm/swapfile.c~mm-swap-do-not-choose-swap-device-according-to-numa-node-fix
> +++ a/mm/swapfile.c
> @@ -1388,11 +1388,10 @@ start_over:
>  static bool swap_sync_discard(void)
>  {
>  	bool ret = false;
> -	int nid = numa_node_id();
>  	struct swap_info_struct *si, *next;
>  
>  	spin_lock(&swap_avail_lock);
> -	plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
> +	plist_for_each_entry_safe(si, next, &swap_avail_head, avail_list) {
>  		spin_unlock(&swap_avail_lock);
>  		if (get_swap_device_info(si)) {
>  			if (si->flags & SWP_PAGE_DISCARD)
> @@ -2890,7 +2889,6 @@ SYSCALL_DEFINE1(swapoff, const char __us
>  	del_from_avail_list(p, true);
>  	if (p->prio < 0) {
>  		struct swap_info_struct *si = p;
> -		int nid;
>  
>  		plist_for_each_entry_continue(si, &swap_active_head, list) {
>  			si->prio++;
> _
> 

