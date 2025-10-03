Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54668EAC7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759486800; cv=none; b=gkLImY7vgb1SKQohdcXt/EOgQ/oE3osOMWzGJN45hlUM9YV1/CncSECwkb2ss83JZNy6xKbPXFlJlWb8qTpehuma6fe9YfkUOwrnw/cDLkJGdX9ODDcEbK6146XetJBkvJPB54UFMPHSVZFERq34QJqGqcXp/gRwYiwZtHK5zkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759486800; c=relaxed/simple;
	bh=gY3XN0wfLlf7t4nheEFF+T1GKq05iaYXEJtGttMkGL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlsEDTM8l8gVXvgaPUm6IJoicQ8t+oWzxYvbktaGBhuv1s0ptUq2akEp0WgATIk+kxYbXl+Z/IpR5fsUN80MUFQHf6d96OjdMgyaTz4leisVVfR8yHUeXKdEUH+eK9OvSwQWDbNcJtfw9ngHl+YquYUh/vAKUzO3Jo8dMDTBzws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvhckHKL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvhckHKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759486798; x=1791022798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gY3XN0wfLlf7t4nheEFF+T1GKq05iaYXEJtGttMkGL8=;
  b=bvhckHKLF1tANn72ONvdCzWcmg0yiVleGXr8zuTqziUTsubhTZIjJWnQ
   qMT1RTRMGJJ6lH1UQkUyCTGqYWxKRMbYzpHvWo8YLBqDRo6Qw+6GIpiEm
   URXRiB4etdsfP2K06U87O+tHqJJiTx1y4nd95bkgqe4LLUNRPbziqg0D7
   5SUy4cv59/IV3SgiI+LwH8R6huM30HCVlkl75yRzTHV9ZZqMfVXafG2u6
   laSbyOmZqXOyxMqckrj/Uh++hpWa1YnSMdhtC2xbNt0fHvLODbmHFYBBC
   kbHJvaHppDksaM9Igt/ceUuzhcb4yCUxmeH5C+AXUiGT+hgXrFnSxkpXu
   A==;
X-CSE-ConnectionGUID: WV36bP2sQQK8tZ6kDKhXqA==
X-CSE-MsgGUID: xkmerPgbRn2vM0F5piUtrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61731412"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61731412"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 03:19:58 -0700
X-CSE-ConnectionGUID: bRPtcE5ZTDa9De15+uKbUA==
X-CSE-MsgGUID: 0go/wkRVQaCeCEKQyxrIxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="179068115"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2025 03:19:57 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4ctG-0004UR-0k;
	Fri, 03 Oct 2025 10:19:54 +0000
Date: Fri, 3 Oct 2025 18:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v2 02/12] bpf: Convert bpf_selem_unlink_map
 to failable
Message-ID: <202510031816.i9nCjhzy-lkp@intel.com>
References: <20251002225356.1505480-3-ameryhung@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002225356.1505480-3-ameryhung@gmail.com>

Hi Amery,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/bpf-Select-bpf_local_storage_map_bucket-based-on-bpf_local_storage/20251003-070020
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251002225356.1505480-3-ameryhung%40gmail.com
patch subject: [RFC PATCH bpf-next v2 02/12] bpf: Convert bpf_selem_unlink_map to failable
config: i386-buildonly-randconfig-001-20251003 (https://download.01.org/0day-ci/archive/20251003/202510031816.i9nCjhzy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510031816.i9nCjhzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510031816.i9nCjhzy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/bpf_local_storage.c: In function 'bpf_local_storage_destroy':
>> kernel/bpf/bpf_local_storage.c:781:13: warning: unused variable 'err' [-Wunused-variable]
     781 |         int err;
         |             ^~~


vim +/err +781 kernel/bpf/bpf_local_storage.c

   772	
   773	void bpf_local_storage_destroy(struct bpf_local_storage *local_storage)
   774	{
   775		struct bpf_local_storage_map *storage_smap;
   776		struct bpf_local_storage_elem *selem;
   777		bool bpf_ma, free_storage = false;
   778		HLIST_HEAD(free_selem_list);
   779		struct hlist_node *n;
   780		unsigned long flags;
 > 781		int err;
   782	
   783		storage_smap = rcu_dereference_check(local_storage->smap, bpf_rcu_lock_held());
   784		bpf_ma = check_storage_bpf_ma(local_storage, storage_smap, NULL);
   785	
   786		/* Neither the bpf_prog nor the bpf_map's syscall
   787		 * could be modifying the local_storage->list now.
   788		 * Thus, no elem can be added to or deleted from the
   789		 * local_storage->list by the bpf_prog or by the bpf_map's syscall.
   790		 *
   791		 * It is racing with bpf_local_storage_map_free() alone
   792		 * when unlinking elem from the local_storage->list and
   793		 * the map's bucket->list.
   794		 */
   795		raw_spin_lock_irqsave(&local_storage->lock, flags);
   796		hlist_for_each_entry_safe(selem, n, &local_storage->list, snode) {
   797			/* Always unlink from map before unlinking from
   798			 * local_storage.
   799			 */
   800			while (bpf_selem_unlink_map(selem));
   801			/* If local_storage list has only one element, the
   802			 * bpf_selem_unlink_storage_nolock() will return true.
   803			 * Otherwise, it will return false. The current loop iteration
   804			 * intends to remove all local storage. So the last iteration
   805			 * of the loop will set the free_cgroup_storage to true.
   806			 */
   807			free_storage = bpf_selem_unlink_storage_nolock(
   808				local_storage, selem, true, &free_selem_list);
   809		}
   810		raw_spin_unlock_irqrestore(&local_storage->lock, flags);
   811	
   812		bpf_selem_free_list(&free_selem_list, true);
   813	
   814		if (free_storage)
   815			bpf_local_storage_free(local_storage, storage_smap, bpf_ma, true);
   816	}
   817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
