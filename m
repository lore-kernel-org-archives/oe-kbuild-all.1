Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5401DF736
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 04:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777178349; cv=none; b=i179g8lUog25go0ZrTDTIaYW5KGaRMXKg2KhNUykJsZ/sV1Bo97J0VgYicDAUDwvHC5BXRrwl5/KuafJqROz9J1mwHE15rRLsdvhFWrx0ctyir1WISb3XfZmQdR0uXNXvPkULmxp9pVUGy5ARt6Q5JokWI8Ys/5By49JxzukW4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777178349; c=relaxed/simple;
	bh=V1DsweoOVP0BGWuwWF2c6DWfzuyiHq3CaAUomaiZ3kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+imXutrK3xNF8UVAsVfs42vXMWabK8KaLjeeWs2BCWdc6vvAj6zr+WaNT3F7QK4InUt050br3jOp3ZBoXhJ9PyCb48RmxoTsr4esiBzbNaMxcFXCEvEe8UdzJ+HH07JFvlDJcTx4cfLPYgeh9AGOe/qOxvRV600IZakHqJBs4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZ+QAPvr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZ+QAPvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777178346; x=1808714346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V1DsweoOVP0BGWuwWF2c6DWfzuyiHq3CaAUomaiZ3kI=;
  b=AZ+QAPvrivzn0289mjsiaP2wC82juDeqOGm1Aqj4qjn2Np3U2vaE04FL
   DxdkesSpVhF1yPIF7BSZ7P7U0G36oP98AaOWcMlcoLgqmHBxSYxD+ev2E
   mnpHzz70+71WRTR9qRWn6cVcSEDhh7hI6qknZK9C93y+9nm5+hTnGyvv5
   7gkQ1qXwQ+i1B59yMFwFQJQhq0BIWAwiL2BXGB+RlVKaJ9lLHIU3cCo2g
   EdRNKazoPZ0Hh+tyb5Y4uLa99wt+TEG7xxudZZDSCrDQnAodr8XxCEi9f
   RVuNhaYfiH7JZ4ScDJWoyH9jnXT0KDma/6fXHyR4htCshG4dC39TaXoKB
   w==;
X-CSE-ConnectionGUID: spDTd7c1TlCbbxVuC4e5hw==
X-CSE-MsgGUID: zTYHVuD1Qgm68ktLd13Qcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="77978243"
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="77978243"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 21:39:06 -0700
X-CSE-ConnectionGUID: nMnQHu3/Q3qpyrlWLxnunw==
X-CSE-MsgGUID: 3NPDsV4gRn2wIPOhQO/kOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="233205966"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Apr 2026 21:39:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGrGn-000000007Td-3SUR;
	Sun, 26 Apr 2026 04:39:01 +0000
Date: Sun, 26 Apr 2026 12:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: a0282524688@gmail.com, tmyu0@nuvoton.com, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: Re: [PATCH v3 1/1] mfd: Add Host Interface (HIF) support for Nuvoton
 NCT6694
Message-ID: <202604261259.l0gAOpnS-lkp@intel.com>
References: <20260422035307.2065172-2-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422035307.2065172-2-a0282524688@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-leds/for-leds-next linus/master lee-mfd/for-mfd-fixes v7.0 next-20260424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/a0282524688-gmail-com/mfd-Add-Host-Interface-HIF-support-for-Nuvoton-NCT6694/20260424-201531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260422035307.2065172-2-a0282524688%40gmail.com
patch subject: [PATCH v3 1/1] mfd: Add Host Interface (HIF) support for Nuvoton NCT6694
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260426/202604261259.l0gAOpnS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604261259.l0gAOpnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604261259.l0gAOpnS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-nct6694.c:21:9: warning: 'NCT6694_GPIO_MOD' redefined
      21 | #define NCT6694_GPIO_MOD        0xFF
         |         ^~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpio-nct6694.c:12:
   include/linux/mfd/nct6694.h:27:9: note: this is the location of the previous definition
      27 | #define NCT6694_GPIO_MOD        NCT6694_RPT_MOD
         |         ^~~~~~~~~~~~~~~~


vim +/NCT6694_GPIO_MOD +21 drivers/gpio/gpio-nct6694.c

611a995e8ae1a5 Ming Yu 2025-09-12  15  
611a995e8ae1a5 Ming Yu 2025-09-12  16  /*
611a995e8ae1a5 Ming Yu 2025-09-12  17   * USB command module type for NCT6694 GPIO controller.
611a995e8ae1a5 Ming Yu 2025-09-12  18   * This defines the module type used for communication with the NCT6694
611a995e8ae1a5 Ming Yu 2025-09-12  19   * GPIO controller over the USB interface.
611a995e8ae1a5 Ming Yu 2025-09-12  20   */
611a995e8ae1a5 Ming Yu 2025-09-12 @21  #define NCT6694_GPIO_MOD	0xFF
611a995e8ae1a5 Ming Yu 2025-09-12  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
