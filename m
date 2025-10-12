Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654A01EA65
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Oct 2025 02:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760234942; cv=none; b=RqlMo+0OA7aElBbTZKUnP3Vib/nH4HcBTkcQT4VVN49e5P4+MSet4iKftgghwp0Ks3JB1qCleSw2Z6aWMFYFQABpY1WfYFEjblutU0GStzjhPx78TMe+EZI24Ax5VDhkNSqs4rjk61PFF0RihHNr+r9FKlLGoIwZAtsISt4KEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760234942; c=relaxed/simple;
	bh=okBJhMxEKX55x0IkHVnN32u2ky3ul/SyBIOAH5JdizQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fy/zgnLNgHASTt4WY00C/Xp+4J5dzFW05Yj7NqEpikIOLooh6ZokHg7NkOn4fJV67KItXumfZgNAa2+ZU2CNDrkRMDBdus1GCzmihTV14LMr1KmY/vD9qHqQ28E/WuzNqgrkKu0ntCVbpPdXJCDle63m5GEDmNADMuHTKInRoFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZKNSMlb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZKNSMlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760234939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pYwW5kylGmaXKnmK0P7Fw+OgNfWxcAqI5580HTuaOhA=;
	b=cZKNSMlbcvWou0J8V6d2iGX34EfrBKJlYSVeXhdl6kcpKXgxsgrnMLfaNWJeVuQpxNu2sB
	mot3kvygdCc8j3MLLKds+fW2D7DletyAV9t2CZ4VOlNHhPk6jt5AV+CYlV50E9x+BJhZbp
	XJh3lAROQhoATF8XQsxvLd0adYuqLPU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-fV6xpNoRMrGp8WJJFyoyEg-1; Sat,
 11 Oct 2025 22:08:55 -0400
X-MC-Unique: fV6xpNoRMrGp8WJJFyoyEg-1
X-Mimecast-MFC-AGG-ID: fV6xpNoRMrGp8WJJFyoyEg_1760234934
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 888FE18004D4;
	Sun, 12 Oct 2025 02:08:53 +0000 (UTC)
Received: from localhost (unknown [10.72.112.25])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A49D19560AB;
	Sun, 12 Oct 2025 02:08:51 +0000 (UTC)
Date: Sun, 12 Oct 2025 10:08:47 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev, chrisl@kernel.org,
	kasong@tencent.com, youngjun.park@lge.com, baohua@kernel.org,
	shikemeng@huaweicloud.com, nphamcs@gmail.com
Subject: Re: [PATCH v4 mm-new 1/2] mm/swap: do not choose swap device
 according to numa node
Message-ID: <aOsNrzBI8hSdnGQ1@MiWiFi-R3L-srv>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pJBC71HerVINP2ocqg5mb_vz7GWzk0cfgxVAGdDrxfk_1760234934
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

The code change looks good to me, and I applied this on top of my
patches and build, the building passed, while the link failed. I haven't
got the reason. I will go outside now and will be back in the evening to
fix the linking error and test.

  SORTTAB vmlinux.unstripped
incomplete ORC unwind tables in file: vmlinux.unstripped
Failed to sort kernel tables
make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1

Thanks
Baoquan
> _
> 

