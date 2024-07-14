Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D2DDC9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 05:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720933382; cv=none; b=Avr2dhdP+A4lL0o7WFWBt2wBHRkdsDFtWbU9e4slHCXnl1NYzwzllv1fVFA7YkJR716vML51K1MKAImMkkdQfc778+qeOrpnRtoJ7tai94ImVTmvRwwxxQhk5OvktRfL2IW2p1bKEZI7Y4QUN4ox1heD0yTqaXO8dRjsL4pzSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720933382; c=relaxed/simple;
	bh=VEfuP66fxQpuvny+O0WbNKjcIBihws/P2yxxMnoD6MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JezXHswDBgHZc21doTGQZY9gcIC4VlNwClZ4/HEcITm8IjoHj+gYDPEX7dcNSb2CVvWvPoEB1XkU7payBNDrmyymhegI/qDN7nmkH5efkP3einS/TrNrG12KPd/TSoJRgnImWB3qiQ+Us2hwOWcr/5HG3Y7FPgLlqU5O8GotOHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrzuzMlN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrzuzMlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720933381; x=1752469381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VEfuP66fxQpuvny+O0WbNKjcIBihws/P2yxxMnoD6MQ=;
  b=jrzuzMlNbr2jEYxjkwYNo3c42/GjuYfC/jCb/1zbuLm/DXVBBBWiYAQQ
   a/ihh4JrKUmrkOy9GrYBbpCOOuWpKxKMRrUFljdCylBuBOr/zb6CyF+eZ
   QPvt509a/wdGUNYLAB6sn8vzmd5jMc4nAEkrCZDVWAj/WC0nYHLR5wiMG
   tHCLek/C4iTeMzpj8uME7lHBvs8Lps4W4d/UWAFAY7v8HYkSLrs1cf2PP
   oVfWfurdYymKb3xDsv4H44ijj8AN21RsWwn2aqhtL8uZNxL6NbCHblb3d
   OR0qPGQI++pcbBlB0qKPhoZ+wSH2D7RQBWz6a4/5/ZHBwc63FMmshMQMH
   g==;
X-CSE-ConnectionGUID: POFPotI7Qaqe7ecObwP4+A==
X-CSE-MsgGUID: rz6s4EguQiK7BdRScwNLOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="40865079"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="40865079"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 22:03:00 -0700
X-CSE-ConnectionGUID: XAHEtuOsR5iSkwdZIGLsvQ==
X-CSE-MsgGUID: owh96lvnT2yELZL9X+pH6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="49163408"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jul 2024 22:02:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSrNx-000d4w-0V;
	Sun, 14 Jul 2024 05:02:57 +0000
Date: Sun, 14 Jul 2024 13:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: James Houghton <jthoughton@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/18] KVM: Add asynchronous userfaults,
 KVM_READ_USERFAULT
Message-ID: <202407141216.zQy0qyIf-lkp@intel.com>
References: <20240710234222.2333120-15-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710234222.2333120-15-jthoughton@google.com>

Hi James,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 02b0d3b9d4dd1ef76b3e8c63175f1ae9ff392313]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM-Add-KVM_USERFAULT-build-option/20240711-101935
base:   02b0d3b9d4dd1ef76b3e8c63175f1ae9ff392313
patch link:    https://lore.kernel.org/r/20240710234222.2333120-15-jthoughton%40google.com
patch subject: [RFC PATCH 14/18] KVM: Add asynchronous userfaults, KVM_READ_USERFAULT
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240714/202407141216.zQy0qyIf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141216.zQy0qyIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141216.zQy0qyIf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:2681:12: warning: 'read_userfault' defined but not used [-Wunused-function]
    2681 | static int read_userfault(struct kvm_userfault_ctx __rcu *ctx, gfn_t *gfn)
         |            ^~~~~~~~~~~~~~


vim +/read_userfault +2681 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

  2680	
> 2681	static int read_userfault(struct kvm_userfault_ctx __rcu *ctx, gfn_t *gfn)
  2682	{
  2683		struct kvm_userfault_list_entry *entry;
  2684	
  2685		spin_lock(&ctx->list_lock);
  2686	
  2687		entry = list_first_entry_or_null(&ctx->gfn_list,
  2688						 struct kvm_userfault_list_entry,
  2689						 list);
  2690	
  2691		list_del(&entry->list);
  2692	
  2693		spin_unlock(&ctx->list_lock);
  2694	
  2695		if (!entry)
  2696			return -ENOENT;
  2697	
  2698		*gfn = entry->gfn;
  2699		return 0;
  2700	}
  2701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
