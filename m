Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A2CDF42
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 May 2025 01:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746322765; cv=none; b=Nvfcjpi7CCMPBAE8yXgBHnQRXWpfRL9KN+h4n9lw++elELsi8RhtLCrkDIBGs3cLd9sBgFX1fRRrO7H5dKQ5EHGh5sac3tuawS7S8JTAtMssLG+dFanXZHa63PtAKNTGReURIFTCsbfe6dMV8X8bpAQQPxQdnccotf+5A+FpoOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746322765; c=relaxed/simple;
	bh=pKIqVIqTVkIwGEitRnXf7SQButjyIwLkfB+/Es/jkg4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rS6DuFWldYhlsBtN/CxVFdut+6domSF15mwBFh74HndFt8s0yt0ynWLJaDBiCRLvngK2hbGYW+6Dl7SQmD5VLnbeSbIN7griwyVEvybYq0HzoERnL6U6Uo2acxZGP0mi0v7Y1IE0TJKUvnu01XfwOv0hwz0VPVFGZ59Cjy1BbM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Aw/UCkER; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Aw/UCkER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B080C4CEE3;
	Sun,  4 May 2025 01:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746322764;
	bh=pKIqVIqTVkIwGEitRnXf7SQButjyIwLkfB+/Es/jkg4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Aw/UCkER/q3iFDErZr1NcAbqDqxpKzGGEq+oAd9vRy0oZSbERq2hnrjAiZyTn7ksQ
	 cy8EfgebEXLCO54+/5nMC4W+d4DthErmhFIutkCRGYB1Ra7BrkjNppkNu6KZBeUyHC
	 G5gpsWaBgvlAzA0sd3N/QL85TmC/sTPKzfABoYug=
Date: Sat, 3 May 2025 18:39:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: xu xin <xu.xin16@zte.com.cn>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 313/316] memcontrol.c:undefined reference to
 `ksm_process_profit'
Message-Id: <20250503183923.848bd73811fa7127d50ddf54@linux-foundation.org>
In-Reply-To: <202505030429.a2GUiRAz-lkp@intel.com>
References: <202505030429.a2GUiRAz-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 3 May 2025 04:31:37 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   108c0a7e7ceafc00a50d1b2fd56cfc8fa99d4ddd
> commit: 94c2f83bdfb95917213b7e95584fc2696c210655 [313/316] memcontrol: add ksm_profit in cgroup/memory.ksm_stat
> config: x86_64-buildonly-randconfig-002-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030429.a2GUiRAz-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030429.a2GUiRAz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505030429.a2GUiRAz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: mm/memcontrol.o: in function `evaluate_memcg_ksm_stat':
> >> memcontrol.c:(.text+0xdb5): undefined reference to `ksm_process_profit'

urgh, CONFIG_PROC_FS=n.

It was kind of ksm_process_profit() to avoid bloating CONFIG_PROC_FS=n
kernels but really, are KSM and memcg even viable without procfs? 

I think I'll just do this.


--- a/mm/ksm.c~memcontrol-add-ksm_profit-in-cgroup-memoryksm_stat-fix
+++ a/mm/ksm.c
@@ -3268,7 +3268,6 @@ static void wait_while_offlining(void)
 }
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
-#ifdef CONFIG_PROC_FS
 /*
  * The process is mergeable only if any VMA is currently
  * applicable to KSM.
@@ -3293,7 +3292,6 @@ long ksm_process_profit(struct mm_struct
 	return (long)(mm->ksm_merging_pages + mm_ksm_zero_pages(mm)) * PAGE_SIZE -
 		mm->ksm_rmap_items * sizeof(struct ksm_rmap_item);
 }
-#endif /* CONFIG_PROC_FS */
 
 #ifdef CONFIG_SYSFS
 /*
_

