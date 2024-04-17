Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0568222338
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384049; cv=none; b=TB+kZH5cyTSgSU/AvcrBQJGi+1SaKciQKbPBoeA4tCfMS1dHSpeVKmz8C86K+JKNX682oaR737VHzE+tsvT9FWJkVv3xrrvbKgsioKJM3TRu6TExTirLvrFK3pZga7SCkeqVx9Pm9BkihDaU9U/a2t3liYaFLMOstHjxfhPezDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384049; c=relaxed/simple;
	bh=e6C91cTft67/FbhAlfLEQC72tYktK0ATbW2DBERMn7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZapWJLP8LZX04Razp5Ip0TFdZNGvHsGsjZPOjKYZeUVWOtYBiSaVnGlqzEOVBv/YKrw/IsfssZJix6ZFl8DeOMgoVsqm0FRBlE5p0WjQwy6lHU9WfjbJIn1lCNlnMkJAQ5gBC7oh6MuYh4qAA0V4j+cT+Y4sHieZ6oFZxI97qmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhNINUWC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhNINUWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713384048; x=1744920048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e6C91cTft67/FbhAlfLEQC72tYktK0ATbW2DBERMn7Q=;
  b=jhNINUWCyAD0ppYdDBXbAneVdzt363gCpaOFR7lsRjDKoQn3k5fIepF7
   XcTDWM/xaWuTK/K1RvPAk/Iygy0SSoDgK5l8OdQE838NW6UQImMWR4tP1
   Od1XsuIhuAU7OedXY4/fLxQ0w8/RCz5f6QUtxS08xDqrtnHSLjvRpgMFN
   qIbPDL8xoSgoo0BukJ8WJVFTuhDiM0NEni65n20D7z44NfGd1AN/TpG1e
   kbIlt4Crw9G0m2huOiDk/hOjvjXwjQo7hoJXw2fyUhKtoRMi8nM1OUuc4
   VrsXprg21ajyIcXdi9s/FQ6KVc/50LszcSVTKgThiY93ijiQxY1C7AQFS
   Q==;
X-CSE-ConnectionGUID: aAP+U6ksQIyEiD1OqbL/Lw==
X-CSE-MsgGUID: wFwesS8ITU+6ANl4YxPTLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26406482"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="26406482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 13:00:47 -0700
X-CSE-ConnectionGUID: zCzG8MlISRicFJIAR4yjYQ==
X-CSE-MsgGUID: xXRngO76ROK4d2lme0iCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="23333554"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2024 13:00:46 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxBSV-0006xA-2K;
	Wed, 17 Apr 2024 20:00:43 +0000
Date: Thu, 18 Apr 2024 04:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] virtio_balloon: introduce oom-kill invocations
Message-ID: <202404180315.uKT3DxQU-lkp@intel.com>
References: <20240415084113.1203428-2-pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415084113.1203428-2-pizhenwei@bytedance.com>

Hi zhenwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.9-rc4 next-20240417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenwei-pi/virtio_balloon-introduce-oom-kill-invocations/20240415-164401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240415084113.1203428-2-pizhenwei%40bytedance.com
patch subject: [RFC 1/3] virtio_balloon: introduce oom-kill invocations
config: i386-randconfig-014-20240417 (https://download.01.org/0day-ci/archive/20240418/202404180315.uKT3DxQU-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180315.uKT3DxQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180315.uKT3DxQU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virtio/virtio_balloon.c: In function 'update_balloon_stats':
>> drivers/virtio/virtio_balloon.c:356:39: warning: 'events' is used uninitialized [-Wuninitialized]
     356 |                                 events[OOM_KILL]);
         |                                 ~~~~~~^~~~~~~~~~
   drivers/virtio/virtio_balloon.c:321:23: note: 'events' declared here
     321 |         unsigned long events[NR_VM_EVENT_ITEMS];
         |                       ^~~~~~


vim +/events +356 drivers/virtio/virtio_balloon.c

   318	
   319	static unsigned int update_balloon_stats(struct virtio_balloon *vb)
   320	{
   321		unsigned long events[NR_VM_EVENT_ITEMS];
   322		struct sysinfo i;
   323		unsigned int idx = 0;
   324		long available;
   325		unsigned long caches;
   326	
   327		all_vm_events(events);
   328		si_meminfo(&i);
   329	
   330		available = si_mem_available();
   331		caches = global_node_page_state(NR_FILE_PAGES);
   332	
   333	#ifdef CONFIG_VM_EVENT_COUNTERS
   334		update_stat(vb, idx++, VIRTIO_BALLOON_S_SWAP_IN,
   335					pages_to_bytes(events[PSWPIN]));
   336		update_stat(vb, idx++, VIRTIO_BALLOON_S_SWAP_OUT,
   337					pages_to_bytes(events[PSWPOUT]));
   338		update_stat(vb, idx++, VIRTIO_BALLOON_S_MAJFLT, events[PGMAJFAULT]);
   339		update_stat(vb, idx++, VIRTIO_BALLOON_S_MINFLT, events[PGFAULT]);
   340	#ifdef CONFIG_HUGETLB_PAGE
   341		update_stat(vb, idx++, VIRTIO_BALLOON_S_HTLB_PGALLOC,
   342			    events[HTLB_BUDDY_PGALLOC]);
   343		update_stat(vb, idx++, VIRTIO_BALLOON_S_HTLB_PGFAIL,
   344			    events[HTLB_BUDDY_PGALLOC_FAIL]);
   345	#endif
   346	#endif
   347		update_stat(vb, idx++, VIRTIO_BALLOON_S_MEMFREE,
   348					pages_to_bytes(i.freeram));
   349		update_stat(vb, idx++, VIRTIO_BALLOON_S_MEMTOT,
   350					pages_to_bytes(i.totalram));
   351		update_stat(vb, idx++, VIRTIO_BALLOON_S_AVAIL,
   352					pages_to_bytes(available));
   353		update_stat(vb, idx++, VIRTIO_BALLOON_S_CACHES,
   354					pages_to_bytes(caches));
   355		update_stat(vb, idx++, VIRTIO_BALLOON_S_OOM_KILL,
 > 356					events[OOM_KILL]);
   357	
   358		return idx;
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
