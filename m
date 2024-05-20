Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564EC2FD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716188481; cv=none; b=MYQA+UvpOormX7OT9h+cXwvllyHPRV+9Fs/vSHXM05YPVPWzINl8o9viWYMYbXGiE+9Y4p/3zVzGE/nJU6857ywFTqI3jZRLq9e8QMKU+AyKgsFqJhdY/anBbl5Icjkqe2Fo9IE7XcS4NMF3pgyz/kBbOdOqGpGtFZRiubRh+LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716188481; c=relaxed/simple;
	bh=r3hosoBK+v+vy1M1w1kgWbRXbsnd+zwS9OBJHjxF6L0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHvGVfGbSYw7gCixZKII27lrtix6kc53RrVaLTsqpaJ/AoYaBEXjY4CLrGogYpp4ktpkq6fUNjMsy6XOlhwMx2LkW3E9ioZ7MlYNwkdvqpey9peu0IuJ3vwZh5L21kQ67k7YMp5Wwn9QlUOdBgS8qsQGubHTMdM5OXKxoLoApLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDxH2Q9W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDxH2Q9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716188479; x=1747724479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3hosoBK+v+vy1M1w1kgWbRXbsnd+zwS9OBJHjxF6L0=;
  b=jDxH2Q9WEZEVD3hkW3u5MZXgpAmAcPZ4r5d3jZOSObvy19goeo+fLK+Q
   od2G7I7+O+vCzNRBU21q2q4G8/IY6bW1RsixqkLgVvP/OZpUMbheoSqa5
   SDNTtB91Ooy65UDz000q5UIdOrOZaydQM4B5e39IQSE+1Pobj+spp7c0x
   dZqBaULJTyPGwjRGzh7tAVsm6Agpu8a2JP1kbLRgVRqHVOjtwHN23kJZ+
   O/yeSd4sevQ9nJGF96dkHucfXtlnjcMFT21WwGhm837d8pzEdWvwolxhu
   +s9aTkIdwZSOjOOkwLlFYwsconNXeok3drWZjx+VqORlxi1WPNQ+7aSnP
   A==;
X-CSE-ConnectionGUID: knK5zlrXSA+0Qsy0ESmRjg==
X-CSE-MsgGUID: kxOq2WFcS/SoFxShnL9UfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="16128448"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="16128448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 00:01:18 -0700
X-CSE-ConnectionGUID: YIemVuioTz6ut67H/6TmoQ==
X-CSE-MsgGUID: WpkGEbWiQfm6E5dMocB6ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="69870471"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2024 00:01:15 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8x1E-0004ia-1i;
	Mon, 20 May 2024 07:01:12 +0000
Date: Mon, 20 May 2024 15:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6634/6637] arch/x86/kvm/svm/csv.c:1974: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202405201437.J5s72uy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ab414f954e57ae54df9e871de06eaa10dc57215b
commit: bbea34c324bd47cfc9ce31c152d6f1d38e8defdd [6634/6637] KVM: SVM: CSV: Add ioctl API to unpin shared pages of CSV3 guest
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240520/202405201437.J5s72uy0-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405201437.J5s72uy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405201437.J5s72uy0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/csv.c:1974: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    *  Return negative error code on fail,


vim +1974 arch/x86/kvm/svm/csv.c

  1972	
  1973	/**
> 1974	 *  Return negative error code on fail,
  1975	 *  or return the number of pages unpinned successfully
  1976	 */
  1977	static int csv3_unpin_shared_memory(struct kvm *kvm, gpa_t gpa, u32 num_pages)
  1978	{
  1979		struct shared_page_block *spb;
  1980		struct kvm_csv_info *csv;
  1981		struct list_head *head, *pos, *q;
  1982		struct page *page;
  1983		gfn_t gfn;
  1984		int unpin_cnt = 0;
  1985		unsigned long i, j, k;
  1986		int ret = 0;
  1987	
  1988		csv = &to_kvm_svm_csv(kvm)->csv_info;
  1989		gfn = gpa_to_gfn(gpa);
  1990	
  1991		for (i = 0; i < num_pages; i++, gfn++) {
  1992			mutex_lock(&csv->shared_page_block_lock);
  1993	
  1994			head = &csv->shared_pages_list;
  1995			if (list_empty(head)) {
  1996				ret = -ENOMEM;
  1997				mutex_unlock(&csv->shared_page_block_lock);
  1998				goto out;
  1999			}
  2000	
  2001			/* remvoe the page from shared page block */
  2002			list_for_each_safe(pos, q, head) {
  2003				spb = list_entry(pos, struct shared_page_block, list);
  2004				for (j = 0; j < spb->count; j++) {
  2005					if (spb->shared_pages[j].gfn != gfn)
  2006						continue;
  2007	
  2008					page = spb->shared_pages[j].page;
  2009	
  2010					/* delete the page, and move backward */
  2011					for (k = j; k < spb->count - 1; k++)
  2012						spb->shared_pages[k] = spb->shared_pages[k + 1];
  2013	
  2014					spb->count--;
  2015					csv->total_shared_page_count--;
  2016					if (spb->count == 0) {
  2017						list_del(&spb->list);
  2018						kfree(spb->shared_pages);
  2019						kfree(spb);
  2020						if (csv->cached_shared_page_block == spb)
  2021							csv->cached_shared_page_block = NULL;
  2022					}
  2023					unpin_user_page(page);
  2024					unpin_cnt++;
  2025					goto next_page;
  2026				}
  2027			}
  2028	next_page:
  2029			mutex_unlock(&csv->shared_page_block_lock);
  2030	
  2031			cond_resched();
  2032		}
  2033	
  2034		ret = unpin_cnt;
  2035	out:
  2036		return ret;
  2037	}
  2038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
