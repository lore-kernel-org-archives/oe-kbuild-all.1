Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349A28BAA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918370; cv=none; b=C8zXShfXR/AwLbqTzxrRS5GISNzWxyRAQDBnHDQZqhtk2oYXcRzsIdRmts5tC4AcW64ba4/NJ6GdErDDK189xaAs/Zdxy8YaHvi2221iMgvMpnE+gvYi9gu1EOBbQFt7XaTS22xq/5Fdi73FZL2b4VHud874LdRhkfWP0f8A7AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918370; c=relaxed/simple;
	bh=vy9FmrZy6N51MfsoSFvleMS4+XwfzQum7AC7CpyQOz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgMp/FXUOCt+QaJV8mz3bDQ1bEwGH2ut6psm14FA4qmvLBwYF56mLEbH5zJIGeUESbQ7NJITCxnW4Bgq0s9XpYUX2VCqIhclziyOut4mhCnuXce02tzvl8SZR3q+a0gRAODEetbEIVUbWXjSgp+HGwgIwM8E7oSaubp2OAXssXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cygXWuWk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cygXWuWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747918369; x=1779454369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vy9FmrZy6N51MfsoSFvleMS4+XwfzQum7AC7CpyQOz4=;
  b=cygXWuWkOaRXDexnHeZamli0B/C3ssIIpSlqA1Vp0jYxsONMcTWqERy0
   g7nQCAk8nDVijtBEZObAI0mRAhv/MdykRU4SxdkGve86Mm9RedXauzOf0
   ln7B2Lvmgxck9OuGex4Y+KVlYZ37jvDCT5hhwmq5C6yfcvqQ8V4LcRBbl
   wzRthzy+iIAPybs/Vg3/jS9T6AWCiN1u51fUUSy9KmMGVq2eiUtwTq35i
   7RboBxBrOxyR+HYDkQ/prdeKdIzhi2NAO9metcW8ax02HJdAVX0d/M6DB
   zrUYSnXaRqtsXiCy/YLeLzXdU9t7swsWaF4DQXgzo6+i9sFrp06tl5Nhu
   Q==;
X-CSE-ConnectionGUID: 2g1PViDfRmCmIFNNkgT9Gw==
X-CSE-MsgGUID: oCW7fMR9TjmRlh/MtuWVKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37562264"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="37562264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 05:52:46 -0700
X-CSE-ConnectionGUID: HQqO64ykT7e/YeDd0pmtKA==
X-CSE-MsgGUID: Pu7fCd7yQXiZJCFjJ6yTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140464032"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2025 05:52:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI5Pe-000PLK-2p;
	Thu, 22 May 2025 12:52:42 +0000
Date: Thu, 22 May 2025 20:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/5] nvmet: implement copy support for bdev backed target
Message-ID: <202505222048.SmFqu3B0-lkp@intel.com>
References: <20250521223107.709131-6-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521223107.709131-6-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20250522]
[cannot apply to linux-nvme/for-next brauner-vfs/vfs.all linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-new-sector-copy-api/20250522-063316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250521223107.709131-6-kbusch%40meta.com
patch subject: [PATCH 5/5] nvmet: implement copy support for bdev backed target
config: csky-randconfig-r132-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222048.SmFqu3B0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505222048.SmFqu3B0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222048.SmFqu3B0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/io-cmd-bdev.c:447:62: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le64 [usertype] lba @@     got unsigned long long [assigned] [usertype] slba @@
   drivers/nvme/target/io-cmd-bdev.c:447:62: sparse:     expected restricted __le64 [usertype] lba
   drivers/nvme/target/io-cmd-bdev.c:447:62: sparse:     got unsigned long long [assigned] [usertype] slba
>> drivers/nvme/target/io-cmd-bdev.c:448:63: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le64 [usertype] lba @@     got unsigned short [assigned] [usertype] nlb @@
   drivers/nvme/target/io-cmd-bdev.c:448:63: sparse:     expected restricted __le64 [usertype] lba
   drivers/nvme/target/io-cmd-bdev.c:448:63: sparse:     got unsigned short [assigned] [usertype] nlb
>> drivers/nvme/target/io-cmd-bdev.c:454:35: sparse: sparse: cast to restricted __le64

vim +447 drivers/nvme/target/io-cmd-bdev.c

   419	
   420	static void nvmet_bdev_execute_copy(struct nvmet_req *req)
   421	{
   422		struct bio_vec *bv, fast_bv[UIO_FASTIOV];
   423		struct nvme_copy_range range;
   424		u64 dst_sector, slba;
   425		u16 status, nlb, nr;
   426		int ret, i;
   427	
   428		nr = req->cmd->copy.nr_range + 1;
   429		if (nr <= UIO_FASTIOV) {
   430			bv = fast_bv;
   431		} else {
   432			bv = kmalloc_array(nr, sizeof(*bv), GFP_KERNEL);
   433			if (!bv) {
   434				status = NVME_SC_INTERNAL;
   435				goto done;
   436			}
   437		}
   438	
   439		for (i = 0; i < nr; i++) {
   440			status = nvmet_copy_from_sgl(req, i * sizeof(range), &range,
   441					sizeof(range));
   442			if (status)
   443				goto done;
   444	
   445			slba = le64_to_cpu(range.slba);
   446			nlb = le16_to_cpu(range.nlb) + 1;
 > 447			bv[i].bv_sector = nvmet_lba_to_sect(req->ns, slba);
 > 448			bv[i].bv_sectors = nvmet_lba_to_sect(req->ns, nlb);
   449		}
   450	
   451		dst_sector = nvmet_lba_to_sect(req->ns, req->cmd->copy.sdlba);
   452		ret = blkdev_copy_range(req->ns->bdev, dst_sector, bv, nr, GFP_KERNEL);
   453		if (ret) {
 > 454			req->error_slba = le64_to_cpu(dst_sector);
   455			status = errno_to_nvme_status(req, ret);
   456		} else
   457			status = NVME_SC_SUCCESS;
   458	done:
   459		nvmet_req_complete(req, status);
   460		if (bv != fast_bv)
   461			kfree(bv);
   462	}
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
