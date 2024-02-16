Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A409512C7FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708093660; cv=none; b=cRaT7pXCiVC3rO52KNss7pkVzZ5gfsTQVIQ+NWB+Jw8Wz8KFLbLVckSAXa0DkLVLLsboxphnQyuOn8Li72Z3CltHP4U3Pe79n1m4IedYbN8LLI+ebiRelnkoXz9p0hYUYFlXlbFTOD7olX4xbnx59Nq8f0XUx4QeGTefw0Ckx28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708093660; c=relaxed/simple;
	bh=bdZ0h77L5sduWUV06Y5xcBj5QLA72RpYoNMx6Ens82E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NoLnkRNIMBRZ3IW/1UTpL2kWz631qbmE00Mbmy54Y0jaA33xeH86jW+E3VfRUPgzg8piuq7PSfpYj4Z3RzdxBeFHEFb5rYMoyaW+j1KgGiNcd+gfOCzwS2m96SChnYbnxcXnCdPHqeFc1vZ94VQjaLHvu2ixQEmJbigWhF/JgS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c23D3KEv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c23D3KEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708093659; x=1739629659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bdZ0h77L5sduWUV06Y5xcBj5QLA72RpYoNMx6Ens82E=;
  b=c23D3KEvlNYuNajYJ9JS7ke1sMjikzlC5WxUNHYg+FfPxHR/tW2uLY0e
   COYRyPHjFDET5Lfd+m3WIqt4zT+RylCQeI7ETV9UIxY/sPDohIYkFZyVY
   L9OfbfI/VrwHTbnPUlFcXxWlWCRocExNqrD5miO3AggAfyr5iwzt9d8Gi
   dPa80+zR61gCUFavoia2rtw/gxl3VpdxHVZCYShut1I1K8lClXUGxSQJ/
   QnJUXNcIqHihn2gsnpGeOP9hTgCRGFOOCUimCojGoJi7BwbJ5fL4a7x09
   uTJBcokzcxp+Qq27UZXsFrGOVjjK1rfbls3dbNlRK9QIyj5+plPzKJ8iX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2354173"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2354173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 06:27:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="4165271"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Feb 2024 06:27:37 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1razBe-0001LQ-0I;
	Fri, 16 Feb 2024 14:27:34 +0000
Date: Fri, 16 Feb 2024 22:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6971/7658] mm/page_owner.c:860 stack_print()
 warn: unsigned 'nr_entries' is never less than zero.
Message-ID: <202402162252.FpEa3ZUY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d37e1e4c52bc60578969f391fb81f947c3e83118
commit: 3a6bc36161369a1772af565b59c6e290ee189afc [6971/7658] mm,page_owner: display all stacks and their count
config: x86_64-randconfig-161-20240215 (https://download.01.org/0day-ci/archive/20240216/202402162252.FpEa3ZUY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402162252.FpEa3ZUY-lkp@intel.com/

smatch warnings:
mm/page_owner.c:860 stack_print() warn: unsigned 'nr_entries' is never less than zero.

vim +/nr_entries +860 mm/page_owner.c

   848	
   849	static int stack_print(struct seq_file *m, void *v)
   850	{
   851		int i;
   852		struct stack *stack = v;
   853		unsigned long *entries;
   854		unsigned long nr_entries;
   855		struct stack_record *stack_record = stack->stack_record;
   856	
   857		nr_entries = stack_record->size;
   858		entries = stack_record->entries;
   859	
 > 860		if (!nr_entries || nr_entries < 0 ||
   861		    refcount_read(&stack_record->count) < 2)
   862			return 0;
   863	
   864		for (i = 0; i < nr_entries; i++)
   865			seq_printf(m, " %pS\n", (void *)entries[i]);
   866		seq_printf(m, "stack_count: %d\n\n", refcount_read(&stack_record->count));
   867	
   868		return 0;
   869	}
   870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
