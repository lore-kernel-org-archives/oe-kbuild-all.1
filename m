Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C72EAE5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 04:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712810171; cv=none; b=G/xjZtnaBYM/w1bcEZ2QPwQzZNKpCw6Katbz+e3vqHozmiN0Eo1x5PRlFmybRKhbn9KUp2/WHLbTcI3jYmj+vvUdtijsLgJh9y9CnixglXqvsUoHtwX9F+VmZdxZtDiWuxqYKYDatj3v53RimYIDeRu3ez1a7CzpyBVHghJZc4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712810171; c=relaxed/simple;
	bh=o/+uwXlHAOmhl3WAKzDaiuVdwVeGNqrRyUVMQyyK9YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlgbDD4v5qusaZJ4cXdQc1wMNWwFayGwxH0Q+APAifSe3e+3Pl9aNTTfrHGg93ATMeVVLq1UdUAnsZg0AE0nXiFIOSbbRh08Nr2l/YtjVvbpOORqn+/Dae3QRkRyWYb9cIFbnXlrvW+XKKSpUQzyOWlfWOuAEquAoY47YvS99AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEyhoaV5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEyhoaV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712810170; x=1744346170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o/+uwXlHAOmhl3WAKzDaiuVdwVeGNqrRyUVMQyyK9YU=;
  b=aEyhoaV5Zgty2JpGW8xeaeqR/pYHsGMVxVfcwer5FnNMnwHkqJg2io3A
   Pmz9GciFyidfAM1eZqn7wq+gOIgD0GJKfyIkZ/WNoHoGsO5lJhL+dW878
   fZIkjQvAHhEM5RYRJ+kBpC6sRx2fcgeprfairbq6Zg3qqbkOpWiRQPEJq
   iR3WYakUTR13DKp/Nu2A/5hZ5WuMU4eo0ilmfwLNxXQOf35gBsB01EW7N
   8SPFK7bwfKOA8tCoeQMCgfKpbKVxipi/XGr/+sJVnm0IkmLxAsVjQhrBd
   m9RQhK6OLIxb4q74VNP0TmWr/PV4OHdVbownpNsVg4lXFeevRGDpk89DX
   g==;
X-CSE-ConnectionGUID: tp9sp9tTRsy2sFMpLfBRBg==
X-CSE-MsgGUID: Un7NU1lUSoaDdlBZoGJA9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18913201"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="18913201"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:36:09 -0700
X-CSE-ConnectionGUID: sDkHX2rWTVew/QfTWLUgGQ==
X-CSE-MsgGUID: Pce/SbP3T3C4/uW44S2Mtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20783082"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2024 21:36:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rumAN-0008Do-2N;
	Thu, 11 Apr 2024 04:36:03 +0000
Date: Thu, 11 Apr 2024 12:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jinglin Wen <jinglin.wen@shingroup.cn>, palmer@dabbelt.com
Cc: oe-kbuild-all@lists.linux.dev, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, gregkh@linuxfoundation.org,
	atishp@rivosinc.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: Re: [PATCH 1/3] riscv: Support for early console.
Message-ID: <202404111237.OOIpC9KS-lkp@intel.com>
References: <20240410063432.23058-2-jinglin.wen@shingroup.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410063432.23058-2-jinglin.wen@shingroup.cn>

Hi Jinglin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.9-rc3 next-20240410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinglin-Wen/riscv-Support-for-early-console/20240410-143840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240410063432.23058-2-jinglin.wen%40shingroup.cn
patch subject: [PATCH 1/3] riscv: Support for early console.
config: riscv-randconfig-r112-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111237.OOIpC9KS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce: (https://download.01.org/0day-ci/archive/20240411/202404111237.OOIpC9KS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111237.OOIpC9KS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/early_console.c:13:6: sparse: sparse: symbol 'riscv_early_console_putc' was not declared. Should it be static?

vim +/riscv_early_console_putc +13 arch/riscv/kernel/early_console.c

    11	
    12	/* interface for early console output characters */
  > 13	void (*riscv_early_console_putc)(char c);
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
