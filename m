Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A9814EC6B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716809088; cv=none; b=h8oQO6pjsqWDJNcfxcwkF3LvslRTPnQvmNPDMDpCl5RXc/iAqUPftUu9FkrNYsdDTVOyhSYlS3P4YDNY1DciWaUH4oUsysc9dkSJ8q7P+rV1hW5KwzF6ZWd4iOq+9Typ5OPrmi/SMWnV1HoltrkjnrOpbSBXog7jft2n4J0lHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716809088; c=relaxed/simple;
	bh=lUWW+RfwJnC3X8uGXOQWhU7Luwbtd4HUz2p81IxuYQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlyXvpGcZmLD7Jtf9Xp8BBVeX8I4uaQJswOOQIO6bMrMkIagDQbNfM3yHcZGN+QP8p4KQ1BIjrXy1Pngn+EcL3LH8QJMhF5oncaqsMzYYffesBoJkshMNMG5p/2dAuhqGRcD5M/fKxENaRSFfaEaCcipWQfhRaQ9KqeNGQ/mzdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNTVvv97; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNTVvv97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716809086; x=1748345086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUWW+RfwJnC3X8uGXOQWhU7Luwbtd4HUz2p81IxuYQA=;
  b=HNTVvv97OfZCFo4AzZ9tQZNLBCFoHdDXzCl7wY2wVKoK90CPyYbZqVWC
   wzKl6MiZ7FNQeUzJLQnsOucH9YhvOX0WR+yF33jdGsV+wPoMHGPhroN2L
   7I1KXshkjO0gHiPlCKQNfugedibDS13vQx0mgICxKtpv8qfY9kTWCXZxb
   bs1R8CXlp8XDnweJs0/901twC2P907Al8L/wCvLFpsG2F3GPHcdbnugXq
   PgJxN3UGuNe/ZcGzKSeoOMB5Jxb7lYesJwiYRDFeGsm0XfYMoQi+pNdqW
   cmRNZiFsn7wCBs60eQ5fd/J+n+/clbEzzdB03CQtbbObaXfr0ir4xWCpC
   w==;
X-CSE-ConnectionGUID: NBanpIzXQHGXMiYk+KclsQ==
X-CSE-MsgGUID: DdpbyNIDSpeKO5P72N6fBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12972098"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="12972098"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 04:24:46 -0700
X-CSE-ConnectionGUID: ZQlyU5/qRdGCgp78hh0vlg==
X-CSE-MsgGUID: 30/EdXsLTNqProW9LEE1eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="65516580"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2024 04:24:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBYT4-000A6b-2D;
	Mon, 27 May 2024 11:24:42 +0000
Date: Mon, 27 May 2024 19:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ye Bin <yebin10@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22493/22521] fs/f2fs/.tmp_recovery.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202405271942.goRtz43u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b61ca68689b492a15400db11ef5d3ede708b1a60
commit: 21d0fe9fd291eec496a4c174924ea645ed5d7b9e [22493/22521] f2fs: fix to avoid racing on fsync_entry_slab by multi filesystem instances
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240527/202405271942.goRtz43u-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405271942.goRtz43u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405271942.goRtz43u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/recovery.c:12:
   In file included from include/linux/f2fs_fs.h:14:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/f2fs/.tmp_recovery.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
