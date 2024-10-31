Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAA516A92E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 21:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730410135; cv=none; b=ALJ+sxzBliu8ml7mRiqJ4i1hnHYLiDYJlRcbl72kMXB19/Nz62At4lZgE2bYmyhIbOsVoQWR2SWl5pkDKffp8OLfQGIh+0bOsoVX4mnB4Edg0idFW8deNMru2oy639Fo9XycTKMDfNWfKPm7nXo1F73bKkW9QZNtCYhkCBjdaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730410135; c=relaxed/simple;
	bh=BKAF5ezPvJ5LQxJzOw7MiWKCtHq/cwXX2bSyNNa3Ujk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGVEV70IUAs5eGIKqcnQ2p8QsPabs1pRWiN2mKQPrg0cD4+IeKEuwKQMfM1xOBuCvRZfVQwU6bfr91FD8CKi55BUzU007UOCJc2NgvUxS61+d9vcP+8M65Zy7hvDZMlj2GfrgpaexvJm2nGxYqf5koe7KB+aEDjB22HrGvtN2KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hySMw7xQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hySMw7xQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730410129; x=1761946129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BKAF5ezPvJ5LQxJzOw7MiWKCtHq/cwXX2bSyNNa3Ujk=;
  b=hySMw7xQp6Zpf4RKWZ4rpwaPcU8BoYracIp3XJjMgs5GBRH0KNZ6IPPc
   J49tUwGGHJpEZ87BZvfmlK8KAISoJ/g3NXgR0tMA9plflRHTuERXRfJO/
   +xIdOEu7XIuJhIYg+FWic6yzm5107mGmIfp/GbcvNi73YsYv4u5HQukoc
   iScDsMcaZCPsPPbnLp3PW3QFV8+tmXYNfqOmUO1yajFxjDE47Ox2m4zaw
   A39XuxF4W2NkgXHM6jxd52Rgtg/B4aLcNyXgXMNNK2nrlVoSFJg5g2Pzo
   jF63N/gOmJphFlcPCin6DjrXe1Iep2BLtg0xZmt2PQRC337NuBpmgmXBZ
   Q==;
X-CSE-ConnectionGUID: iSawkLkIS/apekDCnLFIJQ==
X-CSE-MsgGUID: VFGQx4aFTt2pELPxahgJ2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="40750282"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="40750282"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 14:28:48 -0700
X-CSE-ConnectionGUID: 8IhSuJzGTbq2r9nCRKZHDQ==
X-CSE-MsgGUID: PRu8T7W0RiqKql9mb+o9IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82675863"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Oct 2024 14:28:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6cij-000gjq-0Z;
	Thu, 31 Oct 2024 21:28:45 +0000
Date: Fri, 1 Nov 2024 05:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Fontenot <nathan.fontenot@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2] cxl: Update Soft Reserved resources upon region creation
Message-ID: <202411010558.wZcqTZdd-lkp@intel.com>
References: <20241030172751.81392-1-nathan.fontenot@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030172751.81392-1-nathan.fontenot@amd.com>

Hi Nathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on cxl/next]
[also build test WARNING on linus/master v6.12-rc5]
[cannot apply to cxl/pending next-20241031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Fontenot/cxl-Update-Soft-Reserved-resources-upon-region-creation/20241031-012922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20241030172751.81392-1-nathan.fontenot%40amd.com
patch subject: [RFC v2] cxl: Update Soft Reserved resources upon region creation
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241101/202411010558.wZcqTZdd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010558.wZcqTZdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010558.wZcqTZdd-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: insert_soft_reserve_resource+0x3e (section: .text) -> acpi_table_parse_cedt (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
