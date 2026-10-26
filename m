Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019079;
	b=nR1g1bsF0aRLskIXn5if6x5DwRkixFZRb+JiNrQaMfVAhRLy76scnl9Ms1vIjKsv4HHj
	 +J9NzkV98qjS9qd8rgMufMe1TND8BUOSfXfmzbThjrK1mmCdgHqfvzF7JRDI9M+DeNR5B
	 dP3JC26H1qGiyN6KPKxSk2+dzGrXksh2qKHZzOrtKZWGnLQdxzzrR6ibudH022SMLYwFH
	 P2V88FNpN8q32mvzYYRKIbDUL3XJ1n9DMVKDq+/+kqg85UFVQfufNm8zOCvzTrJ7sjWYP
	 Kj2HgnbtmcqRIU3Jv8CF6FluFME7o22mdxfqRgCPhgDOfNArrN78aCygOkZdg1efGQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019079;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=bK3nbaukeJcGdNNGB3JkzMZLtME/bGhzkgpLSf/Eta0=;
	b=nNEapzcRxF9VWqwzgOxnDZlXTZlpTx0Z0dS1UR90TVcf4DoZWokgnrxBw3y0kxK+13PR
	 MztiDReW0xYwrwKJVIkd4Zbd7m9ebBPbmppEn/1J5XK+5invhfHxDvUBny+gF+hpwZ+sL
	 lYa+tjVmH2U0nZyH8bDlE7kgzDzxPyjAvtlPFpOVPV6tqhgSVRfwQ16rvhic3zw65ZZso
	 DTzWprZxZrZohd7w2PisVhnFz8vG0CvtgfL69jeGwAffKl8ChIahnNZbUYX597gIm2FSS
	 y6cBXDYBZ9CdFt3yNOpPFNS9qfSj8simvxXJPW2udUxvbwnWrDth5kclc3fC72xX77g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNWAON9+;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD4606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 12:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNWAON9+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793019077; x=1824555077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OgOER5MPFRdRXUX6yhpDc31WszGMJQVizEP2uzzNS/4=;
  b=RNWAON9+x/D8M4WL/+HORIeMa3s9p+oZbIEPAcm97xkc42on5Kn493Fw
   H1JhRWq4zoNBzdYmWhV5v2wEVXmENJ8XfJQKVXYrr8Igk0OCJAk+HqiX8
   uMSwF16bIxzHp9sa6PPEgIsuGK+LdylK91jF9c9pBXJLbnxAq5w4LZ2v9
   dlPuHOuSzoJtMexpAaiXvt6OyIr+f9Ntx2h2KBR5vlMgFHlLD4QDmPVXV
   xeM2LkBRpsD7V1IQypexe3/MxwUN4j7iPl4DfIqUWS+x1XeeFslDnjx7l
   3pd48QklM9h7Ro9m2eRqTm30Ibf+Fr82/4hjklWSoiUxGa4AodpocFdFn
   w==;
X-CSE-ConnectionGUID: qXDu9ernQ22dDjic7gJoFA==
X-CSE-MsgGUID: +AxR3tjzQIWbsWYzqE03Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1580203"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1580203"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 05:51:17 -0700
X-CSE-ConnectionGUID: oeOhjOIzRX28nx/LCHUfcA==
X-CSE-MsgGUID: qGzxhDcGQI+4l1LQOX0WXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6083940"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 05:51:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLKAT-00000000Vvw-3QfS;
	Mon, 26 Oct 2026 12:51:13 +0000
Date: Mon, 26 Oct 2026 20:51:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 4/9] bpf: Add kfuncs to allocate and seal user
 pages
Message-ID: <202610262046.jyr2SpRS-lkp@intel.com>
References: <20261021195759.119421-5-jolsa@kernel.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021195759.119421-5-jolsa@kernel.org>

Hi Jiri,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/bpf-Add-__srcptr-kfunc-argument-suffix/20261021-215750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20261021195759.119421-5-jolsa%40kernel.org
patch subject: [RFC bpf-next 4/9] bpf: Add kfuncs to allocate and seal user pages
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261026/202610262046.jyr2SpRS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610262046.jyr2SpRS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610262046.jyr2SpRS-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/helpers.c: In function 'bpf_user_page_exec':
>> kernel/bpf/helpers.c:3855:9: error: implicit declaration of function 'flush_icache_user_page'; did you mean 'flush_icache_page'? [-Werror=implicit-function-declaration]
    3855 |         flush_icache_user_page(vma, page, addr, PAGE_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         flush_icache_page
   cc1: some warnings being treated as errors


vim +3855 kernel/bpf/helpers.c

  3807	
  3808	/**
  3809	 * bpf_user_page_exec() - Make a BPF-allocated user page read/execute
  3810	 * @addr: Address of the page to change
  3811	 *
  3812	 * Changes a writable page created by bpf_user_page_alloc() to read/execute.
  3813	 * The page cannot be made writable again after this call.
  3814	 *
  3815	 * Return: 0 on success, or a negative error code.
  3816	 */
  3817	__bpf_kfunc int bpf_user_page_exec(unsigned long addr)
  3818	{
  3819		struct mm_struct *mm = current->mm;
  3820		struct vm_area_struct *vma;
  3821		struct page *page;
  3822		int err = -EINVAL;
  3823	
  3824		if (unlikely(in_interrupt() ||
  3825			     current->flags & (PF_KTHREAD | PF_EXITING)))
  3826			return -EPERM;
  3827		if (unlikely(!nmi_uaccess_okay()))
  3828			return -EPERM;
  3829		if (unlikely(!mm))
  3830			return -EFAULT;
  3831		if ((addr & ~PAGE_MASK) || addr > ULONG_MAX - PAGE_SIZE)
  3832			return -EINVAL;
  3833	
  3834		if (mmap_write_lock_killable(mm))
  3835			return -EINTR;
  3836	
  3837		vma = find_vma(mm, addr);
  3838		if (!vma || vma->vm_start > addr)
  3839			goto out;
  3840		/* Allow to change only vma allocated by bpf_user_page_alloc. */
  3841		if (vma->vm_private_data != &bpf_user_page_marker)
  3842			goto out;
  3843		if (!(vma->vm_flags & VM_WRITE) || !(vma->vm_flags & VM_MAYEXEC))
  3844			goto out;
  3845	
  3846		vma_start_write(vma);
  3847	
  3848		err = get_user_pages(addr, 1, FOLL_WRITE, &page);
  3849		if (err != 1) {
  3850			if (!err)
  3851				err = -EFAULT;
  3852			goto out;
  3853		}
  3854	
> 3855		flush_icache_user_page(vma, page, addr, PAGE_SIZE);
  3856		err = do_mprotect_pkey_locked(addr, PAGE_SIZE, PROT_READ | PROT_EXEC, -1);
  3857		if (!err) {
  3858			vma = find_vma(mm, addr);
  3859			vm_flags_clear(vma, VM_MAYWRITE);
  3860		}
  3861		put_page(page);
  3862	out:
  3863		mmap_write_unlock(mm);
  3864		return err;
  3865	}
  3866	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
