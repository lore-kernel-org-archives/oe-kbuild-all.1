Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725CC33CE8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729349079; cv=none; b=KlubCOMxJan3CPbq6hDLy87ZxNaMARVEbCWlNoiWoKI53UeCj2Ej5Za7CtKdyHvHXhKEpkf4IVE2JKyM8xQbYQk7V6tJ3r+X+9Va6GJ0K/VWJLQ10yIYm8U9k5E8NQM4YEYWu4ucOarv/eTqYScL4WFTbFtiFwPBP0cjtzM4F7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729349079; c=relaxed/simple;
	bh=DYGEHcbKNHhF7I85KB1LRv5kUrofMte1Tm5nsLefHbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YOX83bbjCmOy365aHI70NATKbZIoDPKZ7/L/MGZTblNymivAtfQ0V6MzKYRHVmmwlZIDCUvGqXiwXicz8azznHkqZnEa//5oxg6BtUD3l4PdjmWRAYFL2tOzI3RAQyUI1PQSgMX6wfWf5ZLYV17CQUSAySAF0fAnhMFsUC66qas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bn/UoWjx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bn/UoWjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729349077; x=1760885077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYGEHcbKNHhF7I85KB1LRv5kUrofMte1Tm5nsLefHbI=;
  b=bn/UoWjxCDrTR+Frav58hNM8mF/Lp7U2un7cG49svg2T94q2OZYJ5bFk
   Pe5+B86EeoNPIkM+FRY/0aWzgg2w3UE811p75+VzxAGxGg/gv5ioHobeB
   M7Jr8aMbR/w/8pI10CZJeOd2J24ttH1msfZfxOL7l7QypqfYEu/iBfyr5
   h/h7u0WDCXdHgqEAorO2L/utJLh2/5/499XWqVeLCk7vYrw/v5/6LWLZs
   z6Y19Ph5YEaWBVwFxWcIkhOlm12AZDobHQeXrDq4pz3qF+reGEgH0bFyB
   E5vb5UiMZKgZqhrXWqj+9t3qG84jETBSTTLzEwBtLkiRy8uaWyd8XLgvL
   A==;
X-CSE-ConnectionGUID: vdmVY6FvQyaVvQTEqHLiSw==
X-CSE-MsgGUID: VIpSUnBoQaKQv0qZ7Yl/+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="32790129"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="32790129"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 07:44:37 -0700
X-CSE-ConnectionGUID: yhp8aVp2QVWHQDxAll+tCg==
X-CSE-MsgGUID: qzZGY5e5TzqIGTrWar5ntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79045077"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2024 07:44:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Agz-000P5R-1H;
	Sat, 19 Oct 2024 14:44:33 +0000
Date: Sat, 19 Oct 2024 22:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:ring-buffer/for-next 2/4] kernel/trace/ring_buffer.c:1540
 rb_check_pages() warn: inconsistent indenting
Message-ID: <202410192201.oCwXfxZf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/for-next
head:   70c765743423ea51af71865aeb4530bcdf892300
commit: 1f1c2bc9d0753afb466ad6f0c2cd9dc08ed637fa [2/4] ring-buffer: Limit time with disabled interrupts in rb_check_pages()
config: i386-randconfig-141-20241019 (https://download.01.org/0day-ci/archive/20241019/202410192201.oCwXfxZf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410192201.oCwXfxZf-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:1540 rb_check_pages() warn: inconsistent indenting

vim +1540 kernel/trace/ring_buffer.c

  1493	
  1494	/**
  1495	 * rb_check_pages - integrity check of buffer pages
  1496	 * @cpu_buffer: CPU buffer with pages to test
  1497	 *
  1498	 * As a safety measure we check to make sure the data pages have not
  1499	 * been corrupted.
  1500	 */
  1501	static void rb_check_pages(struct ring_buffer_per_cpu *cpu_buffer)
  1502	{
  1503		struct list_head *head, *tmp;
  1504		unsigned long buffer_cnt;
  1505		unsigned long flags;
  1506		int nr_loops = 0;
  1507	
  1508		/*
  1509		 * Walk the linked list underpinning the ring buffer and validate all
  1510		 * its next and prev links.
  1511		 *
  1512		 * The check acquires the reader_lock to avoid concurrent processing
  1513		 * with code that could be modifying the list. However, the lock cannot
  1514		 * be held for the entire duration of the walk, as this would make the
  1515		 * time when interrupts are disabled non-deterministic, dependent on the
  1516		 * ring buffer size. Therefore, the code releases and re-acquires the
  1517		 * lock after checking each page. The ring_buffer_per_cpu.cnt variable
  1518		 * is then used to detect if the list was modified while the lock was
  1519		 * not held, in which case the check needs to be restarted.
  1520		 *
  1521		 * The code attempts to perform the check at most three times before
  1522		 * giving up. This is acceptable because this is only a self-validation
  1523		 * to detect problems early on. In practice, the list modification
  1524		 * operations are fairly spaced, and so this check typically succeeds at
  1525		 * most on the second try.
  1526		 */
  1527	again:
  1528		if (++nr_loops > 3)
  1529			return;
  1530	
  1531		raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
  1532		head = rb_list_head(cpu_buffer->pages);
  1533		if (!rb_check_links(cpu_buffer, head))
  1534			goto out_locked;
  1535		buffer_cnt = cpu_buffer->cnt;
  1536		tmp = head;
  1537		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
  1538			return;
  1539	
> 1540		while (true) {
  1541			raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
  1542	
  1543			if (buffer_cnt != cpu_buffer->cnt) {
  1544				/* The list was updated, try again. */
  1545				raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
  1546				goto again;
  1547			}
  1548	
  1549			tmp = rb_list_head(tmp->next);
  1550			if (tmp == head)
  1551				/* The iteration circled back, all is done. */
  1552				goto out_locked;
  1553	
  1554			if (!rb_check_links(cpu_buffer, tmp))
  1555				goto out_locked;
  1556	
  1557			raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
  1558		}
  1559	
  1560	out_locked:
  1561		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
  1562	}
  1563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
