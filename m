Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9119A280
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723553246; cv=none; b=YOCQVZXVgm+5DbeZq0p3HIgvN3/42TlhQ1QXK0vAqzgQ2/a1axhjNeVkkL4YbCmFY2quZ66mzUb1YvfzsJ5bm24aY63+8Hy3zFds93AIghUhLAIqzUmkhwRmAnwaRvPcXRIOYj6OdQd8CKi/KptI1jNiSJSa68oBdanUybz8QWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723553246; c=relaxed/simple;
	bh=tuM8kGbOhzPxqpnX7f06k38z7nrCCgXHnhV7YOVMK7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzTDrxLATIZxUppt+ZyuVj7wgqN7kNx3P61aRxOKVhYPZc+tL3/XWn7n9u9BDzQF2jxKwtHEmGg6KMwTJOzwvfbmExKI5+jTUmaYiZX62bIONdd+qigxQe/fyxc4JEUAGUhS3yFwUZ5U3sPN4aS09N4vQVlLl7fhHdxXCP1/YaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6iZ3kRZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6iZ3kRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723553244; x=1755089244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tuM8kGbOhzPxqpnX7f06k38z7nrCCgXHnhV7YOVMK7s=;
  b=D6iZ3kRZDA1GX0WP8jBZzyqS5mxEtbPLHgGAJQPBTqBe4x5eyO3MPC14
   MStMJ5hJprhe0gIloFyWzOLZ6Gavtq2otkM8IxUPA1pHmp4WKXWlY+kYJ
   oN3K46PW8W4alv4Eqq8vEhvXiN8hphSg7TSytrwigv792RFkdg+zx6bQJ
   anCfkqgolf3BZOukCb06rKK9xaS8VCEjjpRFqNsCV8SFj6OjI1lq8QhvA
   cpqm/TY4s2+7u0byV4ZoDF7EKq2/JoA0qTO5LATX3Jq9BIorDXstfPUgd
   IWP4N5p8RthpFs3F7wjONQKi7Ydc4zjsDunyjSQZfvF9OaUg8NmNc1gxp
   g==;
X-CSE-ConnectionGUID: Iwi+iKisQ6+KNoMjAlx+0A==
X-CSE-MsgGUID: VuXEIemIQsmn4llAiT87fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21857410"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21857410"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:47:23 -0700
X-CSE-ConnectionGUID: SYl1FrMGRiaAd8iEA136Iw==
X-CSE-MsgGUID: TuLqWDJHQ/G/j0AN7/GUSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58735906"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2024 05:47:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdqvn-0000Pe-2S;
	Tue, 13 Aug 2024 12:47:19 +0000
Date: Tue, 13 Aug 2024 20:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13169/23490] fs/pipe.o: warning:
 objtool: generic_pipe_buf_get()+0xc0: unreachable instruction
Message-ID: <202408132002.WTqihNUY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ffc1b506e4066379411520003b9c59e509b05252
commit: 8b9ea9010139596e71aae4be5264c3dd901b13cb [13169/23490] pagecache: support percpu refcount to imporve performance
config: x86_64-buildonly-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240813/202408132002.WTqihNUY-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408132002.WTqihNUY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408132002.WTqihNUY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/pipe.c:21:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/pipe.o: warning: objtool: generic_pipe_buf_get()+0xc0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
