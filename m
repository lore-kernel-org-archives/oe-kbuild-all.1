Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF061C1F05
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 02:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759026167; cv=none; b=cn8dFodw87MrZXlZ+iSfHhYzseXfC4difkV4/vWZmgtIuNRdsk8HP1glSXHmryikUPw5wOfFUHoZg8C5sNhOBWr7p+i+RafWZO8H8Ao8TgeCW7r2pr4YJKIXQJxyNhKREiyDzV6aJhWrZrlCoj+chgJDp6GQ+yXPMTHDL71n720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759026167; c=relaxed/simple;
	bh=1ffwPWQWE/4mQdUcLjLKUsA2y5HlpkJ21lORMYku9s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fuaukZC5HV9G0Uy+x+UgBNIUOeIJzIfOMzRpr/pDrpwZhq7cBgnIuL3vojNpWTLLVA4LkOhIzTRYz9j0fyHt8yfxGB60KygLT5heg/1CmI/lFO+r4PNU9zhCn3fBheDbJ5Y0oSUQ9Pi5ShKARXau7xnumQTsNcqs5GwK4D3GH38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z7dK1BPU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z7dK1BPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759026164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4l33LFaBlP7W725XV6EhCal5Ct1v4pxHGZqU1d/s068=;
	b=Z7dK1BPUxLfjCAXvAlfQ2p4NkIcsEcANLto54ZfT0DSYaSxQjcrcAO4MHlA9fBFbaP5yk8
	izlfBZxsDdiRZMWkWizEyoZc67UA/7n2ElzEaKP3NgipsnfO3z44Ow0/xAJ2rwEwOwFC17
	04+fxbzRIN/lfVxhTspIgQtlprPMAzs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-UM5FlzYWPwGc3XX-OFD-XA-1; Sat,
 27 Sep 2025 22:22:39 -0400
X-MC-Unique: UM5FlzYWPwGc3XX-OFD-XA-1
X-Mimecast-MFC-AGG-ID: UM5FlzYWPwGc3XX-OFD-XA_1759026157
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC40E1800576;
	Sun, 28 Sep 2025 02:22:35 +0000 (UTC)
Received: from localhost (unknown [10.72.112.162])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81D7E1800576;
	Sun, 28 Sep 2025 02:22:32 +0000 (UTC)
Date: Sun, 28 Sep 2025 10:22:28 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	youngjun.park@lge.com, aaron.lu@intel.com, baohua@kernel.org,
	shikemeng@huaweicloud.com, nphamcs@gmail.com
Subject: Re: [PATCH v2 1/1] mm/swapfile.c: select the swap device with
 default priority round robin
Message-ID: <aNib5FROJYwjcsa1@fedora>
References: <20250926155504.5122-2-bhe@redhat.com>
 <202509280002.NWLixh90-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202509280002.NWLixh90-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7-ds2obakfszdn25Ga8Bj62vZLpXOMVTDZiUg-Z00C0_1759026157
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 09/28/25 at 01:14am, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.17-rc7 next-20250926]
> [cannot apply to akpm-mm/mm-everything]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-swapfile-c-select-the-swap-device-with-default-priority-round-robin/20250926-235740
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250926155504.5122-2-bhe%40redhat.com
> patch subject: [PATCH v2 1/1] mm/swapfile.c: select the swap device with default priority round robin
> config: sparc-randconfig-001-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280002.NWLixh90-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280002.NWLixh90-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509280002.NWLixh90-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/swapfile.c: In function '_enable_swap_info':
>    mm/swapfile.c:2550:31: error: 'swap_active_head' undeclared (first use in this function); did you mean 'swap_avail_head'?
>     2550 |         plist_add(&si->list, &swap_active_head);
>          |                               ^~~~~~~~~~~~~~~~
>          |                               swap_avail_head

Sorry, I mistakenly removed the definition of swap_avail_head. I planned
to remove swap_avail_head in later work, but mixed the draft code to
this patch. I will post v3 to split patch as Chris suggested, will fix
it this at the same time. Thanks for reporting this, please drop this v2
patch from testing.

