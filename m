Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0315747C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 04:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737087387; cv=none; b=AGX69l4hzc9TmuUMjwrHA2gp+OLY5YhUF3uGYWL/9EkjxDCFByB2zLrJGcRmix0aXl7YuDIlkPWqlJsuZGydDWOkZXlPsKVnizqlFJAuLbz1yB+HukSngulNu/1vh2b8ovrdP098B0a5afB7tHFntRGjyJ5XbeY4In4zi8VQiuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737087387; c=relaxed/simple;
	bh=9Q4ASoDpr0gSlg7zYYNa2grSieg4xfZOdYOnZbCozXQ=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GZolaWPww1AYixboxF5s60+LQu7t09ZhVML8SFr8lcTcq1GyB0WZJL8vgDLhRjRFDRnRm10XXPLehf+GBsyAI+5NG41bcZLrRhn0rVLv82OetOuIQkT1murqW3PdfH+cur9nOExIInPA6rc4rSTFlWtI2YAMDDHgoFir2W6ze5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YZ5sy5ypMzjYCx;
	Fri, 17 Jan 2025 12:12:22 +0800 (CST)
Received: from kwepemg100017.china.huawei.com (unknown [7.202.181.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 2EB0F180218;
	Fri, 17 Jan 2025 12:16:16 +0800 (CST)
Received: from [10.174.178.120] (10.174.178.120) by
 kwepemg100017.china.huawei.com (7.202.181.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 17 Jan 2025 12:16:15 +0800
Message-ID: <9ee2ac2f-b26c-4206-9ba5-b06cbe742128@huawei.com>
Date: Fri, 17 Jan 2025 12:16:14 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <mawupeng1@huawei.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mm: memory-failure: update ttu flag inside
 unmap_poisoned_folio
To: <lkp@intel.com>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<osalvador@suse.de>, <nao.horiguchi@gmail.com>, <linmiaohe@huawei.com>,
	<mhocko@suse.com>
References: <20250116061657.227027-2-mawupeng1@huawei.com>
 <202501171300.SYkofFQ6-lkp@intel.com>
From: mawupeng <mawupeng1@huawei.com>
In-Reply-To: <202501171300.SYkofFQ6-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg100017.china.huawei.com (7.202.181.58)



On 2025/1/17 11:57, kernel test robot wrote:
> Hi Wupeng,
> 
> kernel test robot noticed the following build errors:

Thanks.

Will be fixed later.

> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Wupeng-Ma/mm-memory-failure-update-ttu-flag-inside-unmap_poisoned_folio/20250116-142614
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250116061657.227027-2-mawupeng1%40huawei.com
> patch subject: [PATCH v2 1/3] mm: memory-failure: update ttu flag inside unmap_poisoned_folio
> config: s390-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171300.SYkofFQ6-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171300.SYkofFQ6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501171300.SYkofFQ6-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from mm/page_isolation.c:13:
>>> mm/internal.h:1142:1: error: expected identifier or '(' before '{' token
>     1142 | {
>          | ^
>>> mm/internal.h:1141:19: warning: 'unmap_poisoned_folio' declared 'static' but never defined [-Wunused-function]
>     1141 | static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
>          |                   ^~~~~~~~~~~~~~~~~~~~
> --
>    In file included from mm/damon/paddr.c:19:
>>> mm/damon/../internal.h:1142:1: error: expected identifier or '(' before '{' token
>     1142 | {
>          | ^
>>> mm/damon/../internal.h:1141:19: warning: 'unmap_poisoned_folio' declared 'static' but never defined [-Wunused-function]
>     1141 | static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
>          |                   ^~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +1142 mm/internal.h
> 
> 31d3d3484f9bd2 Wu Fengguang            2009-12-16  1121  
> 7c116f2b0dbac4 Wu Fengguang            2009-12-16  1122  extern u32 hwpoison_filter_dev_major;
> 7c116f2b0dbac4 Wu Fengguang            2009-12-16  1123  extern u32 hwpoison_filter_dev_minor;
> 478c5ffc0b5052 Wu Fengguang            2009-12-16  1124  extern u64 hwpoison_filter_flags_mask;
> 478c5ffc0b5052 Wu Fengguang            2009-12-16  1125  extern u64 hwpoison_filter_flags_value;
> 4fd466eb46a6a9 Andi Kleen              2009-12-16  1126  extern u64 hwpoison_filter_memcg;
> 1bfe5febe34d2b Haicheng Li             2009-12-16  1127  extern u32 hwpoison_filter_enable;
> 3a78f77fd1fb82 Miaohe Lin              2024-06-12  1128  #define MAGIC_HWPOISON	0x48575053U	/* HWPS */
> 3a78f77fd1fb82 Miaohe Lin              2024-06-12  1129  void SetPageHWPoisonTakenOff(struct page *page);
> 3a78f77fd1fb82 Miaohe Lin              2024-06-12  1130  void ClearPageHWPoisonTakenOff(struct page *page);
> 3a78f77fd1fb82 Miaohe Lin              2024-06-12  1131  bool take_page_off_buddy(struct page *page);
> 3a78f77fd1fb82 Miaohe Lin              2024-06-12  1132  bool put_page_back_buddy(struct page *page);
> 3a78f77fd1fb82 Miaohe Lin              2024-06-12  1133  struct task_struct *task_early_kill(struct task_struct *tsk, int force_early);
> 68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1134) void add_to_kill_ksm(struct task_struct *tsk, const struct page *p,
> 3a78f77fd1fb82 Miaohe Lin              2024-06-12  1135  		     struct vm_area_struct *vma, struct list_head *to_kill,
> 3a78f77fd1fb82 Miaohe Lin              2024-06-12  1136  		     unsigned long ksm_addr);
> 68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1137) unsigned long page_mapped_in_vma(const struct page *page,
> 68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1138) 		struct vm_area_struct *vma);
> eb36c5873b96e8 Al Viro                 2012-05-30  1139  
> 16038c4fffd802 Kefeng Wang             2024-08-27  1140  #else
> 2b5df10a15dc74 Ma Wupeng               2025-01-16 @1141  static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
> 16038c4fffd802 Kefeng Wang             2024-08-27 @1142  {
> 2b5df10a15dc74 Ma Wupeng               2025-01-16  1143  	return -EBUSY;
> 16038c4fffd802 Kefeng Wang             2024-08-27  1144  }
> 16038c4fffd802 Kefeng Wang             2024-08-27  1145  #endif
> 16038c4fffd802 Kefeng Wang             2024-08-27  1146  
> 

