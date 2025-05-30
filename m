Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073F125DAF0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626846; cv=none; b=P2EWFe8QKcF+qQB5n9hYOSc/OKLy3PilMO4+8NkMkiECU5kTzJWeh/8hdY39d52d5SsfOaU5wnYXdIBI3MseeFo/wJJDoIEH7wHL81jFDh/+He4tnir740DRlp7OM2cl99tFMctK5J/j2sjg9tPN6h09GpvEO4uJjNj3dzZzXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626846; c=relaxed/simple;
	bh=jyLRrAUi+8lt+LlDpoyQmu0M/BupanEtjUdn/TIOo9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkgbJlPB43dOcwa0vds2M9DleJwn7wNr3uwQQzXpAmlInV7LDLbHowPN96IguiloDOh0Zd3JX0e79p8f7moslwY0sKlakENXJkmX4Fwi2hOL7SDnTr30rJvUmrjqnzmUN0709nSBSYWcSjrZ49npKR4coluFrCWNLuEHrh2j7/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsUMGN+w; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsUMGN+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748626844; x=1780162844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jyLRrAUi+8lt+LlDpoyQmu0M/BupanEtjUdn/TIOo9A=;
  b=CsUMGN+wFp0bnhvNlajRoh6fng5svE5R0Frm12swBwvohDC5FGV1OBER
   Au9daPipVaVy6fdZCd3Vzbzh3YB5lKGGXftIa/WDNZ6i2NPSHGD7zLSrG
   qtsiRSGjVjKFFEZxA2BzRH2+L9j0BSM2lV9mMNCEUYAP0RmTUC9O9arVH
   qdHGRx6bC9InnZM8gS9RFFVgCCQ0onqc7uv0dwbPCj+oauAflTc1AX4fy
   r8iRab60vbF79V6+NxwmlIS5qwwMg154x3CtaBifJgPKA5E0muXb9RFd/
   xSVxox3RNp8bNf3OusskKp2jovZLOQovvMsi0jNw7HUu+z9wSZ+ovPIze
   w==;
X-CSE-ConnectionGUID: A9MH/qJlR8qbubPsh4Ok9Q==
X-CSE-MsgGUID: HDycF6jORB6Zh0F1d6n/ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53360290"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="53360290"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:40:42 -0700
X-CSE-ConnectionGUID: VO4Nw+jPTRG+ADML+rFshg==
X-CSE-MsgGUID: fSX2N7m4SWC4K8ngKUkFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="147820781"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 May 2025 10:40:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL3ih-000Xqa-19;
	Fri, 30 May 2025 17:40:39 +0000
Date: Sat, 31 May 2025 01:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/8] virtio: introduce virtio_features_t
Message-ID: <202505310153.xoBJS3F5-lkp@intel.com>
References: <5be304a8d0e2fffa6bd13cfa9ff848b2e5842171.1748614223.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5be304a8d0e2fffa6bd13cfa9ff848b2e5842171.1748614223.git.pabeni@redhat.com>

Hi Paolo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mst-vhost/linux-next]
[also build test ERROR on net/main net-next/main linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/virtio-introduce-virtio_features_t/20250530-225213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/5be304a8d0e2fffa6bd13cfa9ff848b2e5842171.1748614223.git.pabeni%40redhat.com
patch subject: [RFC PATCH v2 1/8] virtio: introduce virtio_features_t
config: riscv-randconfig-002-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310153.xoBJS3F5-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310153.xoBJS3F5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310153.xoBJS3F5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from net/9p/trans_virtio.c:16:
   include/linux/virtio_features.h: In function 'VIRTIO_BIT':
>> include/linux/virtio_features.h:21:33: error: 'b' undeclared (first use in this function); did you mean 'mb'?
      21 |  return bit >= 64 ? 0 : BIT_ULL(b);
         |                                 ^
   include/vdso/bits.h:8:34: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)  (ULL(1) << (nr))
         |                                  ^~
   include/linux/virtio_features.h:21:33: note: each undeclared identifier is reported only once for each function it appears in
      21 |  return bit >= 64 ? 0 : BIT_ULL(b);
         |                                 ^
   include/vdso/bits.h:8:34: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)  (ULL(1) << (nr))
         |                                  ^~
   In file included from include/linux/virtio.h:14,
                    from net/9p/trans_virtio.c:34:
>> include/linux/virtio_features.h:22:1: warning: control reaches end of non-void function [-Wreturn-type]
      22 | }
         | ^


vim +21 include/linux/virtio_features.h

    18	
    19	static inline u64 VIRTIO_BIT(int bit)
    20	{
  > 21		return bit >= 64 ? 0 : BIT_ULL(b);
  > 22	}
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