>    mm/swapfile.c:2550:31: note: each undeclared identifier is reported only once for each function it appears in
>    In file included from include/linux/list.h:5,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:7,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bvec.h:10,
>                     from include/linux/blk_types.h:10,
>                     from include/linux/blkdev.h:9,
>                     from mm/swapfile.c:9:
>    mm/swapfile.c: In function '__do_sys_swapoff':
>    mm/swapfile.c:2655:34: error: 'swap_active_head' undeclared (first use in this function); did you mean 'swap_avail_head'?
>     2655 |         plist_for_each_entry(p, &swap_active_head, list) {
>          |                                  ^~~~~~~~~~~~~~~~
>    include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
>       20 |         void *__mptr = (void *)(ptr);                                   \
>          |                                 ^~~
>    include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
>      612 |         list_entry((ptr)->next, type, member)
>          |         ^~~~~~~~~~
>    include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
>      770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>          |                    ^~~~~~~~~~~~~~~~
>    include/linux/plist.h:173:10: note: in expansion of macro 'list_for_each_entry'
>      173 |          list_for_each_entry(pos, &(head)->node_list, mem.node_list)
>          |          ^~~~~~~~~~~~~~~~~~~
>    mm/swapfile.c:2655:9: note: in expansion of macro 'plist_for_each_entry'
>     2655 |         plist_for_each_entry(p, &swap_active_head, list) {
>          |         ^~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/init.h:5,
>                     from include/linux/printk.h:6,
>                     from include/asm-generic/bug.h:22,
>                     from arch/sparc/include/asm/bug.h:25,
>                     from include/linux/bug.h:5,
>                     from include/linux/vfsdebug.h:5,
>                     from include/linux/fs.h:5,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bvec.h:10,
>                     from include/linux/blk_types.h:10,
>                     from include/linux/blkdev.h:9,
>                     from mm/swapfile.c:9:
>    include/linux/compiler_types.h:507:27: error: expression in static assertion is not an integer
>      507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>          |                                                        ^~~~
>    include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
>       21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>          |         ^~~~~~~~~~~~~
>    include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>       21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>          |                       ^~~~~~~~~~~
>    include/linux/list.h:601:9: note: in expansion of macro 'container_of'
>      601 |         container_of(ptr, type, member)
>          |         ^~~~~~~~~~~~
>    include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
>      612 |         list_entry((ptr)->next, type, member)
>          |         ^~~~~~~~~~
>    include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
>      770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>          |                    ^~~~~~~~~~~~~~~~
>    include/linux/plist.h:173:10: note: in expansion of macro 'list_for_each_entry'
>      173 |          list_for_each_entry(pos, &(head)->node_list, mem.node_list)
>          |          ^~~~~~~~~~~~~~~~~~~
>    mm/swapfile.c:2655:9: note: in expansion of macro 'plist_for_each_entry'
>     2655 |         plist_for_each_entry(p, &swap_active_head, list) {
>          |         ^~~~~~~~~~~~~~~~~~~~
>    mm/swapfile.c: In function '__has_usable_swap':
>    mm/swapfile.c:3835:35: error: 'swap_active_head' undeclared (first use in this function); did you mean 'swap_avail_head'?
>     3835 |         return !plist_head_empty(&swap_active_head);
>          |                                   ^~~~~~~~~~~~~~~~
>          |                                   swap_avail_head
> >> mm/swapfile.c:3836:1: warning: control reaches end of non-void function [-Wreturn-type]
>     3836 | }
>          | ^
> 
> 
> vim +3836 mm/swapfile.c
> 
> a2468cc9bfdff6 Aaron Lu    2017-09-06  3831  
> 2cf855837b89d9 Tejun Heo   2018-07-03  3832  #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
> 0ff67f990bd457 Kairui Song 2025-03-14  3833  static bool __has_usable_swap(void)
> 0ff67f990bd457 Kairui Song 2025-03-14  3834  {
> 0ff67f990bd457 Kairui Song 2025-03-14  3835  	return !plist_head_empty(&swap_active_head);
> 0ff67f990bd457 Kairui Song 2025-03-14 @3836  }
> 0ff67f990bd457 Kairui Song 2025-03-14  3837  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

