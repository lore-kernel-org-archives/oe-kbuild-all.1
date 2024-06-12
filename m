Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EA22D613
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718207819; cv=none; b=FLvtTCfgXX1qC4obna6pPZ997THlecLCsEVosvfKz0VWPnKLQ5rcgq47OowiLvN1NScLWIx0BJZXu3puV5oi4o93Kipm43PtuJti8hJhB1daw0cXU13jzj8KyGGMW+ug00ZrYrlITD54mMLRcCB8pHyz23qhDUG5h0AII6cyees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718207819; c=relaxed/simple;
	bh=eFTmHqoD/CG27o7Z1ewKkTvVE22oN7rhw6mRqQfVyVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSWXsjkz5unOltl8su5LEJyoF94qcagj7cS565bBh+jFn+pgQxRKN9zcn5ctmvreRrbtSvoU2A79Bv5sz2Rj8A4CiEl+JKtk5JVmQPXhP011och1wznGuV/43ct7Ym1QITsk36VyE4+9SyleT0+/F9xMD/ETfyytFntKMd3FC7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjbXabFw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjbXabFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718207818; x=1749743818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFTmHqoD/CG27o7Z1ewKkTvVE22oN7rhw6mRqQfVyVo=;
  b=BjbXabFwqa1FKpM8V9ULzwz1nxJKyGJhVyLobIuRi2/4gfZ1T3AfH0qO
   aMHawJi816TSXow4VSJbyVWgtcOGMuTk2QyXGmvokUKUeWQqw2ZksYFkN
   VoRGjwGD7/qBOBMX7/8BT6GiKDmeLlgOwKf/x1kgrqsN9e5+ucOYIxGJj
   WWpUedlY8pjes6A+z2tpD1HMUlU2kLvoDLzak13BQl5x3zqhAd8uqrA8i
   dhm32a7n8WfFb/tSu2RIZcgYk/3/cAuJttbyAtoWzXN0lVxmB8QqIQM+M
   AX0AsvviQJi009M/FoNWu3/1jm7LbM+fdefxFYcgBxV0HoJV4sp84XztX
   w==;
X-CSE-ConnectionGUID: WYkB1rp6SOOnBCLp1ttDyw==
X-CSE-MsgGUID: mOS6+f/JT5OYwr0DFg21dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32527954"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="32527954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 08:56:57 -0700
X-CSE-ConnectionGUID: pb2tvm2NSzeOZDmnpNc2ZA==
X-CSE-MsgGUID: t57f/89EQESj1nrDpIYs0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44772462"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jun 2024 08:56:56 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHQLG-0001ft-08;
	Wed, 12 Jun 2024 15:56:54 +0000
Date: Wed, 12 Jun 2024 23:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:ring-buffer/core 6/13] kernel/trace/ring_buffer.c:1704
 rb_range_meta_init() warn: unsigned 'cpu' is never less than zero.
Message-ID: <202406122331.NhG72Fh4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/core
head:   640e052ba42d577a7f57052dbee714cf470dd145
commit: 9018304b705f32d24fda1a88702ef22c9a436ef4 [6/13] ring-buffer: Add test if range of boot buffer is valid
config: i386-randconfig-141-20240612 (https://download.01.org/0day-ci/archive/20240612/202406122331.NhG72Fh4-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122331.NhG72Fh4-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:1704 rb_range_meta_init() warn: unsigned 'cpu' is never less than zero.

vim +/cpu +1704 kernel/trace/ring_buffer.c

  1680	
  1681	static void rb_range_meta_init(struct trace_buffer *buffer, int nr_pages)
  1682	{
  1683		struct ring_buffer_meta *meta;
  1684		unsigned long delta;
  1685		void *subbuf;
  1686		int cpu;
  1687		int i;
  1688	
  1689		for (cpu = 0; cpu < nr_cpu_ids; cpu++) {
  1690			void *next_meta;
  1691	
  1692			meta = rb_range_meta(buffer, nr_pages, cpu);
  1693	
  1694			if (rb_meta_valid(meta, cpu, buffer, nr_pages)) {
  1695				/* Make the mappings match the current address */
  1696				subbuf = rb_subbufs_from_meta(meta);
  1697				delta = (unsigned long)subbuf - meta->first_buffer;
  1698				meta->first_buffer += delta;
  1699				meta->head_buffer += delta;
  1700				meta->commit_buffer += delta;
  1701				continue;
  1702			}
  1703	
> 1704			if (cpu < nr_cpu_ids - 1)
  1705				next_meta = rb_range_meta(buffer, nr_pages, cpu + 1);
  1706			else
  1707				next_meta = (void *)buffer->range_addr_end;
  1708	
  1709			memset(meta, 0, next_meta - (void *)meta);
  1710	
  1711			meta->nr_subbufs = nr_pages + 1;
  1712			meta->subbuf_size = PAGE_SIZE;
  1713	
  1714			subbuf = rb_subbufs_from_meta(meta);
  1715	
  1716			meta->first_buffer = (unsigned long)subbuf;
  1717	
  1718			/*
  1719			 * The buffers[] array holds the order of the sub-buffers
  1720			 * that are after the meta data. The sub-buffers may
  1721			 * be swapped out when read and inserted into a different
  1722			 * location of the ring buffer. Although their addresses
  1723			 * remain the same, the buffers[] array contains the
  1724			 * index into the sub-buffers holding their actual order.
  1725			 */
  1726			for (i = 0; i < meta->nr_subbufs; i++) {
  1727				meta->buffers[i] = i;
  1728				rb_init_page(subbuf);
  1729				subbuf += meta->subbuf_size;
  1730			}
  1731		}
  1732	}
  1733	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
