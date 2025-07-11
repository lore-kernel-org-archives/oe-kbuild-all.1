Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909C376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 00:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752192681; cv=none; b=iPsFoztXNQNdQFlfeJsXZNDVTbGQf+CC7xV4ZNvhbBCIjiM1+eyePOOzImA7jvOBFNgdqWbvniT4UQFXwegMVqP3oQ+Vp0NCBRx3q0Otg7bR92G8OmPaAuUfNPooSTEsk9UeMnACeIIPop9YKAoBVVClHVJiZ7zp57VCK0rQP28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752192681; c=relaxed/simple;
	bh=q+XZfx7gZD4E3O+O4tYJOtPDBJ/HSvsD8dBMmUrb7RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5+L0UKRjWT9LY/z7wUMHAxhWLXJVmcV4aR/hmTgjDBkq8Mcz/m/LL5eYFJTwRXFmdteMlLBOGvz7vD1VJfBvrxMGqEOsCrgl/SBUi8UrzMqW668Y0GPcfFhrbo9kjXvQD+X5ZIoe8fT6jDpjtj87Vg6G9a4AOrd5XaTG6hUiMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbYLLcFh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbYLLcFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752192679; x=1783728679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q+XZfx7gZD4E3O+O4tYJOtPDBJ/HSvsD8dBMmUrb7RA=;
  b=FbYLLcFhNQFV+v1u/IvKLoiIM21kN2vQMAKJhbkC6KCjxj0ijopoxOge
   wA3QdWhSrd6sb/WPiS2Dq9mVbLZH82RHD0r2DEMYD7o3BKUC/MOANsoht
   rIuY2j1ulUmIC1y9phArAJ677As+MSdGfSmpmTfjQJI9toNVzfjhJj6/G
   /6r7UxawgoJqYLtmC+ho53Gyv5CFYEMuvgsO16tTm/9dGtkb7BgAYE9mp
   ufrUadBp9tUhclhOCzb0NN4/kjkQHg6pa1qpFvt9eamVzX/WWD86lMeCg
   MUBTb6eBwujoqM1lkQkPuJWpgd9Uf5K+dxtsI4iPtyudVU8Y7nNg0wPap
   A==;
X-CSE-ConnectionGUID: 7Jw98QfsQ9mF/iqV3uDZzw==
X-CSE-MsgGUID: BXYj26YOTvWEyIh5Xw4DEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65187005"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65187005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 17:11:18 -0700
X-CSE-ConnectionGUID: o7aAQQUgQruJMC7Xa8ZDsQ==
X-CSE-MsgGUID: gW6hLpgET/+vWnyIxI7caw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="156786606"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2025 17:11:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua1M7-0005cd-3A;
	Fri, 11 Jul 2025 00:11:11 +0000
Date: Fri, 11 Jul 2025 08:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 04/12] rv: Let the reactors take care of buffers
Message-ID: <202507110826.2ekbVdWZ-lkp@intel.com>
References: <620a25d4b2e0f73701c4f255063b60c8d8feb7e7.1752088709.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <620a25d4b2e0f73701c4f255063b60c8d8feb7e7.1752088709.git.namcao@linutronix.de>

Hi Nam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on tip/sched/core akpm-mm/mm-everything linus/master v6.16-rc5 next-20250710]
[cannot apply to kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Cao/rv-Add-undef-TRACE_INCLUDE_FILE/20250710-032354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/620a25d4b2e0f73701c4f255063b60c8d8feb7e7.1752088709.git.namcao%40linutronix.de
patch subject: [PATCH v13 04/12] rv: Let the reactors take care of buffers
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20250711/202507110826.2ekbVdWZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110826.2ekbVdWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110826.2ekbVdWZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/reactor_panic.o: warning: objtool: rv_panic_reaction(): unexpected end of section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
