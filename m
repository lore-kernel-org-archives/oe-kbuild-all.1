Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638F34BA38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 22:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760220250; cv=none; b=Aw6Ib3zgijQOsH/PrxaP8LBHbc4noR2ak4qSEusuGY0pL/7f5bdA/0WouI4rvyp4ENN+fZoyWQEQ6QxeLrYu3EqLELbDpupWpfdRaRXW+gvos7yI+JZ7mcttJREbj+zbqjNFEpLFYcPrYsCjCbcpq0FovqlPaoCqvUzTEEeAnYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760220250; c=relaxed/simple;
	bh=i7Jgr7fdDvNL25cRTpbIZFz0XW9pXyGITE2m+CfhP+E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YQqoVPck+SzMgEfi+UqWWrmARthrOq2GOlzeKP1BTBpFHphArz6LpvnULc+Lvvvjr9iU3E+sGt0mWgsKIiR4D3GJoRPDYjnPy+PAAEsuV5Sha+xQZNaoCvIVhn0pudyd66EH4M+8prMAVXdi8XWHGSoKAOMmDQ/+t9xTpmCF/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qSKUSl/e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qSKUSl/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DEEC4CEF4;
	Sat, 11 Oct 2025 22:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1760220249;
	bh=i7Jgr7fdDvNL25cRTpbIZFz0XW9pXyGITE2m+CfhP+E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qSKUSl/eTQ5ivoH4pFV14ujJlqK3eYh+4YOokcp1S7cm1Rp7lv43wi6ZYOWFbteLe
	 VrhxyCQkLIsQE0OC2h1dsVmZsWGddu8XTj6XEnn06IPYYXrb01tc7d966oKhkCMSzP
	 cFIoobUGLuElwOxs39Pe9rnX/3QG2bgtiHA4TC1E=
Date: Sat, 11 Oct 2025 15:04:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org,
 oe-kbuild-all@lists.linux.dev, chrisl@kernel.org, kasong@tencent.com,
 youngjun.park@lge.com, baohua@kernel.org, shikemeng@huaweicloud.com,
 nphamcs@gmail.com
Subject: Re: [PATCH v4 mm-new 1/2] mm/swap: do not choose swap device
 according to numa node
Message-Id: <20251011150408.b865cffc3a8fb8bf834067f7@linux-foundation.org>
In-Reply-To: <202510120456.vTSygUXV-lkp@intel.com>
References: <20251011081624.224202-2-bhe@redhat.com>
	<202510120456.vTSygUXV-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Oct 2025 04:45:07 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Baoquan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-swap-do-not-choose-swap-device-according-to-numa-node/20251011-161743
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20251011081624.224202-2-bhe%40redhat.com
> patch subject: [PATCH v4 mm-new 1/2] mm/swap: do not choose swap device according to numa node
> config: i386-buildonly-randconfig-003-20251012 (https://download.01.org/0day-ci/archive/20251012/202510120456.vTSygUXV-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120456.vTSygUXV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510120456.vTSygUXV-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/list.h:5,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:7,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bvec.h:10,
>                     from include/linux/blk_types.h:10,
>                     from include/linux/blkdev.h:9,
>                     from mm/swapfile.c:9:

Thanks.  I did this.  Baoquan, please review and retest?


--- a/mm/swapfile.c~mm-swap-do-not-choose-swap-device-according-to-numa-node-fix
+++ a/mm/swapfile.c
@@ -1388,11 +1388,10 @@ start_over:
 static bool swap_sync_discard(void)
 {
 	bool ret = false;
-	int nid = numa_node_id();
 	struct swap_info_struct *si, *next;
 
 	spin_lock(&swap_avail_lock);
-	plist_for_each_entry_safe(si, next, &swap_avail_heads[nid], avail_lists[nid]) {
+	plist_for_each_entry_safe(si, next, &swap_avail_head, avail_list) {
 		spin_unlock(&swap_avail_lock);
 		if (get_swap_device_info(si)) {
 			if (si->flags & SWP_PAGE_DISCARD)
@@ -2890,7 +2889,6 @@ SYSCALL_DEFINE1(swapoff, const char __us
 	del_from_avail_list(p, true);
 	if (p->prio < 0) {
 		struct swap_info_struct *si = p;
-		int nid;
 
 		plist_for_each_entry_continue(si, &swap_active_head, list) {
 			si->prio++;
_

