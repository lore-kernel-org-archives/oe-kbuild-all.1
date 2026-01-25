Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935022940D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 00:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769302065; cv=none; b=FSheSkfTmPdsan+BkiOQi5E8ae5Un/oRPLL9girP3D2yXvymHcYSTxST1E2NK3Ty42NXvCj8v1OlLzTVsLIHPwCf4Kj5KRyl/g2RKrXaWMjJ36KwXwBSCLGJW82Q9hSZrki2CloneLR4YqbJacbpuCzeUpLCYWmOCHcOa729hS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769302065; c=relaxed/simple;
	bh=9d4lzESrOX3HOgwNfG2uhIMhvob/39EOT/Bckx7i5Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgRqRQ1eJakURh21TLf16YqS86NLfOpkMxrJgAw089Jxi11ZIvAx4QUyYx7qjr0s7Ks0ign1ucVQ+h+kN0wJIHFhMfJEAKsD7UYOaZzdA8l2vEtAjgfZWug3s7oxHMiD1Mlkb3upW7fgIUpSar4S4blVR0r3ahFfG4rvz6CMNgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iD1K9EPp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iD1K9EPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769302062; x=1800838062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9d4lzESrOX3HOgwNfG2uhIMhvob/39EOT/Bckx7i5Dk=;
  b=iD1K9EPp3DlXlMzQi8F33um6XDhAmQzL7g7gcz3mx6y6K+lrXBBjT9yU
   GKyEXo7yYlhqJ9TZjiAnreD+bTX/9UQf3DCVTI86hZFmdcSDiqJsbA/MZ
   UUWqq1CZNLOwK88ih7Pj6gzz5PTPrKozI6HUtH71cY+5jj8BZEhpaQCpC
   /zx4xT7KQC1X7j3d22VRrbyGu7ry39fmdrjSnEZGt9LZMYc4GiA4Iqut0
   9yxvYhEix2QEBzHaUOLnDKyn4HaACpW+JZcXKhl4Mw6O+5bB6onIy7u16
   Ml9nDuKOXt55v7c1jbx6uEgfhR3tPyq8Swu6lNXjrPDHxWN4ymIk+fFYr
   w==;
X-CSE-ConnectionGUID: d7cc2wwRSSuIFz12oUuJog==
X-CSE-MsgGUID: QIbzD7MqQVeg56u4w+Fylg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="69533314"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="69533314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 16:47:41 -0800
X-CSE-ConnectionGUID: 4YQvcAyYSoWTqoJDY6VvCA==
X-CSE-MsgGUID: tIdXJWLFSDGD08dsLn5EsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207161718"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jan 2026 16:47:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjoHy-00000000Vdm-28xd;
	Sun, 25 Jan 2026 00:47:38 +0000
Date: Sun, 25 Jan 2026 08:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] fs/init: move creating the mount data_page into
 init_mount()
Message-ID: <202601250840.CWZlP3ix-lkp@intel.com>
References: <20260124003939.426931-2-hpa@zytor.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124003939.426931-2-hpa@zytor.com>

Hi Peter,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc6 next-20260123]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/H-Peter-Anvin/fs-init-move-creating-the-mount-data_page-into-init_mount/20260124-084417
base:   linus/master
patch link:    https://lore.kernel.org/r/20260124003939.426931-2-hpa%40zytor.com
patch subject: [RFC PATCH 1/3] fs/init: move creating the mount data_page into init_mount()
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260125/202601250840.CWZlP3ix-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250840.CWZlP3ix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250840.CWZlP3ix-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: try_to_run_init_process+0x24 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
