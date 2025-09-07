Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B76A25771
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757230112; cv=none; b=VTyVUGHNCicTAmA/lI3h5YXY5sSzb8m7zSKulQBW7Y9nzChiZBdtC8cjrsslqO8p1ypTH9hpqeKR/Ms4t9yp0uz+NrpmhPzeRnuqIRJYfEpYrPHtvIcWmPivWn2iuK4EkPuwJbQSu/UXSy0fD61qy5nNEMb5QtyEzXjAl3nUCMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757230112; c=relaxed/simple;
	bh=19lTElotOYS8K01ze9bNW8yLV/5lKaQW5fSC/H9rmg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUVjiRMve17mJyM5wepQS88c57Ce7zp7ns7MuBjLOfeiIc9/V5avOUw5qdSZ1qMy1AbwHPiPB8eVgkdhneCOpEl29YMa0v8rgUWIX9IYbI+7bvxAoElnhWdTcwaZz7WmUQz2e8l5MDs4VRukWWnmUsL3L88NlIn2bGbFntUOUbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlVboATk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlVboATk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757230110; x=1788766110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=19lTElotOYS8K01ze9bNW8yLV/5lKaQW5fSC/H9rmg0=;
  b=DlVboATkZLaDcQOcxY/VLLnb68e0bQoy7xOqfWkgJvXHVmaDJZxv6Lha
   QCzus6p5uT7PZsDTpfp9yDitOZDX6MYyUp0thilPO4cfzdN0Uwh3GTYhq
   58SBcD+AacuTM9P4hq05mv857vwfOfvwjuXC2ddvr12H7UN2+E7Hm3OPu
   xtFzsoOLx50npUZ64Sf6xATe5UqChOAgzf/SpZNUc/avgxdpd5behmIr2
   vRYhWXEVqXMdCuO6BvsAyvJ0f+s0JamRXmz+/h7+Bm5XDFqw7IyzSxbGe
   O0aKrjHhfVrHudhCqyq7eZ8cW6mo7zpC5SRy2dGmMRxtLezoDZCHFqRP/
   g==;
X-CSE-ConnectionGUID: u0V42GeCTgy4Itcqx/q7Ew==
X-CSE-MsgGUID: QuBAKfPkSxO66InNgEEUHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="58728725"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="58728725"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 00:28:30 -0700
X-CSE-ConnectionGUID: webw3IrAS9qctFSe10u1pQ==
X-CSE-MsgGUID: eTY3oN07TjWs1psnpdSdeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="176862096"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2025 00:28:26 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv9p2-000271-2O;
	Sun, 07 Sep 2025 07:28:24 +0000
Date: Sun, 7 Sep 2025 15:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
Subject: Re: [PATCH v5 3/9] powerpc/pseries: Add papr-hvpipe char driver for
 HVPIPE interfaces
Message-ID: <202509071522.62SUglTH-lkp@intel.com>
References: <20250906155308.705926-4-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906155308.705926-4-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-papr-hvpipe-ioctl/20250906-235556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250906155308.705926-4-haren%40linux.ibm.com
patch subject: [PATCH v5 3/9] powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
config: powerpc64-randconfig-r123-20250907 (https://download.01.org/0day-ci/archive/20250907/202509071522.62SUglTH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250907/202509071522.62SUglTH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509071522.62SUglTH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:149:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:149:33: sparse:     expected restricted __poll_t ( *poll )( ... )
   arch/powerpc/platforms/pseries/papr-hvpipe.c:149:33: sparse:     got unsigned int ( * )( ... )

vim +149 arch/powerpc/platforms/pseries/papr-hvpipe.c

   144	
   145	static const struct file_operations papr_hvpipe_handle_ops = {
   146		.read		=	papr_hvpipe_handle_read,
   147		.write		=	papr_hvpipe_handle_write,
   148		.release	=	papr_hvpipe_handle_release,
 > 149		.poll		=	papr_hvpipe_handle_poll,
   150	};
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
